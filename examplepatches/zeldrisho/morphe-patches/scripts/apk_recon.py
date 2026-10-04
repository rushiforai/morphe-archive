#!/usr/bin/env python3
"""Identify an APK and emit a Phase-0 recon report."""

import argparse
import re
import shutil
import subprocess
import tempfile
import zipfile
from pathlib import Path


def run_apkid(apk):
    """Scan an APK path, preferring standalone APKiD and using uvx if it is absent.

    Return stripped stdout, or a diagnostic for missing tools, an OSError while
    running the command, a timeout after 300 seconds, a nonzero exit, or empty
    output. A failed standalone command does not trigger a retry through uvx.
    Output decoding errors propagate.
    """
    executable = shutil.which("apkid")
    command = [executable, str(apk)] if executable else None
    if command is None and shutil.which("uvx"):
        command = ["uvx", "apkid", str(apk)]
    if command is None:
        return "unknown (apkid not available)"
    try:
        result = subprocess.run(
            command,
            text=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            check=False,
            timeout=300,
        )
    except subprocess.TimeoutExpired:
        return "apkid failed: timed out after 300s"
    except OSError as error:
        return f"apkid unavailable ({error})"
    if result.returncode:
        detail = result.stderr.strip() or f"exit status {result.returncode}"
        return f"apkid failed: {detail}"
    return result.stdout.strip() or "apkid returned no results"


def main():
    """Inspect an APK or bundle and write identity, DEX, and protection details to a report.

    Read input and optional output paths from CLI arguments, overwriting recon.md
    by default. For APKM, XAPK, and APKS bundles, inspect identity and protections
    on base.apk or base-master.apk when present, otherwise the first sorted APK;
    count DEX entries and list native libraries across all extracted APKs.

    Exit via SystemExit for invalid arguments, a missing input, or a bundle with
    no APKs. File, ZIP, aapt launch, and output decoding errors propagate; APKiD
    availability and command failures are recorded as diagnostics in the report.
    """
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
        apkid = run_apkid(target)
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
Run scripts/extract_smali.py, then scripts/hunt_signals.py against the extracted smali.
"""
        Path(a.output).write_text(report)
        print(f"✅ Recon written to {a.output}")


if __name__ == "__main__":
    main()
