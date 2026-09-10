#!/usr/bin/env python3
"""Extract one version's release notes from CHANGELOG.md.

Usage: extract_release_notes.py CHANGELOG.md <version> <output.md> <owner/repo>

Finds the Manager-compatible dated heading for <version>, validates its form
(bare only for the oldest released entry, otherwise the exact adjacent-tag
inline compare link), and writes its body (up to the next version heading)
to <output.md>.
Exits non-zero when the version is missing, its heading violates the
compare-link rule, or its body is empty.
"""

import re
import sys
from pathlib import Path


def main() -> int:
    """Extract one version's nonempty release notes from the changelog."""
    if len(sys.argv) != 5:
        print(
            "Usage: extract_release_notes.py CHANGELOG.md <version> "
            "<output.md> <owner/repo>",
            file=sys.stderr,
        )
        return 2
    changelog_path, version, output_path, repo = (
        Path(sys.argv[1]), sys.argv[2], Path(sys.argv[3]), sys.argv[4],
    )
    escaped = re.escape(version)
    target_heading = re.compile(
        r"^#{1,3}\s+(?:\["
        + escaped
        + r"\]\((?P<url>[^)]*)\)|"
        + escaped
        + r")[ \t]+\(\d{4}-\d{2}-\d{2}\)[ \t]*$"
    )
    released_heading = re.compile(
        r"^#{1,3}\s+(?:\[(?P<linked>\d+\.\d+\.\d+)\]\((?P<linked_url>[^)]*)\)|"
        r"(?P<bare>\d+\.\d+\.\d+))[ \t]+\(\d{4}-\d{2}-\d{2}\)[ \t]*$"
    )
    any_heading = re.compile(r"^#{1,3}\s+\S.*\(\d{4}-\d{2}-\d{2}\)\s*$")

    lines = changelog_path.read_text(encoding="utf-8").splitlines()
    entries: list[tuple[str, str | None]] = []
    for line in lines:
        match = released_heading.match(line)
        if match:
            entries.append((match["linked"] or match["bare"], match["linked_url"]))
    position = next(
        (index for index, (entry_version, _) in enumerate(entries)
         if entry_version == version),
        None,
    )
    if position is None:
        print(
            f"No release notes found for {version}; expected a dated "
            f"'## {version} (YYYY-MM-DD)' or '## [{version}](url) (YYYY-MM-DD)' heading",
            file=sys.stderr,
        )
        return 1
    entry_version, url = entries[position]
    if position == len(entries) - 1:
        if url is not None:
            print(
                f"## {entry_version} is the oldest released entry and must use "
                f"a bare '## {entry_version} (YYYY-MM-DD)' heading without "
                "a compare link",
                file=sys.stderr,
            )
            return 1
    else:
        adjacent = entries[position + 1][0]
        expected = f"https://github.com/{repo}/compare/v{adjacent}...v{version}"
        if url is None:
            print(
                f"Only the oldest released entry ({entries[-1][0]}) may use a bare "
                f"heading; ## {version} must link '{expected}'",
                file=sys.stderr,
            )
            return 1
        if url != expected:
            print(
                f"## {version} links '{url}' but must link its adjacent "
                f"compare '{expected}'",
                file=sys.stderr,
            )
            return 1

    body: list[str] = []
    inside = False
    for line in lines:
        if target_heading.match(line):
            inside = True
            continue
        if inside and any_heading.match(line):
            break
        if inside:
            body.append(line)

    text = "\n".join(body).strip() + "\n" if "\n".join(body).strip() else ""
    if not text:
        print(
            f"No nonempty release notes found for {version}; expected a dated "
            f"'## {version} (YYYY-MM-DD)' or '## [{version}](url) (YYYY-MM-DD)' heading",
            file=sys.stderr,
        )
        return 1
    output_path.write_text(text, encoding="utf-8")
    return 0


if __name__ == "__main__":
    sys.exit(main())
