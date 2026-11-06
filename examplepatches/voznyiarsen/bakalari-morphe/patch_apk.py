#!/usr/bin/env python3
"""
patch_apk.py — Patch cz.bakalari.mobile libapp.so to block ad-serving CDN URLs.

Replaces ad-serving domain names with 'localhost' followed by null bytes,
causing all ad requests to fail silently.

Patch offsets were determined by reverse engineering libapp.so (arm64-v8a)
with radare2. Only the domain name portion of each URL is replaced — the
'https://' prefix is preserved intact.
"""

import sys
import os


# Ad-serving URLs and their offsets in libapp.so (arm64-v8a)
# Offsets point to the start of the domain name (after 'https://')
PATCHES = [
    (0x0007d02a, "campaign.bakalari.cz", "campaign.bakalari.cz"),
    (0x0023e3c6, "campaign-dev.bakalari.cz", "campaign-dev.bakalari.cz"),
    (0x00079dd6, "netglade.cz", "netglade.cz"),
    (0x001b0c70, "netglade.cz", "netglade.cz"),
]


def validate_so(path):
    """Verify the libapp.so file contains expected ad URLs."""
    with open(path, 'rb') as f:
        data = f.read()

    found = 0
    for offset, domain, original in PATCHES:
        f.seek(offset)
        chunk = f.read(len(original))
        if chunk == original.encode():
            print(f"[OK] Found {domain} at 0x{offset:08x}")
            found += 1
        else:
            print(f"[WARN] {domain} NOT found at 0x{offset:08x}")

    return found == len(PATCHES)


def patch_so(input_path, output_path):
    """Patch libapp.so by replacing ad domain names with localhost + null bytes."""
    with open(input_path, 'rb') as f:
        data = bytearray(f.read())

    for offset, domain, original in PATCHES:
        # Verify the original domain string is at this offset
        actual = data[offset:offset + len(domain)]
        if actual != domain.encode():
            print(f"[ERROR] Mismatch at 0x{offset:08x}: "
                  f"expected {domain!r}, got {actual!r}")
            return False

        # Replace domain with 'localhost' + null bytes (keep same length)
        replacement = b'localhost' + b'\x00' * (len(domain) - len('localhost'))
        data[offset:offset + len(domain)] = replacement

        print(f"[OK] Patched {domain} -> localhost at 0x{offset:08x}")

    with open(output_path, 'wb') as f:
        f.write(data)

    print(f"\n[OK] Patched library written to {output_path}")
    return True


def main():
    if len(sys.argv) != 3:
        print(f"Usage: {sys.argv[0]} <input_libapp.so> <output_libapp.so>")
        sys.exit(1)

    input_path = sys.argv[1]
    output_path = sys.argv[2]

    if not os.path.exists(input_path):
        print(f"[ERROR] Input file not found: {input_path}")
        sys.exit(1)

    print(f"[*] Validating {input_path}...")
    if not validate_so(input_path):
        print("[ERROR] Validation failed. Aborting.")
        sys.exit(1)

    print(f"[*] Patching {input_path} -> {output_path}...")
    if not patch_so(input_path, output_path):
        print("[ERROR] Patch failed.")
        sys.exit(1)

    print("[*] Done!")


if __name__ == "__main__":
    main()
