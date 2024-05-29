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
      \$template = (Invoke-RestMethod -Headers @{ \"PRIVATE-TOKEN\"= \$ENV:GITLAB_TOKEN } -Uri \"https://gitlab.com/api/v4/projects/45028985/repository/files/durpapi%2FChart.yaml/raw?ref=dev\") | ConvertFrom-Yaml
      \$template.version = \$ENV:VERSION
      \$body = @{
        branch = \"dev\"
        commit_message = \"Update Chart\"
        content = \"\$(\$template | convertto-yaml)\"
      } | ConvertTo-Json
      Invoke-RestMethod -Headers @{ \"PRIVATE-TOKEN\"= \$ENV:GITLAB_TOKEN } -ContentType \"application/json\" -Method Put -body \$body -Uri \"https://gitlab.com/api/v4/projects/45028985/repository/files/durpapi%2FChart.yaml\""
' >> generated-config.yml

echo "
  environment:
    name: $ENVIRONMENT
" >> generated-config.yml
