#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#Build Docker Container
mkdir $CI_PROJECT_DIR/packages
containername=$(echo "$CI_PROJECT_NAME" | awk '{print tolower($0)}')

docker build -t $containername .
docker save -o $CI_PROJECT_DIR/packages/$containername.$VERSION.tar.gz $containername
