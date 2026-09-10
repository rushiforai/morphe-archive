#!/usr/bin/env python3
import json
import sys
from pathlib import Path

PUBLIC_PATCHES = {
    "Keepcool: allow plus in email",
    "Keepcool: booking availability dots",
}
PERSONAL_PATCHES = PUBLIC_PATCHES | {
    "Keepcool: 30-day booking calendar",
}


def names(path: str) -> set[str]:
    data = json.loads(Path(path).read_text(encoding="utf-8"))
    return {patch["name"] for patch in data["patches"]}


def main() -> None:
    if len(sys.argv) != 3:
        raise SystemExit("usage: verify_bundle_visibility.py PUBLIC_LIST PERSONAL_LIST")

    public = names(sys.argv[1])
    personal = names(sys.argv[2])

    if public != PUBLIC_PATCHES:
        raise SystemExit(
            f"public bundle mismatch: expected {sorted(PUBLIC_PATCHES)}, got {sorted(public)}"
        )
    if personal != PERSONAL_PATCHES:
        raise SystemExit(
            f"personal bundle mismatch: expected {sorted(PERSONAL_PATCHES)}, got {sorted(personal)}"
        )

    print("Bundle visibility: PASS")
    print(f"Public patches: {len(public)}")
    print(f"Personal patches: {len(personal)}")


if __name__ == "__main__":
    main()
