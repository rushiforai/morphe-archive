# InstaRex Clone (`com.xboyrex.instarex`) & UnClone (`com.instagram.android`) Build Pipeline Report

## 1. Variant Specifications
| Attribute | Clone Variant | UnClone Variant |
|---|---|---|
| **Application ID / Package Name** | `com.xboyrex.instarex` | `com.instagram.android` |
| **App Display Label** | `InstaRex` | `InstaRex` |
| **Developer Branding** | `XBOYREX` | `XBOYREX` |
| **Launcher Icon** | `@drawable/rex_ic_launcher_instarex` (`#F10623` crimson + white camera glyph from `22951.png`) | `@drawable/rex_ic_launcher_instarex` (`#F10623` crimson + white camera glyph from `22951.png`) |
| **Round Launcher Icon** | `@drawable/rex_ic_launcher_round` | `@drawable/rex_ic_launcher_round` |
| **Provider Authorities** | Renamed to `com.xboyrex.instarex.*` / `com.xboyrex.instarex_<authority>` | Original `com.instagram.android.*` preserved |
| **Co-Installation with Official Instagram** | Supported (independent app data & authorities) | Replaces standard `com.instagram.android` installation |

## 2. Affected Source Files
- `patches/src/main/kotlin/app/rex/patches/instagram/misc/clone/ClonePatch.kt`
- `patches/src/main/kotlin/app/rex/patches/instagram/misc/settings/SettingsResourcePatch.kt`
- `patches/src/main/resources/instagram/settings/drawable/rex_ic_launcher_instarex.xml`
- `patches/src/main/resources/instagram/settings/drawable/rex_ic_launcher_foreground.xml`
- `patches/src/main/resources/instagram/settings/drawable/rex_ic_launcher_round.xml`
- `patches-list.json`
- `DESIGN_TOKENS.json`

## 3. Implementation Details
- Extracted the exact `#F10623` crimson red and pure white `#FFFFFF` camera glyph from the supplied `22951.png` reference image and created adaptive and circular vector launcher icons (`rex_ic_launcher_instarex.xml`, `rex_ic_launcher_foreground.xml`, `rex_ic_launcher_round.xml`).
- Updated `ClonePatch.kt` default options to `packageName = "com.xboyrex.instarex"` and `appName = "InstaRex"`, transforming `<manifest package="...">`, `<permission>`, `<uses-permission>`, `<provider android:authorities="...">`, `<application android:label="InstaRex" android:icon="@drawable/rex_ic_launcher_instarex" android:roundIcon="@drawable/rex_ic_launcher_round">`, and `MAIN`/`LAUNCHER` `<activity>` / `<activity-alias>` attributes.
- Updated `SettingsResourcePatch.kt` to copy all launcher icon drawables and apply the `InstaRex` label and custom crimson launcher icon by default so both Clone (`com.xboyrex.instarex`) and UnClone (`com.instagram.android`) display `InstaRex` in the Android launcher and recent apps.

## 4. Test Performed & Evidence
- Verified XML well-formedness of `rex_ic_launcher_instarex.xml`, `rex_ic_launcher_foreground.xml`, and `rex_ic_launcher_round.xml`.
- Verified `ClonePatch.kt` and `SettingsResourcePatch.kt` resource registration and manifest transformations via `scripts/verify_rex_ig_lite.py`.
- Status: `PASS` (Patch & Resource Pipeline Verified), `PARTIAL` (Final APK installation test on physical device pending GitHub Actions `.mpp` build & Morphe Manager patch run).

## 5. Remaining Limitations
- Installing the Clone variant (`com.xboyrex.instarex`) requires enabling the `Clone` patch in Morphe Manager when patching the Instagram APK (with default options `com.xboyrex.instarex` and `InstaRex` pre-filled).
