"""Tests for the DEX structural checks.

These run on synthetic dex files, so CI needs no APK and no Android toolchain.
The point is that the checker must not produce false confidence: a truncated or
tampered file has to be reported, and a well-formed one must come back clean.
"""
from __future__ import annotations

import hashlib
import struct
import sys
import unittest
import zlib
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(REPO / "scripts"))

import dex  # noqa: E402


def build_dex(*, corrupt_checksum: bool = False, truncate: int = 0,
              map_item_size: int = 0) -> bytes:
    """Build the smallest dex-shaped file the checks care about."""
    map_list = struct.pack("<I", 1) + struct.pack("<HHII", 0x0000, 0, map_item_size, 0x70)
    total_size = 0x70 + len(map_list)

    header = bytearray(0x70)
    header[0:8] = b"dex\n040\x00"
    struct.pack_into("<I", header, 32, total_size)    # file_size
    struct.pack_into("<I", header, 36, 0x70)          # header_size
    struct.pack_into("<I", header, 40, 0x12345678)    # endian_tag
    struct.pack_into("<I", header, 52, 0x70)          # map_off
    struct.pack_into("<I", header, 104, len(map_list))  # data_size
    struct.pack_into("<I", header, 108, 0x70)         # data_off

    body = bytes(header) + map_list

    digest = hashlib.sha1(body[32:]).digest()
    patched = bytearray(body)
    patched[12:32] = digest
    checksum = zlib.adler32(bytes(patched[12:])) & 0xFFFFFFFF
    if corrupt_checksum:
        checksum ^= 0xFFFF
    struct.pack_into("<I", patched, 8, checksum)
    return bytes(patched)[: len(patched) - truncate] if truncate else bytes(patched)


class HeaderTest(unittest.TestCase):
    def test_valid_dex_is_clean(self) -> None:
        self.assertEqual([], dex.check_header(build_dex(), "test.dex"))

    def test_rejects_non_dex(self) -> None:
        problems = dex.check_header(b"not a dex file", "x")
        self.assertEqual(["x: not a dex file"], problems)

    def test_detects_checksum_corruption(self) -> None:
        problems = dex.check_header(build_dex(corrupt_checksum=True), "x")
        self.assertTrue(any("adler32" in p for p in problems), problems)

    def test_detects_truncation(self) -> None:
        problems = dex.check_header(build_dex(truncate=1), "x")
        self.assertTrue(any("header declares" in p for p in problems), problems)

    def test_detects_data_section_past_end(self) -> None:
        data = bytearray(build_dex())
        struct.pack_into("<I", data, 104, 0xFFFF)  # absurd data_size
        problems = dex.check_header(bytes(data), "x")
        self.assertTrue(any("data section" in p for p in problems), problems)


class MapTest(unittest.TestCase):
    def test_valid_map_is_clean(self) -> None:
        self.assertEqual([], dex.check_map(build_dex(), "test.dex"))

    def test_detects_map_offset_outside_file(self) -> None:
        data = bytearray(build_dex())
        struct.pack_into("<I", data, 52, 0xFFFFFF)
        problems = dex.check_map(bytes(data), "x")
        self.assertTrue(any("map offset" in p for p in problems), problems)

    def test_detects_item_past_end(self) -> None:
        # an item that claims to extend past the end of the file must be reported
        problems = dex.check_map(build_dex(map_item_size=0xFFFF), "x")
        self.assertTrue(any("runs past the end" in p for p in problems), problems)


if __name__ == "__main__":
    unittest.main()
