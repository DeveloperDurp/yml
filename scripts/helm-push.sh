#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#Helm Push    
    
for chart in packages/*; do
    helm push ./$chart oci://$CI_REGISTRY/$CI_PROJECT_PATH
done