#!/bin/bash
# clean-analysis.sh — drop git-ignored build output and heavy local-only
# reverse-engineering work. Nothing tracked by git is touched.
#
# Usage:
#   scripts/clean-analysis.sh            # builds + legacy .mpe copy + .kotlin (safe, rebuildable)
#   scripts/clean-analysis.sh --analysis # ... plus analysis/ (DESTRUCTIVE to scratch work)
#   scripts/clean-analysis.sh --all      # everything above
#   scripts/clean-analysis.sh --dry-run  # print what would be removed, remove nothing
# Flags combine: --analysis --dry-run previews the destructive run.
#
# analysis/ (apktool/smali trees, ~1GB) must never be committed, but it is
# NOT re-fetchable with one command — it holds manual recon work. So it is
# opt-in here. Everything else this script removes regenerates via a normal
# build (./gradlew buildAndroid) or re-runs automatically.
set -euo pipefail
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

DRY_RUN=0
WITH_ANALYSIS=0
for arg in "$@"; do
    case "$arg" in
        --dry-run | -n) DRY_RUN=1 ;;
        --analysis | --all) WITH_ANALYSIS=1 ;;
        -h | --help)
            sed -n '2,14p' "${BASH_SOURCE[0]}"
            exit 0
            ;;
        *)
            echo "Unknown argument: $arg (see --help)" >&2
            exit 1
            ;;
    esac
done

TARGETS=(
    "$PROJECT_DIR/patches/build"
    "$PROJECT_DIR/extensions/threads/build"
    "$PROJECT_DIR/extensions/zalo/build"
    "$PROJECT_DIR/build"
    "$PROJECT_DIR/.gradle"
    "$PROJECT_DIR/.kotlin"
    # Legacy repo-root extension copy (build no longer generates it).
    "$PROJECT_DIR/extensions/extension.mpe"
)
if [ "$WITH_ANALYSIS" -eq 1 ]; then
    TARGETS+=("$PROJECT_DIR/analysis")
fi

for target in "${TARGETS[@]}"; do
    if [ "$DRY_RUN" -eq 1 ]; then
        if [ -e "$target" ]; then
            echo "would remove: $target"
        else
            echo "missing (skip): $target"
        fi
    else
        rm -rf "$target"
    fi
done

if [ "$DRY_RUN" -eq 1 ]; then
    echo "dry run — nothing removed."
elif [ "$WITH_ANALYSIS" -eq 1 ]; then
    echo "✅ Cleaned build dirs, legacy .mpe copy, .kotlin/, and analysis/."
else
    echo "✅ Cleaned build dirs, legacy .mpe copy, and .kotlin/ (analysis/ kept; re-run with --analysis to drop it)."
fi
