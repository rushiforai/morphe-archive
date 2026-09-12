# Patch development

How patches in this repo are structured, written, built, and tested.
See the [reverse engineering workflow](reverse-engineering.md) (finding targets),
[fingerprint guide](fingerprint-guide.md) (fingerprints),
[bypass patterns](bypass-patterns.md) (per-SDK techniques), and
[architecture](architecture.md) (module layout).

## Patch types

| Type | Modifies | Speed | Use when |
| ---- | -------- | ----- | -------- |
| `bytecodePatch` | Dalvik bytecode | Fast (no resource decoding) | Almost always — prefer this |
| `rawResourcePatch` | Raw files / assets | Medium | Files that don't need decoding |
| `resourcePatch` | Decoded XML/resources | Slow (decodes everything) | Manifest, `res/values/*` edits |

## File layout

One app = one folder under `com/zeldrisho/patches/`; one concern = one subfolder with its fingerprints next to the patch. Shared, app-agnostic helpers live in `shared/`; app compatibility lives with its app:

```
patches/src/main/kotlin/com/zeldrisho/patches/
├── shared/
│   ├── bytecode/MethodExtensions.kt  # clearBody/ensureRegisters
│   └── resources/AdIdStrip.kt        # AD_ID manifest helper
├── threads/
│   ├── shared/Constants.kt           # COMPATIBILITY_THREADS only
│   ├── ads/
│   │   ├── FeedMergeRegisters.kt    # Register helpers
│   │   ├── FeedReflectionContract.kt # Patch-time reflection ABI validation
│   │   ├── Fingerprints.kt         # Structural feed-merge fingerprint
│   │   └── HideAdsPatch.kt         # Injection
│   └── misc/
│       ├── analytics/               # RemoveAdIdPatch (uses shared AdIdStrip)
│       ├── branding/
│       └── packagename/
└── zalo/
    ├── shared/Constants.kt           # COMPATIBILITY_ZALO only
    ├── ads/
    └── notif/
```

- Shared implementation does not imply shared compatibility: Threads and Zalo
  patches may call the same `shared/` helper while declaring separate
  `COMPATIBILITY_*` records.
- Pin **exact** `AppTarget` versions you fingerprinted and tested — never ship
  `version = null` as the only target. Morphe Manager rejects a null ("any")
  version (the whole source fails to load), and R8-obfuscated bytecode
  patches only verifiably resolve on the fingerprinted version; pinning makes
  staleness explicit instead of silently matching the wrong code. Use the
  APKMirror original the fingerprint was verified against and record its
  versionCode (see `Constants.TESTED_VERSION_CODE`); same version *names* from
  other mirrors can carry different codes.
- Internal-only helpers stay unnamed (`bytecodePatch { ... }` without `name`) and are
  wired in via `dependsOn(...)`.
- Complex runtime logic goes in the target's extension module (for example
  `extensions/threads/src/main/java/`) and is linked with its matching
  `extendWith(...)` artifact (when to use it: below).
- Every user-visible patch needs an honest `description`: state what it does AND
  its limits (e.g. "client-side IMA ads only; server-stitched SSAI on live streams
  may remain", "UI only — content stays server + Widevine gated", "rename may
  break Google/OAuth sign-in"). If the target is server-gated with no client gate
  (see [lessons learned](lessons-learned.md#what-is-and-isnt-patchable)), don't ship a fake unlock — document it as a limitation.
- Risky patches (login/providers/push at risk) ship `default = false` with a WARNING
  in the description. Precedent: Change package name (renaming breaks package+cert-bound
  SSO). `PatchesListShapeTest` guards the default, so a regression fails CI.

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

For targeted edits at a matched instruction, see the `instructionMatches` pattern in the
[fingerprint guide](fingerprint-guide.md#using-fingerprints-in-patches).

Common `addInstructions` shapes (all verified against the installed patcher API):

```kotlin
// Force-allow a boolean check:
method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
// Force-deny:
method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
// Skip a void method entirely:
method.addInstructions(0, "return-void")
```

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

Extension modules are 1:1 with target apps: `:extensions:threads` serves
Threads and `:extensions:zalo` serves Zalo. Keep each extension dex minimal and
never reference another app's classes from injected smali — cross-app class
descriptors contaminate the dex and couple unrelated patches. Truly shared
runtime code belongs in a separate shared module.

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
            invoke-static { }, Lcom/zeldrisho/threads/extension/MyPatch;->isEnabled()Z
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

Host APKM and signing-key locations are maintained in [toolchain storage and
path conventions](toolchain.md#6-storage-and-path-conventions). The CLI's
keystore discovery, aliases, passwords, and integrity checks are documented in
[CLI signing](cli.md#signing); do not add another environment-specific key path
here.

```bash
./gradlew :patches:test :extensions:threads:testDebugUnitTest :extensions:zalo:testDebugUnitTest buildAndroid --no-daemon
# .mpp -> patches/build/libs/patches-*.mpp
```

Apply the `.mpp` via the terminal ([CLI patching](cli.md)) against the **downloaded APKMirror split bundle**
(see [toolchain storage and source conventions](toolchain.md#6-storage-and-path-conventions)
and [original APK source](toolchain.md#7-original-apk-source)) matching the supported
Threads version and `ApkFileType.APKS` compatibility declaration (never an
extracted `base.apk`), then `adb install -r` the output.
To debug one patch in isolation, apply
only it (`patch --exclusive -e "Name"`, see [CLI patching](cli.md#canonical-flows-this-repo)) before the full suite —
a fingerprint failure elsewhere won't mask your result that way.

For branching and publishing, follow the [release process](release.md).
Generated-file ownership is defined in the [release rules](release.md#rules).

## Troubleshooting

| Symptom | Likely cause | Fix |
| ------- | ------------ | --- |
| `Fingerprint declared no instruction filters` | Using `instructionMatches` without `filters` | Add `filters`, or use `strings` + `stringMatches` |
| `Failed to match the fingerprint` | Code moved / signature changed | Re-verify smali ([fingerprint debugging](bytecode-reference.md#fingerprint-debugging)) |
| Patched app crashes on launch | Wrong register / wide-type (`J`/`D`) shift | `adb logcat`, recount registers from smali |
| "Not compatible" / install fails | Split APK (`requiredSplitTypes`) | Pass the downloaded `.apkm` bundle through; keep `ApkFileType.APKS` in sync with what Morphe accepts |
| Google login / Drive broken | Signature mismatch after re-signing | Expected; not fixable without an account-spoof patch |
| Server-gated features still locked | Server-side validation (credits, cloud) | Not bypassable client-side — document as limitation |
| Gradle auth failure | Missing registry credentials | `gpr.user`/`gpr.key` (or `GITHUB_ACTOR`/`GITHUB_TOKEN`), see [toolchain setup](toolchain.md#4-repository-dependencies) |

## Signing and microG OAuth notes

Morphe keystore aliases are case-sensitive: `morphe` is not the same entry as
`Morphe`. Pass the exact alias and matching key password to `repatch.sh`, then
confirm the output with `apksigner verify --print-certs` before device QA.

MicroG's `app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE` metadata is a
signature-spoofing contract and takes the stock certificate in raw DER hex. It
is not the value to copy into Google Developer Console: OAuth Android-client
registration uses the lowercase 40-character SHA-1 fingerprint
`9487ba76b32e9e36785fb4c3540021f85af8d7b7`. Runtime `client_sig` and
`callerSig` may still be emitted as raw DER hex by the auth request, so verify
both the metadata format and the actual request independently.

A re-signed APK may launch and reach a Drive restore flow while MicroG returns
`UNREGISTERED_ON_API_CONSOLE`. This is a known upstream limitation when Google
OAuth attestation enforces server-side project keys; Drive backup/restore is
not considered validated until the registered package and certificate are
accepted.

## Known limitations (set expectations in patch descriptions)

- Re-signed APKs break Google sign-in and anything bound to the original certificate.
- Client-side license/integrity bypasses never beat server-side attestation.
- Google Drive backup/restore may remain unavailable for re-signed clients because of server-side OAuth project-key attestation.
- Split-only apps must be patched from the downloaded split bundle, not a standalone extracted APK.
