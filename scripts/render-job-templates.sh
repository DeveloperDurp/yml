#!/usr/bin/env bash
#%%MULTILINE_YAML_START
# render job-templates.yml from job-templates.tpl.yml
set -euo pipefail
for script in scripts/*.sh; do
  awk -v script_name="$(basename "$script")" '
  NR==1 && /^#!/ {printf("# Begin of %s\n",script_name); next}   # strip shebang in first line, print head comment
  /^\s*$/ {next}         # strip any newlines or whitespace
  /^#%%MULTILINE_YAML_START$/ { print "- |"; multiline=1; next } # detect start of multiline yaml block, print "- |" into output yml
  /^#%%MULTILINE_YAML_END$/ { multiline=0; next }                # detect end   of multiline yaml block
  multiline==1 {printf("  %s\n",$0)}                             # print indented script of multiline yaml block
  multiline==0 {printf("- !!str %s\n",$0)}                       # not in multiline yaml, just print with "- !!str" (explicit yaml tag to avoid any quoting)
  END { printf("# End of %s\n",script_name) }                    # print trailing comment
  ' "$script" >"$script.yml"
done
# start with copy and then edit in place using yq -i
cat <<EOF >job-templates.yml
### WARNING ###
### THIS FILE IS RENDERED! DO NOT EDIT! ANY CHANGE WILL BE REVERTED BY RENDERING PIPELINE
### Edit the template file job-templates.tpl.yml instead!

EOF
cat job-templates.tpl.yml >> job-templates.yml

# shellcheck disable=SC2016 # "unquoted $ warning"
./yq -i '(.[] | select(keys | .[] | select(tag == "!!str") | test("^(before_|after_|)script$")) | ."*script") ref $scripts
       | ($scripts | .. | select(. == "./scripts/*.sh")) |= (load(. + ".yml") | .[] style="")
       | ($scripts | .[] | select(type == "!reference")) |= ([.] | . style="flow")
       | ($scripts | select(type == "!!seq")) |= flatten(1)
       | explode .
        ' job-templates.yml

for template in templates/*.tpl.yml
  do 
    export pipeline=$(basename $template | sed "s/.tpl//")
    cat $template > pipelines/$pipeline 
    ./yq -i '(.[] | select(keys | .[] | select(tag == "!!str") | test("^(before_|after_|)script$")) | ."*script") ref $scripts
    | ($scripts | .. | select(. == "./scripts/*.sh")) |= (load(. + ".yml") | .[] style="")
    | ($scripts | .[] | select(type == "!reference")) |= ([.] | . style="flow")
    | ($scripts | select(type == "!!seq")) |= flatten(1)
    | explode .
    ' pipelines/$pipeline
done
