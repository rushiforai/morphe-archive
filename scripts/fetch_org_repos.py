"""
Discovers all repositories that publish a Morphe (.mpp) patch bundle into
the Jman-Github/ReVanced-Patch-Bundles registry, and writes the unique
list of "owner/repo" entries to repos.txt.

This mirrors the filtering logic from the original Morphe Patch Tracker
pipeline (fetch_patch_tree.py + download_bundles.py::is_morphe_bundle +
parse_bundles.py::extract_repo_url), but only extracts repo info instead
of doing the full parse/fingerprint/diff pipeline.
"""

import os
import re
import sys
import json
import time
import requests

SOURCE_REPO = "Jman-Github/ReVanced-Patch-Bundles"
SOURCE_BRANCH = "bundles"
OUTPUT_FILE = os.environ.get("OUTPUT_FILE", "repos.txt")
CUSTOM_FILE = os.environ.get("CUSTOM_FILE", "custom_repos.txt")
IGNORE_FILE = os.environ.get("IGNORE_FILE", "ignore_repos.txt")

HEADERS = {
    "Accept": "application/vnd.github.v3+json",
    "User-Agent": "MorpheRepoTracker-Pipeline",
}
token = os.environ.get("GITHUB_TOKEN")
if token:
    HEADERS["Authorization"] = f"token {token}"


def fetch_with_retry(url, raw=False, max_retries=3):
    for attempt in range(1, max_retries + 1):
        try:
            resp = requests.get(url, headers=HEADERS, timeout=30)
            if resp.status_code == 200:
                return resp.text if raw else resp.json()
            print(f"Non-200 fetching {url}: {resp.status_code}")
        except Exception as e:
            print(f"Network error fetching {url}: {e}")
        if attempt < max_retries:
            time.sleep(2 ** attempt)
    return None


def fetch_bundle_tree():
    """Step 1: crawl the bundles branch tree, same as fetch_patch_tree.py."""
    url = f"https://api.github.com/repos/{SOURCE_REPO}/git/trees/{SOURCE_BRANCH}?recursive=1"
    print("Fetching repository tree...")
    data = fetch_with_retry(url)
    if not data:
        print("Failed to fetch tree after retries.")
        sys.exit(1)

    tree = data.get("tree", [])
    patch_bundle_files = [
        item for item in tree
        if item.get("path", "").startswith("patch-bundles/") and item.get("type") == "blob"
    ]
    print(f"Found {len(patch_bundle_files)} files under patch-bundles/.")
    return patch_bundle_files


def group_tree_files(tree_files):
    """Step 2: group flat file list into {bundle_name: {channel: bundle_path}}."""
    bundles = {}
    for item in tree_files:
        path = item.get("path", "")
        parts = path.split('/')
        if len(parts) < 3 or parts[0] != "patch-bundles":
            continue

        bundle_folder = parts[1]
        channel = None
        is_bundle_file = False

        if len(parts) == 4:
            ch, filename = parts[2], parts[3]
            if ch in ("stable", "dev") and filename == "patches-bundle.json":
                channel, is_bundle_file = ch, True
        elif len(parts) == 3:
            filename = parts[2]
            if "-stable-patches-bundle.json" in filename:
                channel, is_bundle_file = "stable", True
            elif "-dev-patches-bundle.json" in filename:
                channel, is_bundle_file = "dev", True

        if channel and is_bundle_file:
            bundle_name = bundle_folder
            if bundle_name.endswith("-patch-bundles"):
                bundle_name = bundle_name[:-14]
            elif bundle_name.endswith("-patches"):
                bundle_name = bundle_name[:-8]

            bundles.setdefault(bundle_name, {})[channel] = path

    return bundles


def is_morphe_bundle(bundle_json):
    """Same filter as download_bundles.py::is_morphe_bundle."""
    download_url = bundle_json.get("download_url")
    if not isinstance(download_url, str):
        return False
    if not download_url.lower().endswith(".mpp"):
        return False
    if len(download_url.split("/")) < 8:
        return False
    return True


def extract_repo_url(bundle_json, bundle_name):
    """Same extraction order as parse_bundles.py::extract_repo_url."""
    candidates = []

    download_url = bundle_json.get("download_url")
    if isinstance(download_url, str):
        candidates.append(download_url)

    patches = bundle_json.get("patches", {})
    if isinstance(patches, dict) and "url" in patches:
        candidates.append(patches["url"])

    integrations = bundle_json.get("integrations", {})
    if isinstance(integrations, dict) and "url" in integrations:
        candidates.append(integrations["url"])

    description = bundle_json.get("description", "")
    if description:
        candidates.append(description)

    for text in candidates:
        match = re.search(r"https://(github|gitlab)\.com/([^/]+)/([^/]+)", text)
        if match:
            return f"{match.group(2)}/{match.group(3)}"

    # Fallback default used by the original pipeline
    return f"{bundle_name}/revanced-patches"


def discover_morphe_repos():
    tree_files = fetch_bundle_tree()
    bundles = group_tree_files(tree_files)
    print(f"Discovered {len(bundles)} distinct bundles in tree.")

    repos = set()
    checked = 0
    morphe_count = 0

    for bundle_name, channels in bundles.items():
        for channel, path in channels.items():
            checked += 1
            raw_url = f"https://raw.githubusercontent.com/{SOURCE_REPO}/{SOURCE_BRANCH}/{path}"
            content = fetch_with_retry(raw_url, raw=True)
            if not content:
                continue

            try:
                bundle_json = json.loads(content)
            except Exception:
                continue

            if not is_morphe_bundle(bundle_json):
                continue  # not a Morphe (.mpp) bundle, skip silently

            morphe_count += 1
            repo = extract_repo_url(bundle_json, bundle_name)
            repos.add(repo.rstrip("/"))

    print(f"Checked {checked} bundle+channel pairs, {morphe_count} were Morphe bundles.")
    return repos


AWESOME_REPO = "nvbangg/awesome-for-morphe"
AWESOME_BRANCH = "main"


def fetch_awesome_for_morphe_repos():
    """
    Scrape the '## 🛠️ Projects' section of the awesome-for-morphe README
    for linked GitHub repos. (Its app/patch data is sourced from the same
    Jman registry we already scan, so we only need its curated project list.)
    """
    url = f"https://raw.githubusercontent.com/{AWESOME_REPO}/{AWESOME_BRANCH}/README.md"
    print(f"Fetching {AWESOME_REPO} README for curated project links...")
    content = fetch_with_retry(url, raw=True)
    if not content:
        print(f"Could not fetch README for {AWESOME_REPO}, skipping.")
        return set()

    # Isolate the "Projects" section (stop at the next "## " heading)
    section_match = re.search(
        r"##\s*.*Projects.*?\n(.*?)(?=\n##\s|\Z)", content, re.IGNORECASE | re.DOTALL
    )
    section_text = section_match.group(1) if section_match else content

    repos = set()
    for match in re.finditer(r"github\.com/([\w.-]+)/([\w.-]+?)(?:[)\"'\]>#]|$)", section_text):
        owner, name = match.group(1), match.group(2)
        if owner.lower() in ("sponsors", "marketplace", "topics", "features"):
            continue
        repos.add(f"{owner}/{name}")

    print(f"Found {len(repos)} curated project repos from {AWESOME_REPO}.")
    return repos


def load_lines(path):
    """Read a newline-separated list file, ignoring blanks and # comments."""
    if not os.path.exists(path):
        return set()
    with open(path) as f:
        return {
            line.strip() for line in f
            if line.strip() and not line.strip().startswith("#")
        }


def main():
    jman_repos = discover_morphe_repos()
    awesome_repos = fetch_awesome_for_morphe_repos()

    existing_repos = load_lines(OUTPUT_FILE)
    custom_repos = load_lines(CUSTOM_FILE)
    ignore_repos = load_lines(IGNORE_FILE)

    discovered = jman_repos | awesome_repos

    # Merge: keep everything we already had, add new discoveries + custom
    # additions, then drop anything explicitly ignored. This means a repo
    # that disappears from the source (Jman registry / awesome list) on a
    # later run is NOT auto-removed -- it stays unless added to
    # ignore_repos.txt. Remove a repo from repos.txt manually (or via
    # ignore_repos.txt) if it should be dropped for real.
    all_repos = (existing_repos | discovered | custom_repos) - ignore_repos
    sorted_repos = sorted(all_repos, key=str.lower)

    with open(OUTPUT_FILE, "w") as f:
        for repo in sorted_repos:
            f.write(repo + "\n")

    print(
        f"Discovered: {len(jman_repos)} from Jman bundles, {len(awesome_repos)} from awesome-for-morphe. "
        f"Custom: {len(custom_repos)}. Ignored: {len(ignore_repos)}. "
        f"Saved {len(sorted_repos)} total unique repos to {OUTPUT_FILE}."
    )


if __name__ == "__main__":
    main()