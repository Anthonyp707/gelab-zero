# Android demo app (Gelab Zero)

This folder contains a tiny Android application that is included to produce a downloadable APK artifact. The repository's GitHub Actions workflow will build a release APK and upload it as an artifact you can download and install.

## What I added

- A minimal Android project at `android_app/` with a single activity.
- A CI workflow `.github/workflows/android-build.yml` which builds a release APK and uploads it as an artifact.

## How to build (locally)

Prerequisites on your machine: Android SDK + build tools, Java 17 and Gradle.

From the repository root you can build locally (example):

```bash
cd android_app
gradle assembleRelease     # or ./gradlew assembleRelease if you have the Gradle wrapper
```

The release APK will be at `app/build/outputs/apk/release/app-release.apk` and must be signed to install. CI signs it using the runner's debug keystore so it's installable.

## How to get the CI-built APK

1. Push to the `main` branch (or trigger the workflow manually from the Actions tab in GitHub).
2. Open the workflow run in GitHub Actions and download the artifact named `gelab-zero-android-apk`.

If you prefer using GitHub CLI to fetch the artifact (requires `gh`):

```bash
# find the most recent run id for this workflow
latest=$(gh run list --workflow android-build.yml --limit 1 --json databaseId --jq '.[0].databaseId')
gh run download $latest --name gelab-zero-android-apk --dir .
```

## Install on a device

Connect your Android device (Developer Options + USB debugging enabled) and use adb:

```bash
adb install -r app-release.apk
```

The app is signed by the debug key in CI, which is OK for testing but not for production distribution.
