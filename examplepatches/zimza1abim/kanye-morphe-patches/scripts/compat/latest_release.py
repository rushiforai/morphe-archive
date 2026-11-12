"""Print the newest stable release of a compat target as GitHub Actions outputs.

Usage: latest_release.py <target>   (outputs for one target from targets.json)
       latest_release.py --list     (`targets=[...]` for the workflow matrix)

With COMPAT_SCHEDULED=true (the daily cron), targets that set "scheduleWeekday"
(Mon..Sun, Korea time) are listed only on that day; manual runs list every target.

Brave's GitHub `prerelease` flag and `releases/latest` are unreliable, so the
channel is taken from the release name ("Release v..." vs Beta/Nightly) and the
highest version wins, since several stable lines can update on the same day.
"""
import datetime
import json
import os
import pathlib
import re
import sys
import urllib.request

ROOT = pathlib.Path(__file__).resolve().parents[2]
DEFAULT_VERSION_PATTERN = r"\d+(?:\.\d+)+"


def fetch(url):
    request = urllib.request.Request(url, headers={"Accept": "application/vnd.github+json"})
    token = os.environ.get("GITHUB_TOKEN")
    if token:
        request.add_header("Authorization", f"Bearer {token}")
    with urllib.request.urlopen(request, timeout=60) as response:
        return json.load(response)


def version_key(text):
    return tuple(int(part) for part in re.findall(r"\d+", text))


def main():
    targets = json.loads((ROOT / "scripts/compat/targets.json").read_text())
    if sys.argv[1] == "--list":
        names = sorted(targets)
        if os.environ.get("COMPAT_SCHEDULED") == "true":
            # Brave ships a stable build every 1-2 days; checking it weekly is enough.
            today = datetime.datetime.now(datetime.timezone(datetime.timedelta(hours=9))).strftime("%a")
            names = [n for n in names if targets[n].get("scheduleWeekday", today) == today]
        print("targets=" + json.dumps(names))
        return
    target = targets[sys.argv[1]]
    # GitHub lists releases by tag creation date, not by version (Joplin's newest
    # release can sit far down the list), so scan several pages and compare versions.
    releases = []
    for page in range(1, 4):
        batch = fetch(f"https://api.github.com/repos/{target['repo']}/releases?per_page=100&page={page}")
        releases += batch
        if len(batch) < 100:
            break

    candidates = []
    for release in releases:
        if release.get("draft"):
            continue
        name = (release.get("name") or "").strip()
        if not name.startswith(target["releaseNamePrefix"]):
            continue
        # Tags such as "3.4.14-android" carry a channel suffix; keep only the version.
        version = re.search(target.get("versionPattern", DEFAULT_VERSION_PATTERN), release["tag_name"])
        if version is None:
            continue
        apk = [a for a in release["assets"] if re.search(target["apkAsset"], a["name"])]
        if len(apk) != 1:
            continue
        sha = None
        if target.get("sha256Asset"):
            sha = next((a for a in release["assets"] if re.search(target["sha256Asset"], a["name"])), None)
            if sha is None:
                continue
        candidates.append((version_key(version.group(0)), version.group(0), release, apk[0], sha))

    if not candidates:
        raise SystemExit(f"No stable {target['label']} release with a matching APK was found")
    _, version, release, apk, sha = max(candidates, key=lambda item: item[0])

    # Per-version resources the patch cannot derive (e.g. a settings-menu adapter).
    adapter = target.get("adapterPath")
    adapter_missing = bool(adapter) and not (ROOT / adapter.format(version=version)).is_file()

    outputs = {
        "label": target["label"],
        "version": version,
        "name": release["name"].strip().splitlines()[0],
        "url": release["html_url"],
        "apk_url": apk["browser_download_url"],
        "sha256_url": sha["browser_download_url"] if sha else "",
        "locator": target.get("locator") or "",
        "versions_file": target.get("versionsFile") or "",
        "patches": "|".join(target["patches"]),
        "adapter_missing": "true" if adapter_missing else "false",
        "adapter_path": adapter.format(version=version) if adapter else "",
    }
    for key, value in outputs.items():
        print(f"{key}={value}")


if __name__ == "__main__":
    main()
