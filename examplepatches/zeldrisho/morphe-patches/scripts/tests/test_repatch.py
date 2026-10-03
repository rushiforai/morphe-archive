"""Offline helper regressions: python3 -m unittest discover -s scripts/tests -v."""

import importlib.util
import json
import os
import unittest
from pathlib import Path

from scripts.tests.repatch_test_support import RepatchTestSupport

SCRIPT = Path(__file__).resolve().parents[1] / "repatch.py"
SPEC = importlib.util.spec_from_file_location("repatch", SCRIPT)
REPATCH = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(REPATCH)


class RepatchTest(RepatchTestSupport):
    """Regression assertions for bundle discovery, signing options, and errors."""

    def test_download_url_validation(self):
        """Reject non-HTTPS and non-GitHub destinations."""
        for url in (
            "file:///etc/passwd",
            "http://api.github.com/repos/example/project",
            "https://127.0.0.1/release.mpp",
            "https://evil.example/release.mpp",
        ):
            with self.subTest(url=url), self.assertRaises(ValueError):
                REPATCH.validate_download_url(url)
        for url in (
            "https://api.github.com/repos/example/project/releases/latest",
            "https://github.com/example/project/releases/download/v1/patches.mpp",
            "https://release-assets.githubusercontent.com/example/patches.mpp",
        ):
            with self.subTest(url=url):
                self.assertEqual(REPATCH.validate_download_url(url), url)

    def test_redirect_handler_exposes_redirects(self):
        """Ensure redirects are returned for validation instead of followed implicitly."""
        handler = REPATCH.NoRedirectHandler()
        self.assertIsNone(
            handler.redirect_request(None, None, 302, "", {}, "https://github.com")
        )

    def test_default_signing_and_patch_selection(self):
        """Verify the script uses default signing parameters and selects the correct patch bundle."""
        result = self.run_helper()
        self.assertEqual(result.returncode, 0, result.stderr)
        calls = self.calls()
        args = calls[1][1]
        self.assertIn("--keystore-entry-alias=Morphe", args)
        self.assertIn("--keystore-password=Morphe", args)
        self.assertFalse(any(a.startswith("--keystore-entry-password=") for a in args))
        self.assertEqual(args[args.index("-p") + 1], self.env["MPP"])
        self.assertEqual(args[-1], str(self.input))
        patches = json.loads(Path(self.env["OPTIONS_CAPTURE"]).read_text())[0][
            "patches"
        ]
        self.assertTrue(patches["Hide ads"]["enabled"])
        self.assertFalse(patches["Change package name"]["enabled"])
        self.assertTrue(self.output.is_file())
        self.assertFalse(Path(args[args.index("-t") + 1]).parent.exists())

    def test_signing_and_rename_overrides(self):
        """Verify that keystore and app/package rename options pass through correctly to the CLI."""
        result = self.run_helper(
            KEYSTORE_ALIAS="morphe",
            KEYSTORE_PASSWORD="store pass=word",
            KEYSTORE_ENTRY_PASSWORD="entry pass=word",
            APP_NAME="Threads Test",
            PACKAGE_NAME="com.example.threads",
        )
        self.assertEqual(result.returncode, 0, result.stderr)
        args = self.calls()[1][1]
        for option in (
            "--keystore-entry-alias=morphe",
            "--keystore-password=store pass=word",
            "--keystore-entry-password=entry pass=word",
        ):
            self.assertIn(option, args)
        patches = json.loads(Path(self.env["OPTIONS_CAPTURE"]).read_text())[0][
            "patches"
        ]
        self.assertEqual(
            patches["Change app name"]["options"]["appName"], "Threads Test"
        )
        self.assertTrue(patches["Change package name"]["enabled"])
        self.assertEqual(
            patches["Change package name"]["options"]["packageName"],
            "com.example.threads",
        )

    def test_newest_local_bundle_excludes_documentation(self):
        """Verify the script selects the newest .mpp bundle while excluding javadoc and sources artifacts."""
        for name, mtime in (
            ("patches-1.mpp", 100),
            ("patches-2.mpp", 200),
            ("patches-2-sources.mpp", 300),
            ("patches-2-javadoc.mpp", 400),
        ):
            path = self.libs / name
            path.touch()
            os.utime(path, (mtime, mtime))
        result = self.run_helper(MPP="")
        self.assertEqual(result.returncode, 0, result.stderr)
        args = self.calls()[0][1]
        self.assertEqual(args[args.index("-p") + 1], str(self.libs / "patches-2.mpp"))

    def test_missing_explicit_bundle_fails_before_cli(self):
        """Verify that specifying a nonexistent patch bundle fails early with a clear error message."""
        result = self.run_helper(MPP=str(self.root / "missing.mpp"))
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("patch bundle not found", result.stderr)
        self.assertFalse(Path(self.env["CALLS"]).exists())

    def test_options_failure_is_visible_and_cleans_scratch(self):
        """Verify that options-create failures surface diagnostics and clean up temporary directories."""
        result = self.run_helper(FAIL_OPTIONS="1")
        self.assertEqual(result.returncode, 23)
        self.assertIn("options-create diagnostic", result.stderr)
        calls = self.calls()
        self.assertEqual(len(calls), 1)
        args = calls[0][1]
        self.assertFalse(Path(args[args.index("-o") + 1]).parent.exists())
        self.assertFalse(self.output.exists())

    def test_bytecode_mode_passes_through_and_rejects_invalid_values(self):
        """Verify that FULL reaches the CLI and unsupported bytecode modes fail validation."""
        result = self.run_helper(BYTECODE_MODE="FULL")
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn("--bytecode-mode=FULL", self.calls()[-1][1])
        result = self.run_helper(BYTECODE_MODE="bad")
        self.assertNotEqual(result.returncode, 0)
        self.assertIn(
            "BYTECODE_MODE must be FULL, STRIP_SAFE, or STRIP_FAST", result.stderr
        )

    def test_verify_sdk_defaults_to_disabled(self):
        """Verify that DEX/APK SDK verification is opt-in and off by default."""
        result = self.run_helper()
        self.assertEqual(result.returncode, 0, result.stderr)
        args = self.calls()[1][1]
        self.assertFalse(any(a.startswith("--verify-with-sdk") for a in args))

    def test_verify_sdk_flag_and_path_forms(self):
        """Verify VERIFY_SDK=1 uses SDK discovery and a path passes through with '='."""
        result = self.run_helper(VERIFY_SDK="1")
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn("--verify-with-sdk", self.calls()[-1][1])
        result = self.run_helper(VERIFY_SDK="/opt/android-sdk")
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn("--verify-with-sdk=/opt/android-sdk", self.calls()[-1][1])

    def test_signing_failure_does_not_report_success(self):
        """Verify that patch/sign failures do not print a success message and preserve error diagnostics."""
        result = self.run_helper(FAIL_PATCH="1")
        self.assertEqual(result.returncode, 24)
        self.assertIn("signing diagnostic", result.stderr)
        self.assertNotIn("✅ Patched APK", result.stdout)
        args = self.calls()[1][1]
        self.assertFalse(Path(args[args.index("-t") + 1]).parent.exists())

    def test_jar_flag_overrides_discovery(self):
        """Verify --jar <path> beats the share-dir JAR for manual testing."""
        override = self.root / "manual-test-all.jar"
        override.touch()
        os.utime(self.share_jar, (300, 300))
        os.utime(override, (100, 100))
        result = self.run_helper("--jar", str(override))
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(Path(self.env["JAR_CAPTURE"]).read_text(), str(override))

    def test_jar_discovery_stays_in_primary_share_dir(self):
        """Verify discovery ignores JARs outside ~/.local/share/morphe/."""
        self.share_jar.unlink()
        primary = self.share / "morphe-desktop-1-all.jar"
        fallback_dir = self.home / ".local/share/other-morphe-install"
        fallback_dir.mkdir(parents=True)
        fallback = fallback_dir / "morphe-desktop-2-all.jar"
        primary.touch()
        fallback.touch()
        os.utime(primary, (100, 100))
        os.utime(fallback, (200, 200))
        result = self.run_helper()
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(Path(self.env["JAR_CAPTURE"]).read_text(), str(primary))

    def test_jar_discovery_selects_highest_version_not_newest_mtime(self):
        """Choose the highest parsed JAR version despite misleading mtimes."""
        self.share_jar.unlink()
        older_version = self.share / "morphe-desktop-1.9.0-all.jar"
        highest_version = self.share / "morphe-desktop-1.10.0-all.jar"
        older_version.touch()
        highest_version.touch()
        os.utime(older_version, (200, 200))
        os.utime(highest_version, (100, 100))
        result = self.run_helper()
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(
            Path(self.env["JAR_CAPTURE"]).read_text(), str(highest_version)
        )

    def test_jar_discovery_missing_error(self):
        """Verify the missing-JAR error names the filesystem locations and --jar."""
        self.share_jar.unlink()
        result = self.run_helper()
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("Morphe JAR not found", result.stderr)
        self.assertIn("~/.local/share/morphe/", result.stderr)
        self.assertIn("--jar", result.stderr)
        self.assertFalse(Path(self.env["CALLS"]).exists())

    def test_keystore_standard_location_fallback(self):
        """Verify an imported keystore in the data dir is picked up automatically."""
        data = self.home / ".local/share/morphe/morphe-data"
        data.mkdir(parents=True)
        (data / "morphe.keystore").touch()
        imported = data / "imported.keystore"
        imported.touch()
        result = self.run_helper(KEYSTORE=None)
        self.assertEqual(result.returncode, 0, result.stderr)
        args = self.calls()[1][1]
        self.assertIn(f"--keystore={imported}", args)
        self.assertIn("--keystore-password=Morphe", args)

    def test_keystore_missing_error(self):
        """Verify a clear error when no keystore exists in any standard location."""
        result = self.run_helper(KEYSTORE=None)
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("keystore not found", result.stderr)
        self.assertFalse(Path(self.env["CALLS"]).exists())


if __name__ == "__main__":
    unittest.main()
