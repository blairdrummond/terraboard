module github.com/camptocamp/terraboard

go 1.23.2

require (
	cloud.google.com/go/storage v1.47.0
	github.com/DATA-DOG/go-sqlmock v1.5.2
	github.com/agext/levenshtein v1.2.3
	github.com/apparentlymart/go-cidr v1.1.0
	github.com/apparentlymart/go-dump v0.0.0-20190214190832-042adf3cf4a0
	github.com/apparentlymart/go-versions v1.0.2
	github.com/aws/aws-sdk-go v1.55.5
	github.com/aws/aws-sdk-go-v2 v1.32.5
	github.com/aws/aws-sdk-go-v2/config v1.28.5
	github.com/aws/aws-sdk-go-v2/feature/dynamodb/attributevalue v1.15.17
	github.com/aws/aws-sdk-go-v2/service/dynamodb v1.37.1
	github.com/aws/aws-sdk-go-v2/service/s3 v1.68.0
	github.com/bmatcuk/doublestar v1.3.4
	github.com/coreos/pkg v0.0.0-20240122114842-bbd7aa9bf6fb
	github.com/davecgh/go-spew v1.1.1
	github.com/go-test/deep v1.1.1
	github.com/google/go-cmp v0.6.0
	github.com/google/uuid v1.6.0
	github.com/gorilla/mux v1.8.1
	github.com/gusaul/go-dynamock v0.0.0-20210107061312-3e989056e1e6
	github.com/hashicorp/errwrap v1.1.0
	github.com/hashicorp/go-cleanhttp v0.5.2
	github.com/hashicorp/go-getter v1.7.6
	github.com/hashicorp/go-hclog v1.6.3
	github.com/hashicorp/go-multierror v1.1.1
	github.com/hashicorp/go-retryablehttp v0.7.7
	github.com/hashicorp/go-tfe v1.70.0
	github.com/hashicorp/go-uuid v1.0.3
	github.com/hashicorp/go-version v1.7.0
	github.com/hashicorp/hcl/v2 v2.23.0
	github.com/hashicorp/terraform v1.9.8
	github.com/hashicorp/terraform-svchost v0.1.1
	github.com/jessevdk/go-flags v1.6.1
	github.com/machinebox/graphql v0.2.2
	github.com/mitchellh/copystructure v1.2.0
	github.com/mitchellh/go-homedir v1.1.0
	github.com/pmezard/go-difflib v1.0.0
	github.com/sirupsen/logrus v1.9.3
	github.com/spf13/afero v1.11.0
	github.com/stretchr/testify v1.9.0
	github.com/swaggo/http-swagger v1.3.4
	github.com/swaggo/swag v1.16.4
	github.com/zclconf/go-cty v1.15.0
	github.com/zclconf/go-cty-yaml v1.1.0
	golang.org/x/crypto v0.29.0
	golang.org/x/mod v0.22.0
	golang.org/x/net v0.31.0
	golang.org/x/sys v0.27.0
	golang.org/x/text v0.20.0
	google.golang.org/api v0.209.0
	gopkg.in/yaml.v2 v2.4.0
	gorm.io/datatypes v1.2.4
	gorm.io/driver/postgres v1.5.10
	gorm.io/gorm v1.25.12
)

require (
	cel.dev/expr v0.16.1 // indirect
	cloud.google.com/go v0.116.0 // indirect
	cloud.google.com/go/auth v0.10.2 // indirect
	cloud.google.com/go/auth/oauth2adapt v0.2.5 // indirect
	cloud.google.com/go/compute/metadata v0.5.2 // indirect
	cloud.google.com/go/iam v1.2.2 // indirect
	cloud.google.com/go/monitoring v1.21.2 // indirect
	filippo.io/edwards25519 v1.1.0 // indirect
	github.com/GoogleCloudPlatform/opentelemetry-operations-go/detectors/gcp v1.24.1 // indirect
	github.com/GoogleCloudPlatform/opentelemetry-operations-go/exporter/metric v0.48.1 // indirect
	github.com/GoogleCloudPlatform/opentelemetry-operations-go/internal/resourcemapping v0.48.1 // indirect
	github.com/KyleBanks/depth v1.2.1 // indirect
	github.com/apparentlymart/go-textseg/v15 v15.0.0 // indirect
	github.com/aws/aws-sdk-go-v2/aws/protocol/eventstream v1.6.7 // indirect
	github.com/aws/aws-sdk-go-v2/credentials v1.17.46 // indirect
	github.com/aws/aws-sdk-go-v2/feature/ec2/imds v1.16.20 // indirect
	github.com/aws/aws-sdk-go-v2/internal/configsources v1.3.24 // indirect
	github.com/aws/aws-sdk-go-v2/internal/endpoints/v2 v2.6.24 // indirect
	github.com/aws/aws-sdk-go-v2/internal/ini v1.8.1 // indirect
	github.com/aws/aws-sdk-go-v2/internal/v4a v1.3.24 // indirect
	github.com/aws/aws-sdk-go-v2/service/dynamodbstreams v1.24.6 // indirect
	github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding v1.12.1 // indirect
	github.com/aws/aws-sdk-go-v2/service/internal/checksum v1.4.5 // indirect
	github.com/aws/aws-sdk-go-v2/service/internal/endpoint-discovery v1.10.5 // indirect
	github.com/aws/aws-sdk-go-v2/service/internal/presigned-url v1.12.5 // indirect
	github.com/aws/aws-sdk-go-v2/service/internal/s3shared v1.18.5 // indirect
	github.com/aws/aws-sdk-go-v2/service/sso v1.24.6 // indirect
	github.com/aws/aws-sdk-go-v2/service/ssooidc v1.28.5 // indirect
	github.com/aws/aws-sdk-go-v2/service/sts v1.33.1 // indirect
	github.com/aws/smithy-go v1.22.1 // indirect
	github.com/bgentry/go-netrc v0.0.0-20140422174119-9fd32a8b3d3d // indirect
	github.com/census-instrumentation/opencensus-proto v0.4.1 // indirect
	github.com/cespare/xxhash/v2 v2.3.0 // indirect
	github.com/cncf/xds/go v0.0.0-20240905190251-b4127c9b8d78 // indirect
	github.com/coreos/go-systemd v0.0.0-20191104093116-d3cd4ed1dbcf // indirect
	github.com/envoyproxy/go-control-plane v0.13.0 // indirect
	github.com/envoyproxy/protoc-gen-validate v1.1.0 // indirect
	github.com/fatih/color v1.16.0 // indirect
	github.com/felixge/httpsnoop v1.0.4 // indirect
	github.com/go-logr/logr v1.4.2 // indirect
	github.com/go-logr/stdr v1.2.2 // indirect
	github.com/go-openapi/jsonpointer v0.19.5 // indirect
	github.com/go-openapi/jsonreference v0.20.0 // indirect
	github.com/go-openapi/spec v0.20.6 // indirect
	github.com/go-openapi/swag v0.19.15 // indirect
	github.com/go-sql-driver/mysql v1.8.1 // indirect
	github.com/golang/groupcache v0.0.0-20210331224755-41bb18bfe9da // indirect
	github.com/google/go-querystring v1.1.0 // indirect
	github.com/google/s2a-go v0.1.8 // indirect
	github.com/googleapis/enterprise-certificate-proxy v0.3.4 // indirect
	github.com/googleapis/gax-go/v2 v2.14.0 // indirect
	github.com/hashicorp/go-safetemp v1.0.0 // indirect
	github.com/hashicorp/go-slug v0.16.0 // indirect
	github.com/hashicorp/jsonapi v1.3.1 // indirect
	github.com/jackc/pgpassfile v1.0.0 // indirect
	github.com/jackc/pgservicefile v0.0.0-20231201235250-de7065d80cb9 // indirect
	github.com/jackc/pgx/v5 v5.5.5 // indirect
	github.com/jackc/puddle/v2 v2.2.1 // indirect
	github.com/jinzhu/inflection v1.0.0 // indirect
	github.com/jinzhu/now v1.1.5 // indirect
	github.com/jmespath/go-jmespath v0.4.0 // indirect
	github.com/josharian/intern v1.0.0 // indirect
	github.com/klauspost/compress v1.15.11 // indirect
	github.com/mailru/easyjson v0.7.6 // indirect
	github.com/matryer/is v1.4.1 // indirect
	github.com/mattn/go-colorable v0.1.13 // indirect
	github.com/mattn/go-isatty v0.0.20 // indirect
	github.com/mitchellh/go-testing-interface v1.14.1 // indirect
	github.com/mitchellh/go-wordwrap v1.0.1 // indirect
	github.com/mitchellh/reflectwalk v1.0.2 // indirect
	github.com/pkg/errors v0.9.1 // indirect
	github.com/planetscale/vtprotobuf v0.6.1-0.20240319094008-0393e58bdf10 // indirect
	github.com/swaggo/files v0.0.0-20220610200504-28940afbdbfe // indirect
	github.com/ulikunitz/xz v0.5.10 // indirect
	go.opencensus.io v0.24.0 // indirect
	go.opentelemetry.io/contrib/detectors/gcp v1.29.0 // indirect
	go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc v0.54.0 // indirect
	go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp v0.54.0 // indirect
	go.opentelemetry.io/otel v1.29.0 // indirect
	go.opentelemetry.io/otel/metric v1.29.0 // indirect
	go.opentelemetry.io/otel/sdk v1.29.0 // indirect
	go.opentelemetry.io/otel/sdk/metric v1.29.0 // indirect
	go.opentelemetry.io/otel/trace v1.29.0 // indirect
	golang.org/x/oauth2 v0.24.0 // indirect
	golang.org/x/sync v0.9.0 // indirect
	golang.org/x/time v0.8.0 // indirect
	golang.org/x/tools v0.21.1-0.20240508182429-e35e4ccd0d2d // indirect
	google.golang.org/genproto v0.0.0-20241113202542-65e8d215514f // indirect
	google.golang.org/genproto/googleapis/api v0.0.0-20241104194629-dd2ea8efbc28 // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20241113202542-65e8d215514f // indirect
	google.golang.org/grpc v1.67.1 // indirect
	google.golang.org/grpc/stats/opentelemetry v0.0.0-20240907200651-3ffb98b2c93a // indirect
	google.golang.org/protobuf v1.35.2 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
	gorm.io/driver/mysql v1.5.6 // indirect
)
