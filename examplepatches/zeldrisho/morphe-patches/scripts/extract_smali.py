#!/usr/bin/env python3
"""Disassemble all DEX files to canonical analysis smali with baksmali."""

import argparse
import re
import shutil
import subprocess
import tempfile
import zipfile
from pathlib import Path


APP_NAMES = {
    "com.instagram.barcelona": "threads",
    "com.zing.zalo": "zalo",
}

MAX_ARCHIVE_ENTRIES = 20_000
MAX_MEMBER_SIZE = 4 * 1024**3
MAX_TOTAL_SIZE = 8 * 1024**3


def validated_members(archive: zipfile.ZipFile, suffix: str) -> list[zipfile.ZipInfo]:
    """Validate archive metadata before reading selected members."""
    entries = archive.infolist()
    if len(entries) > MAX_ARCHIVE_ENTRIES:
        raise ValueError(f"Archive has too many entries: {len(entries)}")
    total = 0
    selected = []
    names = set()
    for entry in entries:
        path = Path(entry.filename)
        mode = entry.external_attr >> 16
        if path.is_absolute() or ".." in path.parts or "\\" in entry.filename:
            raise ValueError(f"Unsafe archive path: {entry.filename}")
        if mode and (mode & 0o170000) not in (0, 0o100000, 0o040000):
            raise ValueError(f"Unsupported archive file type: {entry.filename}")
        if entry.file_size > MAX_MEMBER_SIZE:
            raise ValueError(f"Archive member too large: {entry.filename}")
        total += entry.file_size
        if total > MAX_TOTAL_SIZE:
            raise ValueError("Archive expanded size exceeds limit")
        if entry.filename in names:
            raise ValueError(f"Duplicate archive member: {entry.filename}")
        names.add(entry.filename)
        if not entry.is_dir() and entry.filename.lower().endswith(suffix):
            selected.append(entry)
    return selected


def extract_apks(archive_path: Path, destination: Path) -> list[Path]:
    """Stream APK members to a fresh directory after validating all ZIP entries."""
    destination.mkdir(parents=True, exist_ok=False)
    extracted = []
    with zipfile.ZipFile(archive_path) as archive:
        members = validated_members(archive, ".apk")
        names = [Path(member.filename).name for member in members]
        if len(names) != len(set(names)):
            raise ValueError("APK members have colliding filenames")
        for member, name in zip(members, names):
            target = destination / name
            with archive.open(member) as source, target.open("xb") as output:
                shutil.copyfileobj(source, output)
            extracted.append(target)
    return extracted


def default_output(apk: Path) -> Path:
    """Infer analysis/<app>/<version>/smali from an APKMirror bundle filename."""
    match = re.match(
        r"(?P<package>com(?:\.[A-Za-z0-9_]+)+)_(?P<version>\d+(?:\.\d+)+)-", apk.name
    )
    if not match:
        raise ValueError(
            f"Cannot infer app/version from {apk.name}; pass an output path"
        )
    package = match.group("package")
    app = APP_NAMES.get(package, package.rsplit(".", 1)[-1])
    return (
        Path(__file__).resolve().parents[1]
        / "analysis"
        / app
        / match.group("version")
        / "smali"
    )


def main():
    """Disassemble APK or bundle DEX files and replace the output after successful staging.

    An omitted output path is inferred from the bundle name. Invalid archives or
    failed baksmali commands leave the existing output in place.
    """
    parser = argparse.ArgumentParser()
    parser.add_argument("apk", help="APK, APKM, XAPK, or APKS input")
    parser.add_argument(
        "output",
        nargs="?",
        help="output directory (default: inferred analysis/<app>/<version>/smali)",
    )
    args = parser.parse_args()
    apk = Path(args.apk)
    if not apk.is_file():
        parser.error(f"Not found: {apk}")
    try:
        out = Path(args.output) if args.output else default_output(apk)
    except ValueError as error:
        parser.error(str(error))

    out.parent.mkdir(parents=True, exist_ok=True)
    sources = [apk]
    with tempfile.TemporaryDirectory(
        dir=out.parent, prefix=".extract-smali-"
    ) as staging:
        stage = Path(staging) / "smali"
        stage.mkdir()
        with tempfile.TemporaryDirectory() as work:
            if apk.suffix.lower() in {".apkm", ".xapk", ".apks"}:
                split = Path(work) / "splits"
                sources = sorted(extract_apks(apk, split))

            count = 0
            for source in sources:
                split_out = stage / (
                    source.stem if source.parent.name == "splits" else ""
                )
                split_out.mkdir(parents=True, exist_ok=True)
                with zipfile.ZipFile(source) as archive:
                    dex_members = validated_members(archive, ".dex")
                    for dex_member in sorted(
                        dex_members, key=lambda item: item.filename
                    ):
                        dex = dex_member.filename
                        current = Path(work) / "current.dex"
                        with (
                            archive.open(dex_member) as source,
                            current.open("wb") as target,
                        ):
                            shutil.copyfileobj(source, target)
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

        backup = out.with_name(f".{out.name}.previous")
        if backup.exists():
            shutil.rmtree(backup)
        if out.exists():
            out.rename(backup)
        try:
            stage.rename(out)
        except Exception:
            if backup.exists() and not out.exists():
                backup.rename(out)
            raise
        if backup.exists():
            shutil.rmtree(backup)
    print(
        f"✅ Disassembled {count} DEX file(s) to {out}/ (baksmali; replaced existing output)"
    )


if __name__ == "__main__":
    main()
