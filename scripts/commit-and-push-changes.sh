#!/usr/bin/env bash
#%%MULTILINE_YAML_START
# commit and push changes in job-templates.yml (if any)
git config user.name "DeveloperDurpBot"
git config user.email "DeveloperDurp@durp.info"
git add -A
git commit --untracked-files=no -m "ci: render" -m "Rendered by $CI_PIPELINE_URL" || exit 0
echo "Pushing to branch $CI_COMMIT_BRANCH"
# just using -o ci.skip would create a "skipped" pipeline in the list of pipelines, preventing a merge!
# passing down CI_SCRIPTS_SKIP_PIPELINE and using this in workflow:rules is better, as it does not create a pipeline at all!
git push -o ci.variable="CI_SCRIPTS_SKIP_PIPELINE=true" "https://oauth2:${GITLAB_TOKEN}@${CI_SERVER_HOST}/${CI_PROJECT_PATH}.git" "HEAD:$CI_COMMIT_BRANCH"
curl --silent --fail --request POST --form token="$CI_JOB_TOKEN" --form ref="$CI_COMMIT_BRANCH" "$CI_API_V4_URL/projects/$CI_PROJECT_ID/trigger/pipeline" >/dev/null
