#!/bin/bash
# apk-recon.sh — identify an APK and emit a recon report (Phase-0 triage).
# Usage: scripts/apk-recon.sh <file.apk|apkm|xapk|apks> [output.md]
# Requires: aapt, unzip, strings; optional: rg (fallback: grep), apkid via uvx.
# Phase-0 triage approach (DEX-string stack signals, framework priority,
# obfuscation estimate) adapted from SimoneAvogadro/android-reverse-engineering-skill (Apache-2.0).
set -e

APK="${1:?Usage: scripts/apk-recon.sh <apk-file> [output.md]}"
OUT="${2:-recon.md}"

if [ ! -f "$APK" ]; then
    echo "❌ Not found: $APK" >&2
    exit 1
fi

# rg if available, else grep -E (callers use RG var).
if command -v rg >/dev/null 2>&1; then
    RG="rg"
    RG_Q="rg -q"
else
    RG="grep -E"
    RG_Q="grep -Eq"
fi

TARGET="$APK"
SOURCES=("$APK")
EXT="${APK##*.}"
TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR"' EXIT
if [[ "$EXT" == "apkm" || "$EXT" == "xapk" || "$EXT" == "apks" ]]; then
    unzip -o -q "$APK" '*.apk' -d "$TMPDIR/splits" || {
        echo "❌ Could not extract split APKs from $APK" >&2
        exit 1
    }
    mapfile -d '' -t SOURCES < <(find "$TMPDIR/splits" -type f -name '*.apk' -print0 | sort -z)
    if ((${#SOURCES[@]} == 0)); then
        echo "❌ No embedded APKs found in $APK" >&2
        exit 1
    fi
    TARGET="${SOURCES[0]}"
    for src in "${SOURCES[@]}"; do
        if [[ "${src##*/}" == "base.apk" || "${src##*/}" == "base-master.apk" ]]; then
            TARGET="$src"
            break
        fi
    done
fi

BADGING="$(aapt dump badging "$TARGET" 2>/dev/null | head -20)"
PKG="$(echo "$BADGING" | grep -oP "package: name='\K[^']+" | head -1)"
VER="$(echo "$BADGING" | grep -oP "versionName='\K[^']+" | head -1)"
VERCODE="$(echo "$BADGING" | grep -oP "versionCode='\K[^']+" | head -1)"
MINSDK="$(echo "$BADGING" | grep -oP "sdkVersion:'\K[^']+" | head -1)"
TARGETSDK="$(echo "$BADGING" | grep -oP "targetSdkVersion:'\K[^']+" | head -1)"
LABEL="$(echo "$BADGING" | grep -oP "application-label:'\K[^']+" | head -1)"
LAUNCH="$(echo "$BADGING" | grep -oP "launchable-activity: name='\K[^']+" | head -1)"

SPLIT="APK"
if [[ "$EXT" == "apkm" ]]; then
    SPLIT="APKM"
elif [[ "$EXT" == "xapk" ]]; then
    SPLIT="XAPK"
elif [[ "$EXT" == "apks" ]]; then SPLIT="APKS"; fi
if aapt dump xmltree "$TARGET" AndroidManifest.xml 2>/dev/null | $RG_Q -i 'split|requiredSplit'; then
    SPLIT="$SPLIT (split manifest detected)"
fi

# Aggregate every APK's contents so feature splits contribute .so/DEX signals.
LISTING="$TMPDIR/listing"
: >"$LISTING"
for src in "${SOURCES[@]}"; do
    unzip -Z1 "$src" >>"$LISTING"
done

DEXES="$($RG '\.dex' "$LISTING" | awk '{print $1}' | tr '\n' ' ')"
DEXCOUNT="$($RG -c '\.dex' "$LISTING" || true)"
LIBS="$(grep -E '^lib/[a-z0-9_-]+' "$LISTING" | sort -u | tr '\n' ' ')"
NATIVE_DETAILED="$(grep -E '^lib/[^/]+/[^/]+\.so$' "$LISTING" | sort -u || true)"

# DEX type-descriptor strings: most libs live inside classes*.dex, not as zip
# paths. Extract FQNs (Lcom/foo/Bar; → com/foo/Bar) so stack detection works
# even on obfuscated apps. Inspect every DEX from every APK.
DEXSTR="$TMPDIR/dexstrings"
: >"$DEXSTR"
for src in "${SOURCES[@]}"; do
    while IFS= read -r dex; do
        unzip -p "$src" "$dex" 2>/dev/null |
            strings -n 8 |
            grep -oE 'L[a-z][a-zA-Z0-9_]*(/[a-zA-Z0-9_$]+)+;' |
            sed -E 's/^L//; s/;$//' >>"$DEXSTR" || true
    done < <(unzip -Z1 "$src" | grep -E '\.dex$' || true)
done
sort -u "$DEXSTR" -o "$DEXSTR"

# Check if a pattern exists in the APK listing or DEX strings.
has() { grep -Eq "$1" "$LISTING" || grep -Eq "$1" "$DEXSTR"; }

# --- Framework detection (first match wins) ---
FRAMEWORK="native"
FRAMEWORK_WHY=""
if grep -Eq '^lib/[^/]+/libflutter\.so$' "$LISTING"; then
    FRAMEWORK="Flutter"
    FRAMEWORK_WHY="lib/<abi>/libflutter.so present"
    grep -Eq '^lib/[^/]+/libapp\.so$' "$LISTING" && FRAMEWORK_WHY="$FRAMEWORK_WHY + libapp.so (AOT Dart)"
elif grep -Eq '^lib/[^/]+/libhermes\.so$|^assets/index\.android\.bundle$|^lib/[^/]+/libreactnativejni\.so$' "$LISTING"; then
    FRAMEWORK="React Native"
    FRAMEWORK_WHY="hermes/index.android.bundle/reactnativejni marker"
elif grep -Eq '^assets/www/index\.html$|^assets/www/cordova\.js$|^assets/public/index\.html$' "$LISTING"; then
    FRAMEWORK="Cordova / Capacitor (WebView hybrid)"
    FRAMEWORK_WHY="assets/www/ or assets/public/ shell"
elif grep -Eq '^lib/[^/]+/libmonodroid\.so$|^assemblies/' "$LISTING"; then
    FRAMEWORK="Xamarin / .NET MAUI"
    FRAMEWORK_WHY="libmonodroid.so or assemblies/ (.NET DLLs)"
elif grep -Eq '^assets/flutter_assets/' "$LISTING"; then
    FRAMEWORK="Flutter (code-only split?)"
    FRAMEWORK_WHY="flutter_assets/ without libflutter.so — check splits"
elif has 'androidx\.compose'; then
    FRAMEWORK="Native Android (Kotlin + Jetpack Compose)"
    FRAMEWORK_WHY="androidx.compose.* in DEX"
elif has '^META-INF/.*\.kotlin_module$'; then
    FRAMEWORK="Native Android (Kotlin)"
    FRAMEWORK_WHY="kotlin_module metadata, no Compose markers"
else
    FRAMEWORK="Native Android (Java/Kotlin)"
    FRAMEWORK_WHY="no cross-platform markers"
fi

# --- Stack signals ---
http=()
has 'retrofit2' && http+=("Retrofit")
has 'okhttp3' && http+=("OkHttp")
has 'io/ktor/' && http+=("Ktor")
has 'com/apollographql/' && http+=("Apollo/GraphQL")
has 'com/android/volley' && http+=("Volley")

di=()
has 'dagger/hilt/' && di+=("Hilt")
has 'org/koin/' && di+=("Koin")

ser=()
has 'kotlinx/serialization/' && ser+=("kotlinx.serialization")
has 'com/google/gson/' && ser+=("Gson")
has 'com/squareup/moshi/' && ser+=("Moshi")
has 'com/fasterxml/jackson/' && ser+=("Jackson")

billing=()
has 'revenuecat|com/revenuecat' && billing+=("RevenueCat")
has 'adapty|com/adapty' && billing+=("Adapty")
has 'qonversion|io/qonversion' && billing+=("Qonversion")
has 'superwall' && billing+=("Superwall")
has 'com/android/billingclient' && billing+=("Play Billing")
has 'LicenseChecker|licensing' && billing+=("LVL")

protect=()
has '[Pp]airip|[Pp]airIp' && protect+=("PairIP?")
has 'PlayIntegrity|IntegrityManager' && protect+=("Play Integrity")
has 'RootBeer|checkRoot|isRooted|magisk' && protect+=("root-checks")
has 'CertificatePinner|checkServerTrusted|TrustManager' && protect+=("pinning")

# --- Obfuscation estimate: single/double-letter root dirs ---
SHORT_DIRS=$(grep -oE '^[a-z]{1,2}/' "$LISTING" | sort -u | wc -l | tr -d ' ')
if [[ "$SHORT_DIRS" -gt 30 ]]; then
    OBF="HIGH ($SHORT_DIRS short root dirs)"
elif [[ "$SHORT_DIRS" -gt 10 ]]; then
    OBF="MODERATE ($SHORT_DIRS short root dirs)"
else OBF="LOW"; fi

# --- Notable SDKs / permissions ---
sdks=()
has '^assets/com/appsflyer/' && sdks+=("AppsFlyer")
has 'com/datadog/' && sdks+=("Datadog")
has 'io/sentry/' && sdks+=("Sentry")
has 'com/google/firebase/' && sdks+=("Firebase")
has 'com/google/android/gms/' && sdks+=("Play Services")
has 'com/facebook/' && sdks+=("Facebook")
has 'com/stripe/|com/braintreepayments/|com/payu/' && sdks+=("payments-SDK")
PERMS="$(aapt dump badging "$TARGET" 2>/dev/null | grep -oP "uses-permission: name='\K[^']+" | tr '\n' ' ')"

if has 'BuildConfig\.class$'; then
    BUILDCONFIG="present — grep BuildConfig.java after decompile for base URLs/flavor/keys"
else BUILDCONFIG="not in listing (still worth grepping after decompile)"; fi

APKID="unknown (apkid not available)"
if command -v uvx >/dev/null 2>&1; then
    APKID="$(uvx apkid "$APK" 2>/dev/null || echo 'apkid failed')"
fi

SIZE="$(du -h "$APK" | cut -f1)"

# --- Recommendation ---
case "$FRAMEWORK" in
    Flutter*) NEXT="Java decompile yields ~no app logic (Dart AOT in libapp.so). Prefer binary hexPatch or the platform-channel bridge; see bypass-patterns.md." ;;
    React*) NEXT="Logic is JS/Hermes (assets/index.android.bundle), not DEX. Use Hermes-level replacement; native modules are patchable normally." ;;
    Cordova*) NEXT="App code is assets/www|public/ HTML/JS — unzip and inspect, no DEX fingerprints needed." ;;
    Xamarin* | *.NET*) NEXT="Logic is .NET DLLs (assemblies/). Dump with ILSpy/dotPeek; jadx shows only the Mono host." ;;
    *) NEXT="Proceed: jadx → decompiled/ + extract-smali.sh → smali/ (all DEX files), then hunt per reverse-engineering.md §3." ;;
esac

cat >"$OUT" <<EOF
# Recon — ${LABEL:-unknown}

## Identity
- App Name: ${LABEL:-unknown}
- Package: ${PKG:-unknown}
- Version: ${VER:-unknown}
- VersionCode: ${VERCODE:-unknown}
- MinSdk: ${MINSDK:-unknown}
- TargetSdk: ${TARGETSDK:-unknown}

## APK Info
- File: $APK ($SIZE)
- APK Type: $SPLIT
- DEX count: $DEXCOUNT ($DEXES)

## Protections (apkid)
\`\`\`
$APKID
\`\`\`

## Architecture
- Framework: $FRAMEWORK ($FRAMEWORK_WHY)
- Obfuscation: $OBF
- Native libs: ${LIBS:-none}
- Main activity: ${LAUNCH:-unknown}
- Permissions: ${PERMS:-none listed}

## Stack signals (DEX strings + listing)
- HTTP: ${http[*]:-none detected}
- DI: ${di[*]:-none detected}
- Serialization: ${ser[*]:-none detected}
- Billing SDK: ${billing[*]:-none detected}
- Protections: ${protect[*]:-none detected}
- Third-party SDKs: ${sdks[*]:-none detected}
- BuildConfig: $BUILDCONFIG

## Native libraries (detailed)
\`\`\`
${NATIVE_DETAILED:-none}
\`\`\`

## Recommended next step
$NEXT
EOF

echo "✅ Recon written to $OUT"
