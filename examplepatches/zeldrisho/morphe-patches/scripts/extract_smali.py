#!/usr/bin/env python3
"""Disassemble all DEX files to smali (split-APK aware)."""

import argparse
import subprocess
import tempfile
import zipfile
from pathlib import Path


def main():
    p = argparse.ArgumentParser()
    p.add_argument("apk")
    p.add_argument("output")
    a = p.parse_args()
    apk = Path(a.apk)
    out = Path(a.output)
    if not apk.is_file():
        p.error(f"Not found: {apk}")
    out.mkdir(parents=True, exist_ok=True)
    sources = [apk]
    with tempfile.TemporaryDirectory() as td:
        if apk.suffix.lower() in {".apkm", ".xapk", ".apks"}:
            split = Path(td) / "splits"
            split.mkdir()
            with zipfile.ZipFile(apk) as z:
                z.extractall(split, [n for n in z.namelist() if n.endswith(".apk")])
            sources = sorted(split.rglob("*.apk"))
        count = 0
        for src in sources:
            split_out = out / (src.stem if src.parent.name == "splits" else "")
            split_out.mkdir(parents=True, exist_ok=True)
            with zipfile.ZipFile(src) as z:
                for dex in sorted(n for n in z.namelist() if n.endswith(".dex")):
                    current = Path(td) / "current.dex"
                    current.write_bytes(z.read(dex))
                    subprocess.run(
                        [
                            "baksmali",
                            "d",
                            str(current),
                            "-o",
                            str(split_out / Path(dex).stem),
                        ],
                        check=True,
                    )
                    count += 1
        if not count:
            raise SystemExit(f"❌ No DEX files found in {apk}")
    print(f"✅ Disassembled {count} DEX file(s) to {out}/")


if __name__ == "__main__":
    main()
