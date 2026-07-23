"""
Reads a repos list (one repo per line) and adds each repo as a
customBundle entry in the Morphe Manager settings JSON.

Plain "owner/repo" entries are treated as GitHub repos. GitLab repos can be
listed as "gitlab.com/owner/repo" or "https://gitlab.com/owner/repo". For each
repo, checks whether patches-bundle.json exists on the `main` branch, falling
back to `master` if not found. A bundle is only accepted when the URL is
reachable, the response is valid JSON, and the JSON contains at least one .mpp
reference. Repos already present (matched by source URL, case-insensitive) are
skipped so the script is safe to re-run.

Existing customBundles are also pruned when their source URL no longer resolves
or their bundle JSON has no .mpp reference.

Usage:
    python add_repos_to_bundles.py [REPOS_FILE] [SETTINGS_FILE] [OUTPUT_FILE]

Defaults:
    REPOS_FILE    = repos.txt
    SETTINGS_FILE = latest morphe_archive_config_vN.json
    OUTPUT_FILE   = next morphe_archive_config_vN.json only when content changes
"""

import json
import re
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
from dataclasses import dataclass
from pathlib import Path

BUNDLE_PATH = "patches-bundle.json"
BRANCHES_TO_TRY = ("main", "master")
TIMEOUT_SECONDS = 8
CONFIG_PREFIX = "morphe_archive_config_v"
CONFIG_PATTERN = re.compile(rf"^{CONFIG_PREFIX}(\d+)\.json$")


@dataclass(frozen=True)
class RepoRef:
    host: str
    path: str

    @property
    def provider(self):
        return "gitlab" if self.host == "gitlab.com" else "github"

    @property
    def display(self):
        return self.path if self.host == "github.com" else f"{self.host}/{self.path}"


def load_repos(path):
    with open(path, encoding="utf-8") as f:
        return [
            parse_repo_ref(line.strip())
            for line in f
            if line.strip() and not line.strip().startswith("#")
        ]


def parse_repo_ref(repo):
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

    path = path.removesuffix(".git").strip("/")
    if host not in ("github.com", "gitlab.com") or path.count("/") < 1:
        raise ValueError(f"Unsupported repo entry: {repo}")
    return RepoRef(host=host, path=path)


def fetch_json(url, timeout=TIMEOUT_SECONDS):
    req = urllib.request.Request(
        url,
        headers={
            "Accept": "application/json",
            "User-Agent": "morphe-bundle-importer/1.0",
        },
    )
    try:
        with urllib.request.urlopen(req, timeout=timeout) as resp:
            if resp.status != 200:
                return None, f"HTTP {resp.status}"
            charset = resp.headers.get_content_charset() or "utf-8"
            return json.loads(resp.read().decode(charset)), None
    except urllib.error.HTTPError as e:
        return None, f"HTTP {e.code}"
    except urllib.error.URLError as e:
        return None, f"URL error: {e.reason}"
    except json.JSONDecodeError:
        return None, "invalid JSON"
    except Exception as e:
        return None, str(e)


def is_mpp_reference(value):
    path = urllib.parse.urlparse(value).path or value
    return path.lower().endswith(".mpp")


def contains_mpp_reference(value):
    if isinstance(value, str):
        return is_mpp_reference(value)
    if isinstance(value, dict):
        return any(contains_mpp_reference(item) for item in value.values())
    if isinstance(value, list):
        return any(contains_mpp_reference(item) for item in value)
    return False


def validate_bundle_url(url):
    bundle_json, error = fetch_json(url)
    if error:
        return False, error
    if not contains_mpp_reference(bundle_json):
        return False, "no .mpp reference"
    return True, None


def bundle_url(repo, branch):
    if repo.host == "gitlab.com":
        return f"https://gitlab.com/{repo.path}/-/raw/{branch}/{BUNDLE_PATH}"
    return f"https://raw.githubusercontent.com/{repo.path}/{branch}/{BUNDLE_PATH}"


def resolve_branch(repo):
    for branch in BRANCHES_TO_TRY:
        url = bundle_url(repo, branch)
        valid, _ = validate_bundle_url(url)
        if valid:
            return branch
    return None


def repo_display_name(repo):
    return repo.path.rsplit("/", 1)[-1] or repo.display


def prune_invalid_bundles(bundles):
    kept = []
    removed = []

    for bundle in bundles:
        source = bundle.get("source", "")
        if not source:
            removed.append((bundle.get("name") or "<unnamed>", "<missing source>"))
            continue

        valid, reason = validate_bundle_url(source)
        if valid:
            kept.append(bundle)
        else:
            removed.append((source, reason))

    return kept, removed


def find_latest_config_file(root="."):
    latest_version = 0
    latest_path = None

    for path in Path(root).glob(f"{CONFIG_PREFIX}*.json"):
        match = CONFIG_PATTERN.match(path.name)
        if not match:
            continue
        version = int(match.group(1))
        if version > latest_version:
            latest_version = version
            latest_path = path

    if latest_path is None:
        legacy_path = Path(root) / "morphe_manager_settings.json"
        if legacy_path.exists():
            return legacy_path, 0
        return Path(root) / f"{CONFIG_PREFIX}1.json", 0

    return latest_path, latest_version


def serialize_json(data):
    return json.dumps(data, indent=4) + "\n"


def resolve_config_paths(argv):
    repos_file = argv[1] if len(argv) > 1 else "repos.txt"
    explicit_settings = len(argv) > 2
    explicit_output = len(argv) > 3

    if explicit_settings:
        settings_file = Path(argv[2])
        output_file = Path(argv[3]) if explicit_output else settings_file
        return repos_file, settings_file, output_file, False

    settings_file, version = find_latest_config_file()
    output_file = Path(f"{CONFIG_PREFIX}{version + 1}.json")
    return repos_file, settings_file, output_file, True


def main():
    repos_file, settings_file, output_file, versioned_output = resolve_config_paths(sys.argv)

    repos = load_repos(repos_file)

    with open(settings_file, encoding="utf-8") as f:
        data = json.load(f)

    settings = data.setdefault("settings", {})
    bundles = settings.setdefault("customBundles", [])
    bundles, removed_invalid = prune_invalid_bundles(bundles)
    settings["customBundles"] = bundles

    existing_sources = {
        b.get("source", "").lower()
        for b in bundles
        if b.get("source")
    }
    existing_sort_orders = [b.get("sortOrder", 0) for b in bundles]
    next_sort_order = (max(existing_sort_orders) + 1) if existing_sort_orders else 1

    added = []
    skipped_existing = []
    skipped_invalid_bundle = []

    for repo in repos:
        possible_prefixes = [
            bundle_url(repo, branch).rsplit(f"/{BUNDLE_PATH}", 1)[0].lower()
            for branch in BRANCHES_TO_TRY
        ]
        already_present = any(src.startswith(prefix) for src in existing_sources for prefix in possible_prefixes)
        if already_present:
            skipped_existing.append(repo.display)
            continue

        branch = resolve_branch(repo)
        if branch is None:
            skipped_invalid_bundle.append(repo.display)
            continue

        now_ms = int(time.time() * 1000)
        source_url = bundle_url(repo, branch)
        bundle_entry = {
            "name": repo_display_name(repo),
            "source": source_url,
            "autoUpdate": True,
            "sortOrder": next_sort_order,
            "createdAt": now_ms,
            "updatedAt": now_ms,
        }
        bundles.append(bundle_entry)
        existing_sources.add(source_url.lower())
        next_sort_order += 1
        added.append((repo.display, branch))

    output_json = serialize_json(data)
    if versioned_output and settings_file.exists():
        current_json = settings_file.read_text(encoding="utf-8")
        if current_json == output_json:
            output_file = settings_file
            print(f"No config changes. Kept {settings_file}.")
        else:
            output_file.write_text(output_json, encoding="utf-8")
            print(f"Wrote {output_file}.")
    else:
        output_file.write_text(output_json, encoding="utf-8")
        print(f"Wrote {output_file}.")

    print(f"Added {len(added)} repos.")
    print(f"Skipped {len(skipped_existing)} already present.")
    print(f"Skipped {len(skipped_invalid_bundle)} with invalid/no .mpp bundle on main/master.")
    print(f"Removed {len(removed_invalid)} invalid existing bundles.")

    if removed_invalid:
        print("\nRemoved invalid existing bundles:")
        for source, reason in removed_invalid:
            print(f"  - {source} ({reason})")

    if skipped_invalid_bundle:
        print("\nInvalid or no .mpp bundle found for:")
        for r in skipped_invalid_bundle:
            print(f"  - {r}")

    if added:
        print("\nAdded:")
        for r, b in added:
            print(f"  - {r} ({b})")


if __name__ == "__main__":
    main()
