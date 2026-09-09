#!/bin/bash
# extract-smali.sh — disassemble all DEX files to smali (split-APK aware).
# Usage: scripts/extract-smali.sh <apk-file> <output-dir>
# Requires: unzip, baksmali, rg.
set -e

APK="${1:?Usage: scripts/extract-smali.sh <apk-file> <output-dir>}"
OUT="${2:?Usage: scripts/extract-smali.sh <apk-file> <output-dir>}"

if [ ! -f "$APK" ]; then
    echo "❌ Not found: $APK" >&2
    exit 1
fi

mkdir -p "$OUT"
TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR"' EXIT

EXT="${APK##*.}"
SOURCES=("$APK")
if [[ "$EXT" == "apkm" || "$EXT" == "xapk" || "$EXT" == "apks" ]]; then
    unzip -o -q "$APK" '*.apk' -d "$TMPDIR/splits" || {
        echo "❌ Could not extract split APKs from $APK" >&2
        exit 1
    }
    mapfile -d '' -t SOURCES < <(find "$TMPDIR/splits" -type f -name '*.apk' -print0 | sort -z)
fi

COUNT=0
for src in "${SOURCES[@]}"; do
    split_out="$OUT"
    if [[ "$src" == "$TMPDIR/splits/"* ]]; then
        split="${src#"$TMPDIR/splits/"}"
        split_out="$OUT/${split%.apk}"
    fi
    while IFS= read -r dex; do
        unzip -p "$src" "$dex" >"$TMPDIR/current.dex"
        baksmali d "$TMPDIR/current.dex" -o "$split_out/${dex%.dex}"
        COUNT=$((COUNT + 1))
    done < <(unzip -Z1 "$src" | grep -E '\.dex$' || true)
done

if [ "$COUNT" = "0" ]; then
    echo "❌ No DEX files found in $APK" >&2
    exit 1
fi

echo "✅ Disassembled $COUNT DEX file(s) to $OUT/"
ls "$OUT/"
