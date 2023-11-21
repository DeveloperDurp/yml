#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#Package with octopus
mkdir $CI_PROJECT_DIR/packages

for dir in ./output/*/;
do dir=${dir%*/};
    dir=${dir##*/};
    dotnet /octo/octo.dll pack --id=$dir --version=$VERSION --outFolder=$CI_PROJECT_DIR/packages --basePath=$CI_PROJECT_DIR/output/$dir;
done
