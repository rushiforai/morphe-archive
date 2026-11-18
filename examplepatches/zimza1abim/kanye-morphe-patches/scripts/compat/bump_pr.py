"""Collect the version bumps staged by one compatibility-check run into a single PR.

Usage: bump_pr.py <directory with <target>.json and <target>.md records>

Each passing target with a new version leaves a record; this script applies all of
them on the shared `compat/bump` branch. An open bump PR is extended instead of
opening a second one, so merging releases once however many apps were bumped.
DRY_RUN=1 skips pushing and the GitHub CLI.
"""
import json
import os
import pathlib
import subprocess
import sys

BRANCH = "compat/bump"
PREFIX = "bump: support "
DRY_RUN = os.environ.get("DRY_RUN") == "1"


def run(*args, check=True):
    try:
        result = subprocess.run(args, check=check, text=True, capture_output=True)
    except subprocess.CalledProcessError as error:
        # A failing add_version.py explains itself on stderr; a bare traceback hides it.
        if error.stderr:
            print(error.stderr.rstrip(), file=sys.stderr)
        raise
    if result.stderr.strip():
        # add_version.py warns on stderr when it skips a bump.
        print(result.stderr.rstrip(), file=sys.stderr)
    return result.stdout.strip()


def gh(*args):
    if DRY_RUN:
        print("DRY_RUN gh", *args)
        return ""
    return run("gh", *args)


def main():
    records = sorted(pathlib.Path(sys.argv[1]).glob("*.json")) if len(sys.argv) > 1 else []
    if not records:
        print("No version bumps staged.")
        return

    run("git", "config", "user.name", "github-actions[bot]")
    run("git", "config", "user.email", "41898282+github-actions[bot]@users.noreply.github.com")
    run("git", "fetch", "origin", "main")

    open_pr = json.loads(gh("pr", "list", "--head", BRANCH, "--state", "open",
                            "--json", "number,title,body") or "[]")
    open_pr = open_pr[0] if open_pr else None
    if open_pr:
        run("git", "fetch", "origin", BRANCH)
        run("git", "switch", "-C", BRANCH, f"origin/{BRANCH}")
        run("git", "merge", "--no-edit", "origin/main")
    else:
        run("git", "switch", "-C", BRANCH, "origin/main")

    added, reports = [], []
    for path in records:
        record = json.loads(path.read_text())
        state = run("python3", "-I", "scripts/compat/add_version.py",
                    record["versionsFile"], record["version"])
        if state == "added":
            added.append(f"{record['label']} {record['version']}")
            report = path.with_suffix(".md")
            reports.append(f"### {record['label']} {record['version']}\n\n" +
                           (report.read_text() if report.exists() else ""))
    if not added:
        print("Staged versions are already supported.")
        return
    # Keep each bumped app at its three newest versions, adapters included.
    removed = run("python3", "-I", "scripts/compat/prune_versions.py", *[path.stem for path in records])
    if removed:
        print(removed)

    previous = []
    if open_pr and open_pr["title"].startswith(PREFIX):
        previous = [item.strip() for item in open_pr["title"][len(PREFIX):].split(",") if item.strip()]
    title = PREFIX + ", ".join(previous + added)
    run("git", "commit", "-am", PREFIX + ", ".join(added))

    body_file = pathlib.Path(os.environ.get("RUNNER_TEMP", "/tmp")) / "bump-body.md"
    if open_pr:
        body_file.write_text((open_pr["body"] or "") + "\n\n---\n\n" + "\n\n".join(reports))
        if not DRY_RUN:
            run("git", "push", "origin", BRANCH)
        gh("pr", "edit", str(open_pr["number"]), "--title", title, "--body-file", str(body_file))
        print(f"Extended PR #{open_pr['number']}: {title}")
        number = open_pr["number"]
    else:
        body_file.write_text("\n\n".join(reports))
        if not DRY_RUN:
            # A merged or closed bump PR can leave the branch behind; start it over from main.
            run("git", "push", "--force", "origin", BRANCH)
        url = gh("pr", "create", "--base", "main", "--head", BRANCH, "--title", title, "--body-file", str(body_file))
        print(url)
        print(f"Opened: {title}")
        number = url.rstrip("/").rsplit("/", 1)[-1]
    # A PR opened with GITHUB_TOKEN starts no workflow, so run the merge gate here.
    if not DRY_RUN:
        print(run("python3", "-I", "scripts/ci/pr_gate.py", str(number)))


if __name__ == "__main__":
    main()
