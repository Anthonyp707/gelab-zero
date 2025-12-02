#!/usr/bin/env bash
set -euo pipefail

if ! command -v gh >/dev/null 2>&1; then
  echo "gh (GitHub CLI) is required. Install it and authenticate (gh auth login)."
  exit 2
fi

WORKFLOW_NAME="android-build.yml"
ARTIFACT_NAME="gelab-zero-android-apk"

echo "Finding latest workflow run for ${WORKFLOW_NAME}..."
RUN_ID=$(gh run list --workflow ${WORKFLOW_NAME} --limit 1 --json databaseId --jq '.[0].databaseId')
if [ -z "$RUN_ID" ]; then
  echo "No workflow run found. Trigger a run first." && exit 1
fi

echo "Downloading artifact ${ARTIFACT_NAME} from run ${RUN_ID}..."
gh run download $RUN_ID --name ${ARTIFACT_NAME} --dir .

echo "Done. The APK (or ZIP) should be in the current directory."
