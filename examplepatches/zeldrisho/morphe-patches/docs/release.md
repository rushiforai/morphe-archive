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

Stage on a branch based on the current `origin/main` — either cut fresh
at it or any feature branch that already contains it, appending the
staging as the final commit once ready for release. Never stage on `main`
directly (`main` takes PR merges only) or on a stale or divergent branch.
Work with a clean tree and complete history (not a shallow clone),
synchronize the branch and release tags first. `prepare-release.sh` refuses
any HEAD that is not based on current `origin/main`. Stop if synchronization fails:

```bash
git fetch origin --tags &&
  git checkout -b release/1.2.0 origin/main &&
  bash scripts/prepare-release.sh 1.2.0
```

This pins `gradle.properties` to the version, promotes `## Unreleased` to a
dated version heading with an inline compare link (bare for the first release;
see [changelog policy](#changelog-policy)), regenerates `patches-list.json`
(stamped with the version) and the `README.md` patch table, stages
`patches-bundle.json` (version, notes as description, tag-anchored download
URL), and commits the staging. Then:

```bash
git push origin release/1.2.0
```

Open a PR, merge (no squash), sync `main`, and tag the post-merge tip —
never the pre-merge branch commit:

```bash
git checkout main && git pull --ff-only origin main &&
  git tag v1.2.0 && git push origin v1.2.0
```

Lightweight tags are fully supported — every tag check (name format,
reachability, version match) is type-agnostic, so annotating with `-a -m`
is optional.

The tag must be stable semver (`vX.Y.Z`, no prerelease suffix) on the
post-merge `main` tip containing the staging commit. `prepare-release.sh`
refuses dirty trees, a HEAD that is not based on current `origin/main`,
existing tags, a missing `## Unreleased` section, and an Unreleased section
with no `*` bullets. Before modifying files it also rejects shallow history,
malformed or out-of-order released headings, duplicate target entries, and
versions not greater than the previous release. The newest released changelog
entry supplies PREV; its `vPREV` tag must exist, be reachable from `HEAD`, and
match the highest reachable stable tag (numeric version order). Missing tags or
an untagged staged release are errors, not a reason to fall back to a bare heading.
A first release requires both no released entries and no reachable stable tags.
Tag synchronization is a caller prerequisite; the script does not fetch tags.

## What `release.yml` does

1. Validates the tag: stable `vX.Y.Z`, reachable from `main`, and matching
   `gradle.properties`, `patches-list.json`, `patches-bundle.json`, and the
   `CHANGELOG.md` heading. Extracts that version's section as the release notes.
2. Runs unit tests and `:patches:verifyBundleExtension` (runs `buildAndroid`, then
   fails fast when the embedded `extensions/extension.mpe` is missing); the single
   `.mpp` must be named `patches-<version>.mpp`.
3. Creates the GitHub release (marked latest) with the notes and the `.mpp`.
   A retry reuses the existing release and uploads a missing asset instead
   of failing. `attest-build-provenance` attests the bundle.

The workflow never pushes to `main`: the Manager manifest is staged upfront
by `prepare-release.sh`, so no bot commit — and no branch-ruleset
status-check conflict — follows a release.

To retry a failed run, use the Actions "Re-run jobs" control or `gh run rerun <run-id>` for the tag's run — re-pushing an existing tag does not start a new run (`push.tags` fires only on a new ref update). Never move a published tag or
replace a published asset — fix forward with a new version instead.

## Changelog policy

User-visible app patch changes only: added/changed/fixed support, supported
versions, removals, warnings. Omit CI, refactoring, reviewer fixes,
dependencies, commit hashes/links, issue-number links, and contributor lists.
Keep this hand-curated: one entry per stable release, no dev builds or permanent
prerelease headings. Use one `* **App:**` or `* **App - Feature:**` bullet per change.

Group bullets under these `###` category headings; omit empty categories:

- `🐛 Bug Fixes` — fixed bugs.
- `✨ New Features` — entirely new patches or new patch options.
- `🚀 Updated App Support` — adding/dropping supported app versions. State the
  support level in the bullet: stable targets (`isExperimental: false`) use
  `Add support for <version>`, experimental targets (`isExperimental: true`)
  use `Add experimental support for <version>`.
- `🔧 Improvements` — non-bug, non-feature refinements; use only when genuinely needed.

Category names are display text, not parser keys; scoped bullet syntax is unchanged.

Example:

```markdown
## Unreleased

### 🐛 Bug Fixes
* **Threads - Hide ads:** Sponsored posts no longer appear in the feed.

### 🚀 Updated App Support
* **Threads:** Support 435.x; drop 433.x.
```

Release headings use Morphe Manager's inline-link convention:

- First-ever release, with no prior release tag: `## VERSION (YYYY-MM-DD)`.
- Every subsequent release: `## [VERSION](https://github.com/<owner>/<repo>/compare/v<PREV>...v<VERSION>) (YYYY-MM-DD)`.
  PREV is the previous stable release's version; both compare endpoints use `v` tags.

For example (illustrative release bodies omitted):

```markdown
## [1.1.0](https://github.com/zeldrisho/morphe-patches/compare/v1.0.0...v1.1.0) (2026-09-09)

## 1.0.0 (2026-09-07)
```

The URL must immediately follow `[VERSION]` in parentheses. Keep a Changelog's
`[VERSION] - date` syntax and reference-style footer links are incompatible with
Manager's parser. Existing released headings are not retroactively converted;
`1.0.0` stays bare. Compare links do not permit per-bullet commit/issue links.
The GitHub release notes and the `patches-bundle.json` description are the same
section body, excluding its version heading.

## Release recovery

- A failed run may already have created the release. Inspect remote state
  (`gh release view`, `git ls-remote`) before
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
  patch list, or the `gradle.properties` version — the release staging owns
  them (`prepare-release.sh` regenerates and commits all four).
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
