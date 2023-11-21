#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#move files to output
mkdir $CI_PROJECT_DIR/output
IFS=";" read -a names <<< $PROJECT_NAME
for i in $names;
  do mkdir $CI_PROJECT_DIR/output/$i;
  cp -r $CI_PROJECT_DIR/$i $CI_PROJECT_DIR/output/;
  done
