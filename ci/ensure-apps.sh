#!/bin/bash

mapfile -t non_app_manifests < <(grep -ELri 'kind: application(set)?$' apps | grep -v README.md)

if ((${#non_app_manifests[*]})); then
  echo "ERROR: The 'apps' directory should only contain ArgoCD applications" >&2
  exit 1
fi
