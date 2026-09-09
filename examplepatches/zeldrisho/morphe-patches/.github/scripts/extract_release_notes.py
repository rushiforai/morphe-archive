#!/usr/bin/env python3
"""Extract one version's release notes from CHANGELOG.md.

Usage: extract_release_notes.py CHANGELOG.md <version> <output.md>

Finds the Manager-compatible heading `#{1,3} <version> (YYYY-MM-DD)` and
writes the section body (up to the next version heading) to <output.md>.
Exits non-zero when the version is missing or its body is empty.
"""

import re
import sys
from pathlib import Path


def main() -> int:
    changelog_path, version, output_path = Path(sys.argv[1]), sys.argv[2], Path(sys.argv[3])
    heading = re.compile(
        r"^#{1,3}\s+" + re.escape(version) + r"\s+\(\d{4}-\d{2}-\d{2}\)\s*$"
    )
    any_heading = re.compile(r"^#{1,3}\s+\S.*\(\d{4}-\d{2}-\d{2}\)\s*$")

    lines = changelog_path.read_text(encoding="utf-8").splitlines()
    body: list[str] = []
    inside = False
    for line in lines:
        if heading.match(line):
            inside = True
            continue
        if inside and any_heading.match(line):
            break
        if inside:
            body.append(line)

    text = "\n".join(body).strip() + "\n" if "\n".join(body).strip() else ""
    if not text:
        print(f"No release notes found for {version}", file=sys.stderr)
        return 1
    output_path.write_text(text, encoding="utf-8")
    return 0


if __name__ == "__main__":
    sys.exit(main())
