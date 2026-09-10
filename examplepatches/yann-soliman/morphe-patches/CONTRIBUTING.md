# Contributing

Development follows a simple promotion flow:

```text
feature branch -> dev -> pre-release -> device test -> main -> stable release
```

## Changes

1. Create a branch from `dev`.
2. Make the change and keep commits compatible with Conventional Commits.
3. Open a pull request to `dev`.
4. CI must compile the bundle and pass the regression tests.
5. Merge to `dev` to publish a pre-release.
6. Test the pre-release on a real device when the change affects runtime behavior.
7. Merge the `dev -> main` pull request to publish the stable release. It is opened automatically when repository settings allow GitHub Actions to create pull requests; otherwise create it manually.

## Commit types

The release configuration currently treats:

- `fix:` as a patch release.
- `feat:` as a minor release.
- `perf:` and `bump:` as patch releases.

Documentation, CI and refactoring commits such as `docs:`, `ci:`, `chore:` and `refactor:` do not create a release by themselves.

## Validation

Run the same repository checks locally with:

```bash
./tools/check.sh
```

Keep patches fail-closed: fingerprints should be specific enough to reject an unexpected or ambiguous target rather than modify an uncertain method.

Do not commit APKs, XAPKs, credentials, signing keys or generated `.mpp` bundles.
