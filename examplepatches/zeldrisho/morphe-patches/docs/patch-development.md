# Patch development

How patches in this repo are structured, written, built, and tested.
See the [reverse engineering workflow](reverse-engineering.md) (finding targets),
the fingerprint reference below,
[target selection](#target-selection), and
[repository structure](development.md#repository-structure) (module layout).

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
├── <app>/shared/Constants.kt       # App compatibility only
└── <app>/<concern>/                 # Fingerprints and patch implementation
```

- Shared implementation does not imply shared compatibility: different app patches may call the same `shared/` helper while declaring separate
  compatibility records.
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
  `extensions/<app>/src/main/java/`) and is linked with its matching
  `extendWith(...)` artifact (when to use it: below).
- Every user-visible patch needs an honest `description`: state what it does AND
  its limits (e.g. "client-side IMA ads only; server-stitched SSAI on live streams
  may remain", "UI only — content stays server + Widevine gated", "rename may
  break Google/OAuth sign-in"). If the target is server-gated with no client gate
  (see the limitations guidance below), don't ship a fake unlock — document it as a limitation.
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
fingerprint usage below.

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
Settings are best read once at class-load time (`static final`) when immutable;
settings that users can change at runtime must be refreshed at the documented
lifecycle boundary instead.

Extension modules are 1:1 with target apps: each extension serves one target app. Keep each extension dex minimal and
never reference another app's classes from injected smali — cross-app class
descriptors contaminate the dex and couple unrelated patches. Truly shared
runtime code belongs in a separate shared module.

### Defensive extension convention

Extensions run inside someone else's app on versions you never tested — a layout
change must degrade to a no-op, never a crash. Follow these rules (proven pattern:
a backup-screen launcher that surfaces a hidden activity via an injected row):

- Resolve resources by **name at runtime** (`Resources.getIdentifier`), but do not
  assume runtime reflection survives obfuscation: validate the expected class,
  method signature, and return type before use. Prefer inline smali or an
  app-specific compile-only stub when the ABI is known and must be explicit.
- Hook early entry points (e.g. `onCreate`) but defer view work with
  `decorView.post(...)` so the layout exists when you touch it.
- Dedupe injected views with a tag (`findViewWithTag`) so repeat calls are safe.
- Catch only around the smallest host-boundary operation that may drift, such as
  class/resource lookup or a posted view update. Catch `Exception` (or a narrowly
  documented linkage/reflection error), return a safe no-op, and emit only a
  bounded non-sensitive diagnostic. Do not blanket-catch `Throwable` or hide
  programmer errors, thread cancellation, or fatal VM conditions.
- Clone the sibling's `LayoutParams` and match the host widget type (e.g. reuse the
  app's own row class) so injected UI looks native.
- Keep the app's own machinery unmodified; only add the entry point (e.g. open the
  hidden activity via explicit `Intent.setClassName`).

```kotlin
val myPatch = bytecodePatch(name = "My Feature") {
    extendWith("extensions/extension.mpe")
    execute {
        TargetFingerprint.method.addInstructionsWithLabels(0, """
            invoke-static { }, Lcom/example/extension/MyPatch;->isEnabled()Z
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
./gradlew :patches:test buildAndroid --no-daemon
# .mpp -> patches/build/libs/patches-*.mpp
```

Apply the `.mpp` via the terminal ([CLI patching](cli.md)) against the **downloaded APKMirror split bundle**
(see [toolchain storage and source conventions](toolchain.md#6-storage-and-path-conventions)
and [original APK source](toolchain.md#7-original-apk-source)) matching the supported
the target version and `ApkFileType.APKS` compatibility declaration (never an
extracted `base.apk`), then install the output with
`android install --apks=<path-to-verified.apk> --device="$SERIAL"` (or use
`android run --apks=<path-to-verified.apk> --device="$SERIAL"` to install and
launch). For UI debugging, prefer `android layout --device="$SERIAL" --full`
and `android screen capture --device="$SERIAL" --output=<path>`.
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
| Google login / Drive broken | Signature/provider authorization mismatch after re-signing | External provider boundary; record as blocked, do not spoof account state |
| Server-gated features still locked | Server-side validation (credits, cloud) | Not bypassable client-side — document as limitation |
| Gradle auth failure | Missing registry credentials | `gpr.user`/`gpr.key` (or `GITHUB_ACTOR`/`GITHUB_TOKEN`), see [toolchain setup](toolchain.md#4-repository-dependencies) |

## Signing and microG OAuth notes

Morphe keystore aliases are case-sensitive: `morphe` is not the same entry as
`Morphe`. Pass the exact alias and matching key password to `repatch.py`, then
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


## Fingerprints

## Rules

Policy first, exception second:

- **Prefer stable anchors** (SDK calls, strings, opcodes, signatures) over
  obfuscated app names (`a`, `b`, `H`, …), which change nearly every release.
- **Version-pinned exception:** when no stable anchor uniquely identifies a
  heavily obfuscated target (as with an app-specific reflection ABI), matching on
  the obfuscated class/method shape is acceptable **only** with an exact pinned
  `AppTarget` version plus the tested `versionCode`, a loud drift test, and a
  documented re-hunt path. See [patch development](patch-development.md#file-layout).
- **Filter order must equal smali instruction order.** Ordered `filters` are preferred
  over unordered `strings`.
- **Only touch `instructionMatches` when the fingerprint defines `filters`.**
- **Use `"L"` for obfuscated parameter types** (bare `L` = any object type).
- **Always verify against smali**, never jadx Java alone.
- **Declare fingerprints as named `object`s** so match failures print a useful name.
- When editing several instructions in one method, work **last index first** (or
  re-match after each edit) so earlier edits don't shift later indices.

## Fingerprint declaration

All fields optional — use the minimum that uniquely identifies the method:

```kotlin
object MyFingerprint : Fingerprint(
    // definingClass = "Lcom/example/Class;",  // only for stable (SDK) classes,
    //   or a version-pinned obfuscated target (see Rules above)
    // name = "methodName",                    // only for non-obfuscated methods,
    //   or a version-pinned obfuscated target (see Rules above)
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;", "I", "L"),

    // Ordered — must follow the target method's instruction order:
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET, definingClass = "this", type = "Ljava/util/Map;"),
        string("showBannerAds"),
        methodCall(definingClass = "Ljava/lang/String;", name = "equals"),
        opcode(Opcode.MOVE_RESULT, InstructionLocation.MatchAfterImmediately()),
        literal(1337),
        opcode(Opcode.IF_EQ),
    ),

    // Unordered alternative for string-heavy methods (e.g. enums):
    // strings = listOf("unordered1", "unordered2"),

    // Narrow to one class found by another fingerprint:
    // classFingerprint = AnotherFingerprint,
)
```

Filter reference:

| Filter | Matches |
| ------ | ------- |
| `string("text")` | `const-string` |
| `methodCall(definingClass, name, parameters, returnType)` | `invoke-*` (also accepts a full `smali = "Lcls;->m()V"` shorthand) |
| `fieldAccess(opcode, definingClass, name, type)` | field get/put |
| `opcode(Opcode.X)` | specific opcode, optionally with `InstructionLocation` (`MatchAfterImmediately()`, `MatchAfterWithin(n)`, `MatchFirst()`) |
| `literal(value)` | `const` literal |
| `anyInstruction(f1, f2)` | either alternative (for version drift) |

Mapping smali → fingerprint:

| Smali | Fingerprint |
| ----- | ----------- |
| `public static` | `accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC)` |
| `(Lcom/Foo;)Z` | `parameters = listOf("Lcom/Foo;")`, `returnType = "Z"` |
| `invoke-virtual {…}, Lcom/Foo;->getName()` | `methodCall(definingClass = "Lcom/Foo;", name = "getName")` |
| `const-string "premium"` | `string("premium")` |
| obfuscated param type | `"L"` |

## Using fingerprints in patches

```kotlin
execute {
    // Auto-matches on first access (cached, safe to share between patches):
    MyFingerprint.method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")

    // Matched-instruction index + register for targeted edits:
    val match = MyFingerprint.instructionMatches[0]
    val reg = match.getInstruction<OneRegisterInstruction>().registerA
    MyFingerprint.method.addInstructions(match.index + 1, "const/4 v$reg, 0x0")

    // Null-safe / multi-match / class access:
    val maybe = MyFingerprint.methodOrNull
    val cls = MyFingerprint.originalClassDef // read-only; use `method`/`classDef` for mutable
}
```

For search directions and patch-surface guidance, see [Target selection](#target-selection).
For confirming a target runs before freezing the fingerprint, see
[dynamic confirmation](reverse-engineering.md#dynamic-confirmation-for-runtime-gates)
(Frida log → smali quote → fingerprint).

## Key imports

Actual imports used by this repo's patches (morphe-patcher 1.12.0):

```kotlin
// DSL + targets (see shared/Constants.kt and HideAdsPatch.kt):
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.ApkFileType

// Fingerprints:
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

// Bytecode edits:
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction

// Reading matched registers:
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
```

Only import what the patch uses. Do not reference `app.morphe.util.*` helpers:
the installed patcher exposes `app.morphe.patcher.*` and
`com.android.tools.smali.dexlib2.*`; unverified helper names do not compile.

## Debugging match failures

See [bytecode reference](bytecode-reference.md#fingerprint-debugging) for the full workflow and validation procedure.

## Target selection

Run `scripts/hunt_signals.py <decompiled-or-smali-dir>` to triage protections,
billing, ads, and networking. Its patterns are authoritative. SDK class names
can help locate code, but app wrappers and runtime behavior must be verified for
the pinned version.

| Goal | Candidate area | Important constraint |
| --- | --- | --- |
| Entitlement or purchase behavior | Billing SDK result, local preference, remote-config gate | Client changes cannot grant server-side entitlement or defeat server attestation. |
| Ad reduction | SDK load/show/init paths and mediation adapters | Preserve non-ad content and feed behavior; test controls and refresh. |
| Integrity or environment checks | License, signature, root, pinning, emulator/debug checks | Confirm runtime gates dynamically when needed; avoid disabling unrelated checks. |
| Analytics/privacy | Manifest metadata, receivers/services, event dispatch | Prefer narrow opt-outs; preserve unrelated functionality. |
| Complex runtime behavior | App-specific extension | Keep injection small and fail safely at host-app boundaries. |

These are search directions, not recipes or compatibility evidence. Choose a
narrow patch surface: manifest/resource changes for flags and values, inline
smali for simple changes, and extensions for complex runtime behavior. Confirm
which implementation runs before changing TLS, root, or signature checks. See
[dynamic confirmation](reverse-engineering.md#dynamic-confirmation-for-runtime-gates).
Describe limitations and risks honestly; keep risky patches opt-in and validate
on-device. Server-controlled features and provider authorization remain external
boundaries.
