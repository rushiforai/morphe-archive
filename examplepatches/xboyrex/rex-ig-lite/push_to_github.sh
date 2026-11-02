#!/usr/bin/env bash
set -euo pipefail

# ==============================================================================
# xboyrex (Merged Instagram & X/Twitter Patches + Liquid Glass UI)
# Automated GitHub Push & Release Tagging Script for @xboyrex (Mayank)
# ==============================================================================

REPO_URL="${1:-https://github.com/xboyrex/rex-ig-lite.git}"
TAG="v3.12.0"

echo "🚀 Initializing git repository for xboyrex ($TAG)..."
if [ ! -d ".git" ]; then
    git init
fi

git branch -M main
git config user.name "xboyrex"
git config user.email "xboyrex496@gmail.com"

if git remote get-url origin >/dev/null 2>&1; then
    git remote set-url origin "$REPO_URL"
else
    git remote add origin "$REPO_URL"
fi

echo "📦 Staging all files (zero piko/crimera/InstaPrime references)..."
git add -A
git commit -m "feat(xboyrex): add SakuraTunes Liquid Glass About screen, Gaussian blur, and full Instagram UI hooks ($TAG)" || true

echo "⬆️ Pushing main branch to $REPO_URL..."
git push -u origin main --force

echo "🏷️ Creating and pushing release tag $TAG to trigger GitHub Actions..."
git tag -f "$TAG"
git push origin "$TAG" --force

echo "✅ Done! GitHub Actions is now building patches-3.12.0.mpp (with classes.dex) at:"
echo "   https://github.com/xboyrex/rex-ig-lite/actions"
