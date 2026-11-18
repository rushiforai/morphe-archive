#!/usr/bin/env python3
"""Custom release-notes generator for semantic-release.

Wired through @semantic-release/exec's generateNotesCmd; whatever this script
prints to stdout becomes the release body, the tag notes and the CHANGELOG.md
entry. The commit range is passed by the releaserc via lodash templates:

    python3 .github/scripts/release_notes.py "${lastRelease.gitTag}" "${nextRelease.version}"

Edit CONFIG to add/delete/reword sections without touching the logic below.
"""
import os
import re
import subprocess
import sys
from datetime import date

REPO_SLUG = os.environ.get("GITHUB_REPOSITORY") or "vippium/brokenn-patches"
COMMIT_URL = f"https://github.com/{REPO_SLUG}/commit/{{hash}}"

CONFIG = {
    # Rendered sections, in order. Keys are conventional commit types.
    "sections": [
        ("feat", "✨ New Features"),
        ("perf", "🔧 Improvements"),
        ("fix", "🐛 Bug Fixes"),
        ("bump", "🚀 Updated App Support"),
    ],
    # Commit types that never render.
    "hidden_types": {"build", "chore", "docs", "ci", "test", "refactor", "style"},
    # Per-commit overrides, first match wins. "match" is a regex on the subject.
    #   section  -> render under this section key regardless of the commit type
    #   label    -> bullet prefix "<label>: " (e.g. "jiohotstar/Patch Name")
    #   subject  -> reword the bullet text
    #   drop     -> remove the commit from the notes entirely
    "rewrites": [
        {
            "match": r"drop home chatgpt suggestion tray at the dispatcher",
            "section": "fix",
            "label": "jiohotstar/Remove ChatGPT Voice Assistant",
        },
        {
            "match": r"^null only the ChatGPT suggestion tray",
            "drop": True,
        },
        {
            "match": r"disable secure window flags",
            "label": "jiohotstar/Enable screenshots",
        },
        {
            "match": r"make the ask-pill click inert",
            "drop": True,
        },
        {
            # Intermediate fix for the tray approach that was reverted and
            # reimplemented at the dispatcher; noise in consolidated notes.
            "match": r"^correct tray empty-list branch",
            "drop": True,
        },
        {
            "match": r"^add hide watch page elements patch",
            "scope": "jiohotstar",
            "subject": "add `hide watch page elements` patch",
        },
        {
            "match": r"^add player button hiding options",
            "scope": "jiohotstar",
            "subject": "add `player button hiding` options",
        },
        {
            # Superseded follow-up to the player button hiding options; not
            # worth its own bullet in the consolidated notes.
            "match": r"^make player button hiding universal",
            "drop": True,
        },
    ],
    # Subjects (regex, case-insensitive) dropped from the notes entirely.
    "drop_patterns": [],
    # Extra markdown: inserted after the heading / appended after the sections.
    "prepend_notes": "",
    "append_notes": "",
}

SUBJECT_RE = re.compile(r"^(?P<type>\w+)(?:\((?P<scope>[^)]+)\))?(?P<bang>!)?: (?P<subject>.+)$")
REVERT_RE = re.compile(r'^Revert "(?P<inner>.+)"')


def git(*args):
    return subprocess.run(
        ["git", *args], capture_output=True, text=True, check=True
    ).stdout


def parse_commits(commit_lines):
    """Parse `git log` records into dicts with type/scope/subject/hash."""
    commits = []
    for record in commit_lines:
        record = record.strip("\n")
        if not record:
            continue
        fields = record.split("\x1f")
        if len(fields) < 2:
            continue
        full_hash, subject, body = fields[0], fields[1], fields[2] if len(fields) > 2 else ""
        inner = REVERT_RE.match(subject)
        source = inner.group("inner") if inner else subject
        match = SUBJECT_RE.match(source)
        if match:
            commit = {
                "type": match.group("type"),
                "scope": match.group("scope"),
                "subject": match.group("subject").strip(),
                "hash": full_hash,
                "is_revert": bool(inner),
            }
        else:
            # Not a conventional subject: keep it only if nothing else claims it.
            commit = {
                "type": None,
                "scope": None,
                "subject": subject.strip(),
                "hash": full_hash,
                "is_revert": bool(inner),
            }
        commit["breaking"] = "BREAKING CHANGE:" in body
        commits.append(commit)
    return commits


def apply_rewrites(commit):
    """Return (section, label, subject, scope) or None to drop the commit."""
    for rule in CONFIG["rewrites"]:
        if re.search(rule["match"], commit["subject"], re.I):
            if rule.get("drop"):
                return None
            return (
                rule.get("section"),
                rule.get("label"),
                rule.get("subject", commit["subject"]),
                rule.get("scope"),
            )
    return (None, None, commit["subject"], None)


def commit_scope(hash_, commits):
    for c in commits:
        if c["hash"] == hash_:
            return c["scope"]
    return None


def commit_is_revert(hash_, commits):
    for c in commits:
        if c["hash"] == hash_:
            return c["is_revert"]
    return False


def render(commits, from_tag, version):
    cfg = CONFIG
    breaking = [c for c in commits if c["breaking"]]
    groups = {key: [] for key, _ in cfg["sections"]}
    for commit in commits:
        rewritten = apply_rewrites(commit)
        if rewritten is None:
            continue
        section, label, subject, scope_override = rewritten
        # Explicit section overrides win over the commit's own type and the hidden list.
        effective_type = section or commit["type"]
        if effective_type is None or effective_type in cfg["hidden_types"]:
            continue
        if effective_type not in groups:
            continue
        groups[effective_type].append((label, subject, commit["hash"], scope_override))

    if from_tag:
        compare = f"https://github.com/{REPO_SLUG}/compare/{from_tag}...v{version}"
    else:
        compare = f"https://github.com/{REPO_SLUG}/commits/v{version}"
    lines = [f"## [{version}]({compare}) ({date.today().isoformat()})"]

    if cfg["prepend_notes"]:
        lines.extend(["", cfg["prepend_notes"]])

    if breaking:
        lines.extend(["", "### ⚠️ BREAKING CHANGES"])
        lines.extend(f"* {c['subject']}" for c in breaking)

    for key, header in cfg["sections"]:
        items = groups[key]
        if not items:
            continue
        lines.extend(["", f"### {header}"])
        for label, subject, hash_, scope_override in items:
            own_scope = commit_scope(hash_, commits)
            shown_scope = scope_override or own_scope
            prefix = f"**{label}:** " if label else (f"**{shown_scope}:** " if shown_scope else "")
            revert = "Revert " if commit_is_revert(hash_, commits) else ""
            link = f"[{hash_[:7]}]({COMMIT_URL.format(hash=hash_)})"
            lines.append(f"* {revert}{prefix}{subject} ({link})")

    if cfg["append_notes"]:
        lines.extend(["", cfg["append_notes"]])

    return "\n".join(lines).strip() + "\n"


def main():
    from_tag = sys.argv[1] if len(sys.argv) > 1 else ""
    version = sys.argv[2] if len(sys.argv) > 2 else "0.0.0"
    to_rev = sys.argv[3] if len(sys.argv) > 3 else "HEAD"
    if from_tag in ("", "undefined", "None", "null"):
        from_tag = ""

    args = ["log", "--format=%H%x1f%s%x1f%b%x1e"]
    if from_tag:
        args.append(f"{from_tag}..{to_rev}")
    commit_lines = git(*args).split("\x1e")
    sys.stdout.write(render(parse_commits(commit_lines), from_tag, version))


if __name__ == "__main__":
    main()
