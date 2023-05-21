#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#Build golang api
export GOPATH=/go
export PATH=$PATH:$GOPATH/bin

mkdir output

go install 
go install github.com/swaggo/swag/cmd/swag@v1.8.12 
swag init

CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o ./output/main .