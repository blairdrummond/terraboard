package state

import (
	"context"
	"encoding/json"
	"fmt"
	"strings"
	"time"

	aws_sdk "github.com/aws/aws-sdk-go-v2/aws"
	awsconfig "github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/service/dynamodb"
	"github.com/aws/aws-sdk-go-v2/service/s3"

	// "github.com/aws/aws-sdk-go/service/dynamodb/dynamodbattribute"
	"github.com/aws/aws-sdk-go-v2/feature/dynamodb/attributevalue"
	"github.com/camptocamp/terraboard/config"
	"github.com/camptocamp/terraboard/internal/terraform/states/statefile"
	log "github.com/sirupsen/logrus"
)

// AWS is a state provider type, leveraging S3 and DynamoDB
type AWS struct {
	svc           *s3.Client
	dynamoSvc     *dynamodb.Client
	bucket        string
	dynamoTable   string
	keyPrefix     string
	fileExtension []string
	noLocks       bool
	noVersioning  bool
}

// NewAWS creates an AWS object
func NewAWS(aws config.AWSConfig, bucket config.S3BucketConfig, noLocks, noVersioning bool) *AWS {
	if bucket.Bucket == "" {
		return nil
	}

	awsConfig, err := awsconfig.LoadDefaultConfig(context.TODO())
	if err != nil {
		log.Fatalf("unable to load SDK config, %v", err)
	}


	// awsConfig.S3ForcePathStyle = &bucket.ForcePathStyle

	return &AWS{
		svc:           s3.NewFromConfig(awsConfig),
		bucket:        bucket.Bucket,
		keyPrefix:     bucket.KeyPrefix,
		fileExtension: bucket.FileExtension,
		dynamoSvc:     dynamodb.NewFromConfig(awsConfig),
		dynamoTable:   aws.DynamoDBTable,
		noLocks:       noLocks,
		noVersioning:  noVersioning,
	}
}

// NewAWSCollection instantiate all needed AWS objects configurated by the user and return a slice
func NewAWSCollection(c *config.Config) []*AWS {
	var awsInstances []*AWS
	for _, aws := range c.AWS {
		for _, bucket := range aws.S3 {
			if awsInstance := NewAWS(aws, bucket, c.Provider.NoLocks, c.Provider.NoVersioning); awsInstance != nil {
				awsInstances = append(awsInstances, awsInstance)
			}
		}
	}

	return awsInstances
}

// GetLocks returns a map of locks by State path
func (a *AWS) GetLocks() (locks map[string]LockInfo, err error) {
	if a.noLocks {
		locks = make(map[string]LockInfo)
		return
	}

	if a.dynamoTable == "" {
		err = fmt.Errorf("no dynamoDB table provided, not getting locks")
		return
	}

	results, err := a.dynamoSvc.Scan(context.TODO(), &dynamodb.ScanInput{
		TableName: &a.dynamoTable,
	})
	if err != nil {
		return locks, err
	}

	var lockList []Lock
	err = attributevalue.UnmarshalListOfMaps(results.Items, &lockList)
	if err != nil {
		return locks, err
	}

	locks = make(map[string]LockInfo)
	infoPrefix := fmt.Sprintf("%s/", a.bucket)
	for _, lock := range lockList {
		if lock.Info != "" {
			var info LockInfo
			err = json.Unmarshal([]byte(lock.Info), &info)
			if err != nil {
				return locks, err
			}

			locks[strings.TrimPrefix(info.Path, infoPrefix)] = info
		}
	}

	return
}

// GetStates returns a slice of State files in the S3 bucket
func (a *AWS) GetStates() (states []string, err error) {
	truncatedListing := true
	var keys []string
	log.WithFields(log.Fields{
		"bucket": a.bucket,
		"prefix": a.keyPrefix,
	}).Debug("Listing states from S3")

	params := s3.ListObjectsV2Input{
		Bucket: aws_sdk.String(a.bucket),
		Prefix: &a.keyPrefix,
	}
	for truncatedListing {
		result, err := a.svc.ListObjectsV2(context.TODO(), &params)
		if err != nil {
			return states, err
		}

		for _, obj := range result.Contents {
			for _, ext := range a.fileExtension {
				if strings.HasSuffix(*obj.Key, ext) {
					keys = append(keys, *obj.Key)
				}
			}
		}
		params.ContinuationToken = result.NextContinuationToken
		truncatedListing = *result.IsTruncated
	}
	states = keys
	log.WithFields(log.Fields{
		"bucket": a.bucket,
		"prefix": a.keyPrefix,
		"states": len(states),
	}).Debug("Found states from S3")
	return states, nil
}

// GetState retrieves a single State from the S3 bucket
func (a *AWS) GetState(st, versionID string) (sf *statefile.File, err error) {
	log.WithFields(log.Fields{
		"path":       st,
		"version_id": versionID,
	}).Info("Retrieving state from S3")
	input := &s3.GetObjectInput{
		Bucket: aws_sdk.String(a.bucket),
		Key:    aws_sdk.String(st),
	}
	if versionID != "" && !a.noVersioning {
		input.VersionId = &versionID
	}

	result, err := a.svc.GetObject(context.Background(), input)
	if err != nil {
		log.WithFields(log.Fields{
			"path":       st,
			"version_id": versionID,
			"error":      err,
		}).Error("Error retrieving state from S3")
		errObj := make(map[string]string)
		errObj["error"] = fmt.Sprintf("State file not found: %v", st)
		errObj["details"] = fmt.Sprintf("%v", err)
		j, _ := json.Marshal(errObj)
		return sf, fmt.Errorf("%s", string(j))
	}
	defer result.Body.Close()

	sf, err = statefile.Read(result.Body)
	if sf == nil || err != nil {
		return sf, fmt.Errorf("failed to find state: %v", err)
	}

	return
}

// GetVersions returns a slice of Version objects
func (a *AWS) GetVersions(state string) (versions []Version, err error) {
	versions = []Version{}
	if a.noVersioning {
		versions = append(versions, Version{
			ID:           state,
			LastModified: time.Now(),
		})
		return
	}

	result, err := a.svc.ListObjectVersions(context.TODO(), &s3.ListObjectVersionsInput{
		Bucket: aws_sdk.String(a.bucket),
		Prefix: aws_sdk.String(state),
	})
	if err != nil {
		return
	}

	for _, v := range result.Versions {
		versions = append(versions, Version{
			ID:           *v.VersionId,
			LastModified: *v.LastModified,
		})
	}

	return
}
