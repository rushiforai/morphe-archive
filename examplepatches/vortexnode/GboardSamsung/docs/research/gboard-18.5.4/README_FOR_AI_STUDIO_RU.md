# Gboard 18.5.4 — source extraction package

This folder contains text artifacts extracted from the exact Gboard APK used by Stage 4.1.

- APK: `Gboard-v18.5.4.993608717-release-arm64-v8a.apk`
- APK SHA-256: `f47f44d33ab21d28aabfaec8292009c1173964ea238441734327a0a15ba32813`
- Four original DEX files were extracted and individually hashed; see `GBOARD_18.5.4_DEX_REFERENCE_EXTRACT.md`.
- `GBOARD_18.5.4_TARGETED_METHOD_INDEX.txt` contains filtered method_ids from all relevant DEX files.

The original DEX binaries are not represented by these text indexes. The indexes are navigation aids only. They are not Smali, decompiled source, or instruction-level traces. AI Studio must not infer control flow from them. If the binary DEX cannot be decoded in its environment, it must explicitly report BLOCKED rather than fabricate offsets or conclusions.

Use the attached source APK/DEX package if binary access is required. Do not make implementation changes during Stage 4.1.


## Дополнительные текстовые трассы code_item

- `GBOARD_18.5.4_TARGETED_CODE_ITEM_DUMP.txt` — извлечённые code_item инструкции выбранных классов Free Cursor, Scrub и Inline Suggestion из `classes.dex` и `classes2.dex`.
- `GBOARD_18.5.4_LANGUAGE_ENUM_XREF_CODE.txt` — code_item enum `Lqga;` / `Lxfe;` и методов, содержащих ссылки на language-switch identifiers / enum fields.

Оба файла содержат сырые 16-битные code units с дескрипторами, абсолютными смещениями code_item и вспомогательными ссылками. Это custom extraction, не JADX/Baksmali. AI Studio должен самостоятельно валидировать opcode widths, branch offsets и xrefs; не считать аннотации полной дизассемблировкой.
