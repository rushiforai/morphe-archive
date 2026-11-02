"""Instagram version watch: report whether APKPure lists an Instagram release newer than the newest
COMPATIBILITY_INSTAGRAM target. Detection only; nothing is downloaded or patched.

Every problem exits 1 with a message: a failed lookup must never look like "no new version".
"""

from __future__ import annotations

import argparse
import re
import sys
import urllib.request
from pathlib import Path

PACKAGE = "com.instagram.android"
# The version endpoint EFF's apkeep uses. It answers in protobuf, where version names are plain strings.
VERSIONS_URL = f"https://api.pureapk.com/m/v3/cms/app_version?hl=en-US&package_name={PACKAGE}"
# Cloudflare refuses urllib's default User-Agent, so the request names an Android HTTP client.
HEADERS = {"x-cv": "3172501", "x-sv": "29", "x-abis": "arm64-v8a,armeabi-v7a,armeabi", "x-gp": "1",
           "User-Agent": "Dalvik/2.1.0 (Linux; U; Android 10)"}
TIMEOUT_SECONDS = 60
CONSTANTS = Path("patches/src/main/kotlin/app/rex/patches/instagram/utils/Constants.kt")
# Instagram versions are five numeric parts, for example 452.0.0.48.64.
LISTED_RE = re.compile(rb"(?<![\d.])(\d{3}(?:\.\d+){4})(?![\d.])")
DECLARED_RE = re.compile(r'AppTarget\(\s*version\s*=\s*"(\d+(?:\.\d+){4})"')
# APKMirror release pages swap the version's dots for dashes: 452.1.0.53.64 -> instagram-452-1-0-53-64-release.
APKMIRROR_RELEASE_URL = "https://www.apkmirror.com/apk/instagram/instagram-instagram/instagram-{slug}-release/"


class WatchError(Exception):
    """A lookup or parse failed. The message is the diagnostic."""


def version_key(version: str) -> tuple[int, ...]:
    return tuple(int(part) for part in version.split("."))


def newest_declared(constants: Path) -> str:
    text = constants.read_text(encoding="utf-8")
    if f'packageName = "{PACKAGE}"' not in text:
        raise WatchError(f"{constants} does not declare packageName {PACKAGE}")
    declared = DECLARED_RE.findall(text)
    if not declared or len(declared) != text.count("AppTarget("):
        raise WatchError(f"{constants}: an AppTarget does not have the expected version shape")
    return max(declared, key=version_key)


def newest_listed() -> str:
    request = urllib.request.Request(VERSIONS_URL, headers=HEADERS)
    try:
        with urllib.request.urlopen(request, timeout=TIMEOUT_SECONDS) as response:
            body = response.read()
    except OSError as error:  # urllib's HTTPError and URLError are both OSError
        raise WatchError(f"APKPure version lookup failed: {error}") from error
    listed = {match.decode() for match in LISTED_RE.findall(body)}
    if not listed:
        raise WatchError(f"APKPure answered {len(body)} bytes with no Instagram version; the API changed")
    return max(listed, key=version_key)


def apkmirror_url(version: str) -> str:
    # A link for a human: APKMirror's Cloudflare blocks the runner, so nothing is fetched.
    return APKMIRROR_RELEASE_URL.format(slug=version.replace(".", "-"))


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Check APKPure for a newer Instagram release.")
    parser.add_argument("--constants", type=Path, default=CONSTANTS)
    parser.add_argument("--github-output", type=Path)
    args = parser.parse_args(argv)
    try:
        declared = newest_declared(args.constants)
        listed = newest_listed()
    except (WatchError, OSError) as error:
        print(f"error: {error}", file=sys.stderr)
        return 1

    status = "new" if version_key(listed) > version_key(declared) else "current"
    print(f"{status}: APKPure lists {listed}; newest declared {declared}")
    if args.github_output:
        with args.github_output.open("a", encoding="utf-8") as file:
            file.write(f"status={status}\nversion={listed}\ndeclared={declared}\napkmirror_url={apkmirror_url(listed)}\n")
    return 0


if __name__ == "__main__":
    sys.exit(main())
