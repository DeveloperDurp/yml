Install-Module -Name powershell-yaml -Confirm:$false -Force

$template = (Invoke-RestMethod -Headers @{ 'PRIVATE-TOKEN'= $ENV:CI_JOB_TOKEN } `
                               -Uri "https://gitlab.com/api/v4/projects/45028985/repository/files/durpapi%2FChart.yaml/raw?ref=main") | ConvertFrom-Yaml
$template.version = $ENV:VERSION

$body = @{
  branch = "main"
  commit_message = "Update Chart"
  content = "$($template | convertto-yaml)"
} | ConvertTo-Json

Invoke-RestMethod -Headers @{ 'PRIVATE-TOKEN'= $ENV:CI_JOB_TOKEN } `
                  -ContentType "application/json" `
                  -Method Put `
                  -body $body `
                  -Uri "https://gitlab.com/api/v4/projects/45028985/repository/files/durpapi%2FChart.yaml"
