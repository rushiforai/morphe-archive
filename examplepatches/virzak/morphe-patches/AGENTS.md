# Repo conventions - virzak/morphe-patches

This is a public Morphe patch source (an umbrella bundle: Instagram, Toyota,
RuTube; Instagram is the flagship). It follows the Morphe patch-source ecosystem
flow, which overrides parts of the global Zomp git conventions. Everything the
global `~/.claude/CLAUDE.md` says that is not contradicted below still applies -
in particular: ASCII punctuation only, no AI `Co-Authored-By:`/`Claude-Session:`
trailers or tool-attribution lines, no session links, `1.` for every ordered
list item, and no absolute filesystem paths in shared artifacts.

## Releases are driven by semantic-release

`.releaserc` runs `semantic-release` in `release.yml`. It computes the next
version from commit messages, builds the `.mpp`, publishes a GitHub release,
updates `patches-bundle.json` / `patches-list.json` / `README.md` / `CHANGELOG.md`,
and commits those back. This means:

1. Commit subjects MUST be Conventional Commits. The type decides the release:
   - `feat:` -> minor (a new patch or a new app).
   - `fix:` -> patch (fixing a broken patch/fingerprint).
   - `bump:` -> patch, shown under "Updated App Support" (re-pinning an app to a
     newer version after re-validating fingerprints).
   - `perf:` -> patch. `build:` -> hidden (no release) unless scoped `Needs bump`.
   - `refactor:`, `chore:`, `docs:`, `ci:`, `test:` -> no release.
1. `main` is the stable channel; `dev` is the prerelease channel. semantic-release
   pushes release/changelog commits directly to these branches and backmerges
   `main` -> `dev`. Those automated release and backmerge commits are expected
   and are exempt from the global "linear history / no merge commits / never push
   to master-main" rules. Do not hand-edit `patches-list.json` (it is generated).

## Human workflow

1. Do feature/fix work on a topic branch (`feat/ig-download`, `fix/ig-feed-ads`),
   never committing it straight to `main` or `dev`.
1. Open the PR against `dev` for pre-release validation, or against `main` for a
   direct stable release. Squash-merge, and make the squash subject a valid
   Conventional Commit so semantic-release picks it up.
1. Re-pinning an app after an app update: validate the fingerprints against the
   new build, update the `AppTarget(version = ...)` in that app's
   `shared/Constants.kt`, and land it as a `bump:` commit.

## Patch layout

Patches live under `com.irzak.patches.<app>.<feature>`, with per-app
compatibility in `com.irzak.patches.<app>.shared.Constants`. Runtime helper code
(injected into the target app) goes under `com.irzak.extension.<app>`. Anchor
fingerprints on stable strings and structural shape, not minified names.
