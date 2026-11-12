#!/bin/sh
# Usage: build-arm64.sh [brave|bare]   (default: brave)
# One engine source serves every Chromium port; only the JNI class, log tag
# and output name differ.
set -eu
BRAVE_FONT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
BRAVE_PROJECT_DIR=$(CDPATH= cd -- "$BRAVE_FONT_DIR/../../.." && pwd)
BRAVE_NDK=${ANDROID_NDK_HOME:-/opt/homebrew/share/android-commandlinetools/ndk/29.0.13599879}
BRAVE_CC="$BRAVE_NDK/toolchains/llvm/prebuilt/darwin-x86_64/bin/aarch64-linux-android29-clang"
BRAVE_SHADOWHOOK="$BRAVE_PROJECT_DIR/patches/src/main/resources/helium/native/arm64-v8a"
case "${1:-brave}" in
    brave)
        PORT_DEFINES=""
        PORT_OUTPUT="$BRAVE_PROJECT_DIR/patches/src/main/resources/brave/native/arm64-v8a/libfontism_brave_233.so"
        ;;
    bare)
        # Bare resolves lang="ko" sans-serif through a U+AC00 locale probe that
        # bypasses the fallback hook; answer it with the custom family.
        PORT_DEFINES="-DLOG_TAG=\"BareFontNative\" -DFONTISM_ENGINE_VERSION=\"2.3.3-bare2\"
            -DFONTISM_BOOTSTRAP_CLASS=\"app/fontism/extension/bare/BareFontBootstrap\"
            -DFONTISM_LOCALE_DEFAULT_PROBE"
        PORT_OUTPUT="$BRAVE_PROJECT_DIR/patches/src/main/resources/bare/native/arm64-v8a/libfontism_bare_233.so"
        ;;
    *) echo "unknown port: $1" >&2; exit 2 ;;
esac
mkdir -p "$(dirname "$PORT_OUTPUT")"
# shellcheck disable=SC2086 # PORT_DEFINES is intentionally split into flags.
"$BRAVE_CC" -shared -fPIC -O2 -fvisibility=hidden -ffunction-sections -fdata-sections \
    -Wl,--gc-sections -Wl,-z,relro,-z,now $PORT_DEFINES \
    -I"$BRAVE_FONT_DIR/include" "$BRAVE_FONT_DIR/fontism_hook.c" \
    -L"$BRAVE_SHADOWHOOK" -lshadowhook -llog -ldl \
    -o "$PORT_OUTPUT"
shasum -a 256 "$PORT_OUTPUT"
