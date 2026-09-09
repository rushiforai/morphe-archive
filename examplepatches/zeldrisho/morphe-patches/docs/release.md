# Release process

Canonical release authority. Branching, versioning, publishing, and release
recovery live here — other docs link here instead of restating them.

Stable-only releases. Push a version tag on `main` and
`.github/workflows/release.yml` tests, builds, and publishes the GitHub
release. Commits can use any style (the commit skill's conventional format
is fine) — nothing parses them; only pushed tags publish.

## Daily flow

- Work on a branch.
- Collect user-visible app patch changes under `## Unreleased` in
  `CHANGELOG.md` as you go (per-app `**App:**` bullets, see below).
- `Check` runs on pull requests targeting `main` and pushes to `main`; `Release` runs only on `v*` tags.
- When the branch is stable, open a PR manually and merge (no squash) into `main`.
- Ship from this repo (branch → `main` → tag → release). `scripts/repatch.sh`
  defaults `GITHUB_REPO` here. Don't split work across sibling patch repos;
  porting patches between repos duplicates fingerprint maintenance with no benefit.

## Staging a release

On `main` with a clean tree:

```bash
bash scripts/prepare-release.sh 1.2.0
```

This pins `gradle.properties` to the version, promotes `## Unreleased` to
`## 1.2.0 (<today>)`, regenerates `patches-list.json` (stamped with the
version) and the `README.md` patch table, and commits the staging. Then:

```bash
git push origin main
git tag -a v1.2.0 -m "Release v1.2.0"
git push origin v1.2.0
```

The tag must be stable semver (`vX.Y.Z`, no prerelease suffix) on the
`main`-branch release commit. `prepare-release.sh` refuses dirty trees,
existing tags, a missing `## Unreleased` section, and an Unreleased section
with no `*` bullets.

## What `release.yml` does

1. Validates the tag: stable `vX.Y.Z`, reachable from `main`, and matching
   `gradle.properties`, `patches-list.json`, and the `CHANGELOG.md` heading.
   Extracts that version's section as the release notes.
2. Runs unit tests and `buildAndroid`; the single `.mpp` must be named
   `patches-<version>.mpp`.
3. Creates the GitHub release (marked latest) with the notes and the `.mpp`.
   A retry reuses the existing release and uploads a missing asset instead
   of failing. `attest-build-provenance` attests the bundle.
4. Writes `patches-bundle.json` (version, notes as description, download URL)
   and pushes it to `main`, so Manager readers serve the new build.
   This happens only after the download exists.

To retry a failed run, use the Actions "Re-run jobs" control or `gh run rerun <run-id>` for the tag's run — re-pushing an existing tag does not start a new run (`push.tags` fires only on a new ref update). Never move a published tag or
replace a published asset — fix forward with a new version instead.

## Changelog policy

User-visible app patch changes only: added/changed/fixed support, supported
versions, removals, warnings. Omit CI, refactoring, reviewer fixes,
dependencies, commit hashes, and contributor lists. One bullet per app change:

```markdown
## Unreleased

### Fixed
* **Threads - Hide ads:** Sponsored posts no longer appear in the feed.

### Changed
* **Threads:** Support 435.x; drop 433.x.
```

Headings stay plain `## <version> (<YYYY-MM-DD>)` with `**App:**` bullets —
this is what Morphe Manager's changelog parser understands, so Keep a
Changelog's `[bracketed] - date` syntax is intentionally not used. The GitHub
release notes and the `patches-bundle.json` description are the same section.

## Release recovery

- A failed run may already have created the release or pushed a manifest
  commit. Inspect remote state (`gh release view`, `git ls-remote`) before
  retrying; re-running the failed run resumes safely (it reuses the existing release and uploads a missing asset).
- Do not delete/repoint published tags or force-push release history.
- Verify publication directly; a green workflow does not by itself prove an
  artifact published.
- If fetch/prune or branch inspection times out, report cleanup as unverified.
  Do not infer merge status from stale refs or force-delete branches.

## Rules

- Never create releases, tags, or `.mpp` uploads by hand — push the tag and
  let `release.yml` publish.
- Never force-push a release commit; ship a new release instead.
- Never hand-edit `patches-list.json`, `patches-bundle.json`, `README.md`
  patch list, or the `gradle.properties` version — the release staging and
  pipeline own them (`prepare-release.sh` + `release.yml`).
- In `CHANGELOG.md`, add bullets under `## Unreleased` only — versioned
  entries are promoted by `prepare-release.sh`, never edited by hand.
- Keep unrelated pending work out of release staging commits.
- The Manager serves the `.mpp` from the GitHub release named in
  `patches-bundle.json` — pushing source does nothing until a versioned
  release is cut.
- `gradlew` must stay tracked executable (`git update-index --chmod=+x gradlew`);
  `core.fileMode=false` checkouts can silently commit it non-executable (CI exit 126).
- `GITHUB_TOKEN` needs `contents:write`, `id-token:write`, `attestations:write`
  (already set in `release.yml`).
