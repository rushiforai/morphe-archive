#!/bin/bash
# repack_and_sign.sh — Full pipeline: patch APK, repackage, re-sign
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

APK="${1:-cz.bakalari.mobile_4.3.2.apk}"
PATCHED_SO="${2:-libapp.so.patched}"
OUT_APK="${3:-cz.bakalari.mobile_4.3.2_patched.apk}"
KEYSTORE="${4:-mykeys.keystore}"
KEY_ALIAS="${5:-mykey}"
STORE_PASS="${6:-android}"
KEY_PASS="${7:-android}"

echo "=== Step 1: Patch libapp.so ==="
python3 "${SCRIPT_DIR}/patch_apk.py" lib/arm64-v8a/libapp.so "${PATCHED_SO}"

echo ""
echo "=== Step 2: Repack APK ==="
python3 "${SCRIPT_DIR}/repack_apk.py" "${APK}" "${PATCHED_SO}" "${OUT_APK}"

echo ""
echo "=== Step 3: Generate keystore (if needed) ==="
if [ ! -f "${KEYSTORE}" ]; then
    keytool -genkeypair -keystore "${KEYSTORE}" -alias "${KEY_ALIAS}" \
        -keyalg RSA -keysize 2048 -validity 10000 \
        -storepass "${STORE_PASS}" -keypass "${KEY_PASS}" \
        -dname "CN=MorPatches, O=MorPatches, C=US"
fi

echo ""
echo "=== Step 4: Sign APK ==="
jarsigner -keystore "${KEYSTORE}" -storepass "${STORE_PASS}" \
    -keypass "${KEY_PASS}" "${OUT_APK}" "${KEY_ALIAS}"

echo ""
echo "=== Done! ==="
echo "Patched APK: ${OUT_APK}"
echo ""
echo "To install:"
echo "  adb uninstall cz.bakalari.mobile"
echo "  adb install ${OUT_APK}"
