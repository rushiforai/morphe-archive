#!/usr/bin/env python3
"""standard library の reference preflight helper に対する回帰テスト。"""

from __future__ import annotations

import importlib.util
import json
from pathlib import Path
import sys
import unittest
import zipfile

ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "scripts" / "preflight_reference.py"
SPEC = importlib.util.spec_from_file_location("preflight_reference", SCRIPT)
assert SPEC is not None and SPEC.loader is not None
preflight = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = preflight
SPEC.loader.exec_module(preflight)

LIMITS = preflight.ArchiveLimits(
    max_entries=3,
    max_entry_uncompressed_bytes=100,
    max_total_uncompressed_bytes=200,
    max_compression_ratio=10,
)


def info(name: str, file_size: int = 1, compress_size: int = 1) -> zipfile.ZipInfo:
    entry = zipfile.ZipInfo(name)
    entry.file_size = file_size
    entry.compress_size = compress_size
    return entry


class ArchiveMemberValidationTest(unittest.TestCase):
    def test_accepts_exact_safe_member_set(self) -> None:
        actual = preflight.validate_archive_members(
            [info("base.apk"), info("metadata.json")], {"base.apk", "metadata.json"}, LIMITS
        )
        self.assertEqual(set(actual), {"base.apk", "metadata.json"})

    def test_rejects_zip_slip_and_backslashes(self) -> None:
        for name in ("../base.apk", "/base.apk", "dir/../../base.apk", "dir\\base.apk"):
            with self.subTest(name=name):
                with self.assertRaisesRegex(preflight.PreflightError, "unsafe ZIP member"):
                    preflight.validate_archive_members([info(name)], {name}, LIMITS)

    def test_rejects_duplicate_and_unexpected_members(self) -> None:
        with self.assertRaisesRegex(preflight.PreflightError, "duplicate ZIP member"):
            preflight.validate_archive_members([info("base.apk"), info("base.apk")], {"base.apk"}, LIMITS)
        with self.assertRaisesRegex(preflight.PreflightError, "unexpected APKM members"):
            preflight.validate_archive_members([info("base.apk"), info("extra.apk")], {"base.apk"}, LIMITS)

    def test_rejects_expansion_and_size_limits(self) -> None:
        with self.assertRaisesRegex(preflight.PreflightError, "member count exceeds limit"):
            preflight.validate_archive_members(
                [info("base.apk"), info("metadata.json"), info("icon.png"), info("extra.txt")],
                {"base.apk", "metadata.json", "icon.png", "extra.txt"},
                LIMITS,
            )
        with self.assertRaisesRegex(preflight.PreflightError, "uncompressed size limit"):
            preflight.validate_archive_members([info("base.apk", 101, 100)], {"base.apk"}, LIMITS)
        with self.assertRaisesRegex(preflight.PreflightError, "compression ratio"):
            preflight.validate_archive_members([info("base.apk", 100, 1)], {"base.apk"}, LIMITS)
        with self.assertRaisesRegex(preflight.PreflightError, "total uncompressed size limit"):
            preflight.validate_archive_members(
                [info("base.apk", 100, 100), info("metadata.json", 101, 101)],
                {"base.apk", "metadata.json"},
                preflight.ArchiveLimits(3, 150, 200, 10),
            )


class DescriptorContractTest(unittest.TestCase):
    def test_descriptor_records_complete_arm64_contract(self) -> None:
        descriptor = json.loads((ROOT / "reference" / "line-26.16.0-arm64-v8a.json").read_text())
        self.assertEqual(descriptor["apkm"]["sha256"], "4a82c3173a935c52dbe96b8768b73a2dda7284b860f37e4982d72b5672dbf1af")
        self.assertEqual(descriptor["package"], {
            "name": "jp.naver.line.android",
            "versionName": "26.16.0",
            "versionCode": 261600106,
            "minSdk": 32,
            "targetSdk": 36,
        })
        self.assertEqual(descriptor["apkContents"]["base"]["dexCount"], 14)
        self.assertEqual(descriptor["apkContents"]["arm64V8a"]["nativeLibraryCount"], 73)
        self.assertEqual(descriptor["requiredSplits"]["baseRequiredSplitTypes"], ["base__abi", "base__density"])
        self.assertEqual(len(descriptor["splits"]), 9)
        self.assertEqual(len(descriptor["requiredSplits"]["density"]), 6)

    def test_parses_signing_lineage_from_apksigner_output(self) -> None:
        output = "\n".join((
            "Verified using v3 scheme (APK Signature Scheme v3): true",
            "V3.1 Signer: (minSdkVersion=33, maxSdkVersion=2147483647) certificate SHA-256 digest: e6e8036e01234e919fbe9cf9ea5d210435cfc0542328641aa70a018f52f63cf8",
            "V3.0 Signer: (minSdkVersion=24, maxSdkVersion=32) certificate SHA-256 digest: e682fe0bcd60907dfed515e0b8a4de03aa1c281d111a07833986602b6098afd2",
        ))
        self.assertTrue(preflight.bool_in_apksigner_output(output, "using v3 scheme (APK Signature Scheme v3)"))
        self.assertEqual(preflight.signer_records(output), {
            ("V3.1", 33, 2147483647, "e6e8036e01234e919fbe9cf9ea5d210435cfc0542328641aa70a018f52f63cf8"),
            ("V3.0", 24, 32, "e682fe0bcd60907dfed515e0b8a4de03aa1c281d111a07833986602b6098afd2"),
        })


if __name__ == "__main__":
    unittest.main()
