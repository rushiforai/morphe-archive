"""Synthetic APK qualification fixtures; no proprietary APKs or certificates."""

import importlib.util
import unittest
from pathlib import Path

SCRIPT = Path(__file__).resolve().parents[1] / "apk_qualification.py"
SPEC = importlib.util.spec_from_file_location("apk_qualification", SCRIPT)
QUALIFICATION = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(QUALIFICATION)


class ApkQualificationTest(unittest.TestCase):
    def test_stock_base_identity_is_accepted(self):
        QUALIFICATION.validate_identity(
            {"package": "com.zing.zalo", "versionCode": 260801903}
        )

    def test_wrong_package_represents_repacked_or_wrong_input(self):
        with self.assertRaisesRegex(ValueError, "package"):
            QUALIFICATION.validate_identity(
                {"package": "com.example.repacked", "versionCode": 260801903}
            )

    def test_wrong_version_is_rejected(self):
        with self.assertRaisesRegex(ValueError, "versionCode"):
            QUALIFICATION.validate_identity(
                {"package": "com.zing.zalo", "versionCode": 1}
            )

    def test_missing_certificate_is_rejected(self):
        with self.assertRaisesRegex(ValueError, "certificate"):
            QUALIFICATION.validate_input_certificate(None)

    def test_unexpected_certificate_is_rejected(self):
        with self.assertRaisesRegex(ValueError, "certificate"):
            QUALIFICATION.validate_input_certificate("patched", expected="stock")

    def test_split_certificate_mismatch_is_rejected(self):
        base = {"package": "com.zing.zalo", "versionCode": "260801903"}
        split = {"package": "com.zing.zalo", "versionCode": "260801903"}
        with self.assertRaisesRegex(ValueError, "does not match"):
            QUALIFICATION.validate_split(base, split, "stock", "other")

    def test_split_metadata_mismatch_is_rejected(self):
        base = {"package": "com.zing.zalo", "versionCode": "260801903"}
        split = {"package": "com.zing.zalo", "versionCode": "260801902"}
        with self.assertRaisesRegex(ValueError, "versionCode"):
            QUALIFICATION.validate_split(base, split, "stock", "stock")

    def test_output_certificate_is_checked_against_output_identity(self):
        self.assertEqual(
            QUALIFICATION.validate_output_certificate("release", expected="release"),
            "release",
        )
        with self.assertRaisesRegex(ValueError, "output APK"):
            QUALIFICATION.validate_output_certificate("other", expected="release")

    def test_output_certificate_requires_configuration(self):
        with self.assertRaisesRegex(ValueError, "configured"):
            QUALIFICATION.validate_output_certificate("release", expected="")


if __name__ == "__main__":
    unittest.main()
