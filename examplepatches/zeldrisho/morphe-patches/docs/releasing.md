# Releases

Releases follow the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template/blob/main/README.md) and are managed by [semantic-release](../.releaserc) in the existing [release workflow](../.github/workflows/release.yml). Do not publish assets by hand, create replacement release scripts, move tags, or force-push release commits.

In GitHub repository settings, enable **Actions → General → Workflow permissions → Allow GitHub Actions to create and approve pull requests** for the automated release PR.

## Branches

- Develop on `dev` using semantic commits. `feat:` and `fix:` create prereleases; `chore:` does not. The configured patch-release rules also cover `bump:`, `perf:`, and `build(Needs bump):`.
- Users can select `dev` prereleases by enabling prereleases in their Morphe Manager patch source.
- When ready for a stable release, merge `dev` into `main` without squashing. Semantic-release publishes from `main` and backmerges to `dev`.
- Push `dev` to the remote before relying on prereleases, automated pull requests, or the stable-release backmerge.

Before a release, build and apply the bundle to the intended app versions as described in [testing](testing.md). A successful CI build alone is not compatibility validation.

## Changelog policy

`CHANGELOG.md`, `patches-list.json`, `patches-bundle.json`, and the generated README patch-list section are release-owned. Preserve existing history; do not edit or commit these generated files manually. The release bot updates them from release commits and the built bundle.

The patch-list generator builds and selects the `.mpp` for the current Gradle project version. Do not delete or rewrite published releases to fix a release: make a new release instead.
