#!/bin/bash
# clean-analysis.sh — drop heavy local-only reverse-engineering work.
# analysis/ (apktool/smali trees, ~1GB) and Gradle build dirs are git-ignored
# and must never be committed. Run before fresh clones / disk cleanup.
set -euo pipefail
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
rm -rf "$PROJECT_DIR/analysis" "$PROJECT_DIR/patches/build" \
  "$PROJECT_DIR/extensions/extension/build" "$PROJECT_DIR/build" "$PROJECT_DIR/.gradle"
echo "✅ Cleaned analysis/ and build dirs (all git-ignored; safe to re-fetch/rebuild)."
