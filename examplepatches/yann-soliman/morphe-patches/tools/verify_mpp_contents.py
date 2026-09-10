#!/usr/bin/env python3
import io
import sys
import zipfile
from pathlib import Path

CALENDAR_DESCRIPTORS = {
    b"Lio/github/yannsoliman/patches/keepcool/KeepcoolCalendarPatchKt;",
    b"Lio/github/yannsoliman/patches/keepcool/KeepcoolCalendarFingerprintsKt;",
    b"Lio/github/yannsoliman/patches/keepcool/BookingCalendarSetupFingerprint;",
    b"Lio/github/yannsoliman/patches/keepcool/DatePickerBuildFingerprint;",
}


def inspect_archive_bytes(data: bytes, prefix: str = "") -> tuple[list[str], list[bytes]]:
    entries: list[str] = []
    dex_blobs: list[bytes] = []
    bio = io.BytesIO(data)
    if not zipfile.is_zipfile(bio):
        return entries, dex_blobs

    bio.seek(0)
    with zipfile.ZipFile(bio) as zf:
        for name in zf.namelist():
            full = f"{prefix}{name}"
            entries.append(full)
            payload = zf.read(name)
            lower = name.lower()

            if lower.endswith(".dex"):
                dex_blobs.append(payload)
            elif lower.endswith((".jar", ".zip", ".mpp")):
                nested_entries, nested_dex = inspect_archive_bytes(payload, f"{full}!/")
                entries.extend(nested_entries)
                dex_blobs.extend(nested_dex)

    return entries, dex_blobs


def inspect(path: Path) -> tuple[list[str], list[bytes]]:
    data = path.read_bytes()
    if not zipfile.is_zipfile(io.BytesIO(data)):
        raise SystemExit(f"{path} is not a ZIP/JAR-compatible MPP")
    return inspect_archive_bytes(data)


def descriptor_name(value: bytes) -> str:
    return value.decode("ascii").removeprefix("L").removesuffix(";")


def main() -> None:
    if len(sys.argv) != 3:
        raise SystemExit("usage: verify_mpp_contents.py PUBLIC_MPP PERSONAL_MPP")

    public_entries, public_dex = inspect(Path(sys.argv[1]))
    personal_entries, personal_dex = inspect(Path(sys.argv[2]))

    if not public_dex:
        raise SystemExit(
            "public MPP has no DEX entries: "
            + ", ".join(name for name in public_entries if name.lower().endswith((".jar", ".dex")))
        )
    if not personal_dex:
        raise SystemExit(
            "personal MPP has no DEX entries: "
            + ", ".join(name for name in personal_entries if name.lower().endswith((".jar", ".dex")))
        )

    public_bytes = b"".join(public_dex)
    personal_bytes = b"".join(personal_dex)

    leaked = sorted(
        descriptor_name(desc)
        for desc in CALENDAR_DESCRIPTORS
        if desc in public_bytes
    )
    missing = sorted(
        descriptor_name(desc)
        for desc in CALENDAR_DESCRIPTORS
        if desc not in personal_bytes
    )

    if leaked:
        raise SystemExit(f"calendar classes leaked into public DEX: {leaked}")
    if missing:
        raise SystemExit(f"calendar classes missing from personal DEX: {missing}")

    print("MPP contents: PASS")
    print(f"Public DEX entries: {len(public_dex)}")
    print(f"Personal DEX entries: {len(personal_dex)}")
    print("Calendar classes absent from public DEX")
    print("Calendar classes present in personal DEX")


if __name__ == "__main__":
    main()
