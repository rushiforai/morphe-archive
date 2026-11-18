"""Hold every compatibility target to its three newest supported versions.

Usage: prune_versions.py [target ...]   (default: every target in targets.json)

A target's supported versions are those in its `*_VERSIONS` block plus those with a
registered adapter (Joplin has adapters only). Everything outside the
three highest is removed: from the block, and with its adapter `.bundle`, `.properties`
and index entry. Prints `removed <target> <version>` for each version it drops.
"""
import json
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[2]
KEEP = 3  # Same support scope as add_version.py.
BLOCK = re.compile(r"(_VERSIONS = listOf\(\n)(.*?)(\n\))", re.S)
VERSION = re.compile(r"[0-9]+(?:\.[0-9]+)*")


def sort_key(version):
    return tuple(int(part) for part in version.split("."))


def prune(name, target):
    versions_file = ROOT / target["versionsFile"] if target.get("versionsFile") else None
    adapters = ROOT / pathlib.Path(target["adapterPath"]).parent if target.get("adapterPath") else None
    if not versions_file and not adapters:
        return
    supported = set()
    if versions_file:
        source = versions_file.read_text()
        block = BLOCK.search(source)
        supported |= set(re.findall(r'"([^"]+)"', block.group(2)))
    if adapters:
        # A registered adapter is a supported version too: it is built before the bump
        # that lists it, and Joplin has no block at all.
        supported |= {p.stem for p in adapters.glob("*.properties") if VERSION.fullmatch(p.stem)}
    kept = sorted(supported, key=sort_key)[-KEEP:]
    removed = supported - set(kept)

    if versions_file:
        body = "\n".join(f'    "{v}",' for v in kept)
        if body != block.group(2):
            versions_file.write_text(source[:block.start(2)] + body + source[block.end(2):])
    if adapters:
        for properties in adapters.glob("*.properties"):
            version = properties.stem
            if VERSION.fullmatch(version) and version not in kept:
                properties.unlink()
                (adapters / f"{version}.bundle").unlink(missing_ok=True)
        present = sorted((p.stem for p in adapters.glob("*.properties") if VERSION.fullmatch(p.stem)), key=sort_key)
        (adapters / "index.properties").write_text("versions=" + ",".join(present) + "\n")
    for version in sorted(removed, key=sort_key):
        print(f"removed {name} {version}")


def main():
    targets = json.loads((ROOT / "scripts/compat/targets.json").read_text())
    for name in sys.argv[1:] or targets:
        prune(name, targets[name])


if __name__ == "__main__":
    main()
