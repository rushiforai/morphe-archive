# Bytecode reference

Smali reading/writing aid, obfuscation survival rules, and fingerprint debugging.
Companion docs: `fingerprint-guide.md` (writing fingerprints), `reverse-engineering.md` (finding targets).

## Type descriptors

| Smali | Java |
| ----- | ---- |
| `V` | void |
| `Z` | boolean |
| `B` / `S` / `C` / `I` | byte / short / char / int |
| `J` / `D` | long / double (**2 registers each**) |
| `Ljava/lang/String;` | String (`L…;` = object) |
| `[I`, `[Ljava/lang/String;` | int[], String[] (`[` = array) |

Method header format: `.method <access> <name>(<params>)<return>`, e.g.
`.method public static isPremium(Lcom/app/User;)Z`.

## Registers

- `.registers N` = total (`v0`–`vN-1`); `.locals N` = locals only, params are `p*`.
- Non-static: `p0` = `this`, `p1…` = params. Static: `p0…` = params.
- Wide types (`J`, `D`) consume **two** consecutive registers — count carefully when
  injecting `const`/`return` sequences.
- `move-result*` must immediately follow its `invoke-*`.

## Common opcodes

```smali
const/4 v0, 0x0          # int 0 / false      const/4 v0, 0x1   # int 1 / true
const-string v0, "text"  # String constant    const-class v0, Lcom/app/Foo;
return-void              # void               return v0         # int/bool/float
return-wide v0           # long/double        return-object v0  # object/String
move-result v0           # capture invoke return (object: move-result-object)
invoke-virtual {v0, v1}, Lcom/app/Foo;->bar(I)V
invoke-static {v0}, Lcom/app/Foo;->check(Z)Z
invoke-direct {p0}, Ljava/lang/Object;-><init>()V
iget v0, p0, Lcom/app/Foo;->count:I           # get field
iput v0, p0, Lcom/app/Foo;->count:I           # set field
sget-object v0, Lcom/app/Tier;->PRO:Lcom/app/Tier;  # static field
if-eqz v0, :label        # == 0 / false / null      if-nez v0, :label  # != 0
goto :label              # unconditional
new-instance v0, Lcom/app/Foo;
```

## Injected snippets

```smali
# allow / deny a boolean gate
const/4 v0, 0x1
return v0
# skip a void method
return-void
# return a premium enum constant
sget-object v0, Lcom/app/Tier;->PRO:Lcom/app/Tier;
return-object v0
# consult an extension, then branch
invoke-static { }, Lapp/template/extension/myapp/MyPatch;->isEnabled()Z
move-result v0
if-eqz v0, :continue
return-void
:continue
nop
```

## Obfuscation: what survives

R8/ProGuard rename app classes, methods, and fields every release — **never match on
those**. What survives and is safe to fingerprint on:

| Survives | Why | Fingerprint field |
| -------- | --- | ----------------- |
| Return / parameter types | Part of the signature | `returnType`, `parameters` |
| Access flags | Structural | `accessFlags` |
| SDK class + method names | Not covered by app obfuscation rules | `methodCall(definingClass, name)` |
| String constants | Kept as-is (unless DexGuard) | `string(…)` / `strings` |
| Literals, opcodes, call order | Logic flow preserved | `literal`, `opcode`, filter order |

Check the level with `uvx apkid app.apk`:

| Output | Difficulty | Strategy |
| ------ | ---------- | -------- |
| `compiler: d8` | Easy | Standard fingerprints |
| `compiler: r8` / `obfuscator: proguard` | Normal | SDK calls + signature + strings |
| `obfuscator: dexguard` | Hard | Strings may be encrypted — opcode/method-call patterns instead |
| `packer: *` | Very hard | DEX encrypted at rest — dump the decrypted DEX first |

Fallbacks for heavy obfuscation: `"L"` as a parameter type (matches any object),
`classFingerprint` via a stable anchor (`toString` with readable content, e.g. Kotlin
data-class output), SDK-call-only filters without strings.

Recover real Kotlin names to *find* targets (never to *match* on): R8 cannot strip
`@DebugMetadata(c="com.foo.Bar$…")` / `@Metadata(d2={…Lcom/foo/Bar;…})` strings —
run `scripts/recover-kotlin-names.sh <decompiled> <mapping-dir>` for an obf → real map
(~100% of `*Repository`/`*ViewModel`/`*Impl`). `jadx --deobf` only invents synthetic
names; metadata recovery restores the developer-written ones.

## Fingerprint debugging

When a fingerprint stops matching, work through this order:

1. **Version drift?** `aapt dump badging` — confirm the APK is the version the
   fingerprint was written for.
2. **Read smali fresh.** Find the class across all DEX dirs
   (`find smali/ -name … | xargs rg -l <sdk-call>`), read the method, and compare
   field-by-field: return type (last char of the header), access flags (**exact** —
   `public static` ≠ `public static final`), full parameter descriptors (SDK package
   paths move, e.g. `…/purchases/CustomerInfo` → `…/purchases/models/CustomerInfo`),
   filter order vs instruction order.
3. **R8 code motion?** Small methods get inlined into callers or split — patch the
   caller / the split method instead.
4. **Too broad / too narrow?** Several matches → add a stable filter; zero matches →
   drop the most fragile filter. A few stable filters beat many brittle ones.
5. **Null-safe probe.** During development, use `methodOrNull` with a logged skip so
   one dead fingerprint doesn't abort the whole `execute` block; hard-fail only in
   the final patch.

Incremental technique: start from `returnType` alone, add access flags, then params,
then filters one by one until the match is unique — you'll find the lying field fast.

Evidence bar: a release patch SHOULD have two independent confirmations — static smali quote + one dynamic
observation (`reverse-engineering.md` §3.6 Frida log). Static-only is draft status: fine for a work-in-progress, not for a release patch.

Also remember: `instructionMatches` requires `filters`; `strings` matches
method-level (not class-level) content — use `classFingerprint` when you need the
class first.
