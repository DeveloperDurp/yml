#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#Syft scan for go

for i in packages/*.tar.gz;
do filename=${i%.*.tar.gz};
  filename=${filename##/};
  syft $i -o cyclonedx-json=$filename.docker.sbom.json;
done

