# Upstream provenance

**GboardSamsung** (`https://github.com/vortexnode/GboardSamsung`, maintained by **Vortex Node**) is an independent downstream customization derived from:

- **Historical upstream repository:** https://github.com/jasonwu1994/Gboard-patches
- **Upstream author:** Jason Wu
- **Historical upstream branch:** `main`
- **Imported upstream commit:** `463269a0f315ef9cee749e10d155af1aedaa49ad` (recorded in `UPSTREAM_COMMIT.txt`)
- **Upstream commit date:** `2026-11-12`
- **License:** GNU General Public License v3.0 (`LICENSE`, `NOTICE`)
- **Patch framework:** Morphe

> **Independence notice:** The upstream repository is recorded strictly for historical provenance and GPL-3.0 attribution. It is **not** an active import source, build dependency, CI dependency, or mandatory runtime dependency of `vortexnode/GboardSamsung`.

## Important distinction

Both historical upstream Gboard Patches and downstream GboardSamsung are Morphe patch sources. Neither contains Google's proprietary Gboard application source code. They build patch bundles (`.mpp`) and catalog metadata that Morphe applies to a user-provided compatible Gboard APK (`18.5.4.993608717-release-arm64-v8a`).

Upstream previously used `GboardWu` as the default Package Rename display name and `dev.jason.com.google.android.inputmethod.latin` as the default patched package ID; GboardSamsung uses `GboardSamsung` as its default app and spell checker display name, `gboardsamsung.com.google.android.inputmethod.latin` as its default side-by-side package ID (keeping official `com.google.android.inputmethod.latin`, custom IDs, and legacy runtime compatibility), and `rootProject.name = "GboardSamsung"` in Gradle while preserving technical extension namespaces (`dev.jason.gboardpatches`, `extensions/gboard-patches.rve`) for binary/runtime compatibility.

## Downstream divergence summary

1. **Added:** `Samsung Spacebar Gestures` (`samsung_spacebar_gestures`) as an independent public patch.
2. **Removed (12 upstream patches):** `latin_globe_key_ignore_interval`, `web_clipboard`, `zhuyin_bottom_row_key_sizes`, `zhuyin_quick_traditional_simplified_toggle`, `zhuyin_slide_input`, `g_logo_on_spacebar`, `english_qwerty_up_flick_uppercase`, `lan_ftp_server`, `swipeable_custom_top_row`, `enable_ocr_scan_text`, `enable_accessibility_layout`, and `enable_cursor_trackpad_mode`, along with their exclusive dependencies (Apache FTPServer/MINA, QuickJS native payload, G Logo image payload).
3. **Self-hosted runtime assets:**
   - Custom Theme preview archive download URL in `GboardCustomThemePreviewRepository.java` now points to `https://github.com/vortexnode/GboardSamsung/releases/download/custom-theme-previews-v1/custom-theme-previews-v1.zip` (pinned to SHA-256 `368af5064b2e8ed62800417efd6fa015d12c74a94553002823eade85d8213ee9`). The archive and manifest live in `release-assets/custom-theme-previews/v1/` and are published via `.github/workflows/custom-theme-previews-release.yml` when tag `custom-theme-previews-v1` is pushed.
4. **Automatic upstream import removed:**
   - `.github/workflows/import-upstream.yml` has been deleted. Upstream history and attribution remain archived in `LICENSE`, `NOTICE`, `UPSTREAM_COMMIT.txt`, `UPSTREAM_README.md`, `CHANGELOG.md`, and this document.
5. **Non-mandatory informational / passive references retained:**
   - Two optional Frosted Glass FAQ browser links (`issues/68`, `issues/58`) in `GboardFrostedGlassSettingsFeature.java` pointing to historical upstream troubleshooting threads (not required for runtime, build, or CI).
   - Passive JSON Schema `$id` URIs in `patches/src/**/gboard-*.schema.json` (static schema identifiers, never fetched over the network).

## Historical upstream reference policy

There is no automated upstream sync pipeline. If a maintainer ever inspects or manually ports an individual upstream bug fix in the future:
1. Verify `LICENSE` / `NOTICE` compatibility under GPL-3.0.
2. Port selectively by hand — do **not** re-introduce the 12 removed features or overwrite downstream branding (`Vortex Node`, `vortexnode/GboardSamsung`, `GboardSamsung` default display name), `samsung_spacebar_gestures`, or downstream preview release URLs.
3. Keep `gboard-port-product-catalog.json`, `gboard-port-product-catalog.sha256`, `gboard-version-bindings.json`, and `patches-list.json` synchronized.

## Build & CI requirements

- Full CI verification (`.github/workflows/ci.yml`): runs unit tests across `:patches`, `:extensions:extension`, and `:extensions:calculator`, verifies `patches-list.json` matches `./gradlew generatePatchesList`, and builds `:patches:buildAndroid` on pushes/PRs to `main` (without publishing releases).
- Build patch bundle: `./gradlew :patches:buildAndroid`
- Regenerate patch metadata: `./gradlew generatePatchesList`
- Outputs: `patches/build/libs/*.mpp`, `patches-list.json`, `patches-bundle.json`
- Authentication to Morphe's GitHub Packages registry uses `gpr.user` and `gpr.key` in Gradle properties, `GITHUB_ACTOR` and `GITHUB_TOKEN` locally, or the `MORPHE_PACKAGES_TOKEN` repository secret in GitHub Actions.

Never commit credentials, tokens, or proprietary Gboard APKs.
