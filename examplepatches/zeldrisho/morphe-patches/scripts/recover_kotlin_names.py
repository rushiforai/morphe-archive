#!/usr/bin/env python3
"""Recover obfuscated-to-real names from Kotlin metadata in jadx output."""

import argparse
import json
import re
from collections import defaultdict
from pathlib import Path
from urllib.parse import quote

SKIP = (
    "kotlin.",
    "kotlinx.",
    "androidx.",
    "android.",
    "java.",
    "javax.",
    "com.google.",
    "com.facebook.",
    "io.ktor.",
    "io.sentry.",
    "okhttp3.",
    "okio.",
    "com.squareup.",
    "retrofit2.",
    "dagger.",
    "org.jetbrains.",
)


def main():
    p = argparse.ArgumentParser()
    p.add_argument("source", type=Path)
    p.add_argument("output", type=Path, nargs="?")
    a = p.parse_args()
    if not a.source.is_dir():
        p.error(f"not a directory: {a.source}")
    out = a.output or a.source.parent / "mapping"
    (out / "by_package").mkdir(parents=True, exist_ok=True)
    mapping = {}
    paths = {}
    counts = defaultdict(int)
    for path in a.source.rglob("*.java"):
        obf = path.relative_to(a.source).with_suffix("").as_posix().replace("/", ".")
        if obf.startswith(SKIP):
            continue
        text = path.read_text(errors="replace")
        real = None
        m = re.search(r'@DebugMetadata\([^)]*?c\s*=\s*"([^"]+)"', text, re.DOTALL)
        if m:
            real = m.group(1).split("$", 1)[0]
            counts["debug_meta"] += 1
        if not real:
            m = re.search(r"@Metadata\([^)]*?d2\s*=\s*\{([^}]*)\}", text, re.DOTALL)
            if m:
                lm = re.search(r"L([A-Za-z][\w/$]+);", m.group(1))
                if lm and "." in lm.group(1):
                    real = lm.group(1).replace("/", ".").split("$", 1)[0]
                    counts["d2"] += 1
        if not real:
            m = re.search(r"/\*\s*renamed from:\s*([\w.$]+)\s*\*/", text)
            if m:
                real = m.group(1)
                counts["renamed"] += 1
        if real:
            mapping[obf] = real
            paths[obf] = str(path)
    (out / "mapping.tsv").write_text(
        "obf_fqn\treal_fqn\tfile\n"
        + "".join(f"{k}\t{mapping[k]}\t{paths[k]}\n" for k in sorted(mapping))
    )
    (out / "mapping.json").write_text(
        json.dumps(mapping, indent=2, sort_keys=True) + "\n"
    )
    packages = defaultdict(list)
    for obf, real in mapping.items():
        packages[real.rsplit(".", 1)[0] if "." in real else "(default)"].append(
            (real, obf, paths[obf])
        )
    for pkg, rows in packages.items():
        (
            out
            / "by_package"
            / Path(quote(pkg, safe="()") or "default").with_suffix(".txt")
        ).write_text("".join(f"{r}\t{o}\t{f}\n" for r, o, f in sorted(rows)))
    print(f"Recovered {len(mapping)} class names")
    [print(f"  via {k}: {v}") for k, v in counts.items()]
    print(
        f"Real packages: {len(packages)}\nWrote {out}/mapping.tsv, mapping.json, by_package/"
    )


if __name__ == "__main__":
    main()
