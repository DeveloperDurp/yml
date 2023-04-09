#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#Helm Package

for chart in charts/*; do
  if [ -d "$chart" ]; then
    helm package "$chart" -d ./packages --version ${GITVERSION}
  fi
done