"""
Generates a polished README.md listing every repo in repos.txt.
Run after fetch_org_repos.py / discover_github_wide.py so the README
always reflects the current contents of repos.txt.
"""

import os
from datetime import datetime, timezone

REPOS_FILE = os.environ.get("OUTPUT_FILE", "repos.txt")
README_FILE = os.environ.get("README_FILE", "README.md")


def load_repos(path):
    if not os.path.exists(path):
        return []
    with open(path) as f:
        return sorted(
            (line.strip() for line in f if line.strip() and not line.strip().startswith("#")),
            key=str.lower,
        )


def build_readme(repos):
    now = datetime.now(timezone.utc).strftime("%Y-%m-%d %H:%M UTC")
    count = len(repos)

    lines = []
    lines.append("# 🧩 Morphe Patch Source Repositories")
    lines.append("")
    lines.append(
        "An auto-generated, continuously updated index of every GitHub repository "
        "that publishes a [Morphe](https://morphe.software) (`.mpp`) patch bundle."
    )
    lines.append("")
    lines.append(
        f"![Repos tracked](https://img.shields.io/badge/repos%20tracked-{count}-6366f1)"
        f"![Last updated](https://img.shields.io/badge/last%20updated-{now.replace(' ', '%20')}-555)"
    )
    lines.append("")
    lines.append("---")
    lines.append("")
    lines.append("## 📦 How this list is built")
    lines.append("")
    lines.append("This repo list is kept in [`repos.txt`](./repos.txt) and assembled from three sources:")
    lines.append("")
    lines.append(
        "1. **Registry scan** — crawling [`Jman-Github/ReVanced-Patch-Bundles`]"
        "(https://github.com/Jman-Github/ReVanced-Patch-Bundles) and extracting the source repo "
        "behind every bundle that passes the Morphe (`.mpp`) filter."
    )
    lines.append(
        "2. **GitHub-wide search** — scanning all of GitHub for `patches-bundle.json` files, "
        "excluding forks, and verifying each candidate has an actual `.mpp` release asset."
    )
    lines.append(
        "3. **Manual additions** — anything listed in [`custom_repos.txt`](./custom_repos.txt)."
    )
    lines.append("")
    lines.append(
        "Repos are never silently removed when a source goes quiet — add an entry to "
        "[`ignore_repos.txt`](./ignore_repos.txt) to intentionally drop one."
    )
    lines.append("")
    lines.append("---")
    lines.append("")
    lines.append(f"## 📋 Tracked Repositories ({count})")
    lines.append("")
    lines.append("| # | Repository | Link |")
    lines.append("|---|------------|------|")

    for i, repo in enumerate(repos, start=1):
        owner, _, name = repo.partition("/")
        lines.append(f"| {i} | `{repo}` | [🔗 Open]({f'https://github.com/{repo}'}) |")

    lines.append("")
    lines.append("---")
    lines.append("")
    lines.append("## 🔄 Updating")
    lines.append("")
    lines.append("This README is regenerated automatically by GitHub Actions whenever `repos.txt` changes.")
    lines.append("To add a repo manually, append it to `custom_repos.txt`. To remove one permanently, add it to `ignore_repos.txt`.")
    lines.append("")
    lines.append(f"*Last generated: {now}*")
    lines.append("")

    return "\n".join(lines)


def main():
    repos = load_repos(REPOS_FILE)
    readme = build_readme(repos)

    with open(README_FILE, "w") as f:
        f.write(readme)

    print(f"Wrote {README_FILE} with {len(repos)} repos.")


if __name__ == "__main__":
    main()