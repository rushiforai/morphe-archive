# Release process

Branches are configured in `.releaserc`: `main` (stable) and `dev` (prerelease).

## Daily flow

- Commit to `dev` with semantic messages: `feat:` (minor), `fix:` (patch), `chore:` (no release). `bump:`, `perf:`, and `build(Needs bump):` are also configured — see `.releaserc`.
- Non-release branches and `chore:` commits only run the verify step in `.github/workflows/release.yml`.
- Enable `pre-release` in Morphe Manager sources to consume `dev` releases.
- When `dev` is stable, merge (no squash) `dev` → `main`. `.github/workflows/open_pull_request.yml` opens that PR automatically on pushes to `dev`.

## What `release.yml` does

1. `semantic-release` analyzes commits (`commit-analyzer`, `release-notes-generator`).
2. `@MorpheApp/changelog` writes `patches-bundle.json`; `gradle-semantic-release-plugin` builds the `.mpp` and bumps `gradle.properties`.
3. `exec.prepareCmd` runs `./gradlew generatePatchesList`, stamps `patches-list.json` version, regenerates the `README.md` patch table.
4. `git` plugin commits `CHANGELOG.md`, `gradle.properties`, `patches-bundle.json`, `patches-list.json`, `README.md` as `chore: Release v... [skip ci]`.
5. `github` plugin attaches `patches-*.mpp` to the release; `attest-build-provenance` attests it.
6. `backmerge` merges `main` back into `dev` with a clean workspace.

## Rules

- Never create releases, tags, or `.mpp` uploads by hand.
- Never force-push a release commit; ship a new release instead.
- Requires Settings → Actions → General → "Allow GitHub Actions to create and approve pull requests".
- `GITHUB_TOKEN` needs `contents:write`, `packages:write`, `id-token:write`, `attestations:write` (already set in `release.yml`).
