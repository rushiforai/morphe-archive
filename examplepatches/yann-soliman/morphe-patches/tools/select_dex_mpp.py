#!/usr/bin/env python3
import sys
import zipfile
from pathlib import Path


def has_dex(path: Path) -> bool:
    try:
        with zipfile.ZipFile(path) as zf:
            return any(name.lower().endswith(".dex") for name in zf.namelist())
    except zipfile.BadZipFile:
        return False


def main() -> None:
    if len(sys.argv) < 2:
        raise SystemExit("usage: select_dex_mpp.py CANDIDATE...")

    candidates = [Path(arg) for arg in sys.argv[1:]]
    dex_candidates = [path for path in candidates if has_dex(path)]

    if len(dex_candidates) != 1:
        print("MPP candidates:", file=sys.stderr)
        for path in candidates:
            print(f"  {path} dex={has_dex(path)}", file=sys.stderr)
        raise SystemExit(
            f"expected exactly one dex-enabled MPP, found {len(dex_candidates)}"
        )

    print(dex_candidates[0])


if __name__ == "__main__":
    main()
