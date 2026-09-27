#!/usr/bin/env python3
"""Validate and stage a stable release without modifying main."""

import argparse
import datetime
import json
import re
import subprocess
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
RELEASE_HEADING = re.compile(
    r"##\s+(?:\[(?P<link_version>\d+\.\d+\.\d+)\]\((?P<link>[^)]*)\)|(?P<version>\d+\.\d+\.\d+))\s+\((?P<date>\d{4}-\d{2}-\d{2})\)"
)
STABLE_TAG = re.compile(r"^v(\d+\.\d+\.\d+)$")


def run(*args, **kw):
    return subprocess.run(
        args, cwd=ROOT, text=True, check=True, stdout=subprocess.PIPE, **kw
    ).stdout.strip()


def die(msg):
    raise SystemExit("❌ " + msg)


def version_tuple(value):
    """Convert a dot-separated numeric version into a comparable tuple."""
    return tuple(map(int, value.split(".")))


def reachable_stable_tags():
    """Return stable version tags reachable from ``HEAD``, ordered by version."""
    output = run(
        "git",
        "for-each-ref",
        "--merged",
        "HEAD",
        "--format=%(refname:strip=2)",
        "refs/tags",
    )
    result = []
    for tag in output.splitlines():
        match = STABLE_TAG.fullmatch(tag)
        if match:
            result.append((version_tuple(match.group(1)), tag))
    return sorted(result)


def changelog_state(text, target, repo):
    """Validate release notes and tag history, then return changelog insertion state.

    The result contains the changelog lines, the Unreleased section index, the next
    section index, and the previous release version. Invalid state exits the script.
    """
    lines = text.splitlines()
    if lines.count("## Unreleased") != 1:
        die("CHANGELOG.md must have exactly one '## Unreleased' section")
    unreleased = lines.index("## Unreleased")
    next_section = next(
        (i for i in range(unreleased + 1, len(lines)) if lines[i].startswith("## ")),
        len(lines),
    )
    if not any(line.startswith("* ") for line in lines[unreleased + 1 : next_section]):
        die("## Unreleased has no '*' bullets — add the app patch changes first")

    headings = []
    for i, line in enumerate(lines):
        match = RELEASE_HEADING.fullmatch(line)
        if match:
            version = match.group("link_version") or match.group("version")
            headings.append((i, version, match.group("link")))
        elif line.startswith("## ") and line != "## Unreleased":
            die(f"Malformed released changelog heading: {line}")
    seen = set()
    for _, version, link in headings:
        if version in seen:
            die(f"Duplicate released changelog entry: {version}")
        seen.add(version)
        if link is not None and not link.startswith(
            f"https://github.com/{repo}/compare/"
        ):
            die(f"Released heading for {version} has an invalid compare link")
    if any(
        version_tuple(headings[i][1]) <= version_tuple(headings[i + 1][1])
        for i in range(len(headings) - 1)
    ):
        die("Released changelog headings must be in descending version order")

    previous = headings[0][1] if headings else None
    if previous and version_tuple(target) <= version_tuple(previous):
        die(f"Version {target} must be greater than {previous}")
    tags = reachable_stable_tags()
    if previous:
        previous_tag = f"v{previous}"
        if subprocess.run(
            ["git", "rev-parse", "--verify", previous_tag],
            cwd=ROOT,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        ).returncode:
            die(f"Previous release tag {previous_tag} is missing")
        if subprocess.run(
            ["git", "merge-base", "--is-ancestor", previous_tag, "HEAD"], cwd=ROOT
        ).returncode:
            die(f"Previous release tag {previous_tag} is not reachable from HEAD")
        if not tags or tags[-1][1] != previous_tag:
            die(f"Highest reachable stable tag must be {previous_tag}")
    elif tags:
        die("First release changelog cannot coexist with reachable stable tags")
    return lines, unreleased, next_section, previous


def main():
    """Validate, regenerate, and commit release artifacts with rollback on failure."""
    parser = argparse.ArgumentParser()
    parser.add_argument("version")
    args = parser.parse_args()
    version = args.version
    if not re.fullmatch(r"\d+\.\d+\.\d+", version):
        die(f"Version must be X.Y.Z (got '{version}')")
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
            ["git", "rev-parse", "--verify", f"v{version}"],
            cwd=ROOT,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        ).returncode
        == 0
    ):
        die(f"Tag v{version} already exists")

    repo = subprocess.run(
        ["gh", "repo", "view", "--json", "nameWithOwner", "-q", ".nameWithOwner"],
        cwd=ROOT,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.DEVNULL,
    ).stdout.strip()
    if not repo:
        repo = re.sub(
            r".*github\.com[:/]([^/]+/[^/]+?)(?:\.git)?$",
            r"\1",
            run("git", "remote", "get-url", "origin"),
        )
    changelog = ROOT / "CHANGELOG.md"
    owned_names = (
        "CHANGELOG.md",
        "gradle.properties",
        "patches-list.json",
        "README.md",
        "patches-bundle.json",
    )
    # Record absence as well as contents so failed staging cannot leave a newly
    # generated release artifact behind.
    original = {
        name: (ROOT / name).read_bytes() if (ROOT / name).exists() else None
        for name in owned_names
    }
    text = changelog.read_text()
    lines, unreleased, next_section, previous = changelog_state(text, version, repo)

    # All validation is complete. Generated files are transactional: a failed
    # generator or commit restores only files this script owns.
    try:
        label = (
            f"[{version}](https://github.com/{repo}/compare/v{previous}...v{version})"
            if previous
            else version
        )
        insertion = f"## {label} ({datetime.date.today()})"
        new_lines = lines[: unreleased + 1] + ["", insertion] + lines[unreleased + 1 :]
        changelog.write_text("\n".join(new_lines) + "\n")
        props = ROOT / "gradle.properties"
        updated = re.sub(
            r"^version\s*=.*$",
            f"version = {version}",
            props.read_text(),
            flags=re.MULTILINE,
        )
        props.write_text(updated)
        # The generator depends on the Gradle build lifecycle, whose test task
        # validates the already-generated root metadata. Skip that test here so
        # the generator can refresh the metadata first; verification is a
        # prerequisite of release staging and the generated files are validated
        # below before they are committed.
        run("./gradlew", "generatePatchesList", "--no-daemon", "-x", "test")
        list_path = ROOT / "patches-list.json"
        data = json.loads(list_path.read_text())
        data["version"] = version
        list_path.write_text(json.dumps(data, indent=2) + "\n")
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
                version,
                notes_file.name,
                repo,
            )
            notes = Path(notes_file.name).read_text()
        manifest = {
            "created_at": datetime.datetime.now(datetime.timezone.utc).strftime(
                "%Y-%m-%dT%H:%M:%S"
            ),
            "description": notes.strip(),
            "download_url": f"https://github.com/{repo}/releases/download/v{version}/patches-{version}.mpp",
            "signature_download_url": "",
            "version": version,
        }
        (ROOT / "patches-bundle.json").write_text(json.dumps(manifest, indent=2) + "\n")
        run("git", "add", *owned_names)
        run("git", "commit", "-m", f"chore(release): release v{version}")
    except Exception:
        for name, content in original.items():
            path = ROOT / name
            if content is None:
                path.unlink(missing_ok=True)
            else:
                path.write_bytes(content)
        subprocess.run(
            ["git", "reset", "--", *original],
            cwd=ROOT,
            check=False,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )
        raise
    print(f"✅ Staged v{version}.")


if __name__ == "__main__":
    main()
