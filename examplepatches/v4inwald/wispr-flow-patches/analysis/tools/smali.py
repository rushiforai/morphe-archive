#!/usr/bin/env python3
"""Read one smali class from a disassembly tree, without the noise.

Usage:
  python3 smali.py 'com/wispr/payment/wordlimit/WordLimitPolicy'    # whole class
  python3 smali.py 'WordLimitEngine' --grep 'const/16'              # grep inside
  python3 smali.py 'wordlimit' --list                               # list matches
  python3 smali.py 'wordlimit' --all                                # every matched file

Options:
  --decoded DIR   disassembly tree (default: $DECODED, else build/decoded)
  --grep REGEX    print matching lines with line numbers instead of the class
  --head N        keep only the first N meaningful lines
  --list          list matching files
  --all           print every matching file, not just the first
"""
from __future__ import annotations

import argparse
import glob
import os
import re
import sys

NOISE = re.compile(
    r"^\s*(\.line |\.local |\.end local|\.param |\.end param|# |\.prologue|\.registers|\.source)"
)


def decoded_root(cli_value: str | None) -> str:
    root = cli_value or os.environ.get("DECODED") or "build/decoded"
    if not os.path.isdir(root):
        sys.exit(f"error: disassembly tree not found: {root} (run scripts/decompile.sh first)")
    return root


def resolve(root: str, fragment: str) -> list[str]:
    if os.path.isfile(fragment):
        return [fragment]
    for pattern in (f"{root}/**/{fragment}.smali", f"{root}/**/*{fragment}*.smali"):
        hits = sorted(glob.glob(pattern, recursive=True))
        if hits:
            return hits
    return []


def main() -> int:
    ap = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter
    )
    ap.add_argument("fragment", help="class name, path fragment, or .smali file")
    ap.add_argument("--decoded")
    ap.add_argument("--grep")
    ap.add_argument("--head", type=int, default=0)
    ap.add_argument("--list", action="store_true")
    ap.add_argument("--all", action="store_true")
    a = ap.parse_args()

    root = decoded_root(a.decoded)
    files = resolve(root, a.fragment)
    if not files:
        print(f"no match for {a.fragment!r} under {root}")
        return 1

    prefix = root.rstrip("/") + "/"
    if a.list:
        for f in files[:80]:
            print(f.replace(prefix, ""))
        print(f"({len(files)} files)")
        return 0

    for f in files if a.all else files[:1]:
        print(f"########## {f.replace(prefix, '')}")
        lines = open(f, encoding="utf-8", errors="replace").read().splitlines()
        if a.grep:
            rx = re.compile(a.grep, re.I)
            for i, line in enumerate(lines):
                if rx.search(line):
                    print(f"{i + 1:5d} {line.strip()[:240]}")
            continue
        out = [line for line in lines if not NOISE.match(line)]
        print("\n".join(out[: a.head] if a.head else out))
    return 0


if __name__ == "__main__":
    sys.exit(main())
