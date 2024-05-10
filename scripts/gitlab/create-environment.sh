#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#test deployment

echo "
Test_Job:
  stage: deploy
  script:
    - echo "Test job"
  environment:
    name: $ENVIRONMENT

$VERSION:
  stage: deploy
  needs:
    - job: Test_Job 
  script:
    - echo "Deploy to $ENVIRONMENT server"
  environment:
    name: $ENVIRONMENT
" > generated-config.yml
