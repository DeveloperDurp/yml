#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#Package with octopus
mkdir $CI_PROJECT_DIR/packages
IFS=";"
count=0
for i in $projectname; 
  do dotnet /octo/octo.dll pack --id=$i --version=$VERSION --outFolder=$CI_PROJECT_DIR/packages --basePath=$WORKDIR/$i;
  count=$(($count+1));
  done
