#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#Octopus Create Release
dotnet /octo/octo.dll create-release --project="$octoproject" --releaseNumber=$VERSION --server=https://octopus.internal.durp.info/ --apiKey=$OCTOAPI --packagesFolder=$CI_PROJECT_DIR/packages


