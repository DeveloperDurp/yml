#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#Helm repo add

helm repo add --username gitlab-ci-token --password ${CI_JOB_TOKEN} ${CI_PROJECT_NAME} ${CI_API_V4_URL}/projects/${CI_PROJECT_ID}/packages/helm/stable