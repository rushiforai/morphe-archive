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


def collect_patch_metadata(bundle):
    data = fetch_json(patches_list_url(bundle["source"]))
    patches = data.get("patches", []) if isinstance(data, dict) else []
    apps = {}

    for patch in patches:
        patch_name = patch.get("name") or "Unnamed patch"
        patch_description = patch.get("description") or ""
        for app in normalize_compatible_packages(patch.get("compatiblePackages", []) or []):
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
                    "iconUrl": app.get("iconUrl") or app.get("appIconUrl") or "",
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

    return len(patches), sorted(normalized_apps, key=lambda item: item["name"].lower())


def build_data():
    config_file, config_version = latest_config_file()
    config = json.loads(config_file.read_text(encoding="utf-8"))
    bundles = config.get("settings", {}).get("customBundles", [])

    repos = []
    apps_by_package = {}
    host_counts = defaultdict(int)
    total_patch_count = 0

    for bundle in bundles:
        host, repo_path = repo_from_source(bundle.get("source", ""))
        patch_count, apps = collect_patch_metadata(bundle)
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
        "hostCounts": dict(sorted(host_counts.items())),
        "repos": sorted(repos, key=lambda item: item["repo"].lower()),
        "apps": sorted(apps, key=lambda item: item["name"].lower()),
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
      --bg: #0f1115;
      --panel: #181b21;
      --panel-2: #20242c;
      --line: #2d333d;
      --text: #f4f6f8;
      --muted: #a9b1bd;
      --accent: #74d99f;
      --accent-2: #93baff;
      --warn: #f2c56c;
      --shadow: 0 18px 45px rgba(0, 0, 0, .24);
    }
    * { box-sizing: border-box; }
    body {
      margin: 0;
      font-family: Inter, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
      background: linear-gradient(180deg, #14171d 0, var(--bg) 420px);
      color: var(--text);
      line-height: 1.5;
    }
    header {
      border-bottom: 1px solid var(--line);
      background: #121418;
    }
    .wrap {
      max-width: 1180px;
      margin: 0 auto;
      padding: 24px;
    }
    .top {
      display: grid;
      grid-template-columns: 1fr auto;
      gap: 20px;
      align-items: end;
    }
    h1 {
      margin: 0 0 8px;
      font-size: clamp(30px, 4vw, 52px);
      line-height: 1;
      letter-spacing: 0;
    }
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
      grid-template-columns: repeat(3, minmax(96px, 1fr));
      gap: 10px;
      flex-wrap: wrap;
      justify-content: flex-end;
    }
    .stat {
      border: 1px solid var(--line);
      background: var(--panel);
      padding: 10px 12px;
      border-radius: 8px;
      min-width: 104px;
      box-shadow: var(--shadow);
    }
    .stat strong { display: block; font-size: 22px; }
    .toolbar {
      display: grid;
      grid-template-columns: minmax(220px, 1fr) auto auto auto;
      gap: 12px;
      margin-top: 22px;
    }
    input, select, button, a.button {
      border: 1px solid var(--line);
      background: var(--panel);
      color: var(--text);
      border-radius: 6px;
      padding: 11px 12px;
      font: inherit;
    }
    input { width: 100%; }
    select { min-width: 140px; }
    .tabs {
      display: flex;
      gap: 8px;
      flex-wrap: wrap;
    }
    button.active {
      border-color: var(--accent);
      color: #08110d;
      background: var(--accent);
    }
    main .wrap { padding-top: 18px; }
    .list {
      display: grid;
      gap: 10px;
    }
    .row {
      display: grid;
      grid-template-columns: 1fr auto;
      gap: 16px;
      align-items: center;
      border: 1px solid var(--line);
      background: var(--panel);
      padding: 14px;
      border-radius: 8px;
      box-shadow: var(--shadow);
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
      align-items: center;
      gap: 12px;
      min-width: 0;
    }
    .avatar, .app-icon {
      width: 40px;
      height: 40px;
      border-radius: 8px;
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
      justify-content: flex-end;
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
      grid-column: 1 / -1;
      border-top: 1px solid var(--line);
      margin-top: 2px;
      padding-top: 10px;
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
      grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
      gap: 10px;
      margin-top: 10px;
    }
    .source-card {
      border: 1px solid var(--line);
      border-radius: 8px;
      padding: 12px;
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
      margin-top: 18px;
      border-top: 1px solid var(--line);
      padding-top: 16px;
      color: var(--muted);
      font-size: 13px;
    }
    @media (max-width: 760px) {
      .top, .toolbar, .row { grid-template-columns: 1fr; }
      .stats { grid-template-columns: repeat(3, 1fr); }
      .actions { justify-content: flex-start; }
      .wrap { padding: 18px; }
    }
    @media (max-width: 520px) {
      .stats { grid-template-columns: 1fr; }
    }
  </style>
</head>
<body>
  <header>
    <div class="wrap">
      <div class="top">
        <div>
          <h1>Morphe Archive</h1>
          <p>Search working Morphe patch sources, open their repositories, and add them to Morphe Manager.</p>
          <div class="subline">
            <span id="generatedAt">Loading archive data</span>
            <div class="header-actions">
              <a id="configLink" class="button primary" href="#">Download Manager Config</a>
            </div>
          </div>
        </div>
        <div class="stats">
          <div class="stat"><strong id="repoCount">0</strong><span>sources</span></div>
          <div class="stat"><strong id="appCount">0</strong><span>apps</span></div>
          <div class="stat"><strong id="patchCount">0</strong><span>patches</span></div>
        </div>
      </div>
      <div class="toolbar">
        <input id="search" type="search" placeholder="Search repos, apps, packages, patches">
        <select id="hostFilter" aria-label="Filter by host">
          <option value="all">All hosts</option>
        </select>
        <select id="sortMode" aria-label="Sort results">
          <option value="name">Name</option>
          <option value="patches">Most patches</option>
          <option value="apps">Most apps</option>
          <option value="sources">Most sources</option>
        </select>
        <div class="tabs">
          <button id="reposTab" class="active" type="button">Repos</button>
          <button id="appsTab" type="button">Apps</button>
        </div>
      </div>
    </div>
  </header>
  <main>
    <div class="wrap">
      <div id="list" class="list"></div>
      <p class="disclaimer">Use at your own risk. This site indexes possible Morphe patch sources but does not verify every repository or patch behavior. Patch failures, account bans, device issues, data loss, and other side effects are your responsibility.</p>
    </div>
  </main>
  <script>
    const state = { tab: "repos", query: "", host: "all", sort: "name", data: null };
    const list = document.getElementById("list");
    const search = document.getElementById("search");
    const hostFilter = document.getElementById("hostFilter");
    const sortMode = document.getElementById("sortMode");
    const reposTab = document.getElementById("reposTab");
    const appsTab = document.getElementById("appsTab");

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
      if (app.iconUrl) return `<span class="app-icon"><img src="${app.iconUrl}" alt="" loading="lazy" onerror="this.remove(); this.parentElement.textContent='${escapeHtml(label)}'"></span>`;
      return `<span class="app-icon" style="background:${escapeHtml(color)}">${escapeHtml(label)}</span>`;
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

    function appRow(app) {
      const repo = state.data.repos.find((item) => app.repos.includes(item.repo));
      const row = document.createElement("article");
      row.className = "row";
      const sourceCards = app.sources.map((source) => {
        const sourcePatches = source.patches.slice(0, 16).map((patch) => `
          <span class="chip">${escapeHtml(patch.name)}${patch.description ? `<span class="patch-note">${escapeHtml(patch.description)}</span>` : ""}</span>
        `).join("");
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
        <div class="actions">
          ${repo ? `<a class="button" href="${repo.webUrl}" target="_blank" rel="noreferrer">Source</a><a class="button primary" href="${repo.addUrl}" target="_blank" rel="noreferrer">Add Source</a>` : ""}
        </div>
        <details>
          <summary>${app.sources.length} source${app.sources.length === 1 ? "" : "s"} with separate patch sets</summary>
          <div class="source-grid">${sourceCards}</div>
        </details>`;
      return row;
    }

    function render() {
      list.innerHTML = "";
      reposTab.classList.toggle("active", state.tab === "repos");
      appsTab.classList.toggle("active", state.tab === "apps");

      let rows = state.tab === "repos"
        ? state.data.repos.filter((repo) =>
            (state.host === "all" || repo.host === state.host) &&
            (!state.query || [repo.repo, repo.name, repo.host].some(textMatch))
          )
        : state.data.apps.filter((app) => !state.query || [
            app.name,
            app.packageName,
            app.repos.join(" "),
            app.patches.join(" ")
          ].some(textMatch));
      rows = sortRows(rows);

      if (!rows.length) {
        list.innerHTML = '<div class="empty">No matches found.</div>';
        return;
      }

      rows.forEach((item) => list.appendChild(state.tab === "repos" ? repoRow(item) : appRow(item)));
    }

    fetch("data.json")
      .then((response) => response.json())
      .then((data) => {
        state.data = data;
        document.getElementById("repoCount").textContent = data.repoCount;
        document.getElementById("appCount").textContent = data.appCount;
        document.getElementById("patchCount").textContent = data.patchCount;
        document.getElementById("generatedAt").textContent = `Generated ${data.generatedAt}`;
        const configLink = document.getElementById("configLink");
        configLink.href = `../${data.configFile}`;
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
  </script>
</body>
</html>
"""


def main():
    OUTPUT_DIR.mkdir(exist_ok=True)
    data = build_data()
    (OUTPUT_DIR / "data.json").write_text(json.dumps(data, indent=2) + "\n", encoding="utf-8")
    (OUTPUT_DIR / "index.html").write_text(HTML, encoding="utf-8")
    print(f"Wrote {OUTPUT_DIR / 'index.html'}")
    print(f"Wrote {OUTPUT_DIR / 'data.json'} with {data['repoCount']} repos and {data['appCount']} apps")


if __name__ == "__main__":
    main()
