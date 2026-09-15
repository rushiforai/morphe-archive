#!/usr/bin/env python3
"""Stage a release without modifying main."""

import argparse
import datetime
import json
import re
import subprocess
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def run(*args, **kw):
    return subprocess.run(
        args, cwd=ROOT, text=True, check=True, stdout=subprocess.PIPE, **kw
    ).stdout.strip()


def die(msg):
    raise SystemExit("❌ " + msg)


def main():
    p = argparse.ArgumentParser()
    p.add_argument("version")
    a = p.parse_args()
    v = a.version
    if not re.fullmatch(r"\d+\.\d+\.\d+", v):
        die(f"Version must be X.Y.Z (got '{v}')")
    if run("git", "branch", "--show-current") == "main":
        die("Release staging must run on a release branch, not main")
    if run("git", "rev-parse", "--is-shallow-repository") != "false":
        die(
            "Release staging requires complete history; unshallow and synchronize tags first"
        )
    main_head = subprocess.run(
        ["git", "rev-parse", "--verify", "--quiet", "origin/main"],
        cwd=ROOT,
        text=True,
        stdout=subprocess.PIPE,
    ).stdout.strip()
    if not main_head:
        die("origin/main is unknown; fetch origin first")
    if subprocess.run(
        ["git", "merge-base", "--is-ancestor", main_head, "HEAD"], cwd=ROOT
    ).returncode:
        die("HEAD is not based on origin/main; sync with origin/main first")
    if run("git", "status", "--porcelain"):
        die("Working tree is dirty")
    if (
        subprocess.run(
            ["git", "rev-parse", f"v{v}"],
            cwd=ROOT,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        ).returncode
        == 0
    ):
        die(f"Tag v{v} already exists")
    repo = subprocess.run(
        ["gh", "repo", "view", "--json", "nameWithOwner", "-q", ".nameWithOwner"],
        cwd=ROOT,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.DEVNULL,
    ).stdout.strip() or re.sub(
        r".*github\.com[:/]([^/]+/[^/]+?)(?:\.git)?$",
        r"\1",
        run("git", "remote", "get-url", "origin"),
    )
    changelog = ROOT / "CHANGELOG.md"
    text = changelog.read_text()
    lines = text.splitlines()
    unreleased = (
        lines.index("## Unreleased")
        if lines.count("## Unreleased") == 1
        else die("CHANGELOG.md must have exactly one '## Unreleased' section")
    )
    headings = []
    for i, line in enumerate(lines):
        m = re.fullmatch(
            r"##\s+(?:\[(\d+\.\d+\.\d+)\]\(([^)]*)\)|(\d+\.\d+\.\d+))\s+\(\d{4}-\d{2}-\d{2}\)",
            line,
        )
        if m:
            headings.append((m.group(1) or m.group(3), m.group(2)))
    if not any(x.startswith("* ") for x in lines[unreleased + 1 :]):
        die("## Unreleased has no '*' bullets — add the app patch changes first")
    prev = headings[0][0] if headings else ""
    if prev and tuple(map(int, v.split("."))) <= tuple(map(int, prev.split("."))):
        die(f"Version {v} must be greater than {prev}")
    if prev:
        label = f"[{v}](https://github.com/{repo}/compare/v{prev}...v{v})"
    else:
        label = v
    changelog.write_text(
        text.replace(
            "## Unreleased",
            "## Unreleased\n\n## " + label + f" ({datetime.date.today()})",
            1,
        )
    )
    props = ROOT / "gradle.properties"
    props.write_text(
        re.sub(
            r"^version\s*=.*$", f"version = {v}", props.read_text(), flags=re.MULTILINE
        )
    )
    run("./gradlew", "generatePatchesList", "--no-daemon")
    data = json.loads((ROOT / "patches-list.json").read_text())
    data["version"] = v
    (ROOT / "patches-list.json").write_text(json.dumps(data, indent=2) + "\n")
    run(
        "python3",
        "scripts/generate_patches_readme.py",
        repo,
        "main",
        "patches-list.json",
        "README.md",
    )
    with tempfile.NamedTemporaryFile() as notes_file:
        run(
            "python3",
            "scripts/extract_release_notes.py",
            "CHANGELOG.md",
            v,
            notes_file.name,
            repo,
        )
        notes = Path(notes_file.name).read_text()
    manifest = {
        "created_at": datetime.datetime.now(datetime.timezone.utc).strftime(
            "%Y-%m-%dT%H:%M:%S"
        ),
        "description": notes.strip(),
        "download_url": f"https://github.com/{repo}/releases/download/v{v}/patches-{v}.mpp",
        "signature_download_url": "",
        "version": v,
    }
    (ROOT / "patches-bundle.json").write_text(json.dumps(manifest, indent=2) + "\n")
    run(
        "git",
        "add",
        "gradle.properties",
        "CHANGELOG.md",
        "patches-list.json",
        "README.md",
        "patches-bundle.json",
    )
    run("git", "commit", "-m", f"chore(release): release v{v}")
    print(f"✅ Staged v{v}.")


if __name__ == "__main__":
    main()
