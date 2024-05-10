#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#test deployment

echo "
deploy_$VERSION:
  stage: deploy
  needs:
    - job: build
      optional: true
  script:
    - echo "Deploy to staging server"
  environment:
    name: staging
" > generated-config.yml
