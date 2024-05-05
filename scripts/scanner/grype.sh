#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#grype scan sboms

for i in syft/*.sbom.json;
do filename=${i%*.sbom.json};
  filename=${filename##/};
  grype $i -o json --file $filename.cve.json;
done
