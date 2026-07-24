"""
Generates README.md listing every repo in repos.txt.
Run after fetch_org_repos.py / discover_github_wide.py so the README
always reflects the current contents of repos.txt.
"""

import os
import urllib.parse
from datetime import datetime, timezone

from add_repos_to_bundles import parse_repo_ref, resolve_branch

REPOS_FILE = os.environ.get("OUTPUT_FILE", "repos.txt")
README_FILE = os.environ.get("README_FILE", "README.md")
VALIDATE_BUNDLES = os.environ.get("VALIDATE_BUNDLES", "1").lower() not in ("0", "false", "no")


def load_repos(path):
    if not os.path.exists(path):
        return []
    with open(path, encoding="utf-8") as f:
        return sorted(
            (line.strip() for line in f if line.strip() and not line.strip().startswith("#")),
            key=str.lower,
        )


def parse_readme_repo_ref(repo):
    repo = repo.strip().rstrip("/")
    if repo.startswith(("http://", "https://")):
        parsed = urllib.parse.urlparse(repo)
        host = parsed.netloc.lower()
        path = parsed.path.strip("/")
    else:
        parts = repo.split("/", 1)
        if len(parts) == 2 and parts[0].lower() in ("github.com", "gitlab.com"):
            host = parts[0].lower()
            path = parts[1].strip("/")
        else:
            host = "github.com"
            path = repo

    return host, path.removesuffix(".git").strip("/")


def repo_web_url(repo):
    host, path = parse_readme_repo_ref(repo)
    return f"https://{host}/{path}"


def morphe_add_url(repo):
    host, path = parse_readme_repo_ref(repo)
    if host == "gitlab.com":
        return f"https://morphe.software/add-source?gitlab={path}"
    return f"https://morphe.software/add-source?github={path}"


def filter_valid_repos(repos):
    if not VALIDATE_BUNDLES:
        return repos, []

    valid = []
    invalid = []
    for repo in repos:
        repo_ref = parse_repo_ref(repo)
        branch = resolve_branch(repo_ref)
        if branch:
            valid.append(repo)
        else:
            invalid.append(repo)
    return valid, invalid


def build_readme(repos, invalid_repos=None):
    invalid_repos = invalid_repos or []
    now = datetime.now(timezone.utc).strftime("%Y-%m-%d %H:%M UTC")
    count = len(repos)

    lines = []
    lines.append("# Morphe Patch Source Repositories")
    lines.append("")
    lines.append(
        "An auto-generated, continuously updated index of every GitHub or GitLab repository "
        "that publishes a [Morphe](https://morphe.software) (`.mpp`) patch bundle."
    )
    lines.append("")
    lines.append(
        f"![Repos tracked](https://img.shields.io/badge/repos%20tracked-{count}-6366f1)"
        " "
        f"![Last updated](https://img.shields.io/badge/last%20updated-{now.replace(' ', '%20')}-555)"
    )
    lines.append("")
    lines.append("---")
    lines.append("")
    lines.append("## How this list is built")
    lines.append("")
    lines.append("This repo list is kept in [`repos.txt`](./repos.txt) and assembled from three sources:")
    lines.append("")
    lines.append(
        "1. **Registry scan** - crawling [`Jman-Github/ReVanced-Patch-Bundles`]"
        "(https://github.com/Jman-Github/ReVanced-Patch-Bundles) and extracting the source repo "
        "behind every bundle that passes the Morphe (`.mpp`) filter."
    )
    lines.append(
        "2. **GitHub-wide search** - scanning all of GitHub for `patches-bundle.json` files "
        "and verifying each candidate bundle JSON has an actual `.mpp` reference."
    )
    lines.append(
        "3. **Manual additions** - anything listed in [`custom_repos.txt`](./custom_repos.txt)."
    )
    lines.append("")
    lines.append(
        "Repos are never silently removed when a source goes quiet - add an entry to "
        "[`ignore_repos.txt`](./ignore_repos.txt) to intentionally drop one."
    )
    lines.append("")
    lines.append(
        "README and settings output include only repos whose `patches-bundle.json` is reachable "
        "and contains a real `.mpp` reference."
    )
    lines.append("")
    lines.append("---")
    lines.append("")
    lines.append("## Website")
    lines.append("")
    lines.append(
        "Browse the archive, search supported apps, and add sources from the GitHub Pages site: "
        "[Morphe Archive](https://rushiforai.github.io/morphe-archive/)."
    )
    lines.append("")
    lines.append("---")
    lines.append("")
    lines.append("## Manager Config")
    lines.append("")
    lines.append(
        "The latest `morphe_archive_config_vN.json` file is a Morphe Manager settings export "
        "with the valid bundle sources already added."
    )
    lines.append("")
    lines.append("To import it:")
    lines.append("")
    lines.append("1. Open Morphe Manager.")
    lines.append("2. Go to **Settings**.")
    lines.append("3. Open **System**.")
    lines.append("4. Open **Morphe Settings**.")
    lines.append("5. Choose **Import**.")
    lines.append("6. Select the `morphe_archive_config_vN.json` file.")
    lines.append("7. Choose **Replace existing** when prompted.")
    lines.append("")
    lines.append("---")
    lines.append("")
    lines.append("## Disclaimer")
    lines.append("")
    lines.append(
        "Use this archive at your own risk. I do not verify every repository listed here, "
        "and I am not responsible for any patch, patch failure, account ban, device issue, "
        "data loss, or other side effect caused by using these sources. This repository only "
        "gathers possible Morphe patch sources; deciding whether to use any source or patch is "
        "your responsibility."
    )
    lines.append("")
    lines.append("---")
    lines.append("")
    lines.append(f"## Tracked Repositories ({count})")
    lines.append("")
    lines.append("| # | Repository | Source | Morphe |")
    lines.append("|---|------------|--------|--------|")

    for i, repo in enumerate(repos, start=1):
        lines.append(
            f"| {i} | `{repo}` | [Open]({repo_web_url(repo)}) | "
            f"[Add Source]({morphe_add_url(repo)}) |"
        )

    lines.append("")
    lines.append("---")
    lines.append("")
    lines.append("## Updating")
    lines.append("")
    lines.append("This README is regenerated automatically by GitHub Actions whenever `repos.txt` changes.")
    lines.append(
        "To add a repo manually, append it to `custom_repos.txt`. "
        "To remove one permanently, add it to `ignore_repos.txt`."
    )
    lines.append("Use `owner/repo` for GitHub, or `gitlab.com/group/project` for GitLab.")
    if invalid_repos:
        lines.append("")
        lines.append(
            f"{len(invalid_repos)} approved repo entries were hidden because their bundle "
            "URL is currently invalid."
        )
    lines.append("")
    lines.append(f"*Last generated: {now}*")
    lines.append("")

    return "\n".join(lines)


def main():
    repos = load_repos(REPOS_FILE)
    valid_repos, invalid_repos = filter_valid_repos(repos)
    readme = build_readme(valid_repos, invalid_repos)

    with open(README_FILE, "w", encoding="utf-8") as f:
        f.write(readme)

    print(f"Wrote {README_FILE} with {len(valid_repos)} valid repos.")
    if invalid_repos:
        print(f"Hidden {len(invalid_repos)} invalid repos from README:")
        for repo in invalid_repos:
            print(f"  - {repo}")


if __name__ == "__main__":
    main()
