#!/usr/bin/env bash
#%%MULTILINE_YAML_START
#Check for configuration
echo "mode: ContinuousDeployment
continuous-delivery-fallback-tag: ''
branches:
  master:
    mode: ContinuousDeployment
    tag: 'dev'
    increment: Minor
    track-merge-target: true
    tracks-release-branches: true
    is-release-branch: false
    prevent-increment-of-merged-branch-version: false
  release:
    regex: release?[/]
    mode: ContinuousDeployment
    increment: Patch
    tag: ''
    is-release-branch: true
    prevent-increment-of-merged-branch-version: true
  feature:
    regex: feature?[/]
    mode: ContinuousDeployment
    increment: Inherit
    tag: 'alpha'
    is-release-branch: false
    prevent-increment-of-merged-branch-version: true
ignore:
  sha: []
" > GitVersion.yml

version=$(/tools/dotnet-gitversion /showvariable NuGetVersionV2)
echo "VERSION=$version" >> version.env
cat version.env
