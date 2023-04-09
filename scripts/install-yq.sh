#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#Install YQ

export YQ_VERSION=4.27.2
export YQ_ARCH=linux_amd64 
curl -fsSL "https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/yq_${YQ_ARCH}" -o yq 
chmod +x yq