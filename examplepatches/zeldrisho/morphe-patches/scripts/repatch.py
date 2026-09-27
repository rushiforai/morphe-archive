#!/usr/bin/env python3
"""Re-patch an APK/APKM with the repository patch set and sign it."""

import argparse
import json
import os
import shutil
import subprocess
import tempfile
import urllib.request
from urllib.error import HTTPError, URLError
from pathlib import Path
from urllib.parse import urljoin, urlparse
import re

ROOT = Path(__file__).resolve().parents[1]
MAX_REDIRECTS = 5
GITHUB_HOSTS = {"api.github.com", "github.com"}


class NoRedirectHandler(urllib.request.HTTPRedirectHandler):
    """Expose redirects so each destination can be validated before following."""

    def redirect_request(self, request, response, code, msg, headers, newurl):
        return None


def die(msg):
    raise SystemExit("❌ " + msg)


def validate_download_url(url):
    """Return a credential-free, default-port HTTPS URL for an allowed GitHub host."""
    parsed = urlparse(url)
    host = (parsed.hostname or "").lower().rstrip(".")
    if parsed.scheme != "https" or parsed.username or parsed.password:
        raise ValueError("download URL must use HTTPS without credentials")
    if parsed.port is not None and parsed.port != 443:
        raise ValueError("download URL must use the default HTTPS port")
    if host not in GITHUB_HOSTS and not host.endswith(".githubusercontent.com"):
        raise ValueError(f"download host is not allowed: {host or '<missing>'}")
    return url


def download(url, destination=None):
    """Fetch an allowed GitHub URL while validating every redirect destination.

    Return the response bytes when ``destination`` is omitted; otherwise write the
    response to that path and return ``None``.
    """
    opener = urllib.request.build_opener(NoRedirectHandler())
    current = validate_download_url(url)
    for _ in range(MAX_REDIRECTS + 1):
        request = urllib.request.Request(
            current, headers={"User-Agent": "morphe-patches"}
        )
        try:
            with opener.open(request, timeout=30) as response:
                if destination is None:
                    return response.read()
                with open(destination, "wb") as output:
                    shutil.copyfileobj(response, output)
                return None
        except HTTPError as exc:
            if exc.code not in {301, 302, 303, 307, 308}:
                raise
            location = exc.headers.get("Location")
            if not location:
                raise ValueError("download redirect has no Location header") from exc
            current = validate_download_url(urljoin(current, location))
    raise ValueError("too many download redirects")


def main():
    """Patch the requested APK or APKM and sign the resulting APK."""
    p = argparse.ArgumentParser()
    p.add_argument("--jar")
    p.add_argument("input")
    p.add_argument("output", nargs="?")
    a = p.parse_args()
    inp = Path(a.input)
    out = Path(a.output or inp.with_name(inp.stem + "_patched.apk"))
    home = Path.home()
    jars = sorted(
        (home / ".local/share/morphe").glob("morphe-desktop-*-all.jar"),
        key=lambda x: x.stat().st_mtime,
    )
    jar = Path(a.jar) if a.jar else (jars[-1] if jars else None)
    key = os.environ.get("KEYSTORE")
    if not key and (ROOT / "Morphe.keystore").is_file():
        key = str(ROOT / "Morphe.keystore")
    if not key:
        for x in (
            home / ".local/share/morphe/morphe-data/imported.keystore",
            home / ".local/share/morphe/morphe-data/morphe.keystore",
            home / "morphe/morphe-data/imported.keystore",
            home / "morphe/morphe-data/morphe.keystore",
            home / "morphe/imported.keystore",
            home / "morphe/morphe.keystore",
        ):
            if x.is_file():
                key = str(x)
                break
    if not inp.is_file():
        die(f"input not found: {inp}")
    if not jar or not jar.is_file():
        die(
            "Morphe JAR not found. Download morphe-desktop-*-all.jar to ~/.local/share/morphe/ or pass --jar <path>."
        )
    if not key or not Path(key).is_file():
        die("keystore not found (set KEYSTORE= or import one into morphe-data/)")
    mpp = os.environ.get("MPP")
    if not mpp:
        local = [
            x
            for x in (ROOT / "patches/build/libs").glob("patches-*.mpp")
            if "sources" not in x.name and "javadoc" not in x.name
        ]
        mpp = str(max(local, key=lambda x: x.stat().st_mtime)) if local else None
    with tempfile.TemporaryDirectory() as td:
        if not mpp:
            repo = os.environ.get("GITHUB_REPO", "zeldrisho/morphe-patches")
            if not re.fullmatch(r"[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+", repo):
                die("GITHUB_REPO must be in owner/repository form")
            print("No local .mpp found. Downloading the latest release bundle...")
            mpp = str(Path(td) / "patches.mpp")
            try:
                api = json.loads(
                    download(f"https://api.github.com/repos/{repo}/releases/latest")
                )
                url = next(
                    x["browser_download_url"]
                    for x in api["assets"]
                    if x["name"].endswith(".mpp")
                )
                download(url, mpp)
            except (
                OSError,
                HTTPError,
                URLError,
                StopIteration,
                KeyError,
                TypeError,
                ValueError,
                json.JSONDecodeError,
            ) as exc:
                die(f"failed to download latest patch bundle: {exc}")
        if not Path(mpp).is_file():
            die(f"patch bundle not found: {mpp}")
        opts = Path(td) / "options.json"
        base = ["java", "-jar", str(jar)]
        try:
            subprocess.run(
                base + ["options-create", "-p", mpp, "-o", str(opts)],
                check=True,
                stdout=subprocess.DEVNULL,
            )
        except subprocess.CalledProcessError as e:
            raise SystemExit(e.returncode)
        data = json.loads(opts.read_text())
        patches = data[0]["patches"]
        selected = os.environ.get("PATCHES", "__DEFAULT__")
        if selected != "__DEFAULT__":
            aliases = {
                "Remove AD_ID permission — Zalo": "Remove AD_ID permission",
            }
            requested = {
                aliases.get(x.strip(), x.strip())
                for x in selected.split(",")
                if x.strip()
            }
            unknown = requested - patches.keys()
            if unknown:
                die("unknown patch name(s): " + ", ".join(sorted(unknown)))
            for name, patch in patches.items():
                patch["enabled"] = name in requested
        for env, names, opt in (
            ("APP_NAME", ("Change app name", "Change Zalo app name"), "appName"),
            (
                "PACKAGE_NAME",
                ("Change package name", "Change Zalo package name"),
                "packageName",
            ),
        ):
            value = os.environ.get(env)
            for name in names:
                if value and name in patches:
                    if selected == "__DEFAULT__":
                        patches[name]["enabled"] = True
                    if patches[name].get("enabled"):
                        patches[name].setdefault("options", {})[opt] = value
        opts.write_text(json.dumps(data, indent=1))
        ks = [
            f"--keystore={key}",
            f"--keystore-entry-alias={os.environ.get('KEYSTORE_ALIAS', 'Morphe')}",
        ]
        default_store = "" if str(key) == str(ROOT / "Morphe.keystore") else "Morphe"
        store = os.environ.get("KEYSTORE_PASSWORD", default_store)
        entry = os.environ.get(
            "KEYSTORE_ENTRY_PASSWORD", "Morphe" if default_store == "" else ""
        )
        if store:
            ks.append(f"--keystore-password={store}")
        if entry:
            ks.append(f"--keystore-entry-password={entry}")
        bytecode_mode = os.environ.get("BYTECODE_MODE", "").upper()
        if bytecode_mode and bytecode_mode not in {"FULL", "STRIP_SAFE", "STRIP_FAST"}:
            die("BYTECODE_MODE must be FULL, STRIP_SAFE, or STRIP_FAST")
        bm = [f"--bytecode-mode={bytecode_mode}"] if bytecode_mode else []
        verify = os.environ.get("VERIFY_SDK", "")
        va = (
            []
            if verify in ("", "0", "false", "no")
            else (
                ["--verify-with-sdk"]
                if verify in ("1", "true", "yes")
                else [f"--verify-with-sdk={verify}"]
            )
        )
        print(f"Patching '{inp}' -> '{out}'")
        try:
            subprocess.run(
                base
                + [
                    "patch",
                    "-p",
                    mpp,
                    "--options-file",
                    str(opts),
                    *ks,
                    *bm,
                    *va,
                    "-o",
                    str(out),
                    "-t",
                    str(Path(td) / "patch"),
                    str(inp),
                ],
                check=True,
            )
        except subprocess.CalledProcessError as e:
            raise SystemExit(e.returncode)
    print(
        f'\n✅ Patched APK: {out}\nInstall:  android install --apks="{out}" --device="$SERIAL"'
    )


if __name__ == "__main__":
    main()
