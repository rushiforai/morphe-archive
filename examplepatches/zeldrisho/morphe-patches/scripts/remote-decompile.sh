#!/bin/bash
# remote-decompile.sh — decompile an APK with jadx on Kaggle's free runners.
# Local jadx OOMs on large APKs; Kaggle kernels offer ~28 GB RAM.
#
# Usage: KAGGLE_API_TOKEN=... KAGGLE_KERNEL_ID=user/notebook \
#          scripts/remote-decompile.sh "<direct-apk-url>" <output-dir>
#
# - Arg 1 must be a DIRECT download link (opening it downloads the file,
#   not a store/web page). Mirror links usually expire within ~1 hour —
#   generate a fresh one right before running.
# - Requires the `kaggle` CLI and a private notebook named like
#   KAGGLE_KERNEL_ID with internet access enabled.
# - Output: <output-dir>/*_decompiled.zip — unzip into your analysis folder.
set -e

APK_URL="${1:?Usage: scripts/remote-decompile.sh <direct-apk-url> [output-dir]}"
OUTPUT_DIR="${2:-./output}"
KERNEL_ID="${KAGGLE_KERNEL_ID:?Set KAGGLE_KERNEL_ID (e.g. user/jadx-apk-decompiler)}"
export KAGGLE_API_TOKEN="${KAGGLE_API_TOKEN:?Set KAGGLE_API_TOKEN (kaggle.com/settings → API)}"

case "$APK_URL" in
    http://* | https://*) ;;
    *)
        echo "❌ First argument must be a URL (https://...)" >&2
        exit 1
        ;;
esac

mkdir -p "$OUTPUT_DIR"
WORK_DIR="$(mktemp -d)"
trap 'rm -rf "$WORK_DIR"' EXIT

echo "📦 Remote jadx decompile via Kaggle ($KERNEL_ID)"

APK_URL="$APK_URL" WORK_DIR="$WORK_DIR" python3 <<'PYEOF'
import json, os

apk_url = os.environ["APK_URL"]
work_dir = os.environ["WORK_DIR"]

def code(*lines):
    """Generate a Jupyter notebook code cell from the given lines of Python/bash code."""
    return {"cell_type": "code", "metadata": {},
            "source": [l + "\n" for l in lines],
            "outputs": [], "execution_count": None}

nb = {
    "nbformat": 4, "nbformat_minor": 4,
    "metadata": {"kernelspec": {"display_name": "Python 3",
                                "language": "python", "name": "python3"}},
    "cells": [
        code("APK_URL = " + repr(apk_url),
             'print(f"URL: {APK_URL[:80]}...")'),
        code("%%bash",
             "apt-get update -qq && apt-get install -y -qq default-jre-headless aria2 > /dev/null 2>&1",
             'JADX_VER="1.5.5"',
             'wget -q "https://github.com/skylot/jadx/releases/download/v${JADX_VER}/jadx-${JADX_VER}.zip" -O /tmp/jadx.zip',
             "unzip -qo /tmp/jadx.zip -d /opt/jadx && chmod +x /opt/jadx/bin/jadx && ln -sf /opt/jadx/bin/jadx /usr/local/bin/jadx",
             'echo "JADX $(jadx --version) installed"'),
        code("import os, re, base64",
             "from urllib.parse import urlparse, parse_qs, unquote",
             "from pathlib import Path",
             "def detect_filename(url):",
             "    parsed = urlparse(url)",
             "    params = parse_qs(parsed.query)",
             '    for key in ("_fn", "filename", "file"):',
             "        if key in params:",
             "            name = unquote(params[key][0])",
             "            try:",
             '                decoded = base64.b64decode(name + "=" * (-len(name) % 4)).decode()',
             '                if "." in decoded: return decoded',
             "            except Exception: pass",
             '            if "." in name: return name',
             "    name = Path(parsed.path).name",
             '    return name if name else "downloaded_file"',
             "def sanitize(name):",
             "    stem = Path(name).stem",
             "    ext = Path(name).suffix.lower()",
             '    m = re.match(r"([a-z][a-z0-9._]+?)_([0-9][0-9.]+)", stem, re.IGNORECASE)',
             '    if m: return f"{m.group(1)}_{m.group(2)}{ext}"',
             '    clean = re.sub(r"[^a-z0-9._-]", "_", stem.lower())',
             '    clean = re.sub(r"_+", "_", clean).strip("_")[:60]',
             "    return clean + ext",
             "apk_file = sanitize(detect_filename(APK_URL))",
             'print(f"Downloading: {apk_file}")',
             '!aria2c -x 16 -s 16 -k 1M --file-allocation=none --disk-cache=64M -o "{apk_file}" "{APK_URL}"',
             'print(f"Saved: {apk_file} ({os.path.getsize(apk_file)/1024/1024:.1f} MB)")'),
        code("import zipfile",
             "target = apk_file",
             "ext = Path(apk_file).suffix.lower()",
             'if ext in (".xapk", ".apkm", ".apks", ".zip"):',
             '    print(f"Split APK ({ext}), extracting...")',
             '    extract_dir = Path(apk_file).stem + "_extracted"',
             '    with zipfile.ZipFile(apk_file, "r") as z:',
             "        z.extractall(extract_dir)",
             "        contents = z.namelist()",
             '    apk_list = [f for f in contents if f.endswith(".apk")]',
             "    for a in apk_list:",
             '        s = os.path.getsize(os.path.join(extract_dir, a)) / 1024 / 1024',
             '        tag = " base" if "base" in a.lower() else ""',
             '        print(f"  {s:8.1f} MB  {a}{tag}")',
             '    base = next((f for f in apk_list if "base" in f.lower()), None)',
             "    if base: target = os.path.join(extract_dir, base)",
             "    elif apk_list: target = max([os.path.join(extract_dir, f) for f in apk_list], key=os.path.getsize)",
             '    print(f"Using: {target}")',
             "else:",
             '    print(f"Direct APK: {target}")'),
        code("output_dir = Path(apk_file).stem + \"_decompiled\"",
             "cores = os.cpu_count() or 4",
             'os.environ["JADX_JAVA_OPTS"] = f"-Xmx28672m -Xms14336m -XX:+UseParallelGC -XX:ParallelGCThreads={cores}"',
             'print(f"Threads: {cores}")',
             '!jadx -d "{output_dir}" --deobf --show-bad-code --decompilation-mode restructure --log-level progress -j {cores} "{target}" 2>&1',
             'java_count = int(os.popen(f\'find "{output_dir}" -name "*.java" | wc -l\').read().strip())',
             'total_count = int(os.popen(f\'find "{output_dir}" -type f | wc -l\').read().strip())',
             'print(f"{java_count:,} .java | {total_count:,} total files")'),
        code("import shutil",
             "import zipfile as zf",
             'zip_name = str(output_dir) + ".zip"',
             'print(f"Compressing {zip_name}...")',
             "fc = 0",
             'with zf.ZipFile(zip_name, "w", zf.ZIP_DEFLATED, compresslevel=9) as z:',
             "    for root, dirs, files in os.walk(output_dir):",
             "        for f in files:",
             "            fpath = os.path.join(root, f)",
             "            z.write(fpath, os.path.relpath(fpath, output_dir))",
             "            fc += 1",
             'print(f"{zip_name} ({os.path.getsize(zip_name)/1024/1024:.1f} MB) — {fc:,} files")',
             "shutil.rmtree(output_dir, ignore_errors=True)",
             "if os.path.exists(apk_file): os.remove(apk_file)",
             'extract = Path(apk_file).stem + "_extracted"',
             "if os.path.exists(extract): shutil.rmtree(extract, ignore_errors=True)",
             'print("Done")'),
    ],
}

with open(os.path.join(work_dir, "jadx-decompiler.ipynb"), "w") as f:
    json.dump(nb, f)
print("Notebook written.")
PYEOF

cat >"$WORK_DIR/kernel-metadata.json" <<METADATA
{
  "id": "$KERNEL_ID",
  "title": "jadx-apk-decompiler",
  "code_file": "jadx-decompiler.ipynb",
  "language": "python",
  "kernel_type": "notebook",
  "is_private": true,
  "enable_gpu": false,
  "enable_internet": true
}
METADATA

echo "🚀 Pushing to Kaggle..."
kaggle kernels push -p "$WORK_DIR"
echo ""
echo "⏳ Waiting for kernel to finish..."
while true; do
    RAW="$(kaggle kernels status "$KERNEL_ID" 2>&1)"
    echo "  $(date +%H:%M:%S) $RAW"
    if echo "$RAW" | grep -qi "complete"; then
        echo "✅ Kernel completed!"
        break
    elif echo "$RAW" | grep -qi "error\|cancel\|fail"; then
        echo "❌ Kernel failed — check output above." >&2
        exit 1
    fi
    sleep 10
done

echo ""
echo "⬇️  Downloading output..."
kaggle kernels output "$KERNEL_ID" -p "$OUTPUT_DIR" --file-pattern ".*\.zip$"
echo "✅ Done! Files in: $OUTPUT_DIR/"
ls -lh "$OUTPUT_DIR"/*.zip 2>/dev/null
