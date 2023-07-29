#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#Replace main branch with current branch

for file in pipelines/*.yml
  do 
    sed -i "s;ref: 'main';ref: '$CI_COMMIT_BRANCH';g" ./$file
done

for file in compliance/*.yml
  do 
    sed -i "s;ref: 'main';ref: '$CI_COMMIT_BRANCH';g" ./$file
done
