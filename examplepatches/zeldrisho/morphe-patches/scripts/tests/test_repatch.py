"""Offline helper regressions: python3 -m unittest discover -s scripts/tests -v."""

import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest


SCRIPT = Path(__file__).resolve().parents[1] / "repatch.sh"
FAKE_JAVA = r"""#!/usr/bin/env python3
import json, os, pathlib, sys
args = sys.argv[1:]
assert args[0] == "-jar" and args[1].endswith(".jar"), args
capture = os.environ.get("JAR_CAPTURE")
if capture:
    pathlib.Path(capture).write_text(args[1])
command, args = args[2], args[3:]
with open(os.environ["CALLS"], "a") as log:
    log.write(json.dumps([command, args]) + "\n")
if command == "options-create":
    assert "-t" not in args, args
    if os.environ.get("FAIL_OPTIONS"):
        print("options-create diagnostic", file=sys.stderr)
        sys.exit(23)
    patches = {
        "Hide ads": {"enabled": True},
        "Change app name": {"enabled": True, "options": {"appName": "Threads"}},
        "Change package name": {"enabled": False, "options": {}},
    }
    pathlib.Path(args[args.index("-o") + 1]).write_text(json.dumps([{"patches": patches}]))
elif command == "patch":
    assert "--purge" not in args, args
    assert any(a.startswith("--keystore=") for a in args), args
    options = pathlib.Path(args[args.index("--options-file") + 1]).read_text()
    pathlib.Path(os.environ["OPTIONS_CAPTURE"]).write_text(options)
    if os.environ.get("FAIL_PATCH"):
        print("signing diagnostic", file=sys.stderr)
        sys.exit(24)
    pathlib.Path(args[args.index("-o") + 1]).touch()
else:
    raise AssertionError(command)
"""


class RepatchTest(unittest.TestCase):
    """Test suite for the repatch.sh script, covering patch bundle discovery, signing options, and error paths."""

    def setUp(self):
        """Set up a temporary test environment with a fake java executable and mock project structure."""
        self.temp = tempfile.TemporaryDirectory(prefix="repatch test ")
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        scripts = self.root / "scripts"
        scripts.mkdir()
        self.script = scripts / "repatch.sh"
        shutil.copyfile(SCRIPT, self.script)
        self.libs = self.root / "patches/build/libs"
        self.libs.mkdir(parents=True)
        self.home = self.root / "home"
        self.home.mkdir()
        bin_dir = self.root / "bin"
        bin_dir.mkdir()
        java = bin_dir / "java"
        java.write_text(FAKE_JAVA)
        java.chmod(0o755)
        self.env = {
            k: v
            for k, v in os.environ.items()
            if k
            not in {
                "APP_NAME",
                "PACKAGE_NAME",
                "MPP",
                "KEYSTORE",
                "KEYSTORE_ALIAS",
                "KEYSTORE_PASSWORD",
                "KEYSTORE_ENTRY_PASSWORD",
                "GITHUB_REPO",
                "VERIFY_SDK",
                "FAIL_OPTIONS",
                "FAIL_PATCH",
            }
        }
        self.env.update(
            PATH=f"{bin_dir}{os.pathsep}{os.environ['PATH']}",
            HOME=str(self.home),
            KEYSTORE=str(self.root / "test.keystore"),
            MPP=str(self.root / "bundle.mpp"),
            CALLS=str(self.root / "calls.jsonl"),
            OPTIONS_CAPTURE=str(self.root / "options.json"),
            JAR_CAPTURE=str(self.root / "jar.txt"),
        )
        for key in ("KEYSTORE", "MPP"):
            Path(self.env[key]).touch()
        # Seed JAR discovery: newest morphe-desktop-*-all.jar in the primary share dir.
        self.share = self.home / ".local/share/morphe"
        self.share.mkdir(parents=True)
        self.share_jar = self.share / "morphe-desktop-test-all.jar"
        self.share_jar.touch()
        self.input = self.root / "app input.apkm"
        self.input.touch()
        self.output = self.root / "output.apk"

    def run_helper(self, *cli_args, **overrides):
        """Run the repatch.sh script with optional CLI args and environment variable overrides.

        Positional args are passed to the script before the input/output paths.
        An override value of None removes the variable from the environment.
        """
        env = dict(self.env)
        for key, value in overrides.items():
            if value is None:
                env.pop(key, None)
            else:
                env[key] = value
        return subprocess.run(
            ["bash", str(self.script), *cli_args, str(self.input), str(self.output)],
            env=env,
            capture_output=True,
            text=True,
            timeout=15,
        )

    def calls(self):
        """Parse and return the list of Morphe CLI commands logged during script execution."""
        return [
            json.loads(line)
            for line in Path(self.env["CALLS"]).read_text().splitlines()
        ]

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

    def test_jar_discovery_finds_newest_share_jar(self):
        """Verify discovery picks the newest upstream JAR within a share dir."""
        self.share_jar.unlink()
        old = self.share / "morphe-desktop-1-all.jar"
        new = self.share / "morphe-desktop-2-all.jar"
        old.touch()
        new.touch()
        os.utime(old, (100, 100))
        os.utime(new, (200, 200))
        result = self.run_helper()
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(Path(self.env["JAR_CAPTURE"]).read_text(), str(new))

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
