# APK inspection and bytecode

These optional local tools support patch development; Gradle and Morphe remain the build and patching tools. Keep each target in the ignored `analysis/<package>/<version>/` workspace: original APKs in `apk/`, disassembly in `smali/`, evidence in `notes/`, and diagnostic outputs in `runs/`. Preserve existing evidence, and keep signing keys private. Do not put account information or tokens in evidence.

Look for the requested original APK, APKM, APKS or XAPK under `analysis/<package>/<version>/apk/` first. If it is missing, ask the user for its path; move the supplied file there without overwriting an existing file, and verify its SHA-256 before and after the move. Inspect package and version to confirm the destination before use. Perform subsequent inspection and patching from the workspace. Installed base APKs saved for signer inspection are evidence, not substitutes for the original split bundle.

Prerequisites: Python 3, `fd`, `aapt` from Android SDK Build-Tools on `PATH`, and `baksmali` on `PATH` for disassembly. APK protection detection optionally uses `apkid` when installed; otherwise the report records it as unavailable.

```bash
# Locate existing inputs before asking for a missing file.
fd --hidden --no-ignore -t f -e apk -e apkm -e apks -e xapk . analysis/

# Inspect package identity, splits, DEX files and native libraries.
python3 scripts/apk_recon.py analysis/<package>/<version>/apk/app.apkm analysis/<package>/<version>/notes/recon.md

# Disassemble all DEX files in the APK or split bundle.
python3 scripts/extract_smali.py analysis/<package>/<version>/apk/app.apkm analysis/<package>/<version>/smali-<run-id>

# Summarize candidate signals; use --files to show matching paths.
python3 scripts/hunt_signals.py analysis/<package>/<version>/smali --files
```

Do not treat a partial move as success: confirm the source and destination, preserve the original filename, and never replace existing evidence. Keep captured signer APKs distinct from original downloads. Never move app files from a device without approval.

`extract_smali.py` replaces an existing output directory **after** successful extraction. Always choose an unused output directory when the target may contain evidence; never point it at an annotated or previously preserved `smali/` tree. Choose the output path carefully and preserve notes separately. If omitted, it infers `analysis/<package>/<version>/smali` only for recognizable APKMirror filenames.

For decoded text manifests, compare security-relevant components, permissions and queries:

```bash
python3 scripts/manifest_security_diff.py /private/original/AndroidManifest.xml /private/patched/AndroidManifest.xml
```

## CLI-first analysis

Follow the Android-specific parts of [leanrea](https://github.com/aicodeking/leanrea/blob/main/leanrea/SKILL.md): identify the exact artifact and its contents first, then use focused searches and code inspection. Keep all artifacts and outputs under the ignored analysis workspace rather than temporary directories. Use `rg -uu` for ignored smali trees and limit output to relevant matches. Never delete or overwrite existing evidence.

For APKM and other bundles, identify the relevant APK members and record both bundle and selected APK hashes. When Java orientation is useful, `jadx -d <new-output-dir> --show-bad-code <base.apk>` can provide decompiled sources; `apktool d --no-src -o <new-output-dir> <base.apk>` can inspect resources. These tools are optional until a task needs them. If a required tool is missing or requires a PATH change, stop and tell the user; do not install it or bypass PATH with an absolute executable path.

Use `jadx --single-class <full-class-name> --single-class-output <new-output-file> <base.apk>` for a focused Java view. For native libraries, inspect architecture and use `llvm-objdump` on a preserved extracted copy. These direct CLI workflows do not require REA or an MCP server. Preserve artifact hashes, source locations, coverage, and limitations; see [testing](testing.md) for signature verification before updates.

Distinguish observed evidence, inference, and unknowns. Static declarations, decompilation, and references do not establish runtime behavior or complete reflection, dynamic loading, or JNI dispatch. Triage and decompiled output identify candidates, not verified patch targets: verify exact method signatures and instructions in smali, use the [target evidence template](template.md), and follow [testing](testing.md) before claiming compatibility.

## Bytecode and fingerprinting

Use the [Android bytecode specification](https://source.android.com/docs/core/runtime/dalvik-bytecode) for instruction formats, register limits and semantics. For Morphe APIs and matching rules, see [fingerprinting](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_2_1_fingerprinting.md), [advanced APIs](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/4_apis.md), and [version changes](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/5_patcher_changes.md).

### Project safety rules

- Verify injected instructions and control flow against the actual target smali; assembly or fingerprint resolution alone does not prove behavior.
- Do not log passwords, keys, tokens, or plaintext cryptographic data.
- `move-result*` must immediately follow its `invoke-*`. Account for wide registers, parameter aliases and instruction encoding limits.
- Never assume `v0` is free. Prefer Morphe's free-register helpers for instruction-preserving injection; a register-count increase alone does not rewrite existing encoded operands.
- Use the control-flow-label insertion API when branches to the original instruction must execute injected code.
- Whole-body replacement and instruction-preserving injection have different safety contracts. The local `clearBody` and `ensureRegisters` helpers are only for whole-body replacement; inspect try blocks and register types before using them.
- `matchAll()` returns the first matching instruction sequence in each matched method, not every matching instruction. Validate match counts and use the all-indices API when every occurrence matters.
- Pin obfuscated targets to the app versions actually examined; stable strings, framework calls and structure are anchors, not proof of unchanged semantics.

### Debugging a fingerprint

1. Confirm package, version and version code with `aapt dump badging`.
2. Inspect the target across all DEX files and compare signature, exact access flags, string semantics and instruction order with the fingerprint.
3. Check for R8 inlining, moved methods, and encrypted or missing strings. `apkid` can identify some protections; its output is a lead, not proof.
4. Add or relax anchors incrementally and verify both match uniqueness and the selected instruction indices. Fail closed in the final patch if the expected target is absent or ambiguous.
5. Record static evidence and validate runtime behavior as described in [testing](testing.md). Metadata may help locate candidates but is not proof of their behavior.
