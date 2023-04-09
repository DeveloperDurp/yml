#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#Build Docker Container
docker build -t $CI_REGISTRY/$CI_PROJECT_PATH:$DOCKERTAG -t $CI_REGISTRY/$CI_PROJECT_PATH:latest .
docker push "$CI_REGISTRY/$CI_PROJECT_PATH:latest"