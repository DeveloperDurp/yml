#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#test deployment

echo "
$VERSION:
  stage: deploy
  image: mcr.microsoft.com/powershell:latest
  script:
" >> generated-config.yml

echo '
    - |
      pwsh -c "Install-Module -Name powershell-yaml -Confirm:\$false -Force
      \$template = (Invoke-RestMethod -Headers @{ \"PRIVATE-TOKEN\"= \$ENV:GITLAB_TOKEN } -Uri \"\$ENV:CI_API_V4_URL/projects/\$ENV:GITLAB_PROJECT_ID/repository/files/\$ENV:GITLAB_CHART_PATH/raw?ref=\$ENV:ENVIRONMENT\") | ConvertFrom-Yaml
      \$template.version = \$ENV:VERSION
      \$body = @{
        branch = \"\$ENV:ENVIRONMENT\"
        commit_message = \"Update Chart\"
        content = \"\$(\$template | convertto-yaml)\"
      } | ConvertTo-Json
      Invoke-RestMethod -Headers @{ \"PRIVATE-TOKEN\"= \$ENV:GITLAB_TOKEN } -ContentType \"application/json\" -Method Put -body \$body -Uri \"\$ENV:CI_API_V4_URL/projects/\$ENV:GITLAB_PROJECT_ID/repository/files/\$ENV:GITLAB_CHART_PATH\""
  needs:
    - pipeline: $PARENT_PIPELINE_ID
      job: version
' >> generated-config.yml

echo "
  environment:
    name: $ENVIRONMENT
" >> generated-config.yml
