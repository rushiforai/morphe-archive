#!/usr/bin/env python3
"""Regenerate the current bundle description from its changelog release section.

Usage: sync_bundle_description.py CHANGELOG.md patches-bundle.json <owner/repo>
"""

import json
import subprocess
import sys
import tempfile
from pathlib import Path


def main() -> int:
    """Update the bundle description from its versioned changelog section.

    Return 0 on success, 2 for invalid arguments, or a nonzero validation/extractor
    status. Extraction must succeed before the manifest is written.
    """
    if len(sys.argv) != 4:
        print(
            "Usage: sync_bundle_description.py CHANGELOG.md patches-bundle.json <owner/repo>",
            file=sys.stderr,
        )
        return 2

    changelog_path, manifest_path, repo = (
        Path(sys.argv[1]),
        Path(sys.argv[2]),
        sys.argv[3],
    )
    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    version = manifest.get("version")
    if not isinstance(version, str) or not version:
        print("Bundle manifest must contain a nonempty version", file=sys.stderr)
        return 1

    with tempfile.TemporaryDirectory() as temporary_directory:
        notes_path = Path(temporary_directory) / "release-notes.md"
        result = subprocess.run(
            [
                sys.executable,
                str(Path(__file__).with_name("extract_release_notes.py")),
                str(changelog_path),
                version,
                str(notes_path),
                repo,
            ],
            check=False,
        )
        if result.returncode:
            return result.returncode
        manifest["description"] = notes_path.read_text(encoding="utf-8").strip()

    manifest_path.write_text(json.dumps(manifest, indent=2) + "\n", encoding="utf-8")
    return 0


if __name__ == "__main__":
    sys.exit(main())
