SAMSUNG KEYBOARD 5.9.50.10 — ANALYSIS MATERIALS
================================================

Source APK: Клавиатура_Samsung_v5.9.50.10_c87b(1).apk
APK size: 86,899,269 bytes
APK SHA-256: c87bfd9ae4bb9e17f527a53aaccd955cbc203083dabe9fc9673134d4adbbfb8e
ZIP integrity test: PASS (no corrupt entries)
APK entries: 5,544
DEX files: 3
Native libraries (.so): 37

IMPORTANT LIMITATION
--------------------
This package is NOT a JADX/Apktool decompilation. The current preparation
environment has Java, but no JADX, Apktool, Baksmali, AAPT or Androguard.
Therefore no Java source, Smali method bodies, decoded AndroidManifest.xml,
or decoded resource XML has been produced.

What these text files contain:
- DEX*_STRING_TABLE.txt: decoded DEX string_ids tables, preserving string indexes.
- DEX*_CLASS_DESCRIPTORS.txt: class descriptors parsed from DEX class_defs.
- DEX*_KEYWORD_CANDIDATES.txt: strings matching likely keyboard/touch/cursor/language
  terms. These are search leads only and do not prove implementation behavior.

DEX inventory:
[
  {
    "dex": "classes.dex",
    "bytes": 11172568,
    "sha256": "e672411581ff91f1bc27b20305095444bc7a77682c66d1535e7301260b7e26eb",
    "string_count": 92459,
    "class_count": 8119,
    "full_strings_file": "DEX1_STRING_TABLE.txt",
    "class_file": "DEX1_CLASS_DESCRIPTORS.txt",
    "candidate_file": "DEX1_KEYWORD_CANDIDATES.txt"
  },
  {
    "dex": "classes2.dex",
    "bytes": 11205604,
    "sha256": "4f582ab5f7068e61c86bb9f38726c268b05dbe427ee30100c73df427fb388b19",
    "string_count": 78156,
    "class_count": 8052,
    "full_strings_file": "DEX2_STRING_TABLE.txt",
    "class_file": "DEX2_CLASS_DESCRIPTORS.txt",
    "candidate_file": "DEX2_KEYWORD_CANDIDATES.txt"
  },
  {
    "dex": "classes3.dex",
    "bytes": 4297992,
    "sha256": "abf8954c240934db8da8011845b280d4052005d23142fdc856fee16654ddb618",
    "string_count": 29576,
    "class_count": 4395,
    "full_strings_file": "DEX3_STRING_TABLE.txt",
    "class_file": "DEX3_CLASS_DESCRIPTORS.txt",
    "candidate_file": "DEX3_KEYWORD_CANDIDATES.txt"
  }
]

CLASS NAME NOTE
---------------
Many descriptors are obfuscated (for example, short package/class names).
The class descriptor lists do not include method bodies. To prove the exact
spacebar behavior, an actual DEX decompiler/disassembler is still required.

INSTRUCTIONS FOR THE ANALYST
----------------------------
1. Read this file first.
2. Search the three KEYWORD_CANDIDATES files and full STRING_TABLE files for
   terms such as space, cursor, language, locale, swipe, touch, gesture,
   pointer, motion, inputmethod, trackpad, glide, selection, editor.
3. Treat all matches as leads. Do not claim a behavior from a string alone.
4. If your environment can run JADX/Apktool/Baksmali, request the original APK
   again or use the original DEX files; do not pretend these text indexes are
   decompiled source.
5. Report exact class descriptors, method names/descriptors and bytecode
   evidence only when you can inspect method bodies.

Original APK hash for matching:
c87bfd9ae4bb9e17f527a53aaccd955cbc203083dabe9fc9673134d4adbbfb8e
