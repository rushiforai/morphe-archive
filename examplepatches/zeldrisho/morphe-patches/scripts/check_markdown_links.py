#!/usr/bin/env python3
"""Check repository-relative Markdown links without network access."""

import re
import sys
import unicodedata
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
LINK = re.compile(r"!?\[[^]]*\]\(([^)\s]+)(?:\s+[^)]*)?\)")
HEADING = re.compile(r"^#{1,6}\s+(.+?)\s*#*\s*$")


def slug(value):
    """Return the GitHub-style base anchor for a Markdown heading."""
    value = unicodedata.normalize("NFKC", value)
    value = re.sub(r"[`*_~]", "", value).lower()
    value = re.sub(r"[^\w\s-]", "", value, flags=re.UNICODE)
    return re.sub(r"\s+", "-", value).strip("-")


def heading_anchors(lines):
    """Return anchors, including GitHub's numeric suffix for duplicates."""
    counts = {}
    result = set()
    for line in lines:
        match = HEADING.match(line)
        if not match:
            continue
        base = slug(match.group(1))
        index = counts.get(base, 0)
        counts[base] = index + 1
        result.add(base if index == 0 else f"{base}-{index}")
    return result


def anchors(path):
    """Return all GitHub-style heading anchors in a Markdown file."""
    return heading_anchors(path.read_text(encoding="utf-8").splitlines())


def main():
    """Report invalid local Markdown links and return a process status code."""
    errors = []
    for path in ROOT.rglob("*.md"):
        if any(part in {".git", "build", ".gradle", "analysis"} for part in path.parts):
            continue
        for number, line in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
            for raw in LINK.findall(line):
                if raw.startswith(("http://", "https://", "mailto:", "#")):
                    target, fragment = (
                        (raw.split("#", 1) + [""])[:2]
                        if raw.startswith("#")
                        else (None, None)
                    )
                    if target is None:
                        continue
                    if fragment not in anchors(path):
                        errors.append(f"{path}:{number}: missing anchor #{fragment}")
                    continue
                target, separator, fragment = raw.partition("#")
                if separator and not fragment:
                    errors.append(f"{path}:{number}: empty anchor in link {raw}")
                    continue
                if not target:
                    errors.append(f"{path}:{number}: empty local link {raw}")
                    continue
                destination = (path.parent / target).resolve()
                if not destination.is_file() or not str(destination).startswith(
                    str(ROOT.resolve())
                ):
                    errors.append(f"{path}:{number}: missing local link {raw}")
                elif fragment and fragment not in anchors(destination):
                    errors.append(f"{path}:{number}: missing anchor {raw}")
    if errors:
        print("\n".join(errors), file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
