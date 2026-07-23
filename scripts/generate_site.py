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


def patches_list_url(bundle_url):
    return bundle_url.rsplit("/", 1)[0] + "/patches-list.json"


def collect_patch_metadata(bundle):
    data = fetch_json(patches_list_url(bundle["source"]))
    patches = data.get("patches", []) if isinstance(data, dict) else []
    apps = {}

    for patch in patches:
        for app in patch.get("compatiblePackages", []) or []:
            if isinstance(app, str):
                app = {"packageName": app, "name": app}
            if not isinstance(app, dict):
                continue
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
                    "versions": set(),
                },
            )
            entry["patches"].add(patch.get("name") or "Unnamed patch")
            entry["versions"].update(versions)

    normalized_apps = []
    for app in apps.values():
        normalized_apps.append(
            {
                "packageName": app["packageName"],
                "name": app["name"],
                "patches": sorted(app["patches"], key=str.lower),
                "versions": sorted(app["versions"], key=str.lower),
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
                    "patches": set(),
                    "versions": set(),
                },
            )
            existing["repos"].append(repo_path)
            existing["patches"].update(app["patches"])
            existing["versions"].update(app["versions"])

    apps = []
    for app in apps_by_package.values():
        apps.append(
            {
                "packageName": app["packageName"],
                "name": app["name"],
                "repos": sorted(set(app["repos"]), key=str.lower),
                "patches": sorted(app["patches"], key=str.lower),
                "versions": sorted(app["versions"], key=str.lower),
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
    }
    .row:hover { border-color: #46505f; }
    .name {
      font-weight: 700;
      color: var(--text);
      overflow-wrap: anywhere;
    }
    .meta {
      display: flex;
      gap: 10px;
      flex-wrap: wrap;
      color: var(--muted);
      font-size: 13px;
      margin-top: 4px;
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
          <div class="name">${escapeHtml(repo.repo)}</div>
          <div class="meta">
            ${hostBadge(repo.host)}
            <span>${repo.patchCount} patches</span>
            <span>${repo.appCount} apps</span>
          </div>
        </div>
        <div class="actions">
          <a class="button" href="${repo.webUrl}" target="_blank" rel="noreferrer">Open</a>
          <a class="button" href="${repo.source}" target="_blank" rel="noreferrer">Bundle</a>
          <a class="button primary" href="${repo.addUrl}" target="_blank" rel="noreferrer">Add to Morphe</a>
        </div>
        <details>
          <summary>Source details</summary>
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
      const patches = app.patches.slice(0, 18).map((patch) => `<span class="chip">${escapeHtml(patch)}</span>`).join("");
      const versions = app.versions.slice(0, 8).map((version) => `<span class="chip">${escapeHtml(version)}</span>`).join("");
      row.innerHTML = `
        <div>
          <div class="name">${escapeHtml(app.name)}</div>
          <div class="meta">
            <span>${escapeHtml(app.packageName)}</span>
            <span>${app.patches.length} patches</span>
            <span>${app.repos.length} sources</span>
          </div>
        </div>
        <div class="actions">
          ${repo ? `<a class="button" href="${repo.webUrl}" target="_blank" rel="noreferrer">Source</a><a class="button primary" href="${repo.addUrl}" target="_blank" rel="noreferrer">Add Source</a>` : ""}
        </div>
        <details>
          <summary>Patch and version details</summary>
          <div class="chips">
            ${versions || '<span class="chip">Any version</span>'}
            ${patches}
            ${app.patches.length > 18 ? `<span class="chip">+${app.patches.length - 18} more patches</span>` : ""}
          </div>
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
