#!/usr/bin/env bash
# recover-kotlin-names.sh — rebuild obfuscated→real class-name map from Kotlin
# metadata left in jadx output. R8 renames JVM symbols but cannot strip
# @DebugMetadata(c="...") / @Metadata(d2={...}) strings.
# Technique adapted from SimoneAvogadro/android-reverse-engineering-skill (Apache-2.0).
#
# Usage: scripts/recover-kotlin-names.sh <decompiled-sources-dir> [mapping-dir]
# Output: mapping.tsv, mapping.json, by_package/
# Then: grep hits can be annotated with the real owning class.
set -euo pipefail

# Display usage information and exit.
usage() {
  cat <<EOF
Usage: recover-kotlin-names.sh <decompiled-sources-dir> [mapping-dir]

Walks *.java under <decompiled-sources-dir>, mines @DebugMetadata and
@Metadata annotations, writes mapping.tsv / mapping.json / by_package/.
EOF
  exit 0
}

[[ $# -lt 1 || "$1" == "-h" || "$1" == "--help" ]] && usage
SRC="$1"
OUT="${2:-$(dirname "$SRC")/mapping}"
[[ ! -d "$SRC" ]] && { echo "not a directory: $SRC" >&2; exit 1; }

mkdir -p "$OUT/by_package"

python3 - "$SRC" "$OUT" <<'PY'
import os, re, sys, json
from collections import defaultdict
from urllib.parse import quote

SRC, OUT = sys.argv[1], sys.argv[2]

RE_DEBUG = re.compile(r'@DebugMetadata\([^)]*?c\s*=\s*"([^"]+)"', re.S)
RE_DTWO  = re.compile(r'@Metadata\([^)]*?d2\s*=\s*\{([^}]*)\}', re.S)
RE_LCLASS = re.compile(r'L([A-Za-z][\w/$]+);')
RE_RENAMED = re.compile(r'/\*\s*renamed from:\s*([\w.$]+)\s*\*/')

SKIP_PREFIXES = (
    "kotlin.", "kotlinx.", "androidx.", "android.", "java.", "javax.",
    "com.google.", "com.facebook.", "com.appsflyer.", "com.datadog.",
    "io.ktor.", "io.sentry.", "io.realm.", "okhttp3.", "okio.",
    "com.squareup.", "com.bumptech.", "com.airbnb.", "com.payu.",
    "com.storyteller.", "zendesk.", "io.intercom.", "com.microsoft.",
    "com.tinder.", "com.hotjar.", "com.amplitude.", "com.segment.",
    "com.mixpanel.", "com.onesignal.", "com.stripe.", "com.braintreepayments.",
    "retrofit2.", "dagger.", "javax.inject.", "org.jetbrains.",
)

mapping = {}
file_real = {}
counts = defaultdict(int)

for dp, _, files in os.walk(SRC):
    for f in files:
        if not f.endswith(".java"):
            continue
        path = os.path.join(dp, f)
        rel = os.path.relpath(path, SRC)
        obf = rel[:-5].replace(os.sep, ".")
        if obf.startswith(SKIP_PREFIXES):
            continue
        try:
            text = open(path, "r", errors="replace").read()
        except OSError:
            continue
        real = None
        m = RE_DEBUG.search(text)
        if m:
            real = m.group(1).split("$", 1)[0]
            counts["debug_meta"] += 1
        if not real:
            m = RE_DTWO.search(text)
            if m:
                for lm in RE_LCLASS.finditer(m.group(1)):
                    cand = lm.group(1).replace("/", ".").split("$", 1)[0]
                    if "." in cand and not cand.startswith(("kotlin.", "java.", "android")):
                        real = cand
                        counts["d2"] += 1
                        break
        if not real:
            m = RE_RENAMED.search(text)
            if m:
                real = m.group(1)
                counts["renamed"] += 1
        if real:
            mapping[obf] = real
            file_real[obf] = path

with open(os.path.join(OUT, "mapping.tsv"), "w") as f:
    f.write("obf_fqn\treal_fqn\tfile\n")
    for k in sorted(mapping):
        f.write(f"{k}\t{mapping[k]}\t{file_real[k]}\n")

with open(os.path.join(OUT, "mapping.json"), "w") as f:
    json.dump(mapping, f, indent=2, sort_keys=True)

by_pkg = defaultdict(list)
for obf, real in mapping.items():
    pkg = real.rsplit(".", 1)[0] if "." in real else "(default)"
    by_pkg[pkg].append((real, obf, file_real[obf]))

for pkg, rows in by_pkg.items():
    safe = quote(pkg, safe="()") or "default"
    with open(os.path.join(OUT, "by_package", f"{safe}.txt"), "w") as f:
        for real, obf, p in sorted(rows):
            f.write(f"{real}\t{obf}\t{p}\n")

print(f"Recovered {len(mapping)} class names")
for k, v in counts.items():
    print(f"  via {k}: {v}")
print(f"Real packages: {len(by_pkg)}")
print(f"Wrote {OUT}/mapping.tsv, mapping.json, by_package/")
PY
