#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#run linter
golangci-lint run ./... --timeout 5m0s
