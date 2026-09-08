# Fingerprint + patch guide

Practical reference for writing fingerprints and bytecode patches in this repo.
See `reverse-engineering.md` for how to find targets, `architecture.md` for module
layout, and `patches/src/main/kotlin/com/zeldrisho/threads/patches/ads/HideAdsPatch.kt`
for an existing Threads patch and fingerprint example.

## Rules (strict)

- **Never match on obfuscated names** (`a`, `b`, `H`, …) — they change every release.
  SDK names (`getEntitlements`, `queryPurchases`) are stable and safe.
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
    // definingClass = "Lcom/example/Class;",  // only for stable (SDK) classes
    // name = "methodName",                    // only for non-obfuscated methods
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

## Common patch snippets

```kotlin
// Force-allow a boolean check:
method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
// Force-deny:
method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
// Skip a void method entirely:
method.addInstructions(0, "return-void")

// Higher-level helpers (app.morphe.util) — prefer these when available:
method.returnEarly(true)
method.returnEarly(false)
method.returnEarly()
method.indexOfFirstStringInstructionOrThrow("premium")
method.indexOfFirstInstructionOrThrow(Opcode.RETURN)
```

For per-billing-system and per-ad-SDK starting points, see `bypass-patterns.md`.
For confirming a target runs before freezing the fingerprint, see
`reverse-engineering.md` §3.6 (Frida log → smali quote → fingerprint).

## Key imports

```kotlin
// DSL + targets (see example/ExamplePatch.kt, shared/Constants.kt):
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

// Helpers:
import app.morphe.util.returnEarly
```

## Debugging match failures

See `bytecode-reference.md` (§ Fingerprint debugging) for the full workflow and checklist.
