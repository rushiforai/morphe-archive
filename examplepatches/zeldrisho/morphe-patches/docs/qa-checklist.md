# QA checklist (per release / APK bump)

Manual E2E — run on a **throwaway account** (re-signed build + VPN/proxy on a
real account = ban risk, see `docs/lessons-learned.md`). Needs `adb` + the
pinned APK (`434.0.0.41.74` / versionCode `510406926` unless re-fingerprinting).

## 1. Build

```bash
# If SDK discovery is not configured: export ANDROID_HOME=$HOME/Android/Sdk
./gradlew :patches:test :extensions:extension:testDebugUnitTest
./gradlew buildAndroid          # .mpp -> patches/build/libs/patches-*.mpp
shellcheck scripts/*.sh
python3 -m unittest discover -s scripts/tests -v  # offline helper regression tests
```

## 2. Re-patch + install

```bash
MPP="patches/build/libs/patches-<version>.mpp" \
  scripts/repatch.sh /path/to/threads.apkm /tmp/threads_patched.apk
# Only update an existing install if its signing certificate matches.
adb install -r /tmp/threads_patched.apk
```

Record the input APK version/code and hash, bundle path/hash, enabled patches,
package ID, device/Android version, and signing certificate fingerprint (never
passwords). Keep screenshots, UI dumps, and logs outside Git.

- [ ] `aapt dump badging` shows no `AD_ID` permission
- [ ] Fresh login works with the default package and default-on patches.
      An existing session is a separate smoke test, not fresh-login evidence.
      Preserve it: ask before logout, clearing data, or uninstalling. Use a
      clean test device/profile where possible; the user enters credentials.
- [ ] Renamed package (`PACKAGE_NAME=...`) installs **alongside stock-signed**
      Threads, no `INSTALL_FAILED_DUPLICATE_PERMISSION`. Verify the stock
      copy's signing certificate against the original APK; a patched
      default-package copy does not satisfy this check. Do not replace an
      existing differently signed copy without approval.
- [ ] Both stock and renamed copies launch; test renamed-package login
      separately because OAuth/App Links can depend on package and signing.
- [ ] Launcher shows `APP_NAME` override

## 3. Feed ad removal (issue #5 regression)

Relabel-vs-remove signature: "labels disappeared but content still there" =
filter bypassed, predicate neutralized instead. Verify **removal**:

```bash
QA_DIR="$(mktemp -d /tmp/morphe-qa.XXXXXX)"
adb logcat -b crash -d > "$QA_DIR/crash-before.txt"
# Scroll the main feed and visually inspect changing content, then capture it.
adb shell uiautomator dump /sdcard/morphe-qa-ui.xml
adb pull /sdcard/morphe-qa-ui.xml "$QA_DIR/ui.xml"
adb shell rm /sdcard/morphe-qa-ui.xml
adb exec-out screencap -p > "$QA_DIR/feed.png"
adb logcat -b crash -d > "$QA_DIR/crash-after.txt"
# Label matches are only supplemental evidence; absence does not prove removal.
grep -oiE '\b(Ad|Sponsored)\b' "$QA_DIR/ui.xml" || true
```

- [ ] Sponsored units absent from main feed (gap-free, no blank cards),
      confirmed visually across refreshed/scrolled content, not just labels
- [ ] Video posts still open and play normally. Threads has no separate
      clips/reels surface; this is a playback regression check, not video-ad QA.
- [ ] Compare before/after crash buffers for new app crashes. The production
      `FeedAdFilter` emits no logs; a silent tag does not prove execution or
      removal. Use controlled comparison or verified temporary instrumentation
      for removal evidence. A clean smoke test is not comprehensive coverage.

Record each result as PASS / FAIL / BLOCKED with its evidence. Temporary files
are not durable evidence; retain sanitized notes in the release/PR record.
Do not merge the stable release while required checks remain blocked.

## 4. Version bump (new Threads release)

- [ ] Fingerprint `FeedMergeMethod` (A0F, `BarcelonaFeedCache`, 8 params + `this`)
      still resolves to exactly 1 method — 0 or >1 means R8 drift, re-hunt per
      `docs/reverse-engineering.md`
- [ ] Re-run steps 1–3 on the new version before updating `Constants.kt`
