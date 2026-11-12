#!/usr/bin/env python3
"""
Generates the patches section of README.md from patches-list.json
and injects it between <!-- PATCHES_START --> / <!-- PATCHES_END --> markers.

python3 generate_patches_readme.py <owner/repo> <branch> [patches-list.json] [README.md]
"""

import json
import re
import sys
from pathlib import Path


if len(sys.argv) < 3:
    print("Usage: generate_patches_readme.py <owner/repo> <branch> [json] [readme]")
    sys.exit(1)

repo_full   = sys.argv[1]
branch      = sys.argv[2]
json_path   = Path(sys.argv[3]) if len(sys.argv) > 3 else Path("patches-list.json")
readme_path = Path(sys.argv[4]) if len(sys.argv) > 4 else Path("README.md")


if "/" not in repo_full:
    raise ValueError(f"Invalid repo format: {repo_full} (expected owner/repo)")

owner, repo = repo_full.split("/", 1)


with open(json_path, encoding="utf-8") as f:
    data = json.load(f)


# Emoji and label suffix for each form factor. Mobile and unspecified use no suffix.
FORM_FACTORS = {
    "TV":         ("📺", "Android TV"),
    "WEARABLE":   ("⌚", "Wear OS"),
    "AUTOMOTIVE": ("🚗", "Android Automotive"),
}


def pkg_emoji(form_factor):
    """Return the emoji for a form factor, or a standard package emoji."""
    return FORM_FACTORS.get(form_factor, ("📦", None))[0]


def pkg_label(name, form_factor):
    """Return the app name, with the form factor appended if it is not mobile."""
    suffix = FORM_FACTORS.get(form_factor, (None, None))[1]
    return f"{name} ({suffix})" if suffix else name


# Group patches by package and form factor; patches with no compatiblePackages are universal.
# The same package name can be used by different apps for each form factor.
# JSON structure: compatiblePackages is a list of objects with
# { packageName, name, formFactor, targets: [{ version, isExperimental, description }] }
by_pkg = {}   # (packageName, formFactor) -> { name, emoji, patches, targets }
universal = {}

for patch in data["patches"]:
    cp = patch.get("compatiblePackages")
    if not cp:
        # Deduplicate universal patches by name
        if patch["name"] not in universal:
            universal[patch["name"]] = patch
        continue
    for pkg_entry in cp:
        pkg  = pkg_entry["packageName"]
        name = pkg_entry.get("name") or pkg  # fall back to package name if no label
        form_factor = pkg_entry.get("formFactor")
        key  = (pkg, form_factor)
        if key not in by_pkg:
            by_pkg[key] = {
                "name":    pkg_label(name, form_factor),
                "emoji":   pkg_emoji(form_factor),
                "patches": {},
                "targets": [],
            }
        for target in pkg_entry.get("targets") or []:
            target_with_type = {**target, "apkFileType": pkg_entry.get("apkFileType")}
            if target_with_type not in by_pkg[key]["targets"]:
                by_pkg[key]["targets"].append(target_with_type)
        # Deduplicate patches that appear across multiple packages
        if patch["name"] not in by_pkg[key]["patches"]:
            by_pkg[key]["patches"][patch["name"]] = patch


def patches_table(patches, package_key=None):
    """Render a sorted patch table for a (package name, form factor) key.

    Compatibility cells are empty when no entry matches package_key, including
    universal patches; matching entries without versions are labeled Any version.
    """
    rows = [
        "| 💊&nbsp;Patch | 📜&nbsp;Description | 🎯&nbsp;Versions / file type | ⚙️&nbsp;Options |",
        "|----------|----------------|----------------|-----------|",
    ]
    for p in sorted(patches, key=lambda x: x["name"]):
        options = p.get("options") or []
        if options:
            # Show only option titles as a bullet list
            parts = [opt.get("title") or opt.get("key") or "" for opt in options]
            opts_cell = "<br>".join(f"• {t}" for t in parts)
        else:
            opts_cell = ""
        desc = (p.get("description") or "").replace("\n", "<br>")
        compatibility = []
        for pkg in p.get("compatiblePackages") or []:
            if (pkg.get("packageName"), pkg.get("formFactor")) != package_key:
                continue
            versions = ", ".join(t["version"] for t in pkg.get("targets") or [] if t.get("version")) or "Any version"
            file_type = pkg.get("apkFileType")
            compatibility.append(f"{versions} ({file_type})" if file_type else versions)
        rows.append(f"| {p['name']} | {desc} | {'<br>'.join(compatibility)} | {opts_cell} |")
    return "\n".join(rows)


def versions_table(targets):
    """Render a markdown table of supported versions.
    Experimental versions get a 🧪 prefix.
    Versions with a description get it shown in a second row below.
    """
    if not targets:
        return ""

    cells = []
    descs = []
    for t in targets:
        ver   = t["version"]
        if ver is None:
            continue
        label = f"🧪&nbsp;{ver}" if t.get("isExperimental") else ver
        if t.get("apkFileType"):
            label += f" ({t['apkFileType']})"
        cells.append(label)
        descs.append((t.get("description") or "").replace("\n", "<br>"))

    if not cells:
        return ""

    header = "| " + " | ".join(cells) + " |"
    sep = "| " + " | ".join(":---:" for _ in cells) + " |"
    rows = [header, sep]

    # Optional description row — only rendered if at least one target has one
    if any(descs):
        rows.append("| " + " | ".join(descs) + " |")

    return "\n".join(rows)


def app_section(label, count, targets, tbl, expanded):
    """Return an app section with supported versions and the supplied patch table.

    Use a Markdown heading when expanded is true; otherwise wrap the section in
    a collapsed HTML details element. Omit supported versions when none render.
    """
    noun = "patch" if count == 1 else "patches"
    heading = f"{label} • {count} {noun}"
    vtbl = versions_table(targets)
    versions_section = f"**🎯 Supported versions:**\n\n{vtbl}\n\n" if vtbl else ""
    body = f"{versions_section}{tbl}"
    if expanded:
        return f"### {heading}\n\n{body}"
    return f"<details>\n<summary>{heading}</summary>\n\n{body}\n\n</details>"


def build_content(expanded=False):
    """Return the release summary and app sections, followed by universal patches.

    App sections are collapsed by default; expanded opens all sections as
    Markdown headings.
    """
    lines = [
        f"> **[v{ver}](https://github.com/{owner}/{repo}/releases/tag/v{ver})**"
        f"&nbsp;&nbsp;•&nbsp;&nbsp;`{branch}`&nbsp;&nbsp;•&nbsp;&nbsp;"
        f"{total} patches total"
    ]

    # One section per app, in the order they appear in the JSON
    for key, entry in by_pkg.items():
        patches = list(entry["patches"].values())
        label   = f"{entry['emoji']} {entry['name']}"
        lines.append(app_section(label, len(patches), entry["targets"], patches_table(patches, key), expanded))
        lines.append("")

    # Universal patches (no specific app)
    if universal:
        uni_patches = list(universal.values())
        lines.append(app_section("🌐 Universal", len(uni_patches), [], patches_table(uni_patches), expanded))
        lines.append("")

    return "\n".join(lines)


# Build and inject
raw_ver = data["version"]
# Strip leading "v" if present
ver   = raw_ver.lstrip("v")
total = sum(len(e["patches"]) for e in by_pkg.values()) + len(universal)

readme = readme_path.read_text(encoding="utf-8")

# Marker pattern — matches both <!-- PATCHES_START --> and <!-- PATCHES_START EXPANDED -->
START_PATTERN = r"<!-- PATCHES_START(?:\s+EXPANDED)?\s*-->"
END_MARKER    = "<!-- PATCHES_END -->"

marker_match = re.search(START_PATTERN, readme)

if not marker_match or END_MARKER not in readme:
    # Fallback: print to stdout so CI can catch the issue
    print(build_content())
    sys.stderr.write(
        f"⚠️  Markers <!-- PATCHES_START [EXPANDED] --> / {END_MARKER} not found in {readme_path}. "
        "Printed to stdout instead.\n"
    )
    sys.exit(1)

actual_start = marker_match.group(0)

generated = build_content(expanded="EXPANDED" in actual_start)

# Replace template links if present
readme = readme.replace("https://morphe.software/add-source?github=xyz-user/xyz-patches", f"https://morphe.software/add-source?github={repo_full}")
readme = readme.replace("https://github.com/xyz-user/xyz-patches", f"https://github.com/{repo_full}")

new_readme = re.sub(
    rf"{START_PATTERN}.*?{re.escape(END_MARKER)}",
    f"{actual_start}\n{generated}\n{END_MARKER}",
    readme,
    flags=re.DOTALL,
)
readme_path.write_text(new_readme, encoding="utf-8")
print(f"✅ Injected patches section into {readme_path} (v{ver}, branch={branch}, {total} patches)")
