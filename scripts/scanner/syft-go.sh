#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#Syft scan for go

if [ -f "go.mod" ]; then
    syft go.mod -o cyclonedx-json=syft/${CI_PROJECT_NAME}.sbom.json
fi
