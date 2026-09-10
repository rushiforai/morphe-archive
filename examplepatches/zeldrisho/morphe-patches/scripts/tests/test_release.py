#!/usr/bin/env python3
"""Release fixtures: only temporary repositories and files are modified.

Run: python3 -m unittest discover -s scripts/tests -p 'test_release.py' -v
"""

import os
import re
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SCRIPT = (ROOT / "scripts/prepare-release.sh").read_text(encoding="utf-8")
PREFLIGHT, PROMOTE, _ = re.findall(r"<<'PY'\n(.*?)\nPY", SCRIPT, re.DOTALL)
EXTRACTOR = ROOT / ".github/scripts/extract_release_notes.py"
DATE = "2026-09-09"
REPO = "example/patches"
BULLET = "* **Threads:** A change.\n"


def heading(version, prev=None):
    """Build a dated heading: bare for the initial release, else an exact adjacent compare link."""
    label = (
        f"[{version}](https://github.com/{REPO}/compare/v{prev}...v{version})"
        if prev is not None
        else version
    )
    return f"## {label} ({DATE})"


def entry(version, prev=None):
    """Build a complete changelog entry for a fixture version."""
    return heading(version, prev) + "\n\n### ✨ New Features\n" + BULLET


class ReleaseFixtures(unittest.TestCase):
    def setUp(self):
        """Create an isolated Git repository for each release fixture."""
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.cwd = Path(self.temp.name)
        # Ignore host Git configuration/hooks; all commits/tags are fixtures.
        self.env = dict(os.environ, GIT_CONFIG_GLOBAL=os.devnull,
                        GIT_CONFIG_NOSYSTEM="1")
        self.git("init", "-b", "main")
        self.git("config", "user.name", "Release Fixture")
        self.git("config", "user.email", "fixture@example.invalid")
        self.git("config", "core.hooksPath", os.devnull)
        self.git("commit", "--allow-empty", "-m", "fixture")
        # Fixtures have no remote; pin origin/main at the initial commit so
        # the even-with-main staging guard has a ref to compare against.
        self.git("update-ref", "refs/remotes/origin/main", "HEAD")
        self.changelog = self.cwd / "CHANGELOG.md"

    def git(self, *args):
        """Run Git in the fixture repository and return trimmed standard output."""
        return subprocess.run(
            ["git", *args], cwd=self.cwd, env=self.env, check=True,
            text=True, capture_output=True,
        ).stdout.strip()

    def write_changelog(self, rest=""):
        """Write an Unreleased section followed by optional released entries."""
        self.changelog.write_text(
            "# Changelog\n\n## Unreleased\n\n### 🚀 Updated App Support\n"
            + BULLET + "\n" + rest, encoding="utf-8",
        )

    def preflight(self, version="1.1.0", success=True):
        """Run release preflight and assert its result without modifying the changelog."""
        before = self.changelog.read_bytes()
        result = subprocess.run(
            [sys.executable, "-c", PREFLIGHT, version, REPO],
            cwd=self.cwd, env=self.env, text=True, capture_output=True,
        )
        self.assertEqual(result.returncode == 0, success, result.stderr)
        self.assertEqual(self.changelog.read_bytes(), before)
        return result

    def promote(self, version, prev):
        """Promote Unreleased notes and return the resulting changelog text."""
        subprocess.run(
            [sys.executable, "-c", PROMOTE, version, DATE, REPO, prev],
            cwd=self.cwd, env=self.env, check=True, capture_output=True,
        )
        return self.changelog.read_text(encoding="utf-8")

    def extract(self, target, success=True):
        """Extract a version's notes and assert the result without stale outputs."""
        output = self.cwd / f"notes-{target}.md"
        if output.exists():
            output.unlink()
        result = subprocess.run(
            [sys.executable, str(EXTRACTOR), str(self.changelog),
             target, str(output), REPO],
            capture_output=True, text=True,
        )
        self.assertEqual(result.returncode == 0, success, result.stderr)
        return result, output

    def guard_prefix(self, version):
        """Run the shell guard prefix and return the completed process."""
        guards = SCRIPT.split('REPO="', 1)[0].replace(
            'PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"',
            'PROJECT_DIR="$PWD"',
        )
        return subprocess.run(
            ["bash", "-c", guards, "prepare-release.sh", version],
            cwd=self.cwd, env=self.env, text=True, capture_output=True,
        )

    def test_staging_branch_even_with_main(self):
        """Verify guards and preflight pass on a branch even with origin/main."""
        self.git("checkout", "-b", "release/1.2.0")
        result = self.guard_prefix("1.2.0")
        self.assertEqual(result.returncode, 0, result.stderr)
        self.git("tag", "v1.0.0")
        self.write_changelog(entry("1.0.0"))
        self.assertEqual(self.preflight("1.1.0").stdout.strip(), "1.0.0")
        self.git("checkout", "main")

    def test_branch_behind_main_rejected(self):
        """Verify staging fails when the branch is behind origin/main."""
        self.git("commit", "--allow-empty", "-m", "main moved on")
        self.git("update-ref", "refs/remotes/origin/main", "HEAD")
        self.git("reset", "--hard", "HEAD~1")
        result = self.guard_prefix("1.1.0")
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("is not based on origin/main", result.stderr)

    def test_branch_ahead_of_main_allowed(self):
        """Verify guards and preflight pass when the branch is ahead of origin/main."""
        self.git("commit", "--allow-empty", "-m", "reviewed tooling")
        result = self.guard_prefix("1.1.0")
        self.assertEqual(result.returncode, 0, result.stderr)
        self.git("tag", "v1.0.0")
        self.write_changelog(entry("1.0.0"))
        self.assertEqual(self.preflight("1.1.0").stdout.strip(), "1.0.0")

    def test_missing_origin_main_rejected(self):
        """Verify staging fails clearly when origin/main is unknown."""
        self.git("update-ref", "-d", "refs/remotes/origin/main")
        result = self.guard_prefix("1.1.0")
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("fetch origin first", result.stderr)

    def test_existing_shell_safeguards(self):
        """Verify the original shell guards reject invalid release invocations."""
        # Execute only the original shell guards, never the real staging steps.
        guards = SCRIPT.split('REPO="', 1)[0]

        def check(version, error=None):
            """Run the shell guards and assert the expected success or error."""
            result = subprocess.run(
                ["bash", "-c", guards, "prepare-release.sh", version],
                cwd=self.cwd, env=self.env, text=True, capture_output=True,
            )
            if error:
                self.assertNotEqual(result.returncode, 0)
                self.assertIn(error, result.stderr)
            else:
                self.assertEqual(result.returncode, 0, result.stderr)

        # The script computes its root from BASH_SOURCE[0]. Point the fixture's
        # script path there while keeping execution limited to the guard prefix.
        guards = guards.replace(
            'PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"',
            'PROJECT_DIR="$PWD"',
        )
        check("1.1.0")
        check("1.1.0-dev.1", "Version must be X.Y.Z")
        self.git("checkout", "-b", "release/1.1.0")
        check("1.1.0")
        self.git("checkout", "main")
        self.write_changelog()
        self.git("add", "CHANGELOG.md")
        check("1.1.0", "Working tree is dirty")
        self.git("commit", "-m", "fixture changelog")
        # The commit moved main; sync the fake remote so later subcases
        # exercise their own guards instead of the even-with-main check.
        self.git("update-ref", "refs/remotes/origin/main", "HEAD")
        self.changelog.write_text(self.changelog.read_text() + "\n")
        check("1.1.0", "Working tree is dirty")
        self.git("checkout", "--", "CHANGELOG.md")
        self.git("tag", "v1.1.0")
        check("1.1.0", "Tag v1.1.0 already exists")

    def test_workflow_validation_precedes_build(self):
        """Verify release-note validation runs before toolchain setup and build."""
        workflow = (ROOT / ".github/workflows/release.yml").read_text()
        extractor = workflow.index("python3 .github/scripts/extract_release_notes.py")
        self.assertLess(extractor, workflow.index("- name: Set up Java"))
        self.assertLess(extractor, workflow.index("- name: Test and build bundle"))

    def test_first_release(self):
        """Verify the first release uses a bare heading without a compare link."""
        self.write_changelog()
        self.assertEqual(self.preflight("1.0.0").stdout.strip(), "")
        text = self.promote("1.0.0", "")
        self.assertIn(heading("1.0.0"), text)
        self.assertNotIn("/compare/", text)

    def test_subsequent_release_preserves_old_sections(self):
        """Verify later releases add a compare link without rewriting history."""
        self.git("tag", "-f", "-a", "v1.0.0", "-m", "fixture release")
        self.git("tag", "-f", "v1.1.0")
        old = entry("1.1.0", "1.0.0") + "\n" + entry("1.0.0")
        self.write_changelog(old)
        prev = self.preflight("1.2.0").stdout.strip()
        self.assertEqual(prev, "1.1.0")
        text = self.promote("1.2.0", prev)
        self.assertTrue(text.endswith(old))
        self.assertIn(
            "## [1.2.0](https://github.com/example/patches/compare/"
            f"v1.1.0...v1.2.0) ({DATE})", text,
        )
        self.assertTrue(text.startswith("# Changelog\n\n## Unreleased\n\n"))

    def test_missing_tag(self):
        """Verify preflight rejects a released changelog entry without its tag."""
        self.write_changelog(entry("1.0.0"))
        self.assertIn("Missing tag v1.0.0", self.preflight(success=False).stderr)

    def test_untagged_staging(self):
        """Verify preflight rejects untagged history and duplicate version staging."""
        self.git("tag", "v1.0.0")
        self.write_changelog(entry("1.1.0", "1.0.0") + "\n" + entry("1.0.0"))
        self.assertIn("Missing tag v1.1.0", self.preflight("1.2.0", False).stderr)
        self.assertIn("already contains", self.preflight("1.1.0", False).stderr)

    def test_out_of_order_requested_version(self):
        """Verify the requested version must exceed the latest released version."""
        self.git("tag", "v1.0.0")
        self.write_changelog(entry("1.0.0"))
        self.assertIn("must be greater", self.preflight("0.9.0", False).stderr)

    def test_out_of_order_history(self):
        """Verify released changelog entries remain in newest-first order."""
        self.git("tag", "v1.0.0")
        self.git("tag", "v1.1.0")
        self.write_changelog(entry("1.0.0") + "\n" + entry("1.1.0", "1.0.0"))
        self.assertIn("newest-first", self.preflight("1.2.0", False).stderr)

    def test_higher_reachable_tag(self):
        """Verify preflight detects a reachable release tag omitted from history."""
        self.git("tag", "v1.0.0")
        self.git("tag", "v1.10.0")
        self.write_changelog(entry("1.0.0"))
        self.assertIn("highest reachable", self.preflight("1.11.0", False).stderr)

    def test_numeric_tag_order_and_prerelease_ignored(self):
        """Verify tag ordering is numeric and ignores prerelease or unrelated tags."""
        for tag in ("v1.9.0", "v1.10.0", "v9.0.0-dev.1", "unrelated"):
            self.git("tag", tag)
        self.write_changelog(entry("1.10.0", "1.9.0") + "\n" + entry("1.9.0"))
        self.assertEqual(self.preflight("1.11.0").stdout.strip(), "1.10.0")

    def test_unreachable_previous_tag(self):
        """Verify the latest released tag must be reachable from the current branch."""
        self.git("checkout", "-b", "other")
        self.git("commit", "--allow-empty", "-m", "other")
        self.git("tag", "v1.0.0")
        self.git("checkout", "main")
        self.write_changelog(entry("1.0.0"))
        self.assertIn("not reachable", self.preflight(success=False).stderr)

    def test_tags_without_entries(self):
        """Verify preflight rejects release tags when no released entries exist."""
        self.git("tag", "v1.0.0")
        self.write_changelog()
        self.assertIn("no released entries", self.preflight(success=False).stderr)

    def test_shallow_history(self):
        """Verify preflight rejects repositories with incomplete shallow history."""
        self.write_changelog()
        (self.cwd / ".git/shallow").write_text(self.git("rev-parse", "HEAD") + "\n")
        self.assertIn("complete history", self.preflight(success=False).stderr)

    def test_empty_unreleased(self):
        """Verify Unreleased must contain at least one changelog bullet."""
        self.write_changelog(entry("1.0.0"))
        self.changelog.write_text(self.changelog.read_text().replace(BULLET, "", 1))
        self.assertIn("no '*' bullets", self.preflight(success=False).stderr)

    def test_wrong_compare_url_rejected(self):
        """Verify a wrong or non-adjacent compare URL fails preflight and extraction."""
        self.git("tag", "v1.0.0")
        self.git("tag", "v1.1.0")
        for bad_url in (
            f"https://github.com/{REPO}/compare/v0.9.0...v1.1.0",
            f"https://github.com/{REPO}/compare/v1.1.0...v1.0.0",
            "https://example.com/compare/v1.0.0...v1.1.0",
        ):
            with self.subTest(url=bad_url):
                self.write_changelog(
                    f"## [1.1.0]({bad_url}) ({DATE})\n\n### ✨ New Features\n"
                    + BULLET + "\n" + entry("1.0.0")
                )
                result = self.preflight("1.2.0", success=False)
                self.assertIn("adjacent", result.stderr)
                result, _ = self.extract("1.1.0", success=False)
                self.assertIn("adjacent", result.stderr)

    def test_bare_non_initial_release_rejected(self):
        """Verify a bare heading on a non-initial release fails preflight and extraction."""
        self.git("tag", "v1.0.0")
        self.git("tag", "v1.1.0")
        self.write_changelog(entry("1.1.0") + "\n" + entry("1.0.0"))
        result = self.preflight("1.2.0", success=False)
        self.assertIn("bare", result.stderr)
        result, _ = self.extract("1.1.0", success=False)
        self.assertIn("bare", result.stderr)
        # The oldest entry stays extractable in its bare form.
        _, output = self.extract("1.0.0")
        self.assertEqual(output.read_text(), "### ✨ New Features\n" + BULLET)

    def test_linked_initial_release_rejected(self):
        """Verify the oldest released entry must stay bare."""
        self.git("tag", "v1.0.0")
        self.git("tag", "v1.1.0")
        self.write_changelog(
            entry("1.1.0", "1.0.0") + "\n" + entry("1.0.0", "0.9.0")
        )
        result = self.preflight("1.2.0", success=False)
        self.assertIn("bare", result.stderr)
        result, _ = self.extract("1.0.0", success=False)
        self.assertIn("bare", result.stderr)

    def test_correct_history_accepted(self):
        """Verify bare-initial plus exact-URL subsequent entries pass both gates."""
        self.git("tag", "v1.0.0")
        self.git("tag", "v1.1.0")
        self.write_changelog(entry("1.1.0", "1.0.0") + "\n" + entry("1.0.0"))
        self.assertEqual(self.preflight("1.2.0").stdout.strip(), "1.1.0")
        for target in ("1.0.0", "1.1.0"):
            _, output = self.extract(target)
            self.assertEqual(output.read_text(), "### ✨ New Features\n" + BULLET)

    def test_extraction_validates_target_heading(self):
        """Verify extraction enforces bare-initial and exact-URL-subsequent headings."""
        self.write_changelog(
            entry("1.2.0", "1.1.0") + "\n" + entry("1.1.0", "1.0.0")
            + "\n" + entry("1.0.0")
        )
        for target in ("1.2.0", "1.1.0", "1.0.0"):
            _, output = self.extract(target)
            self.assertEqual(output.read_text(), "### ✨ New Features\n" + BULLET)

    def test_malformed_and_reference_headings_rejected(self):
        """Verify malformed and reference-style release headings are rejected."""
        for bad in (
            f"## [1.1.0] ({DATE})",
            f"## [1.1.0][compare] ({DATE})",
            f"## [1.1.0] - {DATE}",
            f"## [1.1.0 (https://example.com) ({DATE})",
            f"## 1.1.0](https://example.com) ({DATE})",
            "## 1.1.0",
            f"## 1x1x0 ({DATE})",
        ):
            with self.subTest(heading=bad):
                self.write_changelog(bad + "\n" + BULLET + "\n[compare]: https://example.com\n")
                self.assertIn("Unrecognized release heading", self.preflight("1.2.0", False).stderr)
                result = subprocess.run(
                    [sys.executable, str(EXTRACTOR), str(self.changelog),
                     "1.1.0", str(self.cwd / "notes.md"), REPO], capture_output=True,
                )
                self.assertNotEqual(result.returncode, 0)

    def test_empty_extracted_body_rejected(self):
        """Verify extraction fails when a matching heading has no release notes."""
        self.changelog.write_text(heading("1.1.0", "1.0.0") + "\n\n" + entry("1.0.0"))
        result = subprocess.run(
            [sys.executable, str(EXTRACTOR), str(self.changelog),
             "1.1.0", str(self.cwd / "notes.md"), REPO], capture_output=True,
        )
        self.assertNotEqual(result.returncode, 0)


if __name__ == "__main__":
    unittest.main()
