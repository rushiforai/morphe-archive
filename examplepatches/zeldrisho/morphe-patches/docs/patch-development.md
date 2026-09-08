# Patch development

How patches in this repo are structured, written, built, and tested.
See `reverse-engineering.md` (finding targets), `fingerprint-guide.md` (fingerprints),
`bypass-patterns.md` (per-SDK techniques), `architecture.md` (module layout).

## Patch types

| Type | Modifies | Speed | Use when |
| ---- | -------- | ----- | -------- |
| `bytecodePatch` | Dalvik bytecode | Fast (no resource decoding) | Almost always — prefer this |
| `rawResourcePatch` | Raw files / assets | Medium | Files that don't need decoding |
| `resourcePatch` | Decoded XML/resources | Slow (decodes everything) | Manifest, `res/values/*` edits |

## File layout

One app = one folder; one concern = one subfolder with its fingerprints next to the patch:

```
patches/src/main/kotlin/com/zeldrisho/threads/patches/
├── shared/Constants.kt          # Compatibility records (package, file type, versions)
├── ads/
│   ├── FeedMergeRegisters.kt    # Register helpers
│   └── HideAdsPatch.kt          # Patch and named fingerprint
└── misc/
    ├── analytics/
    ├── branding/
    └── packagename/
```

- Shared targets go in `shared/Constants.kt` (see `architecture.md` for the fields).
- Pin **exact** `AppTarget` versions you fingerprinted and tested — never ship
  `version = null` as the only target. Rationale: Morphe Manager rejects a null
  ("any") version (the whole source fails to load), and R8-obfuscated bytecode
  patches only verifiably resolve on the fingerprinted version; pinning makes
  staleness explicit instead of silently matching the wrong code. Prefer versions
  available on well-known APK mirrors (see `Constants.kt` comments).
- Internal-only helpers stay unnamed (`bytecodePatch { ... }` without `name`) and are
  wired in via `dependsOn(...)` (unnamed `bytecodePatch { ... }` without `name`).
- Complex runtime logic goes in `extensions/extension/src/main/java/` and is linked with
  `extendWith("extensions/extension.mpe")` (when to use it: below).
- Prefer exact `AppTarget` versions available on well-known APK mirrors over `version = null` (see above — null breaks Manager loading).
- Every user-visible patch needs an honest `description`: state what it does AND
  its limits (e.g. "client-side IMA ads only; server-stitched SSAI on live streams
  may remain", "UI only — content stays server + Widevine gated", "rename may
  break Google/OAuth sign-in"). If the target is server-gated with no client gate
  (see `lessons-learned.md`), don't ship a fake unlock — document it as a limitation.

## Writing a patch

```kotlin
@Suppress("unused")
val myPremiumPatch = bytecodePatch(
    name = "My Premium",
    description = "Unlocks premium features."
) {
    compatibleWith(COMPATIBILITY_MYAPP)

    execute {
        // Force-allow a boolean gate:
        MyFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)
    }
}
```

For targeted edits at a matched instruction, see the `instructionMatches` pattern in `fingerprint-guide.md`.

Prefer the `app.morphe.util` helpers when they cover the case
(`returnEarly(true/false)`, `indexOfFirstStringInstructionOrThrow`, …) —
see `fingerprint-guide.md`.

## Resource patches

```kotlin
// Manifest flag (e.g. deactivate analytics collection):
resourcePatch {
    execute {
        document("AndroidManifest.xml").use { doc ->
            val app = doc.getElementsByTagName("application").item(0) as Element
            val meta = doc.createElement("meta-data").apply {
                setAttribute("android:name", "firebase_analytics_collection_deactivated")
                setAttribute("android:value", "true")
            }
            app.appendChild(meta)
        }
    }
}

// Override an integer limit stored in resources:
resourcePatch {
    execute {
        document("res/values/integers.xml").use { doc ->
            doc.documentElement.childNodes
                .findElementByAttributeValueOrThrow("name", "max_free_user_count")
                .textContent = Int.MAX_VALUE.toString()
        }
    }
}
```

## Extensions vs inline smali

| Scenario | Use |
| -------- | --- |
| Return true/false/void, simple value override | Inline smali |
| Read a setting at runtime | Extension (reads preferences) |
| Filter a list, manipulate strings, branch heavily | Extension (Java list/string ops) |
| Touch Android APIs (`Context`, `Toast`), network, signatures | Extension |
| Intercept before any SDK inits (signature spoof) | Extension (`Application` subclass) |

Extension methods called from patched bytecode must be `public static`; mark them
`@SuppressWarnings("unused")` since nothing references them at compile time.
Settings are best read once at class-load time (`static final`) for performance.

### Defensive extension convention

Extensions run inside someone else's app on versions you never tested — a layout
change must degrade to a no-op, never a crash. Follow these rules (proven pattern:
a backup-screen launcher that surfaces a hidden activity via an injected row):

- Resolve everything by **name at runtime** (`Class.forName`,
  `Resources.getIdentifier`) — never hardcode resource IDs or reference obfuscated
  app classes directly, so the code survives R8 renames.
- Hook early entry points (e.g. `onCreate`) but defer view work with
  `decorView.post(...)` so the layout exists when you touch it.
- Dedupe injected views with a tag (`findViewWithTag`) so repeat calls are safe.
- Wrap **every** call in `try/catch (Throwable)` — including the posted `Runnable`
  body — so any drift silently skips the feature instead of crashing the host.
- Clone the sibling's `LayoutParams` and match the host widget type (e.g. reuse the
  app's own row class) so injected UI looks native.
- Keep the app's own machinery unmodified; only add the entry point (e.g. open the
  hidden activity via explicit `Intent.setClassName`).

```kotlin
val myPatch = bytecodePatch(name = "My Feature") {
    extendWith("extensions/extension.mpe")
    execute {
        TargetFingerprint.method.addInstructionsWithLabels(0, """
            invoke-static { }, Lapp/template/extension/myapp/MyPatch;->isEnabled()Z
            move-result v0
            if-eqz v0, :disabled
            return-void
            :disabled
            nop
        """)
    }
}
```

## Build and test

```bash
./gradlew buildAndroid                        # → patches/build/libs/patches-*.mpp
./gradlew generatePatchesList
./gradlew :patches:buildAndroid clean --no-daemon
```

Apply the `.mpp` in Morphe Desktop against the **original `.apks` split container**
matching the supported Threads version and `ApkFileType.APKS` compatibility
declaration (never an extracted `base.apk`), then `adb install -r` the output.
To debug one patch in isolation, apply
only it (`--exclusive`-style single-patch run in the CLI/Desktop) before the full suite —
a fingerprint failure elsewhere won't mask your result that way.

Work on `dev`, merge (no squash) to `main` for stable releases; `feat:`/`fix:`/`chore:`
semantics and the generated-files rules live in `release.md` and `development.md`.

## Troubleshooting

| Symptom | Likely cause | Fix |
| ------- | ------------ | --- |
| `Fingerprint declared no instruction filters` | Using `instructionMatches` without `filters` | Add `filters`, or use `strings` + `stringMatches` |
| `Failed to match the fingerprint` | Code moved / signature changed | Re-verify smali (§ debugging checklist in `fingerprint-guide.md`) |
| Patched app crashes on launch | Wrong register / wide-type (`J`/`D`) shift | `adb logcat`, recount registers from smali |
| "Not compatible" / install fails | Split APK (`requiredSplitTypes`) | Use `XAPK`/`APKM` with matching `ApkFileType` |
| Google login / Drive broken | Signature mismatch after re-signing | Expected; not fixable without an account-spoof patch |
| Server-gated features still locked | Server-side validation (credits, cloud) | Not bypassable client-side — document as limitation |
| Gradle auth failure | Missing registry credentials | `gpr.user`/`gpr.key` (or `GITHUB_ACTOR`/`GITHUB_TOKEN`), see `development.md` |

## Known limitations (set expectations in patch descriptions)

- Re-signed APKs break Google sign-in and anything bound to the original certificate.
- Client-side license/integrity bypasses never beat server-side attestation.
- Split-only apps must be distributed as `XAPK`/`APKM`, not standalone APKs.
