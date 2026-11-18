#!/usr/bin/env python3
"""Recover a protobuf message schema from generated smali classes.

Generated protobuf messages declare their schema as constants in the class itself:

    .field public static final RESULT_FIELD_NUMBER:I = 0x1
    .field private result_:Lcom/example/Result;

so the wire format can be read straight off the smali, with no decompiler and no
.proto file. Field numbers are printed in wire order.

Usage:
  python3 proto_fields.py 'flow_api/v1/RequestOuterClass$Request'
  python3 proto_fields.py --search Request Payload Metadata
  python3 proto_fields.py 'flow_api/v1/ResponseOuterClass$Response' --nested

Options:
  --decoded DIR   disassembly tree (default: $DECODED, else build/decoded)
  --search NAME   print every matching message class instead of one
  --nested        resolve each field's own schema, one level deep
"""
from __future__ import annotations

import argparse
import glob
import os
import re
import sys

FIELD_NUMBER = re.compile(
    r"^\.field public static final ([A-Z0-9_]+)_FIELD_NUMBER:I = (0x[0-9a-fA-F]+)"
)
PRIVATE_FIELD = re.compile(r"^\.field (?:private|public) (?:final )?([A-Za-z0-9_]+):(L[^;]+;|\[?[IJZFD])")


def decoded_root(cli_value: str | None) -> str:
    root = cli_value or os.environ.get("DECODED") or "build/decoded"
    if not os.path.isdir(root):
        sys.exit(f"error: disassembly tree not found: {root} (run scripts/decompile.sh first)")
    return root


def find_class(root: str, fragment: str) -> list[str]:
    clean = fragment.replace(".", "/")
    hits = sorted(glob.glob(f"{root}/**/{clean}.smali", recursive=True))
    if not hits:
        hits = sorted(glob.glob(f"{root}/**/*{clean}*.smali", recursive=True))
    return hits


def schema(path: str) -> tuple[list[tuple[int, str, str]], str]:
    """Return ([(number, NAME, type)], class descriptor) for one message class."""
    numbers: dict[str, int] = {}
    types: dict[str, str] = {}
    descriptor = "?"
    for line in open(path, encoding="utf-8", errors="replace"):
        if line.startswith(".class"):
            m = re.search(r"L([^;]+);", line)
            if m:
                descriptor = m.group(1)
        m = FIELD_NUMBER.match(line)
        if m:
            numbers[m.group(1).lower()] = int(m.group(2), 16)
            continue
        m = PRIVATE_FIELD.match(line)
        if m:
            types[m.group(1).rstrip("_").lower()] = m.group(2)
    fields = []
    for name, number in numbers.items():
        raw = types.get(name, "?")
        if raw.startswith("L"):
            raw = raw[1:-1]
            if raw.startswith("com/google/protobuf/") or raw.startswith("java/lang/"):
                raw = raw.rsplit("/", 1)[-1]
        fields.append((number, name.upper(), raw))
    return sorted(fields), descriptor


def print_schema(root: str, path: str, nested: bool, depth: int = 0) -> None:
    fields, descriptor = schema(path)
    pad = "  " * depth
    print(f"{pad}### {descriptor}  ({len(fields)} fields)")
    if not fields:
        print(f"{pad}    (no FIELD_NUMBER constants — not a generated message?)")
        return
    for number, name, ftype in fields:
        print(f"{pad}    {number:>2}  {name:<24} {ftype}")
    if not nested:
        return
    seen = set()
    for _number, _name, ftype in fields:
        if ftype in seen or not ftype.endswith("OuterClass$") and "$" not in ftype:
            continue
        seen.add(ftype)
        for candidate in find_class(root, ftype):
            print_schema(root, candidate, nested=False, depth=depth + 1)
            break


def main() -> int:
    ap = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter
    )
    ap.add_argument("class_name", nargs="?")
    ap.add_argument("--decoded")
    ap.add_argument("--search", nargs="*")
    ap.add_argument("--nested", action="store_true")
    a = ap.parse_args()

    root = decoded_root(a.decoded)
    targets: list[str] = []
    if a.search:
        for name in a.search:
            targets += find_class(root, name)
    elif a.class_name:
        targets = find_class(root, a.class_name)
    else:
        ap.error("give a class name or --search")

    targets = [t for t in targets if "$Builder" not in t and "$1" not in t]
    if not targets:
        print("no matching message class")
        return 1
    for path in targets[:20]:
        print_schema(root, path, a.nested)
        print()
    return 0


if __name__ == "__main__":
    sys.exit(main())
