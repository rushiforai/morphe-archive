"""Shared subprocess harness for repatch.py regression tests."""

import json
import os
import shutil
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

SCRIPT = Path(__file__).resolve().parents[1] / "repatch.py"

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
    options = pathlib.Path(args[args.index("--options-file") + 1]).read_text()
    pathlib.Path(os.environ["OPTIONS_CAPTURE"]).write_text(options)
    if os.environ.get("FAIL_PATCH"):
        print("signing diagnostic", file=sys.stderr)
        sys.exit(24)
    if os.environ.get("FAKE_PATCH_OUTPUT"):
        print(os.environ["FAKE_PATCH_OUTPUT"])
    patches = json.loads(options)[0]["patches"]
    omitted = set(os.environ.get("FAKE_OMIT_APPLIED", "").split(","))
    skipped = set()
    for line in os.environ.get("FAKE_PATCH_OUTPUT", "").splitlines():
        if "Skipping disabled:" in line:
            skipped.add(line.split("Skipping disabled:", 1)[1].strip())
    for name, patch in patches.items():
        if patch.get("enabled") and name not in omitted and name not in skipped:
            print("INFO: Applied: " + name)
    pathlib.Path(args[args.index("-o") + 1]).touch()
else:
    raise AssertionError(command)
"""


class RepatchTestSupport(unittest.TestCase):
    """Set up an isolated mock project and fake Morphe invocation."""

    def setUp(self):
        """Set up a temporary test environment with a fake java executable and mock project structure."""
        self.temp = tempfile.TemporaryDirectory(prefix="repatch test ")
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        scripts = self.root / "scripts"
        scripts.mkdir()
        self.script = scripts / "repatch.py"
        shutil.copyfile(SCRIPT, self.script)
        self.libs = self.root / "patches/build/libs"
        self.libs.mkdir(parents=True)
        self.home = self.root / "home"
        self.home.mkdir()
        bin_dir = self.root / "bin"
        bin_dir.mkdir()
        (bin_dir / "python3").symlink_to(sys.executable)
        java = bin_dir / "java"
        java.write_text(FAKE_JAVA)
        java.chmod(0o755)
        aapt = bin_dir / "aapt"
        aapt.write_text(
            """#!/usr/bin/env python3
import os
print("package: name='" + os.environ.get("FAKE_BADGING_PACKAGE", "com.example.app") + "' versionCode=1")
"""
        )
        aapt.chmod(0o755)
        self.env = {
            k: v
            for k, v in os.environ.items()
            if k
            not in {
                "APP_NAME",
                "PACKAGE_NAME",
                "EXPECTED_PACKAGE_NAME",
                "SOURCE_PACKAGE_NAME",
                "REQUIRED_PATCHES",
                "MPP",
                "KEYSTORE",
                "KEYSTORE_ALIAS",
                "KEYSTORE_PASSWORD",
                "KEYSTORE_ENTRY_PASSWORD",
                "MORPHE_DATA_DIR",
                "HOMEBREW_PREFIX",
                "GITHUB_REPO",
                "VERIFY_SDK",
                "BYTECODE_MODE",
                "FAIL_OPTIONS",
                "FAIL_PATCH",
                "FAKE_PATCH_OUTPUT",
                "FAKE_BADGING_PACKAGE",
                "FAKE_OMIT_APPLIED",
            }
        }
        self.env.update(
            PATH=str(bin_dir),
            HOME=str(self.home),
            KEYSTORE=str(self.root / "test.keystore"),
            MPP=str(self.root / "bundle.mpp"),
            CALLS=str(self.root / "calls.jsonl"),
            OPTIONS_CAPTURE=str(self.root / "options.json"),
            JAR_CAPTURE=str(self.root / "jar.txt"),
        )
        for key in ("KEYSTORE", "MPP"):
            Path(self.env[key]).touch()
        # Seed JAR discovery with a valid versioned JAR in the primary share dir.
        self.share = self.home / ".local/share/morphe"
        self.share.mkdir(parents=True)
        self.share_jar = self.share / "morphe-desktop-0.0.1-all.jar"
        self.share_jar.touch()
        self.input = self.root / "app input.apkm"
        self.input.touch()
        self.output = self.root / "output.apk"

    def run_helper(self, *cli_args, **overrides):
        """Run the repatch.py script with optional CLI args and environment variable overrides.

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
            [
                os.environ.get("PYTHON", "python3"),
                str(self.script),
                *cli_args,
                str(self.input),
                str(self.output),
            ],
            env=env,
            capture_output=True,
            text=True,
            timeout=15,
        )

    def calls(self):
        """Parse and return the list of Morphe commands logged during script execution."""
        return [
            json.loads(line)
            for line in Path(self.env["CALLS"]).read_text().splitlines()
        ]
