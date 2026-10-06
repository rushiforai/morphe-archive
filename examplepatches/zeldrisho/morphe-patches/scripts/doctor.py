#!/usr/bin/env python3
"""Read-only repository toolchain check; never installs tools or prints credentials."""

from __future__ import annotations

import argparse
import os
import shutil
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def main() -> int:
    """Report prerequisites for the selected mode, returning 1 when required tools are missing."""
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "mode", nargs="?", choices=("build", "analysis", "device"), default="build"
    )
    mode = parser.parse_args().mode
    missing = False

    def check(name: str, required: bool) -> None:
        """Report tool availability and mark required tools missing for the selected mode."""
        nonlocal missing
        path = shutil.which(name)
        if path:
            print(f"OK       {name:<16} {path}")
        elif required:
            print(f"MISSING  {name:<16} required for {mode}")
            missing = True
        else:
            print(f"OPTIONAL {name:<16} not found")

    print(f"Morphe patches doctor ({mode})\nRepository: {ROOT}\n")
    check("python3", True)
    check("java", True)
    java = shutil.which("java")
    if java:
        result = subprocess.run(
            [java, "-version"], capture_output=True, text=True, check=False
        )
        version = (result.stderr or result.stdout).splitlines()
        first = version[0] if version else "Java version unknown"
        print(f"Java: {first}")
        try:
            major = int(
                first.split('version "', 1)[1].split('"', 1)[0].split(".", 1)[0]
            )
        except (IndexError, ValueError):
            major = 0
        if major < 21:
            print("MISSING  Java 21+ required by this repository")
            missing = True

    wrapper = ROOT / "gradlew"
    if wrapper.is_file() and os.access(wrapper, os.X_OK):
        print(f"OK       gradlew          {wrapper}")
    else:
        print("MISSING  gradlew          executable wrapper not found")
        missing = True

    if mode == "analysis":
        for tool in ("file", "unzip", "rg", "aapt"):
            check(tool, True)
        check("baksmali", False)
    else:
        check("android", False)
        if mode == "device":
            check("adb", True)

    check("morphe", False)

    if missing:
        print(
            "One or more required tools are missing; no changes were made.",
            file=sys.stderr,
        )
        return 1
    print("Required tools are available; no changes were made.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
