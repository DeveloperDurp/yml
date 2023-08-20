#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#Helm login

helm registry login ${CI_REGISTRY} -u gitlab-ci-token -p ${CI_JOB_TOKEN}