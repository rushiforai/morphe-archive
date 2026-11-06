#!/usr/bin/env python3
"""
repack_apk.py — Repack patched libapp.so back into the APK.
"""

import sys
import os
import zipfile


def repack_apk(apk_path, patched_so_path, output_apk_path):
    """Repack the APK with the patched libapp.so."""
    if not os.path.exists(apk_path):
        print(f"[ERROR] APK not found: {apk_path}")
        return False

    if not os.path.exists(patched_so_path):
        print(f"[ERROR] Patched .so not found: {patched_so_path}")
        return False

    with zipfile.ZipFile(apk_path, 'r') as zin:
        items = zin.infolist()
        data = [zin.read(item) for item in items]

    with zipfile.ZipFile(output_apk_path, 'w', zipfile.ZIP_DEFLATED) as zout:
        for item, item_data in zip(items, data):
            if item.filename == 'lib/arm64-v8a/libapp.so':
                with open(patched_so_path, 'rb') as f:
                    zout.writestr(item, f.read())
                print(f"[OK] Replaced lib/arm64-v8a/libapp.so")
            else:
                zout.writestr(item, item_data)

    print(f"[OK] Repacked APK written to {output_apk_path}")
    return True


def main():
    if len(sys.argv) != 4:
        print(f"Usage: {sys.argv[0]} <input.apk> <patched_libapp.so> <output.apk>")
        sys.exit(1)

    apk_path = sys.argv[1]
    patched_so_path = sys.argv[2]
    output_apk_path = sys.argv[3]

    if not repack_apk(apk_path, patched_so_path, output_apk_path):
        sys.exit(1)


if __name__ == "__main__":
    main()
