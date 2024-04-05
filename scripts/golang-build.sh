#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#Build golang project
export GOPATH=/go
export PATH=$PATH:$GOPATH/bin

mkdir output

#go install 
go mod download

# Check if go.mod contains "swag"
if grep -q "swag" go.mod; then
    echo "Found 'swag' in go.mod. Running swag init..."
    #go install github.com/swaggo/swag/cmd/swag@v1.8.12 
    swag init
fi

CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o ./output/main .
