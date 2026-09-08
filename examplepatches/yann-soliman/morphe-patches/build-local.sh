#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
if [[ -z "${JAVA_HOME:-}" ]]; then
  for jdk in ../tools/jdk-*; do
    if [[ -x "$jdk/bin/java" ]]; then export JAVA_HOME="$(realpath "$jdk")"; break; fi
  done
fi
if [[ -n "${JAVA_HOME:-}" ]]; then export PATH="$JAVA_HOME/bin:$PATH"; fi
# A stored gh login takes precedence over a stale environment token.
# No secret is printed or written into this project.
if command -v gh >/dev/null 2>&1 && env -u GH_TOKEN -u GITHUB_TOKEN gh auth token >/dev/null 2>&1; then
  export GITHUB_TOKEN="$(env -u GH_TOKEN -u GITHUB_TOKEN gh auth token)"
  export GITHUB_ACTOR="$(env -u GH_TOKEN -u GITHUB_TOKEN gh api user --jq .login)"
fi
exec ./gradlew clean build buildAndroid --no-build-cache --warning-mode all "$@"
