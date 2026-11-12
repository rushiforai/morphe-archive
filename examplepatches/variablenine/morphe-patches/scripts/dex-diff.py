#!/usr/bin/env python3
"""
Reports what other patches did to this bundle's own classes inside a patched app.

    dex-diff.py <dexdump> <our extension dex> <patched apk> [label]

The official patches rewrite certain calls in every class of an app, ours included
(for example the YouTube theme patch wraps every text colour that is set). That is
expected and harmless as long as it is understood, so this prints each change for a
person or an agent to judge. It only fails when one of our classes is missing.
"""
import difflib
import os
import re
import subprocess
import sys
import tempfile
import zipfile


def classes(dexdump, path):
    out = subprocess.run([dexdump, "-d", path], capture_output=True, text=True, errors="replace").stdout
    result, current, lines = {}, None, []
    for line in out.split("\n"):
        start = re.match(r"\s+Class descriptor\s+: '(L[^']+;)'", line)
        if start:
            if current:
                result[current] = lines
            current, lines = start.group(1), []
            continue
        if current is None:
            continue
        if "|" in line and re.match(r"^[0-9a-f]{6}:", line):
            code = line.split("|", 1)[1]
            if code.startswith("["):
                # Method header: keep the name, drop the address.
                code = re.sub(r"^\[[0-9a-f]+\] ", "", code)
            code = re.sub(r"^[0-9a-f]{4}: ", "", code)
            code = re.sub(r" // (method|field|string|type|class|proto|call_site|method_handle)@[0-9a-f]+", "", code)
            code = re.sub(r" // [+-][0-9a-f]+", "", code)
            lines.append(code)
    if current:
        result[current] = lines
    return result


def main():
    dexdump, ours_path, apk = sys.argv[1:4]
    label = sys.argv[4] if len(sys.argv) > 4 else "app"
    ours = classes(dexdump, ours_path)
    found = {}
    with zipfile.ZipFile(apk) as archive:
        for name in archive.namelist():
            if not re.match(r"classes\d*\.dex$", name):
                continue
            with tempfile.NamedTemporaryFile(suffix=".dex", delete=False) as tmp:
                tmp.write(archive.read(name))
            try:
                for descriptor, body in classes(dexdump, tmp.name).items():
                    if descriptor in ours:
                        found[descriptor] = body
            finally:
                os.unlink(tmp.name)
    missing = sorted(set(ours) - set(found))
    changed = sorted(d for d in ours if d in found and found[d] != ours[d])
    print(f"{label}: {len(found)} of {len(ours)} of our classes are in the patched app, "
          f"{len(changed)} rewritten by other patches")
    for descriptor in changed:
        diff = [line for line in difflib.unified_diff(ours[descriptor], found[descriptor], lineterm="", n=0)
                if not line.startswith(("---", "+++", "@@"))]
        print(f"  {descriptor}")
        for line in diff[:12]:
            print(f"      {line[:160]}")
    if missing:
        print(f"PROBLEM: {label}: classes missing from the patched app: {', '.join(missing[:10])}")
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
