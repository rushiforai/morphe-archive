# Maintenance

How this repository is kept working without anyone watching it. Written for the scheduled Claude
task that looks after it, and readable by a person.

## What this repository is

A small, standalone Morphe patch bundle. It is **not** a fork of the official patches and must
never contain code copied from them. It holds one patch per app, both named `Duet reminders`:

| App | Package | What the patch does |
|---|---|---|
| YouTube | `com.google.android.youtube` | merges the extension, adds a provider, a notification listener service and `<queries>` entries to the manifest |
| Reddit | `com.reddit.frontpage` | the same |

The patches match **no code of the apps** (no fingerprints), so an app update cannot break them.
What can break them is a change on the Morphe side. That is what the check below is for.

Layout:

- `patches/` the patches (Kotlin) and their test, which patches a stand-in app built in code
- `extensions/nudge/` everything that runs inside the apps (Java, Android framework only), with its tests
- `scripts/compat-check.sh` the check against the official bundle
- `docs/upstream-verified.json` the last official release this bundle was verified against

## Rules that must keep holding

1. **Unique names.** The extension file is `extensions/duetnudge.mpe`, the Java package is
   `app.variablenine.nudge`, the Kotlin package is `app.variablenine.patches`. When two bundles
   contain a class or a file of the same name, the first one loaded silently wins.
2. **`Compatibility` names stay exactly `YouTube` and `Reddit`**, and no app versions are listed.
   Morphe Manager matches those names against the changelog to decide which app to flag.
3. **The provider authority is `<package name>.duetnudge`**, read from the manifest when the patch
   runs. The official GmsCore support and Clone app patches rename packages and rewrite authorities
   that start with the old name; this form follows along in either order. `SiblingSync.AUTHORITIES`
   in the extension and `YOUTUBE_PACKAGES`/`REDDIT_PACKAGES` in `ReminderSpot.kt` list the names
   the apps can end up with and must be changed together.
4. **The extension must avoid what the official patches rewrite in every class of an app:**
   no class extending `Activity` or `Application`, no `attachBaseContext`, no `Vibrator`, no
   `PackageManager.getPackageInfo`, no `versionCode`, no installer-source getters, no
   `Resources.updateConfiguration`, no string built by appending `getPackageName()`, no literal
   `com.google` or `com.google.android.gms`. No dependencies and no XML resources either.
5. **Nothing in the extension may crash or slow the host app.** Every callback catches its own
   failures. Nothing touches the disk before the first screen is shown.
6. **No `morphe-signing.pub` in the repository unless the `MORPHE_SIGNING_KEY` secret holds the
   matching private key.** A published key with an unsigned bundle makes Morphe Manager refuse
   every release ("Key changed"). That is what silently broke updates of the 1.x fork.
7. Never force-push `main`, never rewrite or delete release commits or tags, never edit
   `patches-bundle.json`, `patches-list.json` or `CHANGELOG.md` by hand.

## How a release happens

- `main` is the only branch that matters. A push to `main` runs `.github/workflows/release.yml`:
  tests, then semantic-release, which reads the commit subjects since the last tag, and if any of
  them releases something builds the bundle, publishes the GitHub release and commits
  `CHANGELOG.md`, `patches-bundle.json`, `patches-list.json`, `README.md` and `gradle.properties`.
  `dev` is only kept identical to `main` by the release itself, for people who switched on
  pre-releases in Morphe Manager.
- Changes go through a pull request into `main` from a `claude/...` branch. `.github/workflows/ci.yml`
  runs on the pull request. Merge with a **merge commit**, never squash: the release notes are made
  from the individual commit subjects.
- The owner does not want to merge by hand. Whoever opens a pull request here also merges it once
  CI is green.

### Commit subjects decide whether an update is announced

Morphe Manager flags an app as "has new patches" only if the newest `CHANGELOG.md` entries contain
a bullet that names the app. The bullets are the commit subjects. So:

| Kind of change | Subject |
|---|---|
| for one app | `fix(YouTube - Duet reminders): Keep the tab above the mini player` |
| for both apps (shared code, which is most changes) | `fix: Tab overlaps the navigation bar in YouTube and Reddit` |
| nothing a user would notice | `chore: ...`, `docs: ...`, `ci: ...`, `test: ...`, `refactor: ...` (no release) |

`feat` gives a minor release, `fix`, `perf` and `bump` a patch release, a `!` after the type a
major one. `scripts/check-commit-subjects.py` enforces the naming in CI.
Never start a subject with "Add experimental support for": Morphe Manager skips such entries.
Do not use a `BREAKING CHANGE:` footer: everything after it, attribution lines included, ends up
in the release notes. The `!` is enough.

### A release run has to end green

The last thing a release does is copy `main` to `dev`. In 2.0.0 that step failed, after the release
itself had been published, because a `.gitattributes` file asked for line endings that the
committed `gradlew.bat` does not have, which made git see the file as changed. The file was
removed. Do not add line-ending rules back without also normalising the files they cover.
If a release run ends red, read which step failed before doing anything else: when the release was
published and only the copy to `dev` failed, `dev` is merely behind (Morphe Manager takes the
higher version of the two branches) and the next release run brings it up to date.

## The upstream check

Run whenever the official Morphe patches publish a new **stable** release (never for `-dev`
pre-releases). The scheduled task does this every day.

1. **Is there anything to do?** Compare the `version` in
   `https://raw.githubusercontent.com/MorpheApp/morphe-patches/main/patches-bundle.json` with
   `official_patches_version` in `docs/upstream-verified.json`. If they are equal, stop: nothing to do.
2. **Build and test what is on `main`:**
   `./gradlew :extensions:nudge:testDebugUnitTest :patches:test :patches:buildAndroid`
   (needs `GITHUB_ACTOR` and `GITHUB_TOKEN` for GitHub Packages; where there is no token, CI on a
   pull request is the build).
3. **Run `scripts/compat-check.sh`**, with real apps if they can be had:
   `scripts/compat-check.sh --youtube <apk> --reddit <apk or apkm>`.
   Use the versions the new official release recommends: the first non-experimental target of
   YouTube and Reddit in the official `patches-list.json` (same raw URL, other file name).
   Unmodified app files have been found at
   `https://archive.org/download/jhc-apks/apks/com.google.android.youtube/com.google.android.youtube-<version>-all.apk`,
   `https://archive.org/download/sixstrings-apks/com.reddit.frontpage_<version>.apkm` and
   `https://d.apkpure.net/b/APK/<package>?versionCode=<code>`. Never commit an app file.
   Without app files the script still compares patcher versions and file names; say in the report
   that the combined run was skipped.
4. **Read the official changelog** between the two versions
   (`https://raw.githubusercontent.com/MorpheApp/morphe-patches/main/CHANGELOG.md`) for anything
   that touches: the patcher or Gradle plugin version, manifest handling (GmsCore support, Clone
   app, package names, authorities, queries), changes described as applying to "all classes", the
   add-on support, or new requirements for third-party bundles.
5. **If everything passes:** record it. Update `docs/upstream-verified.json` and commit it as
   `chore: Verify against official Morphe patches vX.Y.Z` (a `chore` does not release). Pull
   request, CI green, merge.
6. **If something fails:** fix it, then release.
   - *Patcher or plugin version changed:* set the same versions in `gradle/libs.versions.toml` and
     `settings.gradle.kts` as the official repository uses, adapt the code to API changes
     (`ReminderSpot.kt` is the only code that calls the patcher), rebuild, rerun everything.
     A bundle built for a newer patcher than the user's Morphe Manager ships is unusable there, so
     do not move ahead of what the official stable release uses.
   - *A shared file or class name appeared:* rename ours.
   - *Our components are missing or the authority did not follow a rename:* read what changed in
     the official manifest handling and adapt `ReminderSpot.kt`. Update `DuetRemindersPatchTest`
     so that the stand-in for the official behaviour matches the new behaviour.
   - *Other patches now rewrite more of our classes* (`scripts/dex-diff.py` prints what they
     did): read the official patch that does it and decide whether the rewritten call still
     behaves the same for us. If not, stop using the call they hook.
   - Commit with a subject that names the apps, for example
     `fix: Support official Morphe patches vX.Y.Z in YouTube and Reddit`, plus the updated
     `docs/upstream-verified.json` in the same pull request. CI green, merge.
7. **Confirm the release.** After merging a releasing change, wait for the Release workflow, then
   check that `patches-bundle.json` on `main` carries the new version, that the release has the
   `.mpp` attached, and that the newest `CHANGELOG.md` entry has a bullet naming YouTube and Reddit.

A run ends in exactly one of three ways: nothing to do; verified (or fixed and released), with the
version named; or blocked, with a pull request left open and a comment on it saying exactly what
changed upstream, what was tried and where it is stuck. An open pull request without such a comment
is a failed run. CI results do not always arrive as events: poll the pull request's checks until
they finish rather than waiting to be told.

## Local building without a GitHub token

GitHub Packages refuses anonymous downloads. Where no token is available, the Morphe build tools
can be built from source and published to the local Maven repository instead: clone
`MorpheApp/morphe-patcher` and `MorpheApp/morphe-patches-gradle-plugin` at the versions named in
`gradle/libs.versions.toml` and `settings.gradle.kts`, run `./gradlew publishToMavenLocal` in each
(signing tasks can be disabled), then build here with `-Pgpr.user=local -Pgpr.key=none`. The
settings script already looks in the local Maven repository first. The extension tests download
the simulated Android runtime from Maven Central; where that is rate limited, pass
`-Pduet.robolectricRepo=<mirror URL>`.

## Things only the owner can do

- **Signing releases.** Run `./gradlew generateSigningKey`, commit `morphe-signing.pub`, and store
  the content of `morphe-signing.key` as the repository secret `MORPHE_SIGNING_KEY`. Both or
  neither (rule 6). Unsigned releases work fine.
- **Changing the model or the schedule of the scheduled task**, at claude.ai/code/routines.
