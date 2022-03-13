# Generate .pb.go files based on the .proto files
START=$(pwd)

# protoc: protoc-go protoc-js

protoc-go:
	protoc -I pb/v1/ \
		--go_out=plugins=grpc:pb \
		--gogrpcmock_out=:pb \
		pb/v1/*.proto

# protoc-js:
# 	mkdir -p pb/js
# 	protoc -I pb/v1/ \
# 		--js_out=import_style=commonjs:pb/js \
# 		--grpc-web_out=import_style=commonjs,mode=grpcwebtext:pb/js \
# 		pb/v1/*.proto

install:
	go get -u \
		google.golang.org/protobuf/proto \
		google.golang.org/protobuf \
		github.com/golang/protobuf/protoc-gen-go \
		google.golang.org/grpc \
		github.com/gogo/protobuf/protoc-gen-gogoslick \
		github.com/gogo/protobuf/gogoproto \
		github.com/DATA-DOG/go-sqlmock \
		github.com/onsi/ginkgo/ginkgo \
		github.com/onsi/gomega/...  \
		github.com/SafetyCulture/s12-proto/protobuf/protoc-gen-gogrpcmock \
		github.com/go-sql-driver/mysql \
		gopkg.in/go-playground/validator.v9 \
		golang.org/x/crypto/... \
		github.com/go-xorm/xorm \
		github.com/pascaldekloe/jwt
	go install github.com/SafetyCulture/s12-proto/protobuf/protoc-gen-gogrpcmock@latest
	go install -tags 'mysql' github.com/golang-migrate/migrate/v4/cmd/migrate@latest
	go install github.com/golang/mock/mockgen@latest

clean:
	rm ./pb/**/*.pb.go
	# rm -rf pb/js

test:
	ginkgo -r -failFast

# start-proxy:
# 	grpcwebproxy \
# 		--backend_addr=localhost:50051 \
# 		--run_tls_server=false \
# 		--allow_all_origins