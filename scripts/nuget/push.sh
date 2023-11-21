#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#Nuget Push
IFS=";" read -a names <<< $PROJECT_NAME
dotnet nuget add source "${CI_API_V4_URL}/projects/${CI_PROJECT_ID}/packages/nuget/index.json" --name gitlab --username gitlab-ci-token --password $CI_JOB_TOKEN --store-password-in-clear-text
count=0
for i in ${names[@]};
  do dotnet nuget push "${CI_PROJECT_DIR}/packages/$i.$VERSION.nupkg" --source gitlab;
done