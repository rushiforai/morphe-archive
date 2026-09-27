"""Regression tests for the Python release-staging script."""

import json
import os
import shutil
import subprocess
import sys
import tempfile
import unittest
from contextlib import contextmanager
from pathlib import Path

from scripts.prepare_release import changelog_state

ROOT = Path(__file__).resolve().parents[2]
SCRIPT = ROOT / "scripts/prepare_release.py"


class ReleaseScriptTest(unittest.TestCase):
    """Check the release script's basic command-line validation."""

    @contextmanager
    def release_repo(self, changelog=None, gradle_script=None):
        """Create a small isolated repository suitable for staging tests."""
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
                changelog
                or "# Changelog\n\n## Unreleased\n\n* Expected release note.\n"
            )
            (root / "gradle.properties").write_text("version = 0.0.0\n")
            (root / "patches-list.json").write_text(
                json.dumps({"version": "0.0.0", "patches": []})
            )
            (root / "README.md").write_text(
                "<!-- PATCHES_START -->\nold\n<!-- PATCHES_END -->\n"
            )
            (root / "unrelated.txt").write_text("must survive\n")
            gradlew = root / "gradlew"
            gradlew.write_text(gradle_script or "#!/bin/sh\nexit 0\n")
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
            git(
                "remote",
                "add",
                "origin",
                "https://github.com/zeldrisho/morphe-patches.git",
            )
            git("update-ref", "refs/remotes/origin/main", "HEAD")
            git("checkout", "-q", "-b", "release/test")
            env = dict(os.environ, PATH=f"{fake_bin}{os.pathsep}{os.environ['PATH']}")
            yield root, git, env

    def run_release(self, root, env, version="1.2.3"):
        return subprocess.run(
            [sys.executable, str(root / "scripts/prepare_release.py"), version],
            cwd=root,
            env=env,
            capture_output=True,
            text=True,
        )

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

    def test_malformed_release_heading_is_rejected(self):
        """Reject a release-looking level-two heading with invalid syntax."""
        text = "# Changelog\n\n## Unreleased\n\n* change\n\n## 1.2 (2024-01-01)\n"
        with self.assertRaisesRegex(SystemExit, "Malformed released changelog heading"):
            changelog_state(text, "1.3.0", "example/project")

    def test_duplicate_release_heading_is_rejected(self):
        """Reject duplicate released versions."""
        text = (
            "# Changelog\n\n## Unreleased\n\n* change\n\n"
            "## 1.2.0 (2024-01-01)\n\n## 1.2.0 (2024-01-02)\n"
        )
        with self.assertRaisesRegex(SystemExit, "Duplicate released changelog entry"):
            changelog_state(text, "1.3.0", "example/project")

    def test_out_of_order_release_headings_are_rejected(self):
        """Require released changelog headings to descend by version."""
        text = (
            "# Changelog\n\n## Unreleased\n\n* change\n\n"
            "## 1.1.0 (2024-01-01)\n\n## 1.2.0 (2024-01-02)\n"
        )
        with self.assertRaisesRegex(SystemExit, "descending version order"):
            changelog_state(text, "1.3.0", "example/project")

    def test_valid_subsequent_release_is_accepted(self):
        """Accept a release after the highest reachable stable tag."""
        changelog = (
            "# Changelog\n\n## Unreleased\n\n* New change.\n\n## 1.1.0 (2024-01-01)\n"
        )
        with self.release_repo(changelog) as (root, git, env):
            git("tag", "v1.1.0")
            result = self.run_release(root, env, "1.2.0")
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertIn(
                "[1.2.0](https://github.com/zeldrisho/morphe-patches/compare/v1.1.0...v1.2.0)",
                (root / "CHANGELOG.md").read_text(),
            )

    def test_missing_previous_tag_is_rejected_without_changes(self):
        """Reject a changelog whose previous release tag is absent."""
        changelog = (
            "# Changelog\n\n## Unreleased\n\n* New change.\n\n## 1.1.0 (2024-01-01)\n"
        )
        with self.release_repo(changelog) as (root, git, env):
            before = {
                name: (root / name).read_bytes()
                for name in (
                    "CHANGELOG.md",
                    "gradle.properties",
                    "patches-list.json",
                    "README.md",
                    "unrelated.txt",
                )
            }
            result = self.run_release(root, env, "1.2.0")
            self.assertNotEqual(result.returncode, 0)
            self.assertIn("Previous release tag v1.1.0 is missing", result.stderr)
            self.assertEqual(
                before, {name: (root / name).read_bytes() for name in before}
            )

    def test_unreachable_previous_tag_is_rejected(self):
        """Reject a previous tag that exists but is not an ancestor of HEAD."""
        changelog = (
            "# Changelog\n\n## Unreleased\n\n* New change.\n\n## 1.1.0 (2024-01-01)\n"
        )
        with self.release_repo(changelog) as (root, git, env):
            unreachable = git(
                "commit-tree", "HEAD^{tree}", "-m", "unreachable"
            ).stdout.strip()
            git("update-ref", "refs/tags/v1.1.0", unreachable)
            result = self.run_release(root, env, "1.2.0")
            self.assertNotEqual(result.returncode, 0)
            self.assertIn("not reachable from HEAD", result.stderr)

    def test_generator_failure_restores_owned_and_unrelated_files(self):
        """Roll back generated artifacts when the patch-list generator fails."""
        with self.release_repo(gradle_script="#!/bin/sh\nexit 7\n") as (root, git, env):
            before = {
                name: (root / name).read_bytes()
                for name in (
                    "CHANGELOG.md",
                    "gradle.properties",
                    "patches-list.json",
                    "README.md",
                    "unrelated.txt",
                )
            }
            result = self.run_release(root, env)
            self.assertNotEqual(result.returncode, 0)
            self.assertEqual(
                before, {name: (root / name).read_bytes() for name in before}
            )
            self.assertEqual(git("status", "--porcelain").stdout, "")

    def test_extraction_failure_restores_generated_files(self):
        """Roll back artifacts when release-note extraction fails."""
        with self.release_repo() as (root, git, env):
            (root / "scripts/extract_release_notes.py").write_text(
                "raise SystemExit(9)\n"
            )
            git("add", "scripts/extract_release_notes.py")
            git("commit", "-q", "-m", "make extraction fail")
            before = {
                name: (root / name).read_bytes()
                for name in (
                    "CHANGELOG.md",
                    "gradle.properties",
                    "patches-list.json",
                    "README.md",
                    "unrelated.txt",
                )
            }
            result = self.run_release(root, env)
            self.assertNotEqual(result.returncode, 0)
            self.assertEqual(
                before, {name: (root / name).read_bytes() for name in before}
            )
            self.assertEqual(git("status", "--porcelain").stdout, "")

    def test_commit_failure_restores_generated_files(self):
        """Roll back artifacts when the final commit fails."""
        with self.release_repo() as (root, git, env):
            hook = root / ".git/hooks/pre-commit"
            hook.write_text("#!/bin/sh\nexit 11\n")
            hook.chmod(0o755)
            before = {
                name: (root / name).read_bytes()
                for name in (
                    "CHANGELOG.md",
                    "gradle.properties",
                    "patches-list.json",
                    "README.md",
                    "unrelated.txt",
                )
            }
            result = self.run_release(root, env)
            self.assertNotEqual(result.returncode, 0)
            self.assertEqual(
                before, {name: (root / name).read_bytes() for name in before}
            )
            self.assertEqual(git("status", "--porcelain").stdout, "")

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
            self.assertIn("patches-bundle.json", git("ls-files").stdout)


if __name__ == "__main__":
    unittest.main()
