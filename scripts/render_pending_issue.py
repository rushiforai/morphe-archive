"""
Renders a GitHub issue body for pending repo discoveries.
"""

import json
import sys


def main():
    evidence_file = sys.argv[1]

    with open(evidence_file, encoding="utf-8-sig") as f:
        rows = json.load(f)

    for item in rows:
        print(f"## {item['repo']}")
        print("")
        print(f"- Branch: `{item.get('branch', '')}`")
        print(f"- Bundle: {item.get('bundle_url', '')}")
        print(f"- Source: {item.get('source', '')}")
        if item.get("fork"):
            print("- Fork: yes, accepted because bundle JSON validates")
        if item.get("note"):
            print(f"- Note: {item['note']}")
        print("")


if __name__ == "__main__":
    main()
