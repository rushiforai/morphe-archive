#!/usr/bin/env python3
"""Dump the user-facing strings of an APK from its resource table (resources.arsc).

Without an Android resource decoder we cannot map string to resource id to usage,
but the pool order is stable and greppable, which is enough to inventory features
and UI copy (including strings for features the app has not shipped yet).

Usage:
  python3 arsc_strings.py --grep 'word limit|upgrade'
  python3 arsc_strings.py --out strings.txt

Options:
  --apk PATH    APK to read (default: $APK)
  --grep REGEX  only print matching entries
  --limit N     stop after N printed entries
  --out FILE    write the whole pool to a file, one "[index] string" per line
"""
from __future__ import annotations

import argparse
import os
import re
import struct
import sys
import zipfile


def apk_path(cli_value: str | None) -> str:
    path = cli_value or os.environ.get("APK")
    if not path:
        sys.exit("error: no APK given (use --apk PATH or set $APK)")
    if not os.path.isfile(path):
        sys.exit(f"error: APK not found: {path}")
    return path


def read_string_pool(buf: bytes, off: int):
    """Return (count, getter) for the RES_STRING_POOL chunk at `off`."""
    chunk_type, header_size, _ = struct.unpack_from("<HHI", buf, off)
    if chunk_type != 0x0001:
        raise ValueError(f"not a string pool chunk at {off}: 0x{chunk_type:04x}")
    count, _styles, flags, strings_start, _styles_start = struct.unpack_from("<IIIII", buf, off + 8)
    utf8 = bool(flags & (1 << 8))
    offsets = struct.unpack_from(f"<{count}I", buf, off + header_size)

    def get(index: int) -> str:
        p = off + strings_start + offsets[index]
        if utf8:
            n = buf[p]
            p += 1
            if n & 0x80:
                n = ((n & 0x7F) << 8) | buf[p]
                p += 1
            m = buf[p]
            p += 1
            if m & 0x80:
                m = ((m & 0x7F) << 8) | buf[p]
                p += 1
            return buf[p : p + m].decode("utf-8", "replace")
        n = struct.unpack_from("<H", buf, p)[0]
        p += 2
        if n & 0x8000:
            n = ((n & 0x7FFF) << 16) | struct.unpack_from("<H", buf, p)[0]
            p += 2
        return buf[p : p + n * 2].decode("utf-16-le", "replace")

    return count, get


def main() -> int:
    ap = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter
    )
    ap.add_argument("--apk")
    ap.add_argument("--grep")
    ap.add_argument("--limit", type=int, default=0)
    ap.add_argument("--out")
    a = ap.parse_args()

    with zipfile.ZipFile(apk_path(a.apk)) as z:
        buf = z.read("resources.arsc")
    count, get = read_string_pool(buf, 12)
    strings = [get(i) for i in range(count)]

    if a.out:
        with open(a.out, "w", encoding="utf-8") as fh:
            for i, s in enumerate(strings):
                fh.write(f"[{i}] {s}\n")
        print(f"wrote {count} strings to {a.out}")

    rx = re.compile(a.grep, re.I) if a.grep else None
    shown = 0
    for i, s in enumerate(strings):
        if rx and not rx.search(s):
            continue
        print(f"[{i}] {s}")
        shown += 1
        if a.limit and shown >= a.limit:
            break
    if not a.out and rx:
        print(f"({shown} matching entries)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
