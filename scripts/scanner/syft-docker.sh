#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#Syft scan for docker

for i in packages/*.tar.gz;
do filename=${i%.*.tar.gz};
  filename="$(basename -- "$filename")"
  syft $i -o cyclonedx-json=syft/$filename.docker.sbom.json;
done

