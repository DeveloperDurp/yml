#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#Helm Push    
    
helm plugin install https://github.com/chartmuseum/helm-push
for chart in packages/*; do
    helm cm-push ./$chart ${CI_PROJECT_NAME}
done
