# Bytecode and fingerprinting

Use the [Android bytecode specification](https://source.android.com/docs/core/runtime/dalvik-bytecode) for instruction formats, register limits and semantics. For Morphe APIs and matching rules, see [fingerprinting](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_2_1_fingerprinting.md), [advanced APIs](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/4_apis.md), and [version changes](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/5_patcher_changes.md).

## Project safety rules

- Verify injected instructions and control flow against the actual target smali; assembly or fingerprint resolution alone does not prove behavior.
- Do not log passwords, keys, tokens, or plaintext cryptographic data.
- `move-result*` must immediately follow its `invoke-*`. Account for wide registers, parameter aliases and instruction encoding limits.
- Never assume `v0` is free. Prefer Morphe's free-register helpers for instruction-preserving injection; a register-count increase alone does not rewrite existing encoded operands.
- Use the control-flow-label insertion API when branches to the original instruction must execute injected code.
- Whole-body replacement and instruction-preserving injection have different safety contracts. The local `clearBody` and `ensureRegisters` helpers are only for whole-body replacement; inspect try blocks and register types before using them.
- `matchAll()` returns the first matching instruction sequence in each matched method, not every matching instruction. Validate match counts and use the all-indices API when every occurrence matters.
- Pin obfuscated targets to the app versions actually examined; stable strings, framework calls and structure are anchors, not proof of unchanged semantics.

## Debugging a fingerprint

1. Confirm package, version and version code with `aapt dump badging`.
2. Inspect the target across all DEX files and compare signature, exact access flags, string semantics and instruction order with the fingerprint.
3. Check for R8 inlining, moved methods, and encrypted or missing strings. `apkid` can identify some protections; its output is a lead, not proof.
4. Add or relax anchors incrementally and verify both match uniqueness and the selected instruction indices. Fail closed in the final patch if the expected target is absent or ambiguous.
5. Record static evidence and validate runtime behavior as described in [testing](testing.md) and [recon](recon.md). Metadata may help locate candidates but is not proof of their behavior.
