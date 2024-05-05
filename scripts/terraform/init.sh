#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#Terraform init    
terraform init -reconfigure -backend-config="address=${GITLAB_TF_ADDRESS}" -backend-config="lock_address=${GITLAB_TF_ADDRESS}/lock" -backend-config="unlock_address=${GITLAB_TF_ADDRESS}/lock" -backend-config="username=gitlab-ci-token" -backend-config="password=${CI_JOB_TOKEN}" -backend-config="lock_method=POST" -backend-config="unlock_method=DELETE" -backend-config="retry_wait_min=5"  