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
        ("change", "♻️ Refactored"),
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
            "match": r"^require the settings patch for runtime-controlled hiding",
            "drop": True,
        },
        {
            "match": r"^route the back arrow through the restart prompt",
            "drop": True,
        },
        {
            "match": r"^drive player button hiding and watch page tabs from runtime settings",
            "drop": True,
        },
        {
            "match": r"^restart prompt on leave and toggle haptics",
            "drop": True,
        },
        {
            "match": r"^ripple press feedback, about copy, double\-tap haptic",
            "drop": True,
        },
        {
            "match": r"^lock brokenn settings to portrait",
            "drop": True,
        },
        {
            "match": r"^full process restart via foreground launch then exit",
            "drop": True,
        },
        {
            "match": r"^feed filter requires exact title match",
            "drop": True,
        },
        {
            "match": r"^move feed filter hook to the live tray assembler",
            "drop": True,
        },
        {
            "match": r"^edge\-to\-edge ripples clipped by opaque card outline",
            "drop": True,
        },
        {
            "match": r"^resolve page font via typeface\.default",
            "drop": True,
        },
        {
            "match": r"^revert to system font on settings page",
            "drop": True,
        },
        {
            "match": r"^use embedded inter font with system font fallback",
            "drop": True,
        },
        {
            "match": r"^restart via foreground task relaunch for android 15",
            "drop": True,
        },
        {
            "match": r"^clearer labels and crisp double\-tap haptic",
            "drop": True,
        },
        {
            "match": r"^full\-width ripples, native restart dialog, single copy toast",
            "drop": True,
        },
        {
            "match": r"^generic title walk for feed tray filter",
            "drop": True,
        },
        {
            "match": r"^match tray hook descriptors to extension signatures",
            "drop": True,
        },
        {
            "match": r"^filter tray titles on the merged feed widget list",
            "drop": True,
        },
        {
            "match": r"^revert header animation and merge the tray filter",
            "drop": True,
        },
        {
            "match": r"^wordmark in content with fading pinned header",
            "drop": True,
        },
        {
            "match": r"^centered wordmark header that compacts on scroll",
            "drop": True,
        },
        {
            "match": r"^scroll\-morphing header and trailing divider cleanup",
            "drop": True,
        },
        {
            "match": r"^flatten feed filter row and rename about labels",
            "drop": True,
        },
        {
            "match": r"^feed filter dialog and drop the for\-you tab gesture",
            "drop": True,
        },
        {
            "match": r"^open settings via double\-tap on the For You tab",
            "drop": True,
        },
        {
            "match": r"^add gear tab to the top bar after For You",
            "drop": True,
        },
        {
            "match": r"^hide home feed shelves by title",
            "drop": True,
        },
        {
            "match": r"^restore widget\-type constants lost in the settings merge",
            "drop": True,
        },
        {
            "match": r"^guard nextInstructionIndex against int overflow",
            "drop": True,
        },
        {
            "match": r"^flatten header expand/collapse to remove tab\-switch push",
            "drop": True,
        },
        {
            "match": r"^match top bar animated height to 25f static height",
            "drop": True,
        },
        {
            "match": r"^drop trailing dividers and update home placeholder",
            "drop": True,
        },
        {
            "match": r"^collapse cards by default and animate siblings",
            "drop": True,
        },
        {
            "match": r"^collapse feature cards and pin settings app bar",
            "drop": True,
        },
        {
            "match": r"^restyle settings to grouped morphe style cards",
            "drop": True,
        },
        {
            "match": r"^draw settings gradient via linear shader",
            "drop": True,
        },
        {
            "match": r"^use half screen vertical gradient sheet on settings",
            "drop": True,
        },
        {
            "match": r"^fade ambient glow radially and soften glass cards",
            "drop": True,
        },
        {
            "match": r"^make settings cards translucent glass style",
            "drop": True,
        },
        {
            "match": r"^add jiohotstar style ambient gradient to settings",
            "drop": True,
        },
        {
            "match": r"^shrink cross and check glyph size",
            "drop": True,
        },
        {
            "match": r"^shrink check cross buttons",
            "drop": True,
        },
        {
            "match": r"^replace toggles with animated check cross buttons",
            "drop": True,
        },
        {
            "match": r"^revert toggles to google style without icons",
            "drop": True,
        },
        {
            "match": r"^swap toggle icon cleanly and sync animation timing",
            "drop": True,
        },
        {
            "match": r"^use fixed size for toggle icons",
            "drop": True,
        },
        {
            "match": r"^stabilize toggle animation and center icons",
            "drop": True,
        },
        {
            "match": r"^restyle toggles as google expressive switches",
            "drop": True,
        },
        {
            "match": r"^replace switches with drawn material style toggles",
            "drop": True,
        },
        {
            "match": r"^shrink chevron and bump accordion label size",
            "drop": True,
        },
        {
            "match": r"^reduce header top padding and bump wordmark",
            "drop": True,
        },
        {
            "match": r"^draw accordion chevrons as vector with rotation",
            "drop": True,
        },
        {
            "match": r"^correct wordmark spelling to brokenn",
            "drop": True,
        },
        {
            "match": r"^bump brokenn wordmark",
            "drop": True,
        },
        {
            "match": r"^intro script heavy wordmark with header divider",
            "drop": True,
        },
        {
            "match": r"^use inter for settings and simplify brand wordmark",
            "drop": True,
        },
        {
            "match": r"^render brokenn wordmark in intro script font",
            "drop": True,
        },
        {
            "match": r"^split settings into white smallcaps line under brand",
            "drop": True,
        },
        {
            "match": r"^center header row with flower emoji and swapped sizes",
            "drop": True,
        },
        {
            "match": r"^animate sibling cards during accordion changes",
            "drop": True,
        },
        {
            "match": r"^use thin chevron glyphs for accordion arrows",
            "drop": True,
        },
        {
            "match": r"^animate accordions and space out accordion cards",
            "drop": True,
        },
        {
            "match": r"^nest feature accordions under home and watch page sections",
            "drop": True,
        },
        {
            "match": r"^group toggles into watch page and home feed accordions",
            "drop": True,
        },
        {
            "match": r"^move about last with app and patches versions",
            "drop": True,
        },
        {
            "match": r"^add collapsible sections with settings toggles",
            "drop": True,
        },
        {
            "match": r"^add top spacing to brokenn settings header",
            "drop": True,
        },
        {
            "match": r"^restyle settings header to match brokenn branding",
            "drop": True,
        },
        {
            "match": r"^set brokenn settings double\-tap window to 200ms",
            "drop": True,
        },
        {
            "match": r"^tighten double\-tap to 50ms and polish settings screen",
            "drop": True,
        },
        {
            "match": r"^add brokenn settings page via double-tap on home",
            "label": "jiohotstar/brokenn settings",
            "subject": "add a hidden settings page with runtime toggles",
        },
        {
            "match": r"^open brokenn settings on (home long press|profile double tap)",
            "section": "change",
            "label": "jiohotstar/brokenn settings",
            "subject": "move settings access from the Home tab to the My Space tab",
        },
        {
            "match": r"^split feed filter into standalone patch",
            "label": "jiohotstar/feed filter",
            "subject": "add `Feed filter` patch that removes home feed trays by title",
        },
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
            "match": r"^update morphe-gradle-plugin to",
            "section": "perf",
            "label": "dependencies",
            "subject": "update morphe-gradle-plugin to 2.1.1",
        },
        {
            "match": r"^update morphe-patcher to",
            "section": "perf",
            "label": "dependencies",
        },
        {
            "match": r"^keep the premium badge off other users",
            "label": "octogram/unlock premium",
            "subject": "stop showing the premium badge on non-premium users",
        },
        {
            "match": r"^hide the notification popup",
            "label": "jiohotstar",
            "subject": "add `Disable notification permission prompt` patch",
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
        {
            "match": r"^add `Remove ads`, `Disable update prompt`",
            "drop": True,
        },
        {
            "match": r"^declare vibrate and handle predictive back",
            "label": "jiohotstar/brokenn settings",
            "subject": "declare vibrate and handle predictive back",
        },
        {
            "match": r"^hide player top bar buttons",
            "label": "jiohotstar/hide player buttons",
            "subject": "hide the top bar buttons",
        },
        {
            "match": r"^stop painting ad markers on the seekbar",
            "label": "jiohotstar/Remove ads",
            "subject": "removed ad markers on the seekbar",
        },
        {
            "match": r"^shut every remaining voice assistant entry point",
            "section": "change",
            "label": "jiohotstar/Remove ChatGPT AI assistant",
            "subject": "refactored to cover remaining entry points",
        },
    ],
    # Subjects (regex, case-insensitive) dropped from the notes entirely.
    "drop_patterns": [],
    # Extra markdown: inserted after the heading / appended after the sections.
    "prepend_notes": "",
    "append_notes": "",
    # Version-scoped highlights, rendered right under the heading.
    "highlights": {
        "1.5.0-dev.4": """### 📦 New app support

* **picasso:** add Picasso patches""",
    },
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

    highlights = cfg["highlights"].get(version)
    if highlights:
        lines.extend(["", highlights])

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
