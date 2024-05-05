#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#grype scan sboms

for i in syft/*.sbom.json;
do filename=${i%*.sbom.json};
  filename=${filename##/};
  grype syft/$i -o json --file syft/$filename.cve.json;
done
