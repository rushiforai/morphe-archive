"""
Generates the static GitHub Pages site in docs/.
"""

import json
import re
import urllib.error
import urllib.parse
import urllib.request
from collections import defaultdict
from datetime import datetime, timezone
from pathlib import Path

CONFIG_PREFIX = "morphe_archive_config_v"
CONFIG_PATTERN = re.compile(rf"^{CONFIG_PREFIX}(\d+)\.json$")
OUTPUT_DIR = Path("docs")
TIMEOUT_SECONDS = 8
ICON_CACHE_PATH = Path("scripts/app_icon_cache.json")
MAX_CHANGELOG_ITEMS = 8


def latest_config_file():
    latest = None
    latest_version = 0
    for path in Path(".").glob(f"{CONFIG_PREFIX}*.json"):
        match = CONFIG_PATTERN.match(path.name)
        if not match:
            continue
        version = int(match.group(1))
        if version > latest_version:
            latest = path
            latest_version = version
    if latest is None:
        raise FileNotFoundError(f"No {CONFIG_PREFIX}N.json file found")
    return latest, latest_version


def load_icon_cache():
    if not ICON_CACHE_PATH.exists():
        return {}
    try:
        data = json.loads(ICON_CACHE_PATH.read_text(encoding="utf-8"))
    except json.JSONDecodeError:
        return {}
    if not isinstance(data, dict):
        return {}
    return {
        str(package).lower(): url
        for package, url in data.items()
        if isinstance(url, str) and url
    }


def fetch_json(url):
    req = urllib.request.Request(
        url,
        headers={"User-Agent": "morphe-archive-site-generator/1.0"},
    )
    try:
        with urllib.request.urlopen(req, timeout=TIMEOUT_SECONDS) as resp:
            if resp.status != 200:
                return None
            charset = resp.headers.get_content_charset() or "utf-8"
            return json.loads(resp.read().decode(charset))
    except (urllib.error.URLError, urllib.error.HTTPError, json.JSONDecodeError, TimeoutError):
        return None


def fetch_text(url):
    req = urllib.request.Request(
        url,
        headers={"User-Agent": "morphe-archive-site-generator/1.0"},
    )
    try:
        with urllib.request.urlopen(req, timeout=TIMEOUT_SECONDS) as resp:
            if resp.status != 200:
                return ""
            charset = resp.headers.get_content_charset() or "utf-8"
            return resp.read().decode(charset, errors="replace")
    except (urllib.error.URLError, urllib.error.HTTPError, TimeoutError):
        return ""


def repo_from_source(source):
    parsed = urllib.parse.urlparse(source)
    if parsed.netloc == "raw.githubusercontent.com":
        parts = parsed.path.strip("/").split("/")
        if len(parts) >= 2:
            return "github.com", f"{parts[0]}/{parts[1]}"
    if parsed.netloc == "gitlab.com":
        parts = parsed.path.strip("/").split("/")
        if "-/raw/" in parsed.path and len(parts) >= 2:
            raw_index = parts.index("-")
            if raw_index >= 2:
                return "gitlab.com", "/".join(parts[:raw_index])
        if len(parts) >= 2:
            return "gitlab.com", "/".join(parts[:2])
    return "", ""


def web_url(host, repo):
    return f"https://{host}/{repo}" if host and repo else ""


def add_to_morphe_url(host, repo):
    if host == "gitlab.com":
        return f"https://morphe.software/add-source?gitlab={repo}"
    return f"https://morphe.software/add-source?github={repo}"


def repo_avatar_url(host, repo):
    owner = repo.split("/", 1)[0] if repo else ""
    if not owner:
        return ""
    if host == "github.com":
        return f"https://github.com/{owner}.png?size=96"
    if host == "gitlab.com":
        return f"https://gitlab.com/uploads/-/system/user/avatar/{urllib.parse.quote(owner)}/avatar.png"
    return ""


def patches_list_url(bundle_url):
    return bundle_url.rsplit("/", 1)[0] + "/patches-list.json"


def changelog_url(bundle_url):
    return bundle_url.rsplit("/", 1)[0] + "/CHANGELOG.md"


def format_timestamp(ms):
    if not isinstance(ms, (int, float)) or ms <= 0:
        return ""
    try:
        return datetime.fromtimestamp(ms / 1000, tz=timezone.utc).strftime("%Y-%m-%d")
    except (OverflowError, OSError, ValueError):
        return ""


def clean_markdown(value):
    value = re.sub(r"\[([^\]]+)\]\([^)]+\)", r"\1", value)
    value = re.sub(r"\s+\([0-9a-f]{7,40}\)$", "", value)
    value = value.replace("`", "")
    return value.strip()


def slugify(value):
    value = str(value or "").lower().replace("&", "and").replace("+", "plus")
    value = re.sub(r"[^a-z0-9]+", "-", value)
    return value.strip("-") or "item"


def source_slug(repo):
    return slugify(str(repo or "").replace("/", "-"))


def builder_build_id(package_name, repo):
    return f"{slugify(package_name)}-{source_slug(repo)}"


def builder_release_tag(package_name, repo):
    return f"app-{slugify(package_name)}-{source_slug(repo)}"


def builder_asset_name(app_name, package_name, repo):
    app_part = slugify(app_name or package_name or "app")
    return f"{app_part}-{source_slug(repo)}.apk"


def summarize_changelog(markdown):
    if not markdown:
        return {"title": "", "date": "", "items": []}

    title = ""
    date = ""
    items = []
    category = ""
    in_latest_section = False

    for raw_line in markdown.splitlines():
        line = raw_line.strip()
        if not line:
            continue

        if line.startswith("#"):
            heading = clean_markdown(line.lstrip("#").strip())
            heading_date = re.search(r"\((\d{4}-\d{2}-\d{2})\)", heading) or re.search(r"\b(\d{4}-\d{2}-\d{2})\b", heading)
            if line.startswith("## "):
                if in_latest_section and items:
                    break
                if not in_latest_section:
                    title = heading
                    date = heading_date.group(1) if heading_date else ""
                    in_latest_section = True
                category = ""
                continue
            if in_latest_section:
                category = heading
            continue

        if not in_latest_section:
            continue

        if line.startswith(("* ", "- ")):
            item = clean_markdown(line[2:].strip())
            if item:
                items.append({"category": category, "text": item})
        elif items and not line.startswith("|"):
            items.append({"category": category, "text": clean_markdown(line)})

        if len(items) >= MAX_CHANGELOG_ITEMS:
            break

    return {"title": title, "date": date, "items": items}


def normalize_compatible_packages(value):
    if isinstance(value, dict):
        for package_name, versions in value.items():
            targets = []
            if isinstance(versions, list):
                targets = [{"version": str(version)} for version in versions if version]
            yield {
                "packageName": package_name,
                "name": package_name,
                "targets": targets,
            }
        return

    if not isinstance(value, list):
        return

    for app in value:
        if isinstance(app, str):
            yield {"packageName": app, "name": app, "targets": []}
        elif isinstance(app, dict):
            yield app


def collect_patch_metadata(bundle, icon_cache):
    data = fetch_json(patches_list_url(bundle["source"]))
    patches = data.get("patches", []) if isinstance(data, dict) else []
    apps = {}
    universal_patches = []

    for patch in patches:
        patch_name = patch.get("name") or "Unnamed patch"
        patch_description = patch.get("description") or ""
        compatible_apps = list(normalize_compatible_packages(patch.get("compatiblePackages", []) or []))
        if not compatible_apps:
            universal_patches.append(
                {
                    "name": patch_name,
                    "description": patch_description,
                    "default": patch.get("default", patch.get("use", "")),
                }
            )
            continue

        for app in compatible_apps:
            package_name = app.get("packageName")
            if not package_name:
                continue
            app_name = app.get("name") or package_name
            versions = []
            for target in app.get("targets", []) or []:
                version = target.get("version")
                if version:
                    versions.append(str(version))
            entry = apps.setdefault(
                package_name,
                {
                    "packageName": package_name,
                    "name": app_name,
                    "patches": set(),
                    "patchDetails": {},
                    "versions": set(),
                    "iconColor": app.get("appIconColor") or "",
                    "iconUrl": (
                        app.get("iconUrl")
                        or app.get("appIconUrl")
                        or icon_cache.get(package_name.lower(), "")
                    ),
                },
            )
            entry["patches"].add(patch_name)
            entry["patchDetails"][patch_name] = patch_description
            entry["versions"].update(versions)
            if not entry["iconColor"] and app.get("appIconColor"):
                entry["iconColor"] = app.get("appIconColor")
            if not entry["iconUrl"] and (app.get("iconUrl") or app.get("appIconUrl")):
                entry["iconUrl"] = app.get("iconUrl") or app.get("appIconUrl")

    normalized_apps = []
    for app in apps.values():
        normalized_apps.append(
            {
                "packageName": app["packageName"],
                "name": app["name"],
                "patches": sorted(app["patches"], key=str.lower),
                "patchDetails": [
                    {"name": name, "description": app["patchDetails"].get(name, "")}
                    for name in sorted(app["patches"], key=str.lower)
                ],
                "versions": sorted(app["versions"], key=str.lower),
                "iconColor": app["iconColor"],
                "iconUrl": app["iconUrl"],
            }
        )

    return (
        len(patches),
        sorted(normalized_apps, key=lambda item: item["name"].lower()),
        sorted(universal_patches, key=lambda item: item["name"].lower()),
    )


def build_data():
    config_file, config_version = latest_config_file()
    config = json.loads(config_file.read_text(encoding="utf-8"))
    bundles = config.get("settings", {}).get("customBundles", [])

    repos = []
    apps_by_package = {}
    universal_sources = []
    host_counts = defaultdict(int)
    total_patch_count = 0
    icon_cache = load_icon_cache()

    for bundle in bundles:
        host, repo_path = repo_from_source(bundle.get("source", ""))
        patch_count, apps, universal_patches = collect_patch_metadata(bundle, icon_cache)
        source_changelog_url = changelog_url(bundle.get("source", ""))
        latest_changes = summarize_changelog(fetch_text(source_changelog_url))
        host_counts[host or "other"] += 1
        total_patch_count += patch_count
        repo = {
            "name": bundle.get("name") or repo_path.rsplit("/", 1)[-1],
            "repo": repo_path,
            "host": host,
            "source": bundle.get("source", ""),
            "listUrl": patches_list_url(bundle.get("source", "")),
            "changelogUrl": source_changelog_url,
            "webUrl": web_url(host, repo_path),
            "addUrl": add_to_morphe_url(host, repo_path),
            "avatarUrl": repo_avatar_url(host, repo_path),
            "patchCount": patch_count,
            "appCount": len(apps),
            "createdAt": bundle.get("createdAt", 0),
            "updatedAt": bundle.get("updatedAt", 0),
            "createdDate": format_timestamp(bundle.get("createdAt", 0)),
            "updatedDate": format_timestamp(bundle.get("updatedAt", 0)),
            "latestChanges": latest_changes,
            "apps": [
                {
                    "name": app["name"],
                    "packageName": app["packageName"],
                    "patchCount": len(app["patches"]),
                    "iconUrl": app["iconUrl"],
                    "iconColor": app["iconColor"],
                }
                for app in apps
            ],
        }
        repos.append(repo)
        if universal_patches:
            universal_sources.append(
                {
                    "repo": repo_path,
                    "host": host,
                    "webUrl": repo["webUrl"],
                    "addUrl": repo["addUrl"],
                    "source": repo["source"],
                    "changelogUrl": repo["changelogUrl"],
                    "avatarUrl": repo["avatarUrl"],
                    "patchCount": len(universal_patches),
                    "latestChanges": latest_changes,
                    "patches": universal_patches,
                }
            )

        for app in apps:
            existing = apps_by_package.setdefault(
                app["packageName"],
                {
                    "packageName": app["packageName"],
                    "name": app["name"],
                    "repos": [],
                    "sources": {},
                    "patches": set(),
                    "patchDetails": {},
                    "versions": set(),
                    "iconColor": "",
                    "iconUrl": "",
                },
            )
            existing["repos"].append(repo_path)
            existing["sources"][repo_path] = {
                "repo": repo_path,
                "host": host,
                "webUrl": repo["webUrl"],
                "addUrl": repo["addUrl"],
                "source": repo["source"],
                "changelogUrl": repo["changelogUrl"],
                "avatarUrl": repo["avatarUrl"],
                "latestChanges": latest_changes,
                "builder": {
                    "buildId": builder_build_id(app["packageName"], repo_path),
                    "releaseTag": builder_release_tag(app["packageName"], repo_path),
                    "assetName": builder_asset_name(existing["name"], app["packageName"], repo_path),
                    "repo": "rushiforai/morphe-builder",
                    "webUrl": "https://github.com/rushiforai/morphe-builder",
                },
                "patches": app["patchDetails"],
                "versions": app["versions"],
            }
            existing["patches"].update(app["patches"])
            for patch in app["patchDetails"]:
                existing["patchDetails"][patch["name"]] = patch.get("description", "")
            existing["versions"].update(app["versions"])
            if not existing["iconColor"] and app.get("iconColor"):
                existing["iconColor"] = app["iconColor"]
            if not existing["iconUrl"] and app.get("iconUrl"):
                existing["iconUrl"] = app["iconUrl"]

    apps = []
    for app in apps_by_package.values():
        apps.append(
            {
                "packageName": app["packageName"],
                "name": app["name"],
                "repos": sorted(set(app["repos"]), key=str.lower),
                "sources": sorted(app["sources"].values(), key=lambda item: item["repo"].lower()),
                "patches": sorted(app["patches"], key=str.lower),
                "patchDetails": [
                    {"name": name, "description": app["patchDetails"].get(name, "")}
                    for name in sorted(app["patches"], key=str.lower)
                ],
                "versions": sorted(app["versions"], key=str.lower),
                "iconColor": app["iconColor"],
                "iconUrl": app["iconUrl"],
            }
        )

    return {
        "generatedAt": datetime.now(timezone.utc).strftime("%Y-%m-%d %H:%M UTC"),
        "configFile": config_file.name,
        "configVersion": config_version,
        "repoCount": len(repos),
        "appCount": len(apps),
        "patchCount": total_patch_count,
        "universalPatchCount": sum(source["patchCount"] for source in universal_sources),
        "hostCounts": dict(sorted(host_counts.items())),
        "repos": sorted(repos, key=lambda item: item["repo"].lower()),
        "apps": sorted(apps, key=lambda item: item["name"].lower()),
        "universalSources": sorted(universal_sources, key=lambda item: item["repo"].lower()),
        "recentSources": sorted(
            repos,
            key=lambda item: (
                bool(item.get("latestChanges", {}).get("items")),
                item.get("updatedAt", 0) or item.get("createdAt", 0),
            ),
            reverse=True,
        )[:12],
    }


HTML = """<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
  <title>Morphe Archive</title>
  <meta name="description" content="Search Morphe patch sources and supported apps.">
  <link rel="icon" type="image/svg+xml" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 64 64'%3E%3Crect width='64' height='64' rx='14' fill='%23111318'/%3E%3Ctext x='32' y='44' text-anchor='middle' font-family='Arial,sans-serif' font-size='42' font-weight='800' fill='%2328c7dc'%3EM%3C/text%3E%3C/svg%3E">
  <style>
    :root {
      color-scheme: dark;
      --bg: #111318;
      --panel: #1d1f24;
      --panel-2: #262931;
      --line: #474b55;
      --text: #f4f6f8;
      --muted: #a9b1bd;
      --accent: #28c7dc;
      --accent-2: #5da8ff;
      --warn: #f2c56c;
      --shadow: 0 18px 40px rgba(0, 0, 0, .22);
    }
    * { box-sizing: border-box; }
    html { scroll-behavior: smooth; }
    @media (prefers-reduced-motion: reduce) {
      html { scroll-behavior: auto; }
      *, *::before, *::after { animation: none !important; transition: none !important; }
    }
    html, body {
      width: 100%;
      max-width: 100%;
      overflow-x: hidden;
    }
    body {
      margin: 0;
      font-family: Inter, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
      background: var(--bg);
      color: var(--text);
      line-height: 1.5;
      padding-bottom: calc(54px + env(safe-area-inset-bottom));
    }
    header {
      border-bottom: 1px solid var(--line);
      background: #15171c;
      position: sticky;
      top: 0;
      z-index: 10;
      backdrop-filter: blur(14px);
    }
    .wrap {
      width: 100%;
      max-width: 1220px;
      margin: 0 auto;
      padding: 18px 24px;
    }
    .nav {
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 18px;
      padding-bottom: 10px;
    }
    .brand {
      display: flex;
      align-items: center;
      gap: 0;
      font-size: 24px;
      font-weight: 800;
      letter-spacing: 0;
    }
    .brand-mark {
      color: var(--accent);
      font-size: 30px;
      line-height: 1;
    }
    .top {
      display: grid;
      grid-template-columns: minmax(0, 1fr) auto;
      gap: 20px;
      align-items: end;
      padding: 10px 0 14px;
    }
    h1 {
      margin: 0 0 8px;
      font-size: clamp(30px, 3.4vw, 48px);
      line-height: 1.04;
      letter-spacing: 0;
      overflow-wrap: anywhere;
    }
    .accent-text { color: var(--accent); }
    p { margin: 0; color: var(--muted); }
    .subline {
      display: flex;
      gap: 12px;
      flex-wrap: wrap;
      align-items: center;
      margin-top: 10px;
      color: var(--muted);
      font-size: 13px;
    }
    .header-actions {
      display: flex;
      gap: 8px;
      flex-wrap: wrap;
      align-items: center;
    }
    .icon-button {
      width: 48px;
      height: 48px;
      padding: 0;
      border-radius: 12px;
      color: var(--accent-2);
    }
    .icon-button svg {
      width: 24px;
      height: 24px;
      display: block;
    }
    .stats {
      display: grid;
      grid-template-columns: repeat(4, minmax(86px, 1fr));
      gap: 10px;
      flex-wrap: wrap;
      justify-content: flex-end;
      max-width: 640px;
    }
    .stat {
      border: 1px solid var(--line);
      background: var(--panel);
      padding: 9px 12px;
      border-radius: 8px;
      min-width: 0;
      box-shadow: var(--shadow);
      text-transform: uppercase;
      font-size: 12px;
      letter-spacing: .04em;
      text-align: center;
    }
    .stat strong {
      display: block;
      font-size: 22px;
      color: var(--accent);
      letter-spacing: 0;
    }
    .toolbar {
      display: grid;
      grid-template-columns: auto auto minmax(160px, 220px) minmax(220px, 1fr);
      gap: 14px;
      margin-top: 12px;
      align-items: stretch;
    }
    input, select, button, a.button {
      border: 1px solid var(--line);
      background: var(--panel);
      color: var(--text);
      border-radius: 12px;
      padding: 10px 12px;
      font: inherit;
      touch-action: manipulation;
      -webkit-tap-highlight-color: transparent;
    }
    button, a.button { min-height: 40px; }
    input::placeholder { color: #7a8291; }
    ::selection { background: var(--accent); color: #06110c; }
    input:focus-visible, select:focus-visible, button:focus-visible, a.button:focus-visible {
      outline: 2px solid var(--accent);
      outline-offset: 2px;
    }
    input { width: 100%; }
    input, select { min-width: 0; }
    .tabs {
      display: flex;
      gap: 0;
      flex-wrap: wrap;
      border: 1px solid var(--line);
      border-radius: 14px;
      overflow: hidden;
      background: var(--panel);
    }
    .tabs button { border: 0; border-radius: 0; background: transparent; }
    .host-tabs {
      display: flex;
      gap: 0;
      border: 1px solid var(--line);
      border-radius: 14px;
      overflow: hidden;
      background: var(--panel);
    }
    .host-tabs button {
      border: 0;
      border-radius: 0;
      background: transparent;
      min-width: 74px;
    }
    button.active {
      color: #fff;
      background: #2b2f3a;
      box-shadow: inset 0 -2px 0 var(--accent);
    }
    main .wrap { padding-top: 18px; }
    .list {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(min(360px, 100%), 1fr));
      gap: 20px;
      align-items: stretch;
    }
    .row {
      display: flex;
      flex-direction: column;
      gap: 14px;
      border: 1px solid var(--line);
      background: var(--panel);
      padding: 20px;
      border-radius: 14px;
      box-shadow: var(--shadow);
      min-height: 0;
      min-width: 0;
    }
    .row.has-expand { cursor: pointer; }
    .row { transition: border-color .18s ease, transform .18s ease; }
    @media (hover: hover) and (pointer: fine) {
      .row:hover { border-color: #46505f; transform: translateY(-1px); }
      a:hover { color: #7cb8ff; }
    }
    .card-head {
      display: grid;
      grid-template-columns: minmax(0, 1fr) auto;
      gap: 14px;
      align-items: start;
    }
    .name {
      font-weight: 700;
      color: var(--text);
      overflow-wrap: anywhere;
    }
    .meta {
      display: flex;
      align-items: center;
      gap: 10px;
      flex-wrap: wrap;
      color: var(--muted);
      font-size: 13px;
      margin-top: 4px;
    }
    .meta span {
      overflow-wrap: anywhere;
    }
    .count-line {
      display: flex;
      align-items: center;
      gap: 10px;
      flex-wrap: wrap;
      margin-top: 8px;
      color: var(--muted);
      font-size: 13px;
    }
    .title-line {
      display: flex;
      align-items: flex-start;
      gap: 12px;
      min-width: 0;
    }
    .title-line > div {
      min-width: 0;
    }
    .avatar, .app-icon {
      width: 56px;
      height: 56px;
      border-radius: 12px;
      border: 1px solid var(--line);
      display: inline-flex;
      align-items: center;
      justify-content: center;
      flex: 0 0 auto;
      overflow: hidden;
      background: var(--panel-2);
      color: var(--text);
      font-weight: 800;
      position: relative;
    }
    .app-icon.fallback {
      background:
        linear-gradient(135deg, rgba(255,255,255,.18), rgba(255,255,255,0) 45%),
        var(--icon-color, #2f3542);
    }
    .avatar img, .app-icon img {
      position: absolute;
      inset: 0;
      width: 100%;
      height: 100%;
      object-fit: cover;
      display: block;
    }
    .badge {
      display: inline-flex;
      align-items: center;
      min-height: 24px;
      border: 1px solid var(--line);
      border-radius: 999px;
      padding: 2px 8px;
      background: var(--panel-2);
      color: var(--muted);
      font-size: 12px;
      white-space: nowrap;
    }
    .badge.host-github { color: var(--accent-2); }
    .badge.host-gitlab { color: var(--warn); }
    .actions {
      display: flex;
      gap: 8px;
      flex-wrap: wrap;
      justify-content: flex-start;
    }
    a.badge {
      text-decoration: none;
    }
    .repo-actions {
      justify-content: flex-start;
      margin-top: 10px;
    }
    .bundle-actions {
      display: grid;
      grid-template-columns: auto auto minmax(0, max-content);
      align-items: center;
      width: fit-content;
      max-width: 100%;
    }
    .bundle-actions .primary {
      min-width: 0;
      padding-left: 16px;
      padding-right: 16px;
    }
    .source-actions {
      align-items: center;
      flex-wrap: wrap;
    }
    .source-actions a.button {
      flex: 1 1 0;
      min-height: 38px;
      padding: 8px 11px;
      font-size: 14px;
    }
    .source-actions .obtainium {
      flex: 1 1 0;
      max-width: 100%;
    }
    .source-actions .obtainium span {
      display: block;
      max-width: 190px;
      overflow: hidden;
      text-overflow: ellipsis;
    }
    a { color: var(--accent-2); }
    a.button {
      text-decoration: none;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      min-height: 40px;
      white-space: nowrap;
    }
    a.primary {
      color: #06110c;
      background: var(--accent);
      border-color: var(--accent);
      font-weight: 700;
    }
    a.obtainium {
      border-color: var(--accent-2);
      color: var(--accent-2);
      font-weight: 700;
    }
    .chips {
      display: flex;
      flex-wrap: wrap;
      gap: 6px;
      margin-top: 10px;
    }
    .chip {
      border: 1px solid var(--line);
      background: #11141a;
      border-radius: 999px;
      padding: 4px 8px;
      color: var(--muted);
      font-size: 12px;
      overflow-wrap: anywhere;
    }
    .source-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(330px, 1fr));
      gap: 12px;
      margin-top: 10px;
    }
    .source-card {
      border: 1px solid var(--line);
      border-radius: 14px;
      padding: 14px;
      background: #141820;
      min-width: 0;
      overflow: hidden;
      cursor: default;
    }
    .source-card-head {
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 10px;
      margin-bottom: 8px;
    }
    .source-card-head.card-head {
      display: grid;
      grid-template-columns: minmax(0, 1fr);
      align-items: start;
      gap: 12px;
    }
    .source-card-title {
      display: grid;
      grid-template-columns: 56px minmax(0, 1fr) auto;
      align-items: center;
      gap: 8px;
      width: 100%;
      min-width: 0;
      font-weight: 700;
      overflow-wrap: anywhere;
    }
    .source-card-title span {
      min-width: 0;
      overflow-wrap: normal;
      word-break: normal;
      hyphens: none;
    }
    .source-card-title .badge {
      grid-column: 3;
      justify-self: start;
    }
    .avatar.fallback {
      font-size: 16px;
      color: var(--accent-2);
    }
    .app-icon.fallback {
      font-size: 16px;
      color: white;
    }
    .patch-note {
      color: var(--muted);
      font-size: 12px;
      display: block;
      margin-top: 2px;
    }
    .patch-list {
      display: grid;
      gap: 8px;
      margin-top: 10px;
    }
    .bundle-apps {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
      gap: 10px;
      margin-top: 10px;
    }
    .bundle-app {
      display: flex;
      align-items: center;
      gap: 10px;
      border: 1px solid var(--line);
      border-radius: 12px;
      padding: 10px;
      background: #11151d;
      min-width: 0;
    }
    .bundle-app-info {
      min-width: 0;
    }
    .bundle-app-info .name {
      font-size: 14px;
    }
    .patch-item {
      border: 1px solid var(--line);
      background: #11151d;
      border-radius: 12px;
      padding: 10px 12px;
      color: var(--text);
      font-size: 13px;
      overflow-wrap: anywhere;
    }
    .empty {
      border: 1px dashed var(--line);
      color: var(--muted);
      padding: 24px;
      border-radius: 8px;
      text-align: center;
    }
    .disclaimer {
      margin: 24px 0 0;
      color: var(--muted);
      font-size: 13px;
    }
    .site-counter {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 10px;
      margin: 20px auto 10px;
      color: var(--muted);
      font-size: 13px;
      font-weight: 600;
      letter-spacing: .02em;
    }
    .site-counter .visitors-label {
      color: var(--muted);
    }
    .site-counter a {
      color: var(--muted);
      text-decoration: none;
      display: inline-flex;
      align-items: center;
    }
    .site-counter br {
      display: none;
    }
    .site-counter img {
      height: auto;
      width: auto;
      max-height: none;
      image-rendering: pixelated;
      border-radius: 4px;
    }
    .mobile-footer {
      display: block;
      position: fixed;
      left: 0;
      right: 0;
      bottom: 0;
      z-index: 20;
      border-top: 1px solid var(--line);
      background: rgba(17, 19, 24, .96);
      color: var(--muted);
      font-size: 11px;
      line-height: 1.35;
      padding: 9px 14px max(9px, env(safe-area-inset-bottom));
      text-align: center;
    }
    .back-top {
      display: inline-flex;
      position: fixed;
      right: 22px;
      bottom: calc(58px + env(safe-area-inset-bottom));
      z-index: 21;
      width: 48px;
      height: 48px;
      border-radius: 999px;
      align-items: center;
      justify-content: center;
      text-decoration: none;
      color: white;
      background: var(--accent);
      border: 0;
      box-shadow: 0 12px 32px rgba(0, 0, 0, .35);
      font-size: 28px;
      line-height: 1;
      transition: transform .18s ease, box-shadow .18s ease;
    }
    @media (hover: hover) and (pointer: fine) {
      .back-top:hover { transform: translateY(-2px); box-shadow: 0 14px 36px rgba(0, 0, 0, .45); }
    }
    .modal {
      position: fixed;
      inset: 0;
      z-index: 40;
      display: grid;
      place-items: center;
      padding: 24px;
      background: rgba(0, 0, 0, .62);
      backdrop-filter: blur(8px);
    }
    .modal[hidden] {
      display: none;
    }
    .modal-panel {
      width: min(980px, 100%);
      max-height: min(760px, 88vh);
      display: grid;
      grid-template-rows: auto 1fr;
      overflow: hidden;
      border: 1px solid var(--line);
      border-radius: 18px;
      background: var(--panel);
      box-shadow: 0 28px 80px rgba(0, 0, 0, .5);
    }
    .modal-head {
      display: flex;
      align-items: flex-start;
      justify-content: space-between;
      gap: 16px;
      padding: 22px 24px;
      border-bottom: 1px solid var(--line);
    }
    .modal-title {
      margin: 0;
      font-size: 24px;
      font-weight: 800;
    }
    .modal-body {
      overflow: auto;
      min-height: 0;
      padding: 18px 24px 24px;
      scrollbar-width: thin;
      scrollbar-color: transparent transparent;
    }
    .modal-body.scrolling {
      scrollbar-color: rgba(255, 255, 255, .32) transparent;
    }
    .modal-body::-webkit-scrollbar {
      width: 8px;
    }
    .modal-body::-webkit-scrollbar-track {
      background: transparent;
    }
    .modal-body::-webkit-scrollbar-thumb {
      background: transparent;
      border-radius: 999px;
      border: 2px solid transparent;
      background-clip: padding-box;
    }
    .modal-body.scrolling::-webkit-scrollbar-thumb {
      background-color: rgba(255, 255, 255, .32);
    }
    .modal-panel {
      animation: modal-in .18s ease;
    }
    @keyframes modal-in {
      from { opacity: 0; transform: translateY(12px) scale(.98); }
      to { opacity: 1; transform: none; }
    }
    .modal-detail-head {
      display: flex;
      align-items: center;
      gap: 12px;
      min-width: 0;
    }
    .modal-detail-head > div {
      min-width: 0;
    }
    .modal-detail-head .app-icon,
    .modal-detail-head .avatar {
      width: 48px;
      height: 48px;
      flex: 0 0 auto;
    }
    .modal-detail-head .modal-title {
      overflow-wrap: anywhere;
    }
    .change-card {
      border: 1px solid var(--line);
      border-radius: 14px;
      padding: 16px;
      background: #202228;
    }
    .change-card + .change-card {
      margin-top: 12px;
    }
    .change-head {
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 12px;
      margin-bottom: 12px;
    }
    .change-title {
      display: flex;
      align-items: center;
      gap: 10px;
      min-width: 0;
      font-weight: 800;
    }
    .change-list {
      display: grid;
      gap: 8px;
      margin-top: 12px;
    }
    .change-item {
      display: flex;
      align-items: baseline;
      gap: 8px;
      color: var(--text);
      overflow-wrap: anywhere;
    }
    .change-category {
      color: var(--accent-2);
      font-size: 12px;
      font-weight: 800;
      white-space: nowrap;
    }
    @media (max-width: 1080px) {
      header { position: static; }
      .top { grid-template-columns: 1fr; }
      .stats { max-width: none; }
      .toolbar { grid-template-columns: minmax(0, 1fr) auto; }
      .toolbar .tabs { grid-column: 1 / -1; }
      .host-tabs button { flex: 1 1 0; }
      #search { grid-column: 1 / -1; }
    }
    @media (max-height: 520px) and (orientation: landscape) {
      .wrap { padding-top: 12px; padding-bottom: 12px; }
      .nav { padding-bottom: 6px; }
      .top { padding: 6px 0 10px; }
      .toolbar { margin-top: 10px; }
    }
    @media (max-width: 760px) {
      header { position: static; }
      .nav {
        align-items: flex-start;
        flex-direction: column;
        padding-bottom: 10px;
      }
      .header-actions {
        display: grid;
        grid-template-columns: minmax(0, 1fr) 54px 54px;
        width: 100%;
      }
      .header-actions .button {
        width: 100%;
      }
      #whatsNewButton {
        white-space: nowrap;
        font-size: 14px;
      }
      .header-actions .icon-button {
        width: 54px;
        height: 54px;
      }
      #configLink {
        grid-column: 1 / -1;
      }
      .top, .toolbar, .row { grid-template-columns: 1fr; }
      .card-head { grid-template-columns: 1fr; }
      .top { padding: 8px 0 10px; }
      h1 {
        font-size: 32px;
      }
      .stats {
        grid-template-columns: repeat(2, minmax(0, 1fr));
        width: 100%;
        gap: 8px;
      }
      .stat {
        min-width: 0;
        padding: 7px 10px;
      }
      .list { grid-template-columns: 1fr; }
      .toolbar {
        gap: 10px;
        width: 100%;
      }
      .tabs {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        width: 100%;
      }
      .host-tabs {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        width: 100%;
      }
      .tabs button {
        padding: 10px 8px;
        white-space: nowrap;
      }
      .host-tabs button {
        min-width: 0;
        padding: 10px 8px;
        white-space: nowrap;
      }
      .actions { justify-content: flex-start; }
      button, a.button { min-height: 44px; }
      .repo-actions { justify-content: flex-start; }
      .bundle-actions {
        display: flex;
        flex-wrap: wrap;
        width: 100%;
      }
      .row {
        padding: 14px;
        border-radius: 12px;
      }
      .list .row {
        grid-template-rows: auto auto;
      }
      .avatar, .app-icon {
        width: 46px;
        height: 46px;
      }
      .title-line {
        gap: 10px;
      }
      .source-grid {
        grid-template-columns: 1fr;
      }
      .source-card {
        padding: 12px;
      }
      .source-card-head {
        align-items: flex-start;
      }
      .source-card-title {
        grid-template-columns: 46px minmax(0, 1fr);
      }
      .source-card-title .badge {
        grid-column: 2;
        justify-self: start;
      }
      .source-actions {
        margin-left: 0;
        flex-wrap: wrap;
      }
      .source-actions .obtainium {
        max-width: none;
      }
      .chip {
        border-radius: 999px;
        padding: 6px 10px;
        max-width: 100%;
      }
      .patch-item {
        padding: 9px 10px;
      }
      .wrap {
        width: 100%;
        padding: 14px;
      }
      .back-top {
        right: 16px;
      }
      .modal {
        padding: 10px;
      }
      .modal-head {
        padding: 16px;
      }
      .modal-body {
        padding: 14px;
      }
    }
    @media (max-width: 520px) {
      .stats { grid-template-columns: repeat(2, minmax(0, 1fr)); }
      h1 {
        font-size: 29px;
      }
      .brand {
        font-size: 22px;
      }
      .modal-head .icon-button { font-size: 20px; }
      .list {
        gap: 12px;
      }
      input, select, button, a.button {
        width: 100%;
      }
      .stat {
        padding: 7px 9px;
      }
      .stat strong {
        font-size: 19px;
      }
      .stat span {
        font-size: 10px;
      }
      .actions .button {
        flex: 1 1 0;
      }
      .meta {
        gap: 6px;
      }
      .subline {
        font-size: 12px;
      }
    }
    @media (max-width: 380px) {
      .wrap { padding: 12px; }
      h1 { font-size: 26px; }
      .brand { font-size: 20px; }
      .brand-mark { font-size: 26px; }
      .stat strong { font-size: 17px; }
      .tabs button, .host-tabs button { padding: 10px 4px; }
    }
  </style>
</head>
<body id="top">
  <header>
    <div class="wrap">
      <div class="nav">
        <div class="brand"><span class="brand-mark">M</span><span>orphe Archive</span></div>
        <div class="header-actions">
          <button id="whatsNewButton" class="button" type="button">What's New</button>
          <a class="button icon-button" href="https://github.com/rushiforai/morphe-archive" target="_blank" rel="noreferrer" aria-label="Source code" title="Source code">
            <svg viewBox="0 0 24 24" aria-hidden="true" fill="currentColor">
              <path d="M12 .5a12 12 0 0 0-3.8 23.38c.6.12.82-.25.82-.57v-2.1c-3.34.73-4.04-1.42-4.04-1.42-.55-1.4-1.34-1.78-1.34-1.78-1.09-.74.08-.73.08-.73 1.2.09 1.84 1.24 1.84 1.24 1.08 1.83 2.82 1.3 3.5 1 .11-.78.42-1.3.76-1.6-2.66-.3-5.46-1.33-5.46-5.92 0-1.31.47-2.38 1.24-3.22-.13-.3-.54-1.52.12-3.18 0 0 1.01-.32 3.3 1.23a11.4 11.4 0 0 1 6 0c2.29-1.55 3.3-1.23 3.3-1.23.66 1.66.25 2.88.12 3.18.77.84 1.24 1.9 1.24 3.22 0 4.6-2.8 5.62-5.48 5.92.43.37.82 1.1.82 2.22v3.3c0 .32.22.7.83.57A12 12 0 0 0 12 .5Z"/>
            </svg>
          </a>
          <a class="button icon-button" href="https://github.com/rushiranpise/morphe-patches#donate" target="_blank" rel="noreferrer" aria-label="Donate" title="Donate">
            <svg viewBox="0 0 24 24" aria-hidden="true" fill="currentColor">
              <path d="M12 21.35 10.55 20.03C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.08A6.02 6.02 0 0 1 16.5 3C19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35Z"/>
            </svg>
          </a>
          <a id="configLink" class="button primary" href="#">Download Config</a>
        </div>
      </div>
      <div class="top">
        <div>
          <h1>Community <span class="accent-text">Patch Sources</span></h1>
          <p>Browse working Morphe patch bundles, supported apps, and universal patches that are not tied to one package.</p>
          <div class="subline">
            <span id="generatedAt">Loading archive data</span>
          </div>
        </div>
        <div class="stats">
          <div class="stat"><strong id="repoCount">0</strong><span>sources</span></div>
          <div class="stat"><strong id="appCount">0</strong><span>apps</span></div>
          <div class="stat"><strong id="patchCount">0</strong><span>patches</span></div>
          <div class="stat"><strong id="universalCount">0</strong><span>universal</span></div>
        </div>
      </div>
      <div class="toolbar">
        <div class="tabs">
          <button id="appsTab" class="active" type="button">Apps</button>
          <button id="reposTab" type="button">Bundles</button>
          <button id="universalTab" type="button">Universal</button>
        </div>
        <div id="hostFilter" class="host-tabs" aria-label="Filter by host"></div>
        <select id="sortMode" aria-label="Sort results">
          <option value="name">Name</option>
          <option value="patches">Most patches</option>
          <option value="apps">Most apps</option>
          <option value="sources">Most sources</option>
        </select>
        <input id="search" type="search" placeholder="Search bundles, apps, packages, patches">
      </div>
    </div>
  </header>
  <main>
    <div class="wrap">
      <div id="list" class="list"></div>
      <div class="site-counter" aria-label="Visitor counter">
        <span class="visitors-label">Visitors</span>
        <a href="http://www.freevisitorcounters.com">free counters</a>
        <script type="text/javascript" src="https://www.freevisitorcounters.com/auth.php?id=f0dabb4db81ab3202c8ff62bee44138e7bc9f57e"></script>
        <script type="text/javascript" src="https://www.freevisitorcounters.com/en/home/counter/1603757/t/5"></script>
      </div>
    </div>
  </main>
  <a class="back-top" href="#top" aria-label="Back to top">↑</a>
  <footer class="mobile-footer">Use at your own risk. Community sources are not individually verified.</footer>
  <div id="whatsNewModal" class="modal" hidden>
    <section class="modal-panel" role="dialog" aria-modal="true" aria-labelledby="whatsNewTitle">
      <div class="modal-head">
        <div>
          <h2 id="whatsNewTitle" class="modal-title">What's New</h2>
          <p>Latest changelog entries from patch sources.</p>
        </div>
        <button id="closeWhatsNew" class="button icon-button" type="button" aria-label="Close">x</button>
      </div>
      <div id="whatsNewBody" class="modal-body"></div>
    </section>
  </div>
  <div id="detailModal" class="modal" hidden>
    <section class="modal-panel" role="dialog" aria-modal="true" aria-labelledby="detailModalTitle">
      <div class="modal-head">
        <div id="detailModalHead" class="modal-detail-head"></div>
        <button id="closeDetailModal" class="button icon-button" type="button" aria-label="Close">x</button>
      </div>
      <div id="detailModalBody" class="modal-body"></div>
    </section>
  </div>
  <script>
    const state = { tab: "apps", query: "", host: "all", sort: "name", data: null };
    const list = document.getElementById("list");
    const search = document.getElementById("search");
    const hostFilter = document.getElementById("hostFilter");
    const sortMode = document.getElementById("sortMode");
    const reposTab = document.getElementById("reposTab");
    const appsTab = document.getElementById("appsTab");
    const universalTab = document.getElementById("universalTab");
    const whatsNewButton = document.getElementById("whatsNewButton");
    const whatsNewModal = document.getElementById("whatsNewModal");
    const whatsNewBody = document.getElementById("whatsNewBody");
    const closeWhatsNew = document.getElementById("closeWhatsNew");
    const detailModal = document.getElementById("detailModal");
    const detailModalHead = document.getElementById("detailModalHead");
    const detailModalBody = document.getElementById("detailModalBody");
    const closeDetailModal = document.getElementById("closeDetailModal");
    let lastOpener = null;

    function escapeHtml(value) {
      const div = document.createElement("div");
      div.textContent = String(value || "");
      return div.innerHTML;
    }

    function textMatch(value) {
      return String(value || "").toLowerCase().includes(state.query);
    }

    function hostBadge(host, url = "") {
      const label = host === "gitlab.com" ? "GitLab" : host === "github.com" ? "GitHub" : host || "Other";
      const cls = host === "gitlab.com" ? "gitlab" : host === "github.com" ? "github" : "other";
      if (url) return `<a class="badge host-${cls}" href="${url}" target="_blank" rel="noreferrer">${label}</a>`;
      return `<span class="badge host-${cls}">${label}</span>`;
    }

    function initials(value) {
      const clean = String(value || "?").replace(/[^a-z0-9]+/gi, " ").trim();
      return clean ? clean.split(" ").slice(0, 2).map((part) => part[0]).join("").toUpperCase() : "?";
    }

    function avatarHtml(url, label) {
      const text = escapeHtml(initials(label));
      if (!url) return `<span class="avatar fallback">${text}</span>`;
      return `<span class="avatar fallback">${text}<img src="${url}" alt="" loading="lazy" onerror="this.remove()"></span>`;
    }

    function appIconHtml(app) {
      const label = initials(app.name || app.packageName);
      const color = app.iconColor || "#2f3542";
      if (app.iconUrl) return `<span class="app-icon fallback" style="--icon-color:${escapeHtml(color)}">${escapeHtml(label)}<img src="${app.iconUrl}" alt="" loading="lazy" onerror="this.remove()"></span>`;
      return `<span class="app-icon fallback" style="--icon-color:${escapeHtml(color)}" title="Icon unavailable">${escapeHtml(label)}</span>`;
    }

    function slugify(value) {
      return String(value || "")
        .toLowerCase()
        .replace(/&/g, "and")
        .replace(/\\+/g, "plus")
        .replace(/[^a-z0-9]+/g, "-")
        .replace(/^-+|-+$/g, "");
    }

    function escapeRegex(value) {
      return String(value || "").replace(/[.*+?^${}()|[\\]\\\\]/g, "\\\\$&");
    }

    function obtainiumUrl(app, source) {
      const repoOwner = source.repo.split("/")[0] || "source";
      const builder = source.builder || {};
      const hasMultipleSources = app.sources.length > 1;
      const packageId = app.packageName;
      const appName = hasMultipleSources
        ? `${app.name} (${repoOwner})`
        : app.name;
      const builderRepo = builder.repo || "rushiforai/morphe-builder";
      const builderUrl = builder.webUrl || `https://github.com/${builderRepo}`;
      const assetName = builder.assetName || `${slugify(app.name || app.packageName)}-${slugify(source.repo.replace("/", "-"))}.apk`;
      const payload = {
        id: packageId,
        url: builderUrl,
        author: "rushiforai",
        name: appName,
        preferredApkIndex: 0,
        additionalSettings: JSON.stringify({
          includePrereleases: false,
          fallbackToOlderReleases: true,
          filterReleaseTitlesByRegEx: "",
          filterReleaseNotesByRegEx: "",
          verifyLatestTag: false,
          sortMethodChoice: "date",
          useLatestAssetDateAsReleaseDate: false,
          releaseTitleAsVersion: false,
          trackOnly: false,
          versionExtractionRegEx: "",
          matchGroupToUse: "",
          versionDetection: false,
          releaseDateAsVersion: false,
          useVersionCodeAsOSVersion: false,
          apkFilterRegEx: `^${escapeRegex(assetName)}$`,
          invertAPKFilter: false,
          autoApkFilterByArch: true,
          appName: "",
          appAuthor: "",
          shizukuPretendToBeGooglePlay: false,
          allowInsecure: false,
          exemptFromBackgroundUpdates: false,
          skipUpdateNotifications: false,
          about: "",
          refreshBeforeDownload: false,
          includeZips: false,
          zippedApkFilterRegEx: ""
        }),
        overrideSource: "GitHub"
      };
      return `https://apps.obtainium.imranr.dev/redirect?r=obtainium://app/${encodeURIComponent(JSON.stringify(payload))}`;
    }

    function sortRows(rows) {
      return rows.sort((a, b) => {
        if (state.sort === "patches") return (b.patchCount || b.patches?.length || 0) - (a.patchCount || a.patches?.length || 0);
        if (state.sort === "apps") return (b.appCount || 0) - (a.appCount || 0);
        if (state.sort === "sources") return (b.repos?.length || 0) - (a.repos?.length || 0);
        return String(a.repo || a.name).localeCompare(String(b.repo || b.name));
      });
    }

    function repoRow(repo) {
      const row = document.createElement("article");
      row.className = "row has-expand";
      row.innerHTML = `
        <div>
          <div class="title-line">
            ${avatarHtml(repo.avatarUrl, repo.repo)}
            <div>
              <div class="name">${escapeHtml(repo.repo)}</div>
              <div class="meta">
                ${hostBadge(repo.host, repo.webUrl)}
              </div>
              <div class="count-line"><span>${repo.patchCount} patches</span><span>${repo.appCount} apps</span></div>
            </div>
          </div>
        </div>`;
      makeClickable(row, () => openRepoModal(repo));
      return row;
    }

    function patchChips(patches, limit = 16) {
      const shown = patches.slice(0, limit).map((patch) => `
        <div class="patch-item">${escapeHtml(patch.name)}${patch.description ? `<span class="patch-note">${escapeHtml(patch.description)}</span>` : ""}</div>
      `).join("");
      const more = patches.length > limit ? `<div class="patch-item">+${patches.length - limit} more patches</div>` : "";
      return shown + more;
    }

    function makeClickable(row, open) {
      row.setAttribute("role", "button");
      row.setAttribute("tabindex", "0");
      row.setAttribute("aria-haspopup", "dialog");
      row.addEventListener("click", (event) => {
        if (event.target.closest("a, button")) return;
        lastOpener = row;
        open();
      });
      row.addEventListener("keydown", (event) => {
        if (event.key === "Enter" || event.key === " ") {
          event.preventDefault();
          lastOpener = row;
          open();
        }
      });
    }

    function sourceCardsHtml(app) {
      return app.sources.map((source) => {
        const sourcePatches = patchChips(source.patches, 16);
        const sourceVersions = source.versions.slice(0, 6).map((version) => `<span class="chip">${escapeHtml(version)}</span>`).join("");
        return `
          <div class="source-card">
            <div class="source-card-head card-head">
              <div class="source-card-title">${avatarHtml(source.avatarUrl, source.repo)}<span>${escapeHtml(source.repo)}</span>${hostBadge(source.host, source.webUrl)}</div>
              <div class="actions source-actions">
                <a class="button primary" href="${source.addUrl}" target="_blank" rel="noreferrer">Add Source</a>
                <a class="button obtainium" href="${obtainiumUrl(app, source)}" target="_blank" rel="noreferrer"><span>Add to Obtainium</span></a>
              </div>
            </div>
            <div class="chips">
              ${sourceVersions || '<span class="chip">Any version</span>'}
            </div>
            <div class="patch-list">${sourcePatches || '<div class="patch-item">No patch metadata</div>'}</div>
          </div>`;
      }).join("");
    }

    function appRow(app) {
      const row = document.createElement("article");
      row.className = "row has-expand";
      row.innerHTML = `
        <div>
          <div class="title-line">
            ${appIconHtml(app)}
            <div>
              <div class="name">${escapeHtml(app.name)}</div>
              <div class="meta">
                <span>${escapeHtml(app.packageName)}</span>
              </div>
              <div class="count-line"><span>${app.patches.length} patches</span><span>${app.repos.length} sources</span></div>
            </div>
          </div>
        </div>`;
      makeClickable(row, () => openAppModal(app));
      return row;
    }

    function universalRow(source) {
      const row = document.createElement("article");
      row.className = "row has-expand";
      row.innerHTML = `
        <div>
          <div class="title-line">
            ${avatarHtml(source.avatarUrl, source.repo)}
            <div>
              <div class="name">${escapeHtml(source.repo)}</div>
              <div class="meta">
                ${hostBadge(source.host, source.webUrl)}
              </div>
              <div class="count-line"><span>${source.patchCount} universal patches</span></div>
            </div>
          </div>
        </div>`;
      makeClickable(row, () => openUniversalModal(source));
      return row;
    }

    function renderWhatsNew() {
      const sources = (state.data?.recentSources || []).filter((source) => source.latestChanges?.items?.length);
      const fallback = state.data?.recentSources || [];
      const rows = sources.length ? sources : fallback;
      if (!rows.length) {
        whatsNewBody.innerHTML = '<div class="empty">No changelog entries found yet.</div>';
        return;
      }
      whatsNewBody.innerHTML = rows.map((source) => {
        const changes = source.latestChanges || {};
        const apps = (source.apps || []).slice(0, 8).map((app) => `
          <span class="chip">${escapeHtml(app.name)}${app.patchCount ? ` (${app.patchCount})` : ""}</span>
        `).join("");
        const items = (changes.items || []).map((item) => `
          <div class="change-item">
            ${item.category ? `<span class="change-category">${escapeHtml(item.category)}</span>` : ""}
            <span>${escapeHtml(item.text)}</span>
          </div>
        `).join("");
        const dateText = changes.date || source.updatedDate || source.createdDate || "";
        return `
          <article class="change-card">
            <div class="change-head">
              <div class="change-title">
                ${avatarHtml(source.avatarUrl, source.repo)}
                <div>
                  <div class="name">${escapeHtml(source.repo)}</div>
                  <div class="meta">
                    ${hostBadge(source.host)}
                    <span>${source.patchCount} patches</span>
                    <span>${source.appCount} apps</span>
                    ${dateText ? `<span>${escapeHtml(dateText)}</span>` : ""}
                  </div>
                </div>
              </div>
              <div class="actions">
                <a class="button" href="${source.webUrl}" target="_blank" rel="noreferrer">Open</a>
                <a class="button" href="${source.changelogUrl}" target="_blank" rel="noreferrer">Changelog</a>
              </div>
            </div>
            ${changes.title ? `<div class="subline">${escapeHtml(changes.title)}</div>` : ""}
            ${apps ? `<div class="chips">${apps}</div>` : ""}
            <div class="change-list">${items || '<div class="patch-item">No CHANGELOG.md summary found for this source.</div>'}</div>
          </article>
        `;
      }).join("");
    }

    function openWhatsNew() {
      renderWhatsNew();
      whatsNewModal.hidden = false;
      document.body.style.overflow = "hidden";
    }

    function closeWhatsNewModal() {
      whatsNewModal.hidden = true;
      document.body.style.overflow = "";
    }

    let bodyScrollTimer = null;
    detailModalBody.addEventListener("scroll", () => {
      detailModalBody.classList.add("scrolling");
      clearTimeout(bodyScrollTimer);
      bodyScrollTimer = setTimeout(() => detailModalBody.classList.remove("scrolling"), 900);
    }, { passive: true });

    function showDetailModal(headHtml, bodyHtml) {
      detailModalHead.innerHTML = headHtml;
      detailModalBody.innerHTML = bodyHtml;
      detailModalBody.classList.remove("scrolling");
      clearTimeout(bodyScrollTimer);
      detailModal.hidden = false;
      document.body.style.overflow = "hidden";
      detailModalBody.scrollTop = 0;
      closeDetailModal.focus();
    }

    function closeDetailModalFn() {
      detailModal.hidden = true;
      document.body.style.overflow = "";
      if (lastOpener && document.contains(lastOpener)) lastOpener.focus();
    }

    function openAppModal(app) {
      showDetailModal(
        `
          ${appIconHtml(app)}
          <div>
            <h2 id="detailModalTitle" class="modal-title">${escapeHtml(app.name)}</h2>
            <div class="meta">
              <span>${escapeHtml(app.packageName)}</span>
              <span>${app.patches.length} patches</span>
              <span>${app.repos.length} sources</span>
            </div>
          </div>`,
        `<div class="source-grid">${sourceCardsHtml(app)}</div>`
      );
    }

    function openRepoModal(repo) {
      const apps = (repo.apps || []).slice(0, 24).map((app) => `
        <div class="bundle-app">
          ${appIconHtml(app)}
          <div class="bundle-app-info">
            <div class="name">${escapeHtml(app.name)}</div>
            <div class="meta"><span>${escapeHtml(app.packageName)}</span></div>
            <div class="count-line"><span>${app.patchCount} patches</span></div>
          </div>
        </div>
      `).join("");
      showDetailModal(
        `
          ${avatarHtml(repo.avatarUrl, repo.repo)}
          <div>
            <h2 id="detailModalTitle" class="modal-title">${escapeHtml(repo.repo)}</h2>
            <div class="meta">
              ${hostBadge(repo.host, repo.webUrl)}
              <span>${repo.patchCount} patches</span>
              <span>${repo.appCount} apps</span>
            </div>
          </div>`,
        `
          <div class="actions repo-actions bundle-actions">
            <a class="button" href="${repo.source}" target="_blank" rel="noreferrer">Bundle</a>
            <a class="button primary" href="${repo.addUrl}" target="_blank" rel="noreferrer">Add Source</a>
          </div>
          <div class="bundle-apps">${apps || '<div class="patch-item">No app metadata</div>'}</div>
          ${repo.appCount > 24 ? `<div class="patch-item">+${repo.appCount - 24} more apps</div>` : ""}
          <div class="chips">
            <a class="chip" href="${repo.source}" target="_blank" rel="noreferrer">patches-bundle.json</a>
            <a class="chip" href="${repo.listUrl}" target="_blank" rel="noreferrer">patches-list.json</a>
          </div>`
      );
    }

    function openUniversalModal(source) {
      showDetailModal(
        `
          ${avatarHtml(source.avatarUrl, source.repo)}
          <div>
            <h2 id="detailModalTitle" class="modal-title">${escapeHtml(source.repo)}</h2>
            <div class="meta">
              ${hostBadge(source.host, source.webUrl)}
              <span>${source.patchCount} universal patches</span>
            </div>
          </div>`,
        `
          <div class="actions repo-actions bundle-actions">
            <a class="button primary" href="${source.addUrl}" target="_blank" rel="noreferrer">Add Source</a>
          </div>
          <div class="patch-list">${patchChips(source.patches, 24) || '<div class="patch-item">No patch metadata</div>'}</div>`
      );
    }

    function render() {
      list.innerHTML = "";
      reposTab.classList.toggle("active", state.tab === "repos");
      appsTab.classList.toggle("active", state.tab === "apps");
      universalTab.classList.toggle("active", state.tab === "universal");
      hostFilter.querySelectorAll("button").forEach((button) => {
        button.classList.toggle("active", button.dataset.host === state.host);
      });

      let rows = [];
      if (state.tab === "repos") {
        rows = state.data.repos.filter((repo) =>
          (state.host === "all" || repo.host === state.host) &&
          (!state.query || [repo.repo, repo.name, repo.host].some(textMatch))
        );
      } else if (state.tab === "universal") {
        rows = state.data.universalSources.filter((source) =>
          (state.host === "all" || source.host === state.host) &&
          (!state.query || [source.repo, source.host, source.patches.map((patch) => patch.name).join(" ")].some(textMatch))
        );
      } else {
        rows = state.data.apps.filter((app) =>
          (state.host === "all" || app.sources.some((source) => source.host === state.host)) &&
          (!state.query || [
            app.name,
            app.packageName,
            app.repos.join(" "),
            app.patches.join(" ")
          ].some(textMatch))
        );
      }
      rows = sortRows(rows);

      if (!rows.length) {
        list.innerHTML = '<div class="empty">No matches found.</div>';
        return;
      }

      rows.forEach((item) => {
        if (state.tab === "repos") list.appendChild(repoRow(item));
        else if (state.tab === "universal") list.appendChild(universalRow(item));
        else list.appendChild(appRow(item));
      });
    }

    fetch("data.json")
      .then((response) => response.json())
      .then((data) => {
        state.data = data;
        document.getElementById("repoCount").textContent = data.repoCount;
        document.getElementById("appCount").textContent = data.appCount;
        document.getElementById("patchCount").textContent = data.patchCount;
        document.getElementById("universalCount").textContent = data.universalPatchCount;
        document.getElementById("generatedAt").textContent = `Generated ${data.generatedAt}`;
        const configLink = document.getElementById("configLink");
        configLink.href = data.configFile;
        configLink.download = data.configFile;
        configLink.textContent = `Download Config v${data.configVersion}`;
        const hostOptions = [["all", "All"], ...Object.keys(data.hostCounts || {}).map((host) => [host, host === "github.com" ? "GitHub" : host === "gitlab.com" ? "GitLab" : host || "Other"])];
        hostOptions.forEach(([host, label]) => {
          const button = document.createElement("button");
          button.type = "button";
          button.dataset.host = host;
          button.textContent = label;
          button.addEventListener("click", () => { state.host = host; render(); });
          hostFilter.appendChild(button);
        });
        render();
      });

    search.addEventListener("input", () => {
      state.query = search.value.trim().toLowerCase();
      render();
    });
    sortMode.addEventListener("change", () => { state.sort = sortMode.value; render(); });
    reposTab.addEventListener("click", () => { state.tab = "repos"; render(); });
    appsTab.addEventListener("click", () => { state.tab = "apps"; render(); });
    universalTab.addEventListener("click", () => { state.tab = "universal"; render(); });
    whatsNewButton.addEventListener("click", openWhatsNew);
    closeWhatsNew.addEventListener("click", closeWhatsNewModal);
    whatsNewModal.addEventListener("click", (event) => {
      if (event.target === whatsNewModal) closeWhatsNewModal();
    });
    closeDetailModal.addEventListener("click", closeDetailModalFn);
    detailModal.addEventListener("click", (event) => {
      if (event.target === detailModal) closeDetailModalFn();
    });
    document.addEventListener("keydown", (event) => {
      if (event.key !== "Escape") return;
      if (!detailModal.hidden) { closeDetailModalFn(); return; }
      if (!whatsNewModal.hidden) closeWhatsNewModal();
    });
  </script>
</body>
</html>
"""


def main():
    OUTPUT_DIR.mkdir(exist_ok=True)
    data = build_data()
    config_source = Path(data["configFile"])
    (OUTPUT_DIR / "data.json").write_text(json.dumps(data, indent=2) + "\n", encoding="utf-8")
    (OUTPUT_DIR / "index.html").write_text(HTML, encoding="utf-8")
    (OUTPUT_DIR / data["configFile"]).write_text(config_source.read_text(encoding="utf-8"), encoding="utf-8")
    print(f"Wrote {OUTPUT_DIR / 'index.html'}")
    print(f"Wrote {OUTPUT_DIR / 'data.json'} with {data['repoCount']} repos and {data['appCount']} apps")
    print(f"Wrote {OUTPUT_DIR / data['configFile']}")


if __name__ == "__main__":
    main()
