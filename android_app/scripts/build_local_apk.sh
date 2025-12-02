#!/usr/bin/env bash
set -euo pipefail

# Attempt to build the android release APK locally.
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
pushd "$ROOT_DIR" >/dev/null

if [ -x "./gradlew" ]; then
  ./gradlew assembleRelease
elif command -v gradle >/dev/null 2>&1; then
  gradle assembleRelease
else
  echo "No gradle or gradlew found. Install Gradle or add the Gradle wrapper (recommended)."
  echo "You can build in CI if you don't have a local SDK: workflows are in .github/workflows/android-build.yml"
  exit 2
fi

echo "Built apk at app/build/outputs/apk/release/app-release.apk"
popd >/dev/null
