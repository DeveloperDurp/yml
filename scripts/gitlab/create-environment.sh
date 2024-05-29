#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#test deployment

echo "
$VERSION:
  stage: deploy
  script:
    - echo "Deploy to $ENVIRONMENT server"
  environment:
    name: $ENVIRONMENT
" > generated-config.yml
