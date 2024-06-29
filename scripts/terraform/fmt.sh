#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#Terraform fmt
tofu fmt -diff -check -write=false
