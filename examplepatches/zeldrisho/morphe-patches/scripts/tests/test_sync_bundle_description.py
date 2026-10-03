"""Tests for regenerating the Manager bundle description."""

import json
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

SCRIPT = Path(__file__).resolve().parents[1] / "sync_bundle_description.py"


class SyncBundleDescriptionTest(unittest.TestCase):
    def test_updates_current_description_and_preserves_other_manifest_fields(self):
        """Copy the current release notes into the description while preserving manifest metadata."""
        with tempfile.TemporaryDirectory() as temporary_directory:
            root = Path(temporary_directory)
            changelog = root / "CHANGELOG.md"
            manifest_path = root / "patches-bundle.json"
            changelog.write_text(
                "# Changelog\n\n"
                "## Unreleased\n\n* Next release.\n\n"
                "## 1.2.0 (2026-01-02)\n\n### 🐛 Bug Fixes\n* **App:** Fixed a bug.\n",
                encoding="utf-8",
            )
            original = {
                "version": "1.2.0",
                "description": "Old notes",
                "download_url": "https://example.test/asset.mpp",
                "created_at": "2026-01-02T00:00:00",
            }
            manifest_path.write_text(json.dumps(original), encoding="utf-8")

            result = subprocess.run(
                [
                    sys.executable,
                    str(SCRIPT),
                    str(changelog),
                    str(manifest_path),
                    "example/project",
                ],
                capture_output=True,
                text=True,
                check=False,
            )

            self.assertEqual(result.returncode, 0, result.stderr)
            updated = json.loads(manifest_path.read_text(encoding="utf-8"))
            self.assertEqual(
                updated["description"], "### 🐛 Bug Fixes\n* **App:** Fixed a bug."
            )
            for key in ("version", "download_url", "created_at"):
                self.assertEqual(updated[key], original[key])

    def test_missing_release_fails_without_changing_manifest(self):
        """Keep the manifest intact when its version has no matching changelog release."""
        with tempfile.TemporaryDirectory() as temporary_directory:
            root = Path(temporary_directory)
            changelog = root / "CHANGELOG.md"
            manifest_path = root / "patches-bundle.json"
            changelog.write_text("# Changelog\n\n## Unreleased\n", encoding="utf-8")
            original = {"version": "1.2.0", "description": "Keep me"}
            manifest_path.write_text(json.dumps(original), encoding="utf-8")

            result = subprocess.run(
                [
                    sys.executable,
                    str(SCRIPT),
                    str(changelog),
                    str(manifest_path),
                    "example/project",
                ],
                capture_output=True,
                text=True,
                check=False,
            )

            self.assertNotEqual(result.returncode, 0)
            self.assertEqual(
                json.loads(manifest_path.read_text(encoding="utf-8")), original
            )


if __name__ == "__main__":
    unittest.main()
