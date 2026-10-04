import importlib.util
import subprocess
import unittest
from pathlib import Path
from unittest import mock


SCRIPT = Path(__file__).resolve().parents[1] / "apk_recon.py"
SPEC = importlib.util.spec_from_file_location("apk_recon", SCRIPT)
apk_recon = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(apk_recon)


class ApkReconTest(unittest.TestCase):
    def test_prefers_standalone_apkid(self):
        result = subprocess.CompletedProcess(["apkid"], 0, "Protections: none\n", "")
        with (
            mock.patch.object(
                apk_recon.shutil,
                "which",
                side_effect=lambda name: "/bin/apkid" if name == "apkid" else None,
            ),
            mock.patch.object(apk_recon.subprocess, "run", return_value=result) as run,
        ):
            self.assertEqual("Protections: none", apk_recon.run_apkid(Path("app.apk")))
        self.assertEqual(["/bin/apkid", "app.apk"], run.call_args.args[0])

    def test_falls_back_to_uvx(self):
        result = subprocess.CompletedProcess(["uvx"], 0, "scan output", "")
        with (
            mock.patch.object(
                apk_recon.shutil,
                "which",
                side_effect=lambda name: "/bin/uvx" if name == "uvx" else None,
            ),
            mock.patch.object(apk_recon.subprocess, "run", return_value=result) as run,
        ):
            self.assertEqual("scan output", apk_recon.run_apkid(Path("app.apk")))
        self.assertEqual(["uvx", "apkid", "app.apk"], run.call_args.args[0])

    def test_reports_timeout(self):
        with (
            mock.patch.object(
                apk_recon.shutil,
                "which",
                side_effect=lambda name: "/bin/apkid" if name == "apkid" else None,
            ),
            mock.patch.object(
                apk_recon.subprocess,
                "run",
                side_effect=subprocess.TimeoutExpired("apkid", 300),
            ) as run,
        ):
            self.assertEqual(
                "apkid failed: timed out after 300s",
                apk_recon.run_apkid(Path("app.apk")),
            )
        self.assertEqual(300, run.call_args.kwargs["timeout"])

    def test_reports_unavailable_and_failure(self):
        with mock.patch.object(apk_recon.shutil, "which", return_value=None):
            self.assertIn("not available", apk_recon.run_apkid(Path("app.apk")))
        failure = subprocess.CompletedProcess(["apkid"], 2, "", "bad input")
        with (
            mock.patch.object(apk_recon.shutil, "which", return_value="/bin/apkid"),
            mock.patch.object(apk_recon.subprocess, "run", return_value=failure),
        ):
            self.assertIn(
                "apkid failed: bad input", apk_recon.run_apkid(Path("app.apk"))
            )


if __name__ == "__main__":
    unittest.main()
