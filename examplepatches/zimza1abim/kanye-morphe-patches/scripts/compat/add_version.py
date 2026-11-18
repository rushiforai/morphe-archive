"""Append a version to a `*_VERSIONS = listOf(...)` block and keep the newest three.

Versions are appended in release order, so the tail of the list is the newest:
trimming to the last three needs no version parsing. Prints `added` or `present`.

With `--check`, print `present` or `absent` and never write. The compatibility
workflow uses that to skip a release the repository already supports, without
relying on a branch-scoped cache to remember previous checks.
"""
import pathlib
import re
import sys

KEEP = 3  # Callers pass the newest release; the tail is the newest, so an older version would evict a newer one.


def main():
    args = sys.argv[1:]
    check_only = "--check" in args
    args = [arg for arg in args if arg != "--check"]
    if len(args) != 2:
        raise SystemExit("usage: add_version.py [--check] <versions-file> <version>")
    path = pathlib.Path(args[0])
    version = args[1]
    if not re.fullmatch(r"[0-9][0-9.]*", version):
        raise SystemExit(f"Unexpected version: {version}")
    source = path.read_text()
    block = re.search(r"(_VERSIONS = listOf\(\n)(.*?)(\n\))", source, re.S)
    if block is None:
        raise SystemExit(f"No *_VERSIONS = listOf(...) block in {path}")
    versions = re.findall(r'"([^"]+)"', block.group(2))
    if f'"{version}"' in block.group(2):
        print("present")
        return
    if check_only:
        print("absent")
        return
    body = "\n".join(f'    "{v}",' for v in (versions + [version])[-KEEP:])
    path.write_text(source[:block.start(2)] + body + source[block.end(2):])
    print("added")


if __name__ == "__main__":
    main()
