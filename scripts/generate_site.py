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
        host_counts[host or "other"] += 1
        total_patch_count += patch_count
        repo = {
            "name": bundle.get("name") or repo_path.rsplit("/", 1)[-1],
            "repo": repo_path,
            "host": host,
            "source": bundle.get("source", ""),
            "listUrl": patches_list_url(bundle.get("source", "")),
            "webUrl": web_url(host, repo_path),
            "addUrl": add_to_morphe_url(host, repo_path),
            "avatarUrl": repo_avatar_url(host, repo_path),
            "patchCount": patch_count,
            "appCount": len(apps),
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
                    "avatarUrl": repo["avatarUrl"],
                    "patchCount": len(universal_patches),
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
                "avatarUrl": repo["avatarUrl"],
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
    }


HTML = """<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Morphe Archive</title>
  <meta name="description" content="Search Morphe patch sources and supported apps.">
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
      padding-bottom: 0;
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
      gap: 10px;
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
    .stats {
      display: grid;
      grid-template-columns: repeat(4, minmax(86px, 1fr));
      gap: 10px;
      flex-wrap: wrap;
      justify-content: flex-end;
    }
    .stat {
      border: 1px solid var(--line);
      background: var(--panel);
      padding: 9px 12px;
      border-radius: 8px;
      min-width: 104px;
      box-shadow: var(--shadow);
      text-transform: uppercase;
      font-size: 12px;
      letter-spacing: .04em;
    }
    .stat strong {
      display: block;
      font-size: 22px;
      color: var(--accent);
      letter-spacing: 0;
    }
    .toolbar {
      display: grid;
      grid-template-columns: auto minmax(130px, 160px) minmax(160px, 220px) minmax(220px, 1fr);
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
    button.active {
      color: var(--text);
      background: var(--panel-2);
    }
    main .wrap { padding-top: 18px; }
    .list {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(min(360px, 100%), 1fr));
      gap: 20px;
      align-items: start;
    }
    .row {
      display: grid;
      grid-template-columns: 1fr;
      gap: 14px;
      align-items: start;
      border: 1px solid var(--line);
      background: var(--panel);
      padding: 20px;
      border-radius: 14px;
      box-shadow: var(--shadow);
      min-height: 0;
      min-width: 0;
    }
    .row > .actions {
      margin-left: 68px;
    }
    .row:hover { border-color: #46505f; }
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
    }
    .app-icon.fallback {
      background:
        linear-gradient(135deg, rgba(255,255,255,.18), rgba(255,255,255,0) 45%),
        var(--icon-color, #2f3542);
    }
    .app-icon.fallback::after {
      content: "";
      width: 16px;
      height: 16px;
      border-radius: 5px;
      border: 2px solid rgba(255,255,255,.72);
      box-shadow: 7px 7px 0 -3px rgba(255,255,255,.5);
    }
    .avatar img, .app-icon img {
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
    details {
      border-top: 1px solid var(--line);
      margin-top: 8px;
      padding-top: 14px;
      color: var(--muted);
    }
    summary {
      cursor: pointer;
      color: var(--text);
      font-weight: 650;
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
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: 12px;
      margin-top: 10px;
    }
    .source-card {
      border: 1px solid var(--line);
      border-radius: 14px;
      padding: 14px;
      background: #141820;
    }
    .source-card-head {
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 10px;
      margin-bottom: 8px;
    }
    .source-card-title {
      display: flex;
      align-items: center;
      gap: 8px;
      min-width: 0;
      font-weight: 700;
      overflow-wrap: anywhere;
    }
    .patch-note {
      color: var(--muted);
      font-size: 12px;
      display: block;
      margin-top: 2px;
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
    @media (max-width: 760px) {
      header { position: static; }
      .nav {
        align-items: flex-start;
        flex-direction: column;
        padding-bottom: 10px;
      }
      .header-actions {
        width: 100%;
      }
      .header-actions .button {
        flex: 1 1 0;
      }
      .top, .toolbar, .row { grid-template-columns: 1fr; }
      .top { padding: 8px 0 10px; }
      h1 {
        font-size: 32px;
      }
      .stats {
        grid-template-columns: repeat(2, minmax(0, 1fr));
        width: 100%;
      }
      .stat {
        min-width: 0;
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
      .tabs button {
        padding: 10px 8px;
      }
      .actions { justify-content: flex-start; }
      .row > .actions { margin-left: 0; }
      .row {
        padding: 14px;
        border-radius: 12px;
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
        flex-direction: column;
      }
      .chip {
        border-radius: 10px;
        width: 100%;
      }
      .wrap {
        width: 100%;
        padding: 14px;
      }
    }
    @media (max-width: 520px) {
      .stats {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
      }
      h1 {
        font-size: 29px;
      }
      .brand {
        font-size: 22px;
      }
      .list {
        gap: 12px;
      }
      input, select, button, a.button {
        width: 100%;
      }
      .stat {
        padding: 8px 10px;
      }
      .stat strong {
        font-size: 20px;
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
  </style>
</head>
<body id="top">
  <header>
    <div class="wrap">
      <div class="nav">
        <div class="brand"><span class="brand-mark">M</span><span>orphe Archive</span></div>
        <div class="header-actions">
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
        <select id="hostFilter" aria-label="Filter by host">
          <option value="all">All hosts</option>
        </select>
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
      <p class="disclaimer">Use at your own risk. Sources and patches are community provided and not individually verified.</p>
    </div>
  </main>
  <script>
    const state = { tab: "apps", query: "", host: "all", sort: "name", data: null };
    const list = document.getElementById("list");
    const search = document.getElementById("search");
    const hostFilter = document.getElementById("hostFilter");
    const sortMode = document.getElementById("sortMode");
    const reposTab = document.getElementById("reposTab");
    const appsTab = document.getElementById("appsTab");
    const universalTab = document.getElementById("universalTab");

    function escapeHtml(value) {
      const div = document.createElement("div");
      div.textContent = String(value || "");
      return div.innerHTML;
    }

    function textMatch(value) {
      return String(value || "").toLowerCase().includes(state.query);
    }

    function hostBadge(host) {
      const label = host === "gitlab.com" ? "GitLab" : host === "github.com" ? "GitHub" : host || "Other";
      const cls = host === "gitlab.com" ? "gitlab" : host === "github.com" ? "github" : "other";
      return `<span class="badge host-${cls}">${label}</span>`;
    }

    function initials(value) {
      const clean = String(value || "?").replace(/[^a-z0-9]+/gi, " ").trim();
      return clean ? clean.split(" ").slice(0, 2).map((part) => part[0]).join("").toUpperCase() : "?";
    }

    function avatarHtml(url, label) {
      if (!url) return `<span class="avatar">${escapeHtml(initials(label))}</span>`;
      return `<span class="avatar"><img src="${url}" alt="" loading="lazy" onerror="this.remove(); this.parentElement.textContent='${escapeHtml(initials(label))}'"></span>`;
    }

    function appIconHtml(app) {
      const label = initials(app.name || app.packageName);
      const color = app.iconColor || "#2f3542";
      if (app.iconUrl) return `<span class="app-icon"><img src="${app.iconUrl}" alt="" loading="lazy" onerror="this.remove(); this.parentElement.classList.add('fallback')"></span>`;
      return `<span class="app-icon fallback" style="--icon-color:${escapeHtml(color)}" title="Icon unavailable"></span>`;
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
      row.className = "row";
      row.innerHTML = `
        <div>
          <div class="title-line">
            ${avatarHtml(repo.avatarUrl, repo.repo)}
            <div>
              <div class="name">${escapeHtml(repo.repo)}</div>
              <div class="meta">
                ${hostBadge(repo.host)}
                <span>${repo.patchCount} patches</span>
                <span>${repo.appCount} apps</span>
              </div>
            </div>
          </div>
        </div>
        <div class="actions">
          <a class="button" href="${repo.webUrl}" target="_blank" rel="noreferrer">Open</a>
          <a class="button" href="${repo.source}" target="_blank" rel="noreferrer">Bundle</a>
          <a class="button primary" href="${repo.addUrl}" target="_blank" rel="noreferrer">Add to Morphe</a>
        </div>
        <details>
          <summary>Source details</summary>
          <div class="meta">
            ${hostBadge(repo.host)}
            <span>${repo.patchCount} patches</span>
            <span>${repo.appCount} apps</span>
          </div>
          <div class="chips">
            <a class="chip" href="${repo.source}" target="_blank" rel="noreferrer">patches-bundle.json</a>
            <a class="chip" href="${repo.listUrl}" target="_blank" rel="noreferrer">patches-list.json</a>
          </div>
        </details>`;
      return row;
    }

    function patchChips(patches, limit = 16) {
      const shown = patches.slice(0, limit).map((patch) => `
        <span class="chip">${escapeHtml(patch.name)}${patch.description ? `<span class="patch-note">${escapeHtml(patch.description)}</span>` : ""}</span>
      `).join("");
      const more = patches.length > limit ? `<span class="chip">+${patches.length - limit} more patches</span>` : "";
      return shown + more;
    }

    function appRow(app) {
      const row = document.createElement("article");
      row.className = "row";
      const sourceCards = app.sources.map((source) => {
        const sourcePatches = patchChips(source.patches, 16);
        const sourceVersions = source.versions.slice(0, 6).map((version) => `<span class="chip">${escapeHtml(version)}</span>`).join("");
        return `
          <div class="source-card">
            <div class="source-card-head">
              <div class="source-card-title">${avatarHtml(source.avatarUrl, source.repo)}<span>${escapeHtml(source.repo)}</span></div>
              ${hostBadge(source.host)}
            </div>
            <div class="actions">
              <a class="button" href="${source.webUrl}" target="_blank" rel="noreferrer">Open</a>
              <a class="button primary" href="${source.addUrl}" target="_blank" rel="noreferrer">Add Source</a>
            </div>
            <div class="chips">
              ${sourceVersions || '<span class="chip">Any version</span>'}
              ${sourcePatches || '<span class="chip">No patch metadata</span>'}
              ${source.patches.length > 16 ? `<span class="chip">+${source.patches.length - 16} more patches</span>` : ""}
            </div>
          </div>`;
      }).join("");
      row.innerHTML = `
        <div>
          <div class="title-line">
            ${appIconHtml(app)}
            <div>
              <div class="name">${escapeHtml(app.name)}</div>
              <div class="meta">
                <span>${escapeHtml(app.packageName)}</span>
                <span>${app.patches.length} patches</span>
                <span>${app.repos.length} sources</span>
              </div>
            </div>
          </div>
        </div>
        <details>
          <summary>${app.sources.length} source${app.sources.length === 1 ? "" : "s"}</summary>
          <div class="source-grid">${sourceCards}</div>
        </details>`;
      return row;
    }

    function universalRow(source) {
      const row = document.createElement("article");
      row.className = "row";
      row.innerHTML = `
        <div>
          <div class="title-line">
            ${avatarHtml(source.avatarUrl, source.repo)}
            <div>
              <div class="name">${escapeHtml(source.repo)}</div>
              <div class="meta">
                ${hostBadge(source.host)}
                <span>${source.patchCount} universal patches</span>
              </div>
            </div>
          </div>
        </div>
        <div class="actions">
          <a class="button" href="${source.webUrl}" target="_blank" rel="noreferrer">Open</a>
          <a class="button primary" href="${source.addUrl}" target="_blank" rel="noreferrer">Add Source</a>
        </div>
        <details>
          <summary>Universal patch set</summary>
          <div class="chips">${patchChips(source.patches, 24) || '<span class="chip">No patch metadata</span>'}</div>
        </details>`;
      return row;
    }

    function render() {
      list.innerHTML = "";
      reposTab.classList.toggle("active", state.tab === "repos");
      appsTab.classList.toggle("active", state.tab === "apps");
      universalTab.classList.toggle("active", state.tab === "universal");

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
        rows = state.data.apps.filter((app) => !state.query || [
            app.name,
            app.packageName,
            app.repos.join(" "),
            app.patches.join(" ")
          ].some(textMatch));
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
        Object.entries(data.hostCounts || {}).forEach(([host, count]) => {
          const option = document.createElement("option");
          option.value = host;
          option.textContent = `${host || "Other"} (${count})`;
          hostFilter.appendChild(option);
        });
        render();
      });

    search.addEventListener("input", () => {
      state.query = search.value.trim().toLowerCase();
      render();
    });
    hostFilter.addEventListener("change", () => { state.host = hostFilter.value; render(); });
    sortMode.addEventListener("change", () => { state.sort = sortMode.value; render(); });
    reposTab.addEventListener("click", () => { state.tab = "repos"; render(); });
    appsTab.addEventListener("click", () => { state.tab = "apps"; render(); });
    universalTab.addEventListener("click", () => { state.tab = "universal"; render(); });
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
