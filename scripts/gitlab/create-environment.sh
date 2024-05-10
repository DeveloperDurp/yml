#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#test deployment

echo "
$VERSION:
  stage: deploy
  needs:
    - job: Test_Job 
  script:
    - echo "Deploy to $ENVIRONMENT server"
" > generated-config.yml
