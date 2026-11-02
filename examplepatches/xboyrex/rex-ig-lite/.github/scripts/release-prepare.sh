#!/usr/bin/env bash
# Called by semantic-release (@semantic-release/exec prepareCmd) once the next version is known.
# Builds, verifies and tests the bundle that gets released; any failure stops the release.
set -euo pipefail

VERSION="${1:?usage: release-prepare.sh <version>}"

# gradle-semantic-release-plugin has already stamped the version into gradle.properties.
grep -Eq "^version[[:space:]]*=[[:space:]]*${VERSION}[[:space:]]*$" gradle.properties

./gradlew :patches:build :patches:lintResolvers :patches:checkExtensionDescriptors --no-daemon

MPP="patches/build/libs/patches-${VERSION}.mpp"
test -f "$MPP"
echo "$MPP: built and verified"
