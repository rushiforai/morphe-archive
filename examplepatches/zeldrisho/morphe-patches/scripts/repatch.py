#!/usr/bin/env python3
"""Re-patch an APK/APKM with the repository patch set and sign it."""

import argparse
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
import urllib.request
from pathlib import Path
from urllib.error import HTTPError, URLError
from urllib.parse import urljoin, urlparse

ROOT = Path(__file__).resolve().parents[1]
MAX_REDIRECTS = 5
GITHUB_HOSTS = {"api.github.com", "github.com"}


class NoRedirectHandler(urllib.request.HTTPRedirectHandler):
    """Expose redirects so each destination can be validated before following."""

    def redirect_request(self, request, response, code, msg, headers, newurl):
        return None


def die(msg):
    raise SystemExit("❌ " + msg)


def read_apk_package(apk):
    """Return the APK's manifest package as reported by aapt.

    Return None if aapt is missing, cannot be started, times out, exits
    unsuccessfully, or produces no recognizable package name. Output decoding
    errors propagate.
    """
    aapt = shutil.which("aapt")
    if not aapt:
        return None
    try:
        result = subprocess.run(
            [aapt, "dump", "badging", str(apk)],
            capture_output=True,
            text=True,
            check=False,
            timeout=10,
        )
    except (OSError, subprocess.TimeoutExpired):
        return None
    if result.returncode:
        return None
    match = re.search(r"(?m)^package: name=['\"]([^'\"]+)['\"]", result.stdout)
    return match.group(1) if match else None


def quarantine_artifact(path):
    """Move an invalid output to a sibling .invalid path and return that path.

    Try .invalid.1, .invalid.2, and so on when a destination already exists.
    Return None if the source is absent or the rename raises OSError; a failed
    rename may leave the original output in place.
    """
    if not path.exists():
        return None
    quarantine = path.with_name(path.name + ".invalid")
    suffix = 1
    while quarantine.exists():
        quarantine = path.with_name(path.name + f".invalid.{suffix}")
        suffix += 1
    try:
        path.replace(quarantine)
        return quarantine
    except OSError:
        return None


def canonical_patch_name(name):
    """Normalize legacy/generated aliases to the stable patch name used for validation."""
    aliases = {
        "Change package name": "Change Zalo package name",
        "Change app name": "Change Zalo app name",
    }
    return aliases.get(name, name)


def jar_version(path):
    """Parse the numeric version from a legacy Morphe JAR name."""
    match = re.fullmatch(r"morphe-desktop-(\d+(?:\.\d+)*)-all\.jar", path.name)
    if not match:
        return None
    return tuple(int(part) for part in match.group(1).split("."))


def morphe_data_dirs(home):
    """Return explicit and Homebrew Morphe data directories, in priority order.

    Use MORPHE_DATA_DIR first, then HOMEBREW_PREFIX/var/morphe, falling back to
    ``brew --prefix`` for the prefix. Deduplicate paths without checking whether
    they exist. Ignore brew launch, exit, and timeout failures. The home argument
    is unused.
    """
    dirs = []
    configured = os.environ.get("MORPHE_DATA_DIR")
    if configured:
        dirs.append(Path(configured).expanduser())
    brew_prefix = os.environ.get("HOMEBREW_PREFIX")
    if not brew_prefix and shutil.which("brew"):
        try:
            result = subprocess.run(
                ["brew", "--prefix"],
                capture_output=True,
                text=True,
                check=True,
                timeout=5,
            )
            brew_prefix = result.stdout.strip()
        except (OSError, subprocess.SubprocessError):
            pass
    if brew_prefix:
        dirs.append(Path(brew_prefix) / "var/morphe")
    return list(dict.fromkeys(dirs))


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
    """Patch the requested APK or APKM and sign the resulting APK.

    Read command-line arguments and environment overrides, using a local bundle
    or downloading the latest release when none is selected or found. The
    expected package comes from --expected-package, EXPECTED_PACKAGE_NAME, or
    PACKAGE_NAME, in that order; it filters patch options and guards the output.
    REQUIRED_PATCHES and requested package-renaming patches must be reported
    as applied. Failed output checks attempt to quarantine the APK.

    Raise SystemExit for argument/configuration errors, download failures,
    failed output checks, or Morphe failures, preserving nonzero CLI exit codes.
    Other filesystem errors, options-create launch errors, and malformed options
    data errors propagate. Temporary files are cleaned up on exit.
    """
    p = argparse.ArgumentParser()
    p.add_argument("--jar")
    p.add_argument("--expected-package")
    p.add_argument("input")
    p.add_argument("output", nargs="?")
    a = p.parse_args()
    inp = Path(a.input)
    out = Path(a.output or inp.with_name(inp.stem + "_patched.apk"))
    package_override = os.environ.get("PACKAGE_NAME")
    expected_package = (
        a.expected_package
        or os.environ.get("EXPECTED_PACKAGE_NAME")
        or package_override
    )
    required_patch_names = {
        name.strip()
        for name in os.environ.get("REQUIRED_PATCHES", "").split(",")
        if name.strip()
    }
    home = Path.home()
    jars = [
        (version, path)
        for path in (home / ".local/share/morphe").glob("morphe-desktop-*-all.jar")
        if (version := jar_version(path)) is not None
    ]
    jar = (
        Path(a.jar)
        if a.jar
        else max(jars, key=lambda item: item[0], default=(None, None))[1]
    )
    morphe = shutil.which("morphe") if not a.jar else None
    base = [morphe] if morphe else ["java", "-jar", str(jar)]
    key = os.environ.get("KEYSTORE")
    data_dirs = morphe_data_dirs(home)
    standard_data_keys = {
        (data_dir / "morphe.keystore").resolve() for data_dir in data_dirs
    }
    if not key:
        for data_dir in data_dirs:
            candidates = (
                data_dir / "morphe.keystore",
                data_dir / "imported.keystore",
            )
            if not any(path.is_file() for path in candidates):
                continue
            key = str(next(path for path in candidates if path.is_file()))
            break
    if not key and (ROOT / "Morphe.keystore").is_file():
        key = str(ROOT / "Morphe.keystore")
    if not key:
        legacy_dirs = (
            home / ".local/share/morphe/morphe-data",
            home / "morphe/morphe-data",
            home / "morphe",
        )
        for data_dir in legacy_dirs:
            for x in (data_dir / "imported.keystore", data_dir / "morphe.keystore"):
                if x.is_file():
                    key = str(x)
                    break
            if key:
                break
    if not inp.is_file():
        die(f"input not found: {inp}")
    if not morphe and (not jar or not jar.is_file()):
        die(
            "Morphe not found. Install with brew install morphe. "
            "Legacy JARs in ~/.local/share/morphe/ or --jar <path> are also supported."
        )
    if not key or not Path(key).is_file():
        die(
            "keystore not found (set KEYSTORE= or import one into Morphe's data directory)"
        )
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
        options_command = base + ["options-create", "-p", mpp]
        source_package = os.environ.get("SOURCE_PACKAGE_NAME")
        if source_package:
            options_command.extend(["-f", source_package])
        options_command.extend(["-o", str(opts)])
        try:
            subprocess.run(
                options_command,
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
        if package_override:
            rename_patches = {
                name
                for name, patch in patches.items()
                if patch.get("options", {}).get("packageName") == package_override
            }
            if not rename_patches or not any(
                patches[name].get("enabled") for name in rename_patches
            ):
                die("requested PACKAGE_NAME has no enabled package-rename patch")
            required_patch_names.update(rename_patches)
        opts.write_text(json.dumps(data, indent=1))
        key_path = Path(key).resolve()
        default_key_paths = {
            (data_dir / "morphe.keystore").resolve() for data_dir in data_dirs
        }
        if not os.environ.get("KEYSTORE") and key_path in default_key_paths:
            # Let Morphe resolve its own active default key and credentials.
            ks = []
        else:
            ks = [
                f"--keystore={key}",
                f"--keystore-entry-alias={os.environ.get('KEYSTORE_ALIAS', 'Morphe')}",
            ]
            is_repository_key = key_path == (ROOT / "Morphe.keystore").resolve()
            default_store = (
                "" if is_repository_key or key_path in standard_data_keys else "Morphe"
            )
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
            result = subprocess.run(
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
                check=False,
                capture_output=True,
                text=True,
            )
        except OSError as e:
            die(f"failed to run Morphe: {e}")
        if result.stdout:
            print(result.stdout, end="")
        if result.stderr:
            print(result.stderr, end="", file=sys.stderr)
        if result.returncode:
            raise SystemExit(result.returncode)

        combined_output = result.stdout + "\n" + result.stderr
        skipped = {
            canonical_patch_name(name)
            for name in re.findall(
                r"(?im)^.*Skipping disabled:\s*(.+?)\s*$", combined_output
            )
        }
        applied = {
            canonical_patch_name(name)
            for name in re.findall(r"(?im)^.*Applied:\s*(.+?)\s*$", combined_output)
        }
        required_patch_names = {
            canonical_patch_name(name) for name in required_patch_names
        }
        skipped_required = sorted(required_patch_names.intersection(skipped))
        unapplied_required = sorted(required_patch_names - applied)
        if skipped_required or unapplied_required:
            quarantined = quarantine_artifact(out)
            failed_required = sorted(set(unapplied_required) - set(skipped_required))
            details = []
            if skipped_required:
                details.append(
                    "required patch(es) skipped: " + ", ".join(skipped_required)
                )
            if failed_required:
                details.append(
                    "required patch(es) not applied: " + ", ".join(failed_required)
                )
            detail = "; ".join(details)
            die(
                detail
                + (f"; artifact quarantined at {quarantined}" if quarantined else "")
            )

        if expected_package:
            actual_package = read_apk_package(out)
            if actual_package != expected_package:
                quarantined = quarantine_artifact(out)
                detail = (
                    f"output package mismatch: expected {expected_package}, "
                    f"got {actual_package or '<unreadable>'}"
                )
                die(
                    detail
                    + (
                        f"; artifact quarantined at {quarantined}"
                        if quarantined
                        else ""
                    )
                )
    print(f"\n✅ Patched APK: {out}")


if __name__ == "__main__":
    main()
