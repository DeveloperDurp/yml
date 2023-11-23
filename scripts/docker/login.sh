#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#Docker Login
docker login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY/$CI_PROJECT_PATH
