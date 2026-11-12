#!/usr/bin/env python3
"""
Makes sure every commit that causes a release says which app it is for.

    check-commit-subjects.py <git revision range>      e.g.  origin/main..HEAD

Morphe Manager decides whether to flag YouTube or Reddit as "has new patches" by
reading this repository's CHANGELOG.md, which is generated from commit subjects. An
entry only counts for an app if it names it: either as the scope,

    fix(YouTube - Duet reminders): Keep the tab above the mini player
    feat(Reddit): Add a quiet hours setting

or, for a change to code both apps share, in a subject that names both:

    fix: Tab overlaps the navigation bar in YouTube and Reddit

A releasing commit that names neither produces a release nobody is told about.
Commits that do not release anything (chore, docs, ci, test, refactor, style, build)
are not checked.
"""
import re
import subprocess
import sys

RELEASING = {"feat", "fix", "perf", "bump"}
APPS = ("YouTube", "Reddit")


def names_an_app(scope, subject):
    if scope:
        first = scope.split(" - ")[0].strip().lower()
        if first in (app.lower() for app in APPS):
            return True
    return any(re.search(r"\b" + app + r"\b", subject, re.IGNORECASE) for app in APPS)


def main():
    if len(sys.argv) != 2:
        print(__doc__)
        return 2
    log = subprocess.run(["git", "log", "--no-merges", "--format=%h%x09%s", sys.argv[1]],
                         capture_output=True, text=True, check=True).stdout
    problems = []
    for line in filter(None, log.split("\n")):
        sha, subject = line.split("\t", 1)
        parsed = re.match(r"^(\w+)(?:\(([^)]*)\))?(!)?: (.+)$", subject)
        if not parsed:
            continue
        kind, scope, _, text = parsed.groups()
        if kind in RELEASING and not names_an_app(scope, text):
            problems.append(f"  {sha}  {subject}")
        if kind in RELEASING and re.match(r"add(ed)? experimental support for", text, re.IGNORECASE):
            problems.append(f"  {sha}  {subject}   (Morphe Manager ignores entries that start like this)")
    if problems:
        print("These commits would be released without telling Morphe Manager which app changed:")
        print("\n".join(problems))
        print("\nName the app as the scope, e.g. fix(YouTube - Duet reminders): ..., or name both apps")
        print("in the subject, e.g. fix: ... in YouTube and Reddit. See docs/MAINTENANCE.md.")
        return 1
    print("Commit subjects are fine.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
