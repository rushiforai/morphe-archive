import importlib.util
import io
import stat
import sys
import tempfile
import unittest
import zipfile
from contextlib import redirect_stdout
from pathlib import Path
from unittest import mock


SCRIPT = Path(__file__).resolve().parents[1] / "extract_smali.py"
SPEC = importlib.util.spec_from_file_location("extract_smali", SCRIPT)
extract_smali = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(extract_smali)


class ExtractSmaliTest(unittest.TestCase):
    def test_default_output_uses_app_and_version(self):
        """Check that known APKMirror package names map to app/version analysis paths."""
        threads = extract_smali.default_output(
            Path("com.instagram.barcelona_445.0.0.46.83-1.apkm")
        )
        zalo = extract_smali.default_output(Path("com.zing.zalo_26.08.01-1.apkm"))
        root = SCRIPT.parents[1] / "analysis"
        self.assertEqual(root / "threads/445.0.0.46.83/smali", threads)
        self.assertEqual(root / "zalo/26.08.01/smali", zalo)

    def test_bundle_rejects_traversal_without_replacing_existing_output(self):
        """Reject traversal entries before extraction and preserve the existing smali output."""
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            bundle = root / "input.apkm"
            out = root / "analysis/smali"
            out.mkdir(parents=True)
            (out / "keep.smali").write_text("existing")
            with zipfile.ZipFile(bundle, "w") as archive:
                archive.writestr("../escape.apk", b"bad")
            with (
                mock.patch.object(extract_smali, "default_output", return_value=out),
                mock.patch.object(sys, "argv", [str(SCRIPT), str(bundle)]),
                self.assertRaisesRegex(ValueError, "Unsafe archive path"),
            ):
                extract_smali.main()
            self.assertEqual("existing", (out / "keep.smali").read_text())
            self.assertFalse((root / "escape.apk").exists())

    def test_malformed_container_preserves_existing_output(self):
        """Preserve existing smali when the input container is not a ZIP archive."""
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            bundle = root / "malformed.apks"
            bundle.write_bytes(b"not a zip archive")
            out = root / "analysis/smali"
            out.mkdir(parents=True)
            (out / "keep.smali").write_text("existing")
            with (
                mock.patch.object(extract_smali, "default_output", return_value=out),
                mock.patch.object(sys, "argv", [str(SCRIPT), str(bundle)]),
                self.assertRaises(zipfile.BadZipFile),
            ):
                extract_smali.main()
            self.assertEqual("existing", (out / "keep.smali").read_text())

    def test_archive_rejects_symlink_members(self):
        """Reject symbolic-link entries even when their names end in .apk."""
        with tempfile.TemporaryDirectory() as temp:
            bundle = Path(temp) / "symlink.apkm"
            info = zipfile.ZipInfo("base.apk")
            info.create_system = 3
            info.external_attr = (stat.S_IFLNK | 0o777) << 16
            with zipfile.ZipFile(bundle, "w") as archive:
                archive.writestr(info, "target.apk")
            with zipfile.ZipFile(bundle) as archive:
                with self.assertRaisesRegex(
                    ValueError, "Unsupported archive file type"
                ):
                    extract_smali.validated_members(archive, ".apk")

    def test_total_expanded_archive_limit_is_enforced(self):
        """Reject archives whose combined expanded member sizes exceed the limit."""
        with tempfile.TemporaryDirectory() as temp:
            bundle = Path(temp) / "expanded.apkm"
            with zipfile.ZipFile(bundle, "w") as archive:
                archive.writestr("one.apk", b"1234")
                archive.writestr("two.apk", b"5678")
            with (
                mock.patch.object(extract_smali, "MAX_TOTAL_SIZE", 7),
                zipfile.ZipFile(bundle) as archive,
                self.assertRaisesRegex(ValueError, "expanded size exceeds limit"),
            ):
                extract_smali.validated_members(archive, ".apk")

    def test_archive_limits_are_enforced_before_extraction(self):
        """Reject an oversized APK member before extracting its contents."""
        with tempfile.TemporaryDirectory() as temp:
            bundle = Path(temp) / "large.apkm"
            with zipfile.ZipFile(bundle, "w") as archive:
                archive.writestr("base.apk", b"oversized")
            with (
                mock.patch.object(extract_smali, "MAX_MEMBER_SIZE", 4),
                zipfile.ZipFile(bundle) as archive,
                self.assertRaisesRegex(ValueError, "too large"),
            ):
                extract_smali.validated_members(archive, ".apk")

    def test_bundle_processes_multiple_splits(self):
        """Check that DEX files from base and nested feature APKs both reach disassembly."""
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            bundle = root / "input.apks"
            out = root / "analysis/smali"
            base = io.BytesIO()
            feature = io.BytesIO()
            for buffer, dex in ((base, b"base-dex"), (feature, b"feature-dex")):
                with zipfile.ZipFile(buffer, "w") as archive:
                    archive.writestr("classes.dex", dex)
            with zipfile.ZipFile(bundle, "w") as archive:
                archive.writestr("base.apk", base.getvalue())
                archive.writestr("splits/feature.apk", feature.getvalue())

            def fake_baksmali(command, check):
                """Write the input DEX bytes as fake smali to identify each processed split."""
                current = Path(command[2]).read_bytes()
                target = Path(command[command.index("-o") + 1])
                target.mkdir(parents=True)
                (target / "Class.smali").write_text(current.decode())

            with (
                mock.patch.object(extract_smali, "default_output", return_value=out),
                mock.patch.object(
                    extract_smali.subprocess, "run", side_effect=fake_baksmali
                ),
                mock.patch.object(sys, "argv", [str(SCRIPT), str(bundle)]),
                redirect_stdout(io.StringIO()),
            ):
                extract_smali.main()
            self.assertEqual(
                {"base-dex", "feature-dex"},
                {path.read_text() for path in out.rglob("Class.smali")},
            )

    def test_default_output_replaces_stale_directory(self):
        """Replace stale smali output only after fresh disassembly completes."""
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            bundle = root / "com.instagram.barcelona_445.0.0.46.83-1.apkm"
            out = root / "analysis/threads/445.0.0.46.83/smali"
            out.mkdir(parents=True)
            (out / "stale.smali").write_text("stale")
            split = io.BytesIO()
            with zipfile.ZipFile(split, "w") as apk:
                apk.writestr("classes.dex", b"dex")
            with zipfile.ZipFile(bundle, "w") as apkm:
                apkm.writestr("base.apk", split.getvalue())

            def fake_baksmali(command, check):
                """Write a fresh smali fixture without invoking the external disassembler."""
                target = Path(command[command.index("-o") + 1])
                target.mkdir(parents=True)
                (target / "Class.smali").write_text("fresh")

            with (
                mock.patch.object(extract_smali, "default_output", return_value=out),
                mock.patch.object(
                    extract_smali.subprocess, "run", side_effect=fake_baksmali
                ),
                mock.patch.object(sys, "argv", [str(SCRIPT), str(bundle)]),
                redirect_stdout(io.StringIO()),
            ):
                extract_smali.main()

            self.assertFalse((out / "stale.smali").exists())
            self.assertEqual("fresh", next(out.rglob("Class.smali")).read_text())


if __name__ == "__main__":
    unittest.main()
