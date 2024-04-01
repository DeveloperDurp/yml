#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#Octopus Create Release
dotnet /octo/octo.dll create-release --project=$OCTO_PROJECT_NAME --releaseNumber=$VERSION --server=https://octopus.internal.durp.info/ --apiKey=$OCTOAPI --packagesFolder=$CI_PROJECT_DIR/packages --gitRef main


