"""Regression tests for the release README generator."""

import json
import subprocess
import tempfile
import unittest
from pathlib import Path


GENERATOR = Path(__file__).with_name("generate_patches_readme.py")


class ReadmeGeneratorTest(unittest.TestCase):
    def test_per_patch_compatibility_and_version_union(self):
        def patch(name, version, file_type):
            return {
                "name": name,
                "compatiblePackages": [{
                    "packageName": "example.app",
                    "name": "Example",
                    "apkFileType": file_type,
                    "targets": [{"version": version}],
                }],
            }

        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            catalog = root / "catalog.json"
            readme = root / "README.md"
            catalog.write_text(json.dumps({"version": "1.0", "patches": [
                patch("First", "1.0", "APKS"), patch("Second", "2.0", "APKM"),
            ]}), encoding="utf-8")
            readme.write_text("Before\n<!-- PATCHES_START -->\nold\n<!-- PATCHES_END -->\nAfter\n", encoding="utf-8")
            subprocess.run(["python3", str(GENERATOR), "owner/repo", "dev", str(catalog), str(readme)], check=True, capture_output=True)
            result = readme.read_text(encoding="utf-8")
            self.assertIn("| 1.0 (APKS) | 2.0 (APKM) |", result)
            self.assertIn("<details>\n<summary>📦 Example • 2 patches</summary>", result)
            self.assertIn("</details>", result)
            self.assertIn("| First |  | 1.0 (APKS) |", result)
            self.assertIn("| Second |  | 2.0 (APKM) |", result)
            self.assertTrue(result.startswith("Before\n"))
            self.assertTrue(result.endswith("After\n"))

    def test_expanded_marker_keeps_sections_open(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            catalog = root / "catalog.json"
            readme = root / "README.md"
            catalog.write_text(json.dumps({"version": "1.0", "patches": [
                {"name": "Universal"},
                {"name": "App patch", "compatiblePackages": [{"packageName": "example.app", "name": "Example"}]},
            ]}), encoding="utf-8")
            readme.write_text("<!-- PATCHES_START EXPANDED -->\n<!-- PATCHES_END -->\n", encoding="utf-8")
            subprocess.run(["python3", str(GENERATOR), "owner/repo", "dev", str(catalog), str(readme)],
                           check=True, capture_output=True)
            result = readme.read_text(encoding="utf-8")
            self.assertIn("### 📦 Example • 1 patch", result)
            self.assertIn("### 🌐 Universal • 1 patch", result)
            self.assertNotIn("<details>", result)

    def test_same_version_keeps_file_types_and_descriptions_distinct(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            catalog = root / "catalog.json"
            readme = root / "README.md"
            patches = []
            for file_type, description in [("APKS", "Split build"), ("APKM", "Mirror build")]:
                patches.append({"name": file_type, "compatiblePackages": [{
                    "packageName": "example.app", "name": "Example", "apkFileType": file_type,
                    "targets": [{"version": "1.0", "description": description}],
                }]})
            catalog.write_text(json.dumps({"version": "1.0", "patches": patches}), encoding="utf-8")
            readme.write_text("<!-- PATCHES_START -->\n<!-- PATCHES_END -->\n", encoding="utf-8")
            subprocess.run(["python3", str(GENERATOR), "owner/repo", "dev", str(catalog), str(readme)],
                           check=True, capture_output=True)
            result = readme.read_text(encoding="utf-8")
            self.assertIn("| 1.0 (APKS) | 1.0 (APKM) |", result)
            self.assertIn("| Split build | Mirror build |", result)


if __name__ == "__main__":
    unittest.main()
