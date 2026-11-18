#!/usr/bin/env python3
"""Decide what a build input is, and refuse inputs that cannot install.

An app delivered as an Android App Bundle ships as a base APK plus configuration
splits (ABI, density, language). The base declares `android:requiredSplitTypes`; an
install session that provides the base alone fails with INSTALL_FAILED_MISSING_SPLIT
before any code runs. The base APK extracted from the XAPK is therefore *not* an
installable app on its own, and this script refuses it instead of producing a build
the user cannot install.

Accepts an .xapk/.zip bundle or a directory of APKs, and prints a JSON plan:
`{"base": path, "splits": [path, ...], "required_types": [...], "present_types": [...]}`.

`android:requiredSplitTypes` is read from the binary manifest's string pool, which is
UTF-16LE — an ASCII search finds nothing. Split types are read from each split's own
manifest instead of being guessed from its filename.

Usage:
  python3 scripts/preflight.py bundle.xapk --work build/input
"""
from __future__ import annotations

import argparse
import json
import re
import shutil
import sys
import zipfile
from pathlib import Path

MANIFEST = "AndroidManifest.xml"
PACKAGE = "com.wispr.flowapp"


class PreflightError(Exception):
    """Raised when the input cannot produce an installable build."""


def manifest_text(apk: Path) -> str:
    """The binary manifest decoded from its UTF-16LE string pool."""
    with zipfile.ZipFile(apk) as z:
        if MANIFEST not in z.namelist():
            raise PreflightError(f"{apk.name}: no {MANIFEST}")
        return z.read(MANIFEST).decode("utf-16-le", "ignore")


def required_split_types(apk: Path) -> list[str]:
    """`base__abi,base__density` and friends, from the requiredSplitTypes value.

    Matched as text: the pool chunks carry a length prefix, so comparing whole chunks
    to a bare attribute value misses them.
    """
    runs = re.findall(r"base__[a-z0-9_]+(?:,base__[a-z0-9_]+)*", manifest_text(apk))
    kinds: list[str] = []
    for run in runs:
        kinds += [kind for kind in run.split(",") if kind not in kinds]
    return kinds


def split_types(apk: Path) -> list[str]:
    return sorted(set(re.findall(r"base__[a-z0-9_]+", manifest_text(apk))))


def unpack(source: Path, work: Path) -> list[Path]:
    work.mkdir(parents=True, exist_ok=True)
    if source.is_dir():
        return sorted(source.glob("*.apk"))
    if not source.is_file():
        raise PreflightError(f"no such input: {source}")
    if source.suffix == ".apk":
        target = work / source.name
        shutil.copy2(source, target)
        return [target]
    with zipfile.ZipFile(source) as z:
        names = [n for n in z.namelist() if n.endswith(".apk")]
        if not names:
            raise PreflightError(f"{source.name}: no APK inside")
        for name in names:
            target = work / Path(name).name
            target.write_bytes(z.read(name))
    return sorted(work.glob("*.apk"))


def classify(apks: list[Path]) -> tuple[Path, list[Path]]:
    """The base is the APK holding the second dex; everything else is a split."""
    if not apks:
        raise PreflightError("no APK to build")
    base = None
    for apk in apks:
        with zipfile.ZipFile(apk) as z:
            names = z.namelist()
        if "classes2.dex" in names or "classes.dex" in names and len(apks) == 1:
            if base is not None:
                raise PreflightError(f"two candidate base APKs: {base.name}, {apk.name}")
            base = apk
    if base is None:
        raise PreflightError("no APK contains a dex — is this an app bundle?")
    return base, [apk for apk in apks if apk != base]


def plan(source: Path, work: Path) -> dict:
    apks = unpack(source, work)
    base, splits = classify(apks)
    required = required_split_types(base)
    present = sorted({t for split in splits for t in split_types(split)})
    missing = [t for t in required if t not in present]
    if missing:
        raise PreflightError(
            f"the base requires split types {required} but {missing} are missing; "
            "pass the .xapk (or a directory holding the split APKs), not the bare base APK"
        )
    with zipfile.ZipFile(base) as z:
        if "classes.dex" not in z.namelist() and "classes2.dex" not in z.namelist():
            raise PreflightError(f"{base.name}: no dex")
    return {
        "base": str(base),
        "splits": [str(split) for split in splits],
        "required_types": required,
        "present_types": present,
        "package": PACKAGE,
    }


def main() -> int:
    ap = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter
    )
    ap.add_argument("source", type=Path)
    ap.add_argument("--work", type=Path, default=Path("build/input"))
    ap.add_argument("--json", action="store_true", help="print the plan as JSON")
    a = ap.parse_args()
    try:
        result = plan(a.source, a.work)
    except PreflightError as exc:
        print(f"error: {exc}", file=sys.stderr)
        return 1
    if a.json:
        print(json.dumps(result))
    else:
        print(f"base:    {result['base']}")
        print(f"splits:  {', '.join(result['splits']) or '(none)'}")
        print(f"types:   required={result['required_types']} present={result['present_types']}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
