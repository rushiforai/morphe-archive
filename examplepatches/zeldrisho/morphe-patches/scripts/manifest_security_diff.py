"""Compare security-relevant Android manifest boundaries without APKs."""

import argparse
import json
import xml.etree.ElementTree as ET
from pathlib import Path

ANDROID = "{http://schemas.android.com/apk/res/android}"


def _value(element, name):
    return element.get(ANDROID + name, "")


def security_snapshot(xml_text):
    """Return comparable security-relevant declarations from a manifest string."""
    root = ET.fromstring(xml_text)
    permissions = sorted(
        element.get(ANDROID + "name", "")
        for element in root.findall("permission") + root.findall("uses-permission")
    )
    components = []
    for tag in ("activity", "activity-alias", "service", "receiver", "provider"):
        for element in root.findall("application/" + tag):
            path_permissions = tuple(
                sorted(
                    (
                        _value(path, "path"),
                        _value(path, "pathPrefix"),
                        _value(path, "pathPattern"),
                        _value(path, "readPermission"),
                        _value(path, "writePermission"),
                    )
                    for path in element.findall("path-permission")
                )
            )
            components.append(
                (
                    tag,
                    _value(element, "name"),
                    _value(element, "exported"),
                    _value(element, "permission"),
                    _value(element, "readPermission"),
                    _value(element, "writePermission"),
                    _value(element, "authorities"),
                    _value(element, "grantUriPermissions"),
                    _value(element, "forceUriPermissions"),
                    _value(element, "enabled"),
                    path_permissions,
                )
            )
    queries = {
        "queries_packages": sorted(
            element.get(ANDROID + "package", "")
            for element in root.findall("queries/package")
        ),
        "queries_providers": sorted(
            element.get(ANDROID + "authorities", "")
            for element in root.findall("queries/provider")
        ),
        "queries_intents": sorted(
            tuple(
                sorted(
                    (child.tag, tuple(sorted(child.attrib.items())))
                    for child in element
                )
            )
            for element in root.findall("queries/intent")
        ),
    }
    return {"permissions": permissions, "components": sorted(components), **queries}


def security_delta(original_xml, patched_xml):
    """Return declarations added to or removed from a patched manifest."""
    original = security_snapshot(original_xml)
    patched = security_snapshot(patched_xml)
    return {
        key: {
            "removed": sorted(set(original[key]) - set(patched[key])),
            "added": sorted(set(patched[key]) - set(original[key])),
        }
        for key in original
    }


def main():
    """Print the security delta between two manifest files as JSON."""
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("original", type=Path, help="original AndroidManifest.xml")
    parser.add_argument("patched", type=Path, help="patched AndroidManifest.xml")
    args = parser.parse_args()
    delta = security_delta(
        args.original.read_text(encoding="utf-8"),
        args.patched.read_text(encoding="utf-8"),
    )
    print(json.dumps(delta, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
