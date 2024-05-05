#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#check for Version variable

if [ -z "${VERSION}" ]; then
    # If not, assign a default value
    VERSION=$CI_COMMIT_SHORT_SHA
fi

