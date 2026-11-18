#!/usr/bin/env python3
"""Replace one dex inside an APK (optional), align the result and sign it.

Splits carry no dex to replace and are only re-aligned and re-signed; pass no
`patched_dex` for those, so that every piece of a bundle ends up under one key.

When a dex is given, only the named zip entry is rewritten: AndroidManifest.xml, resources.arsc, res/,
assets/ and the other dex files are copied byte for byte. That matters because
re-encoding this application's resource table is what makes a full apktool rebuild
fail, and because it keeps the diff auditable — `scripts/verify_apk.py` asserts that
nothing else changed.

Usage:
  python3 scripts/repack_apk.py original.apk patched.dex -o out.apk \\
      --entry classes4.dex \\
      --zipalign tools/android/build-tools/zipalign \\
      --apksigner tools/android/build-tools/apksigner \\
      --keystore patch.keystore --alias mykey --storepass ... [--keypass ...]
"""
from __future__ import annotations

import argparse
import shutil
import subprocess
import sys
import zipfile
from pathlib import Path


def main() -> int:
    ap = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter
    )
    ap.add_argument("original_apk", type=Path)
    ap.add_argument("patched_dex", type=Path, nargs="?", help="dex to inject (omit for a plain re-sign)")
    ap.add_argument("-o", "--output", type=Path, required=True)
    ap.add_argument("--entry", help="dex entry to replace (required with a dex)")
    ap.add_argument("--zipalign", help="path to the zipalign binary (optional)")
    ap.add_argument("--apksigner", help="path to the apksigner script (optional)")
    ap.add_argument("--keystore", help="signing keystore (required to sign)")
    ap.add_argument("--storepass")
    ap.add_argument("--keypass")
    ap.add_argument("--alias", default="wispr-patch")
    a = ap.parse_args()

    if not a.original_apk.is_file():
        print(f"error: no such APK: {a.original_apk}", file=sys.stderr)
        return 2
    if a.patched_dex is not None and not a.patched_dex.is_file():
        print(f"error: no such dex: {a.patched_dex}", file=sys.stderr)
        return 2
    if a.patched_dex is not None and a.entry is None:
        print("error: --entry is required with a dex", file=sys.stderr)
        return 2

    with zipfile.ZipFile(a.original_apk) as zin:
        if a.entry is not None and a.entry not in zin.namelist():
            print(f"error: {a.entry} is not in {a.original_apk.name}", file=sys.stderr)
            return 2
        entries = [(info, zin.read(info.filename)) for info in zin.infolist()]

    unsigned = a.output.with_suffix(".unsigned.apk")
    with zipfile.ZipFile(unsigned, "w", zipfile.ZIP_DEFLATED) as zout:
        for info, data in entries:
            if a.patched_dex is not None and info.filename == a.entry:
                data = a.patched_dex.read_bytes()
                print(f"[i] {a.entry}: {info.file_size} -> {len(data)} bytes")
            out = zipfile.ZipInfo(info.filename, date_time=info.date_time)
            out.compress_type = info.compress_type
            out.external_attr = info.external_attr
            out.internal_attr = info.internal_attr
            out.create_system = info.create_system
            zout.writestr(out, data)
    print(f"[ok] repacked: {unsigned}")

    aligned = unsigned
    if a.zipalign:
        aligned = a.output.with_suffix(".aligned.apk")
        subprocess.run([a.zipalign, "-f", "-p", "4", str(unsigned), str(aligned)], check=True)
        print(f"[ok] aligned: {aligned}")

    if a.apksigner and a.keystore:
        cmd = [
            a.apksigner, "sign",
            "--ks", str(a.keystore),
            "--ks-pass", f"pass:{a.storepass}",
            "--ks-key-alias", a.alias,
            "--v1-signing-enabled", "true",
            "--v2-signing-enabled", "true",
            "--v3-signing-enabled", "true",
            "--out", str(a.output),
            str(aligned),
        ]
        if a.keypass:
            cmd += ["--key-pass", f"pass:{a.keypass}"]
        # The AOSP launcher is a bash script; invoke it through bash so it works
        # regardless of the executable bit.
        if Path(a.apksigner).read_bytes()[:2] == b"#!":
            cmd = ["bash"] + cmd
        subprocess.run(cmd, check=True)
        print(f"[ok] signed: {a.output}")
    else:
        shutil.copy2(aligned, a.output)
        print(f"[!] not signed (no --apksigner/--keystore): {a.output}")

    for leftover in (unsigned, aligned):
        if leftover != a.output and leftover.exists():
            leftover.unlink()
    return 0


if __name__ == "__main__":
    sys.exit(main())
