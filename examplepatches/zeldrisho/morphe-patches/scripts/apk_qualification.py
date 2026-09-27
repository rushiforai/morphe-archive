"""Pure qualification checks shared by offline fixtures and release tooling."""

EXPECTED_PACKAGE = "com.zing.zalo"
EXPECTED_VERSION_CODE = "260801903"


def validate_identity(
    metadata, *, package=EXPECTED_PACKAGE, version_code=EXPECTED_VERSION_CODE
):
    """Raise ``ValueError`` unless parsed APK identity matches the expected build."""
    actual_package = metadata.get("package")
    actual_version = str(metadata.get("versionCode", ""))
    if actual_package != package:
        raise ValueError(f"unexpected package: {actual_package!r}")
    if actual_version != str(version_code):
        raise ValueError(f"unexpected versionCode: {actual_version!r}")


def validate_split(base_metadata, split_metadata, base_certificate, split_certificate):
    """Raise ``ValueError`` unless a split matches the base identity and signer."""
    validate_identity(
        split_metadata,
        package=base_metadata["package"],
        version_code=base_metadata["versionCode"],
    )
    if split_certificate is None or base_certificate is None:
        raise ValueError("missing signing certificate")
    if split_certificate != base_certificate:
        raise ValueError("split signing certificate does not match base APK")


def validate_input_certificate(certificate, *, expected=None):
    """Return a stripped input digest after optionally enforcing a stock digest."""
    if not certificate or not certificate.strip():
        raise ValueError("input APK has no signing certificate")
    if expected is not None and certificate.strip() != expected.strip():
        raise ValueError(
            "input APK signing certificate is not the expected certificate"
        )
    return certificate.strip()


def validate_output_certificate(certificate, *, expected):
    """Return a stripped output digest after matching the configured signer."""
    if not certificate or not certificate.strip():
        raise ValueError("output APK has no signing certificate")
    if not expected or not expected.strip():
        raise ValueError("output signing certificate is not configured")
    if certificate.strip() != expected.strip():
        raise ValueError(
            "output APK signing certificate does not match configured signer"
        )
    return certificate.strip()
