#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#Push container to gitlab
containername=$(echo "$PROJECT_NAME" | awk '{print tolower($0)}')

docker import $CI_PROJECT_DIR/packages/$containername.$VERSION.tar.gz $CI_REGISTRY/$CI_PROJECT_PATH:$VERSION
docker import $CI_PROJECT_DIR/packages/$containername.$VERSION.tar.gz $CI_REGISTRY/$CI_PROJECT_PATH:latest

docker push "$CI_REGISTRY/$CI_PROJECT_PATH:$VERSION"
docker push "$CI_REGISTRY/$CI_PROJECT_PATH:latest"
