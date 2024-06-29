#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#Terraform plan    
apk add --update curl jq 
alias convert_report="jq -r '([.resource_changes[].change.actions?]|flatten)|{\"create\":(map(select(.==\"create\"))|length),\"update\":(map(select(.==\"update\"))|length),\"delete\":(map(select(.==\"delete\"))|length)}'"
tofu plan -out=$PLAN $ARGUMENTS
tofu show --json $PLAN | jq -r '([.resource_changes[].change.actions?]|flatten)|{"create":(map(select(.=="create"))|length),"update":(map(select(.=="update"))|length),"delete":(map(select(.=="delete"))|length)}' > $JSON_PLAN_FILE
