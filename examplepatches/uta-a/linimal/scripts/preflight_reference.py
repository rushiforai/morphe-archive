#!/usr/bin/env python3
"""厳密な LINE 26.16.0 arm64-v8a APKM reference input を検証します。

このプログラムは意図的に Python の standard library だけを使用します。入力 APKM は変更しません。
APK ファイルは TemporaryDirectory にのみ materialize し、Android SDK の apksigner が APK Signature
Scheme の検証を実行できるようにします。
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path, PurePosixPath
import re
import shutil
import stat
import struct
import subprocess
import sys
import tempfile
import zipfile
from dataclasses import dataclass
from typing import Any, Iterable, Mapping

CHUNK_SIZE = 1024 * 1024
NO_INDEX = 0xFFFFFFFF
RES_STRING_POOL_TYPE = 0x0001
RES_XML_TYPE = 0x0003
RES_XML_START_ELEMENT_TYPE = 0x0102
TYPE_STRING = 0x03
TYPE_INT_DEC = 0x10
TYPE_INT_HEX = 0x11
TYPE_INT_BOOLEAN = 0x12


class PreflightError(Exception):
    """入力が厳密な reference contract を満たしていません。"""


@dataclass(frozen=True)
class ArchiveLimits:
    max_entries: int
    max_entry_uncompressed_bytes: int
    max_total_uncompressed_bytes: int
    max_compression_ratio: float


def fail(message: str) -> None:
    raise PreflightError(message)


def load_json(path: Path) -> dict[str, Any]:
    try:
        value = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as error:
        fail(f"cannot read descriptor {path}: {error}")
    if not isinstance(value, dict):
        fail("descriptor root must be an object")
    return value


def require_mapping(value: object, description: str) -> Mapping[str, Any]:
    if not isinstance(value, dict):
        fail(f"{description} must be an object")
    return value


def require_string(value: object, description: str) -> str:
    if not isinstance(value, str) or not value:
        fail(f"{description} must be a non-empty string")
    return value


def require_int(value: object, description: str) -> int:
    if isinstance(value, bool) or not isinstance(value, int):
        fail(f"{description} must be an integer")
    return value


def sha256_path(path: Path) -> str:
    digest = hashlib.sha256()
    try:
        with path.open("rb") as source:
            for chunk in iter(lambda: source.read(CHUNK_SIZE), b""):
                digest.update(chunk)
    except OSError as error:
        fail(f"cannot read {path}: {error}")
    return digest.hexdigest()


def is_safe_member_name(name: str) -> bool:
    """正規化された相対 POSIX archive member name のみを許可します。"""
    if not name or "\x00" in name or "\\" in name:
        return False
    path = PurePosixPath(name)
    return not path.is_absolute() and all(part not in ("", ".", "..") for part in path.parts)


def limits_from_descriptor(descriptor: Mapping[str, Any]) -> ArchiveLimits:
    security = require_mapping(descriptor.get("security"), "security")
    return ArchiveLimits(
        max_entries=require_int(security.get("maxContainerEntries"), "security.maxContainerEntries"),
        max_entry_uncompressed_bytes=require_int(
            security.get("maxContainerEntryUncompressedBytes"),
            "security.maxContainerEntryUncompressedBytes",
        ),
        max_total_uncompressed_bytes=require_int(
            security.get("maxContainerUncompressedBytes"),
            "security.maxContainerUncompressedBytes",
        ),
        max_compression_ratio=float(security.get("maxContainerCompressionRatio", 0)),
    )


def validate_archive_members(
    infos: Iterable[zipfile.ZipInfo], expected_names: set[str], limits: ArchiveLimits
) -> dict[str, zipfile.ZipInfo]:
    """安全でない、重複した、サイズ超過または想定外の ZIP member を拒否します。"""
    result: dict[str, zipfile.ZipInfo] = {}
    total_size = 0
    for info in infos:
        name = info.filename
        if not is_safe_member_name(name):
            fail(f"unsafe ZIP member name: {name!r}")
        if name in result:
            fail(f"duplicate ZIP member: {name}")
        if info.is_dir():
            fail(f"directory ZIP member is not permitted: {name}")
        if info.file_size < 0 or info.compress_size < 0:
            fail(f"invalid ZIP member size: {name}")
        if info.file_size > limits.max_entry_uncompressed_bytes:
            fail(f"ZIP member exceeds uncompressed size limit: {name}")
        total_size += info.file_size
        if total_size > limits.max_total_uncompressed_bytes:
            fail("ZIP members exceed total uncompressed size limit")
        # zero-byte member には展開コストがありません。空でない member の compressed size が
        # zero の場合は不正なため、ストリーム展開してはいけません。
        if info.file_size and not info.compress_size:
            fail(f"ZIP member has invalid compressed size: {name}")
        if info.compress_size and info.file_size / info.compress_size > limits.max_compression_ratio:
            fail(f"ZIP member exceeds compression ratio limit: {name}")
        result[name] = info
    if len(result) > limits.max_entries:
        fail("ZIP member count exceeds limit")
    actual_names = set(result)
    missing = expected_names - actual_names
    unexpected = actual_names - expected_names
    if missing:
        fail(f"missing expected APKM members: {', '.join(sorted(missing))}")
    if unexpected:
        fail(f"unexpected APKM members: {', '.join(sorted(unexpected))}")
    return result


def safe_extract_expected_apks(
    archive: zipfile.ZipFile,
    infos: Mapping[str, zipfile.ZipInfo],
    expected_apks: Mapping[str, Mapping[str, Any]],
    destination: Path,
    max_entry_size: int,
) -> dict[str, Path]:
    """既知の APK entry を private な一時ディレクトリへストリーム展開します。

    destination の name は、archive name set を確認した後の descriptor だけから取得します。
    これにより path traversal を防ぎ、archive input から出力 path が導出される
    ZipFile.extract() を決して呼び出しません。
    """
    paths: dict[str, Path] = {}
    for name, expected in expected_apks.items():
        info = infos[name]
        if info.file_size > max_entry_size:
            fail(f"APK entry exceeds extraction limit: {name}")
        output = destination / name
        digest = hashlib.sha256()
        written = 0
        try:
            with archive.open(info, "r") as source, output.open("xb") as target:
                while True:
                    chunk = source.read(CHUNK_SIZE)
                    if not chunk:
                        break
                    written += len(chunk)
                    if written > max_entry_size:
                        fail(f"APK entry exceeds extraction limit while reading: {name}")
                    digest.update(chunk)
                    target.write(chunk)
        except (OSError, RuntimeError, zipfile.BadZipFile) as error:
            fail(f"cannot safely extract {name}: {error}")
        if written != info.file_size:
            fail(f"APK entry size changed while reading: {name}")
        expected_hash = require_string(expected.get("sha256"), f"splits.{name}.sha256")
        if digest.hexdigest() != expected_hash:
            fail(f"SHA-256 mismatch for {name}")
        paths[name] = output
    return paths


def decode_length(data: bytes, offset: int, utf8: bool) -> tuple[int, int]:
    if offset >= len(data):
        fail("truncated string-pool length")
    first = data[offset]
    if utf8:
        if first & 0x80:
            if offset + 1 >= len(data):
                fail("truncated UTF-8 string-pool length")
            return ((first & 0x7F) << 8) | data[offset + 1], offset + 2
        return first, offset + 1
    if offset + 2 > len(data):
        fail("truncated UTF-16 string-pool length")
    first_word = struct.unpack_from("<H", data, offset)[0]
    if first_word & 0x8000:
        if offset + 4 > len(data):
            fail("truncated extended UTF-16 string-pool length")
        second_word = struct.unpack_from("<H", data, offset + 2)[0]
        return ((first_word & 0x7FFF) << 16) | second_word, offset + 4
    return first_word, offset + 2


def parse_string_pool(data: bytes, start: int, size: int, header_size: int) -> list[str]:
    if header_size < 28 or start + size > len(data):
        fail("invalid Android string pool")
    string_count, _style_count, flags, strings_start, _styles_start = struct.unpack_from(
        "<IIIII", data, start + 8
    )
    offsets_start = start + header_size
    if offsets_start + string_count * 4 > start + size:
        fail("truncated Android string-pool offsets")
    utf8 = bool(flags & 0x100)
    strings: list[str] = []
    for index in range(string_count):
        relative = struct.unpack_from("<I", data, offsets_start + index * 4)[0]
        position = start + strings_start + relative
        end = start + size
        if position >= end:
            fail("Android string-pool offset is outside its chunk")
        if utf8:
            _utf16_length, position = decode_length(data, position, True)
            byte_length, position = decode_length(data, position, True)
            if position + byte_length >= end:
                fail("truncated Android UTF-8 string")
            raw = data[position : position + byte_length]
            strings.append(raw.decode("utf-8"))
        else:
            char_length, position = decode_length(data, position, False)
            byte_length = char_length * 2
            if position + byte_length >= end:
                fail("truncated Android UTF-16 string")
            raw = data[position : position + byte_length]
            strings.append(raw.decode("utf-16le"))
    return strings


def string_at(strings: list[str], index: int) -> str | None:
    if index == NO_INDEX:
        return None
    if index >= len(strings):
        fail("Android XML string index is out of range")
    return strings[index]


def typed_value(strings: list[str], value_type: int, value_data: int) -> str | int | bool:
    if value_type == TYPE_STRING:
        value = string_at(strings, value_data)
        if value is None:
            fail("typed string has no value")
        return value
    if value_type == TYPE_INT_BOOLEAN:
        return bool(value_data)
    if value_type in (TYPE_INT_DEC, TYPE_INT_HEX):
        return value_data
    return value_data


def parse_binary_manifest(apk_path: Path) -> dict[str, dict[str, str | int | bool]]:
    """この contract で使用する manifest fields を、aapt/aapt2 を使わずに読み取ります。"""
    try:
        with zipfile.ZipFile(apk_path) as apk:
            manifest = apk.read("AndroidManifest.xml")
    except (OSError, KeyError, zipfile.BadZipFile) as error:
        fail(f"cannot read AndroidManifest.xml in {apk_path.name}: {error}")
    if len(manifest) < 8:
        fail(f"AndroidManifest.xml is truncated in {apk_path.name}")
    root_type, root_header_size, root_size = struct.unpack_from("<HHI", manifest, 0)
    if root_type != RES_XML_TYPE or root_header_size < 8 or root_size != len(manifest):
        fail(f"AndroidManifest.xml is not a complete binary XML document in {apk_path.name}")
    strings: list[str] | None = None
    elements: dict[str, dict[str, str | int | bool]] = {}
    offset = root_header_size
    while offset < len(manifest):
        if offset + 8 > len(manifest):
            fail("truncated Android XML chunk header")
        chunk_type, header_size, chunk_size = struct.unpack_from("<HHI", manifest, offset)
        if header_size < 8 or chunk_size < header_size or offset + chunk_size > len(manifest):
            fail("invalid Android XML chunk size")
        if chunk_type == RES_STRING_POOL_TYPE:
            if strings is not None:
                fail("multiple Android XML string pools are not supported")
            strings = parse_string_pool(manifest, offset, chunk_size, header_size)
        elif chunk_type == RES_XML_START_ELEMENT_TYPE:
            # ResXMLTree_node には 16-byte header があります。20-byte の attrExt は headerSize
            # ではなく chunk body に含まれます。
            if strings is None or header_size < 16 or chunk_size < header_size + 20:
                fail("invalid Android XML start element")
            name_index = struct.unpack_from("<I", manifest, offset + 20)[0]
            element_name = string_at(strings, name_index)
            if element_name is None:
                fail("Android XML element has no name")
            attribute_start, attribute_size, attribute_count = struct.unpack_from(
                "<HHH", manifest, offset + 24
            )
            attributes_offset = offset + 16 + attribute_start
            if attribute_size < 20 or attributes_offset + attribute_size * attribute_count > offset + chunk_size:
                fail("invalid Android XML attributes")
            attributes: dict[str, str | int | bool] = {}
            for index in range(attribute_count):
                attr_offset = attributes_offset + index * attribute_size
                attr_name_index = struct.unpack_from("<I", manifest, attr_offset + 4)[0]
                raw_value_index = struct.unpack_from("<I", manifest, attr_offset + 8)[0]
                value_type = manifest[attr_offset + 15]
                value_data = struct.unpack_from("<I", manifest, attr_offset + 16)[0]
                attr_name = string_at(strings, attr_name_index)
                if attr_name is None:
                    fail("Android XML attribute has no name")
                raw_value = string_at(strings, raw_value_index)
                attributes[attr_name] = raw_value if raw_value is not None else typed_value(strings, value_type, value_data)
            elements.setdefault(element_name, attributes)
        offset += chunk_size
    if strings is None or "manifest" not in elements:
        fail(f"manifest element is missing from {apk_path.name}")
    return elements


def expect_equal(actual: object, expected: object, description: str) -> None:
    if actual != expected:
        fail(f"{description} mismatch: expected {expected!r}, got {actual!r}")


def validate_manifests(apks: Mapping[str, Path], descriptor: Mapping[str, Any]) -> None:
    package = require_mapping(descriptor.get("package"), "package")
    expected_package = require_string(package.get("name"), "package.name")
    expected_version = require_string(package.get("versionName"), "package.versionName")
    expected_version_code = require_int(package.get("versionCode"), "package.versionCode")
    expected_min_sdk = require_int(package.get("minSdk"), "package.minSdk")
    expected_target_sdk = require_int(package.get("targetSdk"), "package.targetSdk")
    expected_required = require_mapping(descriptor.get("requiredSplits"), "requiredSplits")
    expected_split_types = expected_required.get("baseRequiredSplitTypes")
    if not isinstance(expected_split_types, list) or not all(isinstance(item, str) for item in expected_split_types):
        fail("requiredSplits.baseRequiredSplitTypes must be a string list")
    expected_apks = require_mapping(descriptor.get("splits"), "splits")
    arm64_name = require_string(expected_required.get("arm64V8a"), "requiredSplits.arm64V8a")
    arm64_details = require_mapping(expected_apks.get(arm64_name), "required arm64 split")
    if arm64_details.get("abi") != "arm64-v8a":
        fail("requiredSplits.arm64V8a must identify the arm64-v8a split")
    density_names = expected_required.get("density")
    if not isinstance(density_names, list) or not all(isinstance(name, str) for name in density_names):
        fail("requiredSplits.density must be a string list")
    declared_density_names = sorted(
        name
        for name, details in expected_apks.items()
        if require_mapping(details, f"splits.{name}").get("kind") == "density"
    )
    if sorted(density_names) != declared_density_names:
        fail("requiredSplits.density must include every and only declared density split")

    base = parse_binary_manifest(apks["base.apk"])
    base_manifest = base["manifest"]
    expect_equal(base_manifest.get("package"), expected_package, "base package name")
    expect_equal(base_manifest.get("versionName"), expected_version, "base versionName")
    expect_equal(base_manifest.get("versionCode"), expected_version_code, "base versionCode")
    expected_types = ",".join(expected_split_types)
    expect_equal(base_manifest.get("requiredSplitTypes"), expected_types, "base requiredSplitTypes")
    uses_sdk = base.get("uses-sdk", {})
    expect_equal(uses_sdk.get("minSdkVersion"), expected_min_sdk, "base minSdkVersion")
    expect_equal(uses_sdk.get("targetSdkVersion"), expected_target_sdk, "base targetSdkVersion")

    expected_apks = require_mapping(descriptor.get("splits"), "splits")
    for name, apk_path in apks.items():
        parsed = parse_binary_manifest(apk_path)
        manifest = parsed["manifest"]
        expect_equal(manifest.get("package"), expected_package, f"{name} package name")
        expect_equal(manifest.get("versionCode"), expected_version_code, f"{name} versionCode")
        expect_equal(parsed.get("uses-sdk", {}).get("minSdkVersion"), expected_min_sdk, f"{name} minSdkVersion")
        if name != "base.apk":
            split = require_mapping(expected_apks[name], f"splits.{name}")
            expect_equal(manifest.get("split"), split.get("splitName"), f"{name} split name")


def validate_apk_contents(apks: Mapping[str, Path], descriptor: Mapping[str, Any]) -> None:
    apk_contents = require_mapping(descriptor.get("apkContents"), "apkContents")
    base_expected = require_mapping(apk_contents.get("base"), "apkContents.base")
    arm64_expected = require_mapping(apk_contents.get("arm64V8a"), "apkContents.arm64V8a")
    try:
        with zipfile.ZipFile(apks["base.apk"]) as base:
            dex_count = sum(
                entry.filename.startswith("classes") and entry.filename.endswith(".dex")
                for entry in base.infolist()
            )
        with zipfile.ZipFile(apks["split_config.arm64_v8a.apk"]) as arm64:
            native_count = sum(
                entry.filename.startswith("lib/") and entry.filename.endswith(".so")
                for entry in arm64.infolist()
            )
    except zipfile.BadZipFile as error:
        fail(f"embedded APK is not a valid ZIP: {error}")
    expect_equal(dex_count, require_int(base_expected.get("dexCount"), "apkContents.base.dexCount"), "base DEX count")
    expect_equal(
        native_count,
        require_int(arm64_expected.get("nativeLibraryCount"), "apkContents.arm64V8a.nativeLibraryCount"),
        "arm64-v8a native-library count",
    )


def find_apksigner(explicit_path: str | None) -> Path:
    if explicit_path:
        candidate = Path(explicit_path).expanduser()
        if candidate.is_file() and os.access(candidate, os.X_OK):
            return candidate
        fail(f"--apksigner is not an executable file: {candidate}")
    candidates: list[Path] = []
    for variable in ("ANDROID_SDK_ROOT", "ANDROID_HOME"):
        if value := os.environ.get(variable):
            candidates.append(Path(value))
    candidates.extend((Path.home() / "Library/Android/sdk", Path.home() / "Android/Sdk"))
    for sdk_root in candidates:
        build_tools = sdk_root / "build-tools"
        if build_tools.is_dir():
            matches = sorted(build_tools.glob("*/apksigner"), reverse=True)
            for candidate in matches:
                if candidate.is_file() and os.access(candidate, os.X_OK):
                    return candidate
    if executable := shutil.which("apksigner"):
        return Path(executable)
    fail("Android SDK apksigner was not found; pass --apksigner /path/to/apksigner")


def bool_in_apksigner_output(output: str, label: str) -> bool | None:
    match = re.search(rf"^Verified {re.escape(label)}: (true|false)$", output, re.MULTILINE)
    return None if match is None else match.group(1) == "true"


def signer_records(output: str) -> set[tuple[str, int, int, str]]:
    records: set[tuple[str, int, int, str]] = set()
    pattern = re.compile(
        r"^(V3\.\d) Signer: \(minSdkVersion=(\d+), maxSdkVersion=(\d+)\) "
        r"certificate SHA-256 digest: ([0-9a-f]{64})$",
        re.MULTILINE,
    )
    for scheme, minimum, maximum, digest in pattern.findall(output):
        records.add((scheme, int(minimum), int(maximum), digest))
    return records


def validate_signature_output(output: str, descriptor: Mapping[str, Any], name: str) -> None:
    signature = require_mapping(descriptor.get("signature"), "signature")
    signer_count_match = re.search(r"^Number of signers: (\d+)$", output, re.MULTILINE)
    if signer_count_match is None:
        fail(f"apksigner output did not report signer count for {name}")
    expect_equal(
        int(signer_count_match.group(1)),
        require_int(signature.get("numberOfSigners"), "signature.numberOfSigners"),
        f"{name} signer count",
    )
    expected_schemes = require_mapping(signature.get("verifiedSchemes"), "signature.verifiedSchemes")
    labels = {
        "v1": "using v1 scheme (JAR signing)",
        "v2": "using v2 scheme (APK Signature Scheme v2)",
        "v3": "using v3 scheme (APK Signature Scheme v3)",
        "v3.1": "using v3.1 scheme (APK Signature Scheme v3.1)",
        "v3.2": "using v3.2 scheme (APK Signature Scheme v3.2)",
        "v4": "using v4 scheme (APK Signature Scheme v4)",
        "sourceStamp": "for SourceStamp",
    }
    for key, label in labels.items():
        expected = expected_schemes.get(key)
        if not isinstance(expected, bool):
            fail(f"signature.verifiedSchemes.{key} must be boolean")
        actual = bool_in_apksigner_output(output, label)
        if actual is None:
            fail(f"apksigner output did not report {key} for {name}")
        expect_equal(actual, expected, f"{name} signature {key}")
    expected_records = {
        (
            require_string(item.get("scheme"), "signature.lineage.scheme"),
            require_int(item.get("minSdkVersion"), "signature.lineage.minSdkVersion"),
            require_int(item.get("maxSdkVersion"), "signature.lineage.maxSdkVersion"),
            require_string(item.get("certificateSha256"), "signature.lineage.certificateSha256"),
        )
        for item in signature.get("lineage", [])
        if isinstance(item, dict)
    }
    if len(expected_records) != len(signature.get("lineage", [])):
        fail("signature.lineage must be an array of objects")
    expect_equal(signer_records(output), expected_records, f"{name} signer lineage")
    stamp_match = re.search(r"^Source Stamp Signer: certificate SHA-256 digest: ([0-9a-f]{64})$", output, re.MULTILINE)
    if stamp_match is None:
        fail(f"apksigner output did not report Source Stamp signer for {name}")
    expect_equal(
        stamp_match.group(1),
        require_string(signature.get("sourceStampCertificateSha256"), "signature.sourceStampCertificateSha256"),
        f"{name} Source Stamp certificate",
    )


def validate_signatures(apks: Mapping[str, Path], descriptor: Mapping[str, Any], apksigner: Path) -> None:
    for name, apk_path in apks.items():
        completed = subprocess.run(
            [str(apksigner), "verify", "--verbose", "--print-certs", str(apk_path)],
            stdin=subprocess.DEVNULL,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            check=False,
        )
        output = completed.stdout + completed.stderr
        if completed.returncode != 0:
            fail(f"apksigner verification failed for {name}: {output.strip()}")
        validate_signature_output(output, descriptor, name)


def preflight(apkm_path: Path, descriptor_path: Path, apksigner_path: str | None) -> None:
    descriptor = load_json(descriptor_path)
    apkm = require_mapping(descriptor.get("apkm"), "apkm")
    expected_input_name = require_string(apkm.get("fileName"), "apkm.fileName")
    if apkm_path.name != expected_input_name:
        fail(f"unexpected input file name: expected {expected_input_name}, got {apkm_path.name}")
    expected_apkm_hash = require_string(apkm.get("sha256"), "apkm.sha256")
    expect_equal(sha256_path(apkm_path), expected_apkm_hash, "APKM SHA-256")

    expected_apks = require_mapping(descriptor.get("splits"), "splits")
    if "base.apk" not in expected_apks:
        fail("splits must contain base.apk")
    for name, details in expected_apks.items():
        if not is_safe_member_name(name) or not name.endswith(".apk"):
            fail(f"invalid split name in descriptor: {name!r}")
        require_mapping(details, f"splits.{name}")
    expected_container_entries = descriptor.get("containerEntries")
    if not isinstance(expected_container_entries, list) or not all(isinstance(item, str) for item in expected_container_entries):
        fail("containerEntries must be a string array")
    expected_names = set(expected_container_entries)
    if len(expected_names) != len(expected_container_entries):
        fail("containerEntries contains duplicate names")
    if set(expected_apks) - expected_names:
        fail("containerEntries must include every split")

    try:
        with zipfile.ZipFile(apkm_path) as archive:
            infos = validate_archive_members(archive.infolist(), expected_names, limits_from_descriptor(descriptor))
            with tempfile.TemporaryDirectory(prefix="linimal-preflight-") as temporary_directory:
                temporary_path = Path(temporary_directory)
                apks = safe_extract_expected_apks(
                    archive,
                    infos,
                    {name: require_mapping(value, f"splits.{name}") for name, value in expected_apks.items()},
                    temporary_path,
                    limits_from_descriptor(descriptor).max_entry_uncompressed_bytes,
                )
                validate_manifests(apks, descriptor)
                validate_apk_contents(apks, descriptor)
                validate_signatures(apks, descriptor, find_apksigner(apksigner_path))
    except (OSError, zipfile.BadZipFile) as error:
        fail(f"cannot open APKM ZIP: {error}")


def default_paths() -> tuple[Path, Path]:
    root = Path(__file__).resolve().parents[1]
    return (
        root / "line-apk" / "jp.naver.line.android_26.16.0-261600106_2arch_6dpi_27e24416bed2114af71681c9f1fc7b86_apkmirror.com.apkm",
        root / "reference" / "line-26.16.0-arm64-v8a.json",
    )


def main(argv: list[str] | None = None) -> int:
    default_apkm, default_descriptor = default_paths()
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--apkm", type=Path, default=default_apkm, help="read-only APKM input")
    parser.add_argument("--descriptor", type=Path, default=default_descriptor, help="reference descriptor JSON")
    parser.add_argument("--apksigner", help="Android SDK apksigner executable")
    arguments = parser.parse_args(argv)
    try:
        preflight(arguments.apkm, arguments.descriptor, arguments.apksigner)
    except PreflightError as error:
        print(f"preflight failed: {error}", file=sys.stderr)
        return 1
    print("preflight passed: exact LINE 26.16.0 arm64-v8a APKM reference verified")
    return 0


if __name__ == "__main__":
    sys.exit(main())
