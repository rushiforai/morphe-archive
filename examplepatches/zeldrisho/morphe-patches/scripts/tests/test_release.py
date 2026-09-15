"""Regression tests for the Python release-staging script."""

import json
import os
import shutil
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SCRIPT = ROOT / "scripts/prepare_release.py"


class ReleaseScriptTest(unittest.TestCase):
    """Check the release script's basic command-line validation."""

    def test_invalid_version(self):
        """Reject versions that do not use the X.Y.Z format."""
        r = subprocess.run(
            [sys.executable, str(SCRIPT), "1.0"],
            cwd=ROOT,
            text=True,
            capture_output=True,
        )
        self.assertNotEqual(r.returncode, 0)
        self.assertIn("Version must be X.Y.Z", r.stderr)

    def test_help(self):
        """Expose command-line help successfully."""
        r = subprocess.run(
            [sys.executable, str(SCRIPT), "--help"], text=True, capture_output=True
        )
        self.assertEqual(r.returncode, 0)

    def test_successful_staging_updates_release_artifacts(self):
        """Stage a release and keep all generated version metadata consistent."""
        with tempfile.TemporaryDirectory(prefix="release test ") as directory:
            root = Path(directory)
            scripts = root / "scripts"
            scripts.mkdir()
            for name in (
                "prepare_release.py",
                "extract_release_notes.py",
                "generate_patches_readme.py",
            ):
                shutil.copy(ROOT / "scripts" / name, scripts / name)

            (root / "CHANGELOG.md").write_text(
                "# Changelog\n\n## Unreleased\n\n"
                "### 🐛 Bug Fixes\n* **Zalo:** Expected release note.\n"
            )
            (root / "gradle.properties").write_text("version = 0.0.0\n")
            (root / "patches-list.json").write_text(
                json.dumps({"version": "0.0.0", "patches": []})
            )
            (root / "README.md").write_text(
                "<!-- PATCHES_START -->\nold\n<!-- PATCHES_END -->\n"
            )
            gradlew = root / "gradlew"
            gradlew.write_text("#!/bin/sh\nexit 0\n")
            gradlew.chmod(0o755)
            fake_bin = root / "bin"
            fake_bin.mkdir()
            gh = fake_bin / "gh"
            gh.write_text("#!/bin/sh\nprintf '%s\\n' zeldrisho/morphe-patches\n")
            gh.chmod(0o755)

            def git(*args):
                return subprocess.run(
                    ["git", *args], cwd=root, check=True, capture_output=True, text=True
                )

            git("init", "-q")
            git("config", "user.email", "test@example.com")
            git("config", "user.name", "Release Test")
            git("add", ".")
            git("commit", "-q", "-m", "base")
            git("branch", "-M", "main")
            git("update-ref", "refs/remotes/origin/main", "HEAD")
            git("checkout", "-q", "-b", "release/test")

            env = dict(os.environ, PATH=f"{fake_bin}{os.pathsep}{os.environ['PATH']}")
            result = subprocess.run(
                [sys.executable, str(scripts / "prepare_release.py"), "1.2.3"],
                cwd=root,
                env=env,
                capture_output=True,
                text=True,
            )
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertIn("version = 1.2.3", (root / "gradle.properties").read_text())
            self.assertEqual(
                json.loads((root / "patches-list.json").read_text())["version"], "1.2.3"
            )
            bundle = json.loads((root / "patches-bundle.json").read_text())
            self.assertEqual(bundle["version"], "1.2.3")
            self.assertTrue(bundle["description"])
            self.assertIn("Expected release note", bundle["description"])


if __name__ == "__main__":
    unittest.main()
