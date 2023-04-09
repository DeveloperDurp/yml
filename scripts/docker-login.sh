#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#login to docker

docker login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY/$CI_PROJECT_PATH
