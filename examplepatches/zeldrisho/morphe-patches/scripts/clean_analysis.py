#!/usr/bin/env python3
"""Remove rebuildable outputs, optionally including analysis scratch data."""

import argparse
import shutil
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--analysis", "--all", action="store_true")
    p.add_argument("--dry-run", "-n", action="store_true")
    a = p.parse_args()
    targets = [
        ROOT / x
        for x in (
            "patches/build",
            "extensions/threads/build",
            "extensions/zalo/build",
            "build",
            ".gradle",
            ".kotlin",
            "extensions/extension.mpe",
        )
    ]
    if a.analysis:
        targets.append(ROOT / "analysis")
    for target in targets:
        if a.dry_run:
            print(
                f"{'would remove' if target.exists() else 'missing (skip)'}: {target}"
            )
        else:
            shutil.rmtree(
                target, ignore_errors=True
            ) if target.is_dir() else target.unlink(missing_ok=True)
    if a.dry_run:
        print("dry run — nothing removed.")
    elif a.analysis:
        print("✅ Cleaned build dirs, legacy .mpe copy, .kotlin/, and analysis/.")
    else:
        print(
            "✅ Cleaned build dirs, legacy .mpe copy, and .kotlin/ (analysis/ kept; re-run with --analysis to drop it)."
        )


if __name__ == "__main__":
    main()
