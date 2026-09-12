# Fingerprint + patch guide

Practical reference for writing fingerprints and bytecode patches in this repo.
See the [reverse engineering workflow](reverse-engineering.md) for how to find targets,
[architecture](architecture.md) for module layout, and
`patches/src/main/kotlin/com/zeldrisho/patches/threads/ads/HideAdsPatch.kt`
for the Threads patch; `ads/Fingerprints.kt` contains its fingerprint.

## Rules

Policy first, exception second:

- **Prefer stable anchors** (SDK calls, strings, opcodes, signatures) over
  obfuscated app names (`a`, `b`, `H`, …), which change nearly every release.
- **Version-pinned exception:** when no stable anchor uniquely identifies a
  heavily obfuscated target (as with the Threads reflection ABI), matching on
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

## Threads feed targeting

`FeedMergeMethod` matches the named cache class, parameter shape (List at p5),
and construction of `BarcelonaFeedCache$addAndSaveItemsFromFeedFetchSuccess$2$1`.
The pinned APK resolves this to `A0F`; the fingerprint does not require that R8
name or its obfuscated parameter descriptors. Patching requires exactly one match.

`FeedReflectionContract.kt` separately checks the public no-argument instance
members used by `FeedAdFilter`, including return types. Missing members abort
patching with a re-hunt message; unexpected runtime objects still fail open.
This validates the ABI, not the meaning of `DED()` or actual ad removal. Keep
the exact version restriction and device QA. Local DEX verification is described
in the [QA checklist](qa-checklist.md#build).

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

For per-billing-system and per-ad-SDK starting points, see [bypass patterns](bypass-patterns.md).
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

See [bytecode reference](bytecode-reference.md#fingerprint-debugging) for the full workflow and checklist.
