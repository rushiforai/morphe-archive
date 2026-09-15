#!/usr/bin/env python3
"""Identify an APK and emit a Phase-0 recon report."""

import argparse
import re
import shutil
import subprocess
import tempfile
import zipfile
from pathlib import Path


def main():
    p = argparse.ArgumentParser()
    p.add_argument("apk")
    p.add_argument("output", nargs="?", default="recon.md")
    a = p.parse_args()
    apk = Path(a.apk)
    if not apk.is_file():
        p.error(f"Not found: {apk}")
    with tempfile.TemporaryDirectory() as td:
        sources = [apk]
        if apk.suffix.lower() in {".apkm", ".xapk", ".apks"}:
            d = Path(td) / "splits"
            d.mkdir()
            with zipfile.ZipFile(apk) as z:
                z.extractall(d, [n for n in z.namelist() if n.endswith(".apk")])
            sources = sorted(d.rglob("*.apk"))
            if not sources:
                raise SystemExit("❌ No embedded APKs found")
        target = next(
            (x for x in sources if x.name in ("base.apk", "base-master.apk")),
            sources[0],
        )
        badging = subprocess.run(
            ["aapt", "dump", "badging", str(target)],
            text=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.DEVNULL,
        ).stdout

        def field(name):
            m = re.search(name + r"='([^']*)'", badging)
            return m.group(1) if m else "unknown"

        listing = []
        for src in sources:
            with zipfile.ZipFile(src) as z:
                listing += z.namelist()
        text = "\n".join(listing)
        framework = (
            "Flutter"
            if "libflutter.so" in text
            else "React Native"
            if "libhermes.so" in text
            else "Native Android (Java/Kotlin)"
        )
        dex = [x for x in listing if x.endswith(".dex")]
        libs = sorted(
            {x for x in listing if x.startswith("lib/") and x.endswith(".so")}
        )
        apkid = "unknown (apkid not available)"
        if shutil.which("uvx"):
            apkid = (
                subprocess.run(
                    ["uvx", "apkid", str(apk)],
                    text=True,
                    stdout=subprocess.PIPE,
                    stderr=subprocess.DEVNULL,
                ).stdout.strip()
                or "apkid failed"
            )
        report = f"""# Recon — {field("application-label:")}

## Identity
- App Name: {field("application-label:")}
- Package: {field("package: name")}
- Version: {field("versionName")}
- VersionCode: {field("versionCode")}

## APK Info
- File: {apk} ({apk.stat().st_size} bytes)
- APK Type: {apk.suffix[1:].upper() or "APK"}
- DEX count: {len(dex)} ({" ".join(dex)})

## Protections (apkid)
```
{apkid}
```

## Architecture
- Framework: {framework}
- Native libs: {" ".join(libs) or "none"}
- Permissions: {" ".join(re.findall(r"uses-permission: name='([^']+)", badging)) or "none listed"}

## Recommended next step
Proceed with jadx and scripts/extract_smali.py, then scripts/hunt_signals.py.
"""
        Path(a.output).write_text(report)
        print(f"✅ Recon written to {a.output}")


if __name__ == "__main__":
    main()
