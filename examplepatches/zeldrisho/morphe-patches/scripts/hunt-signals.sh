#!/bin/bash
# hunt-signals.sh — one-pass triage over decompiled/ or smali/ before hunting.
# Counts protection / billing / ads / modern-stack signals so you know which
# bypass-pattern section applies. Mirrors the skill's find-api-calls summary,
# but oriented at patch targets (not API docs).
# CANONICAL PATTERN LIST: the buckets below own the exact search expressions.
# docs/reverse-engineering.md summarizes intent and docs/bypass-patterns.md names
# signal families only. If you change a pattern here, update the recipe that
# motivated it; if a recipe needs a new signal, add the expression here first.
# Usage: scripts/hunt-signals.sh <analysis-dir> [--files]
#   <analysis-dir>: analysis/<app>/decompiled or analysis/<app>/smali
#   --files: also print matching file list per bucket (default: counts only)
set -e

DIR="${1:?Usage: scripts/hunt-signals.sh <decompiled-or-smali-dir> [--files]}"
FILES=0
[[ "${2:-}" == "--files" ]] && FILES=1
[[ ! -d "$DIR" ]] && {
    echo "❌ Not a directory: $DIR" >&2
    exit 1
}

if command -v rg >/dev/null 2>&1; then G="rg -l"; else G="grep -rEl"; fi

# Count and optionally list files matching a pattern under a category label.
# $1=label (e.g. "integrity/license"), $2=pattern (grep/rg regex).
bucket() { # $1=label $2=pattern
    n=$($G "$2" "$DIR" 2>/dev/null | wc -l | tr -d ' ')
    printf '  %-28s %s files\n' "$1:" "$n"
    if [[ "$FILES" == "1" && "$n" -gt 0 && "$n" -le 20 ]]; then
        $G "$2" "$DIR" 2>/dev/null | sed 's/^/      /'
    fi
}

echo "=== Hunt signals: $DIR ==="
echo "-- protections --"
bucket "integrity/license" 'pairip|PairIp|PlayIntegrity|IntegrityManager|processLicenseResponse|validateLicenseResponse'
bucket "signature" 'GET_SIGNATURES|checkSignature|verifySignature|getPackageInfo'
bucket "root" 'isRooted|checkRoot|RootBeer|magisk|Superuser'
bucket "pinning/trust" 'CertificatePinner|checkServerTrusted|TrustManager|HostnameVerifier'
bucket "emulator/debug" 'isEmulator|goldfish|isDebuggerConnected|waitForDebugger'
bucket "hmac/signing" 'HmacSHA|Mac.getInstance|SecretKeySpec|Signature.getInstance|x-signature|computeSignature'
echo "-- billing/gates --"
bucket "revenuecat" 'revenuecat|CustomerInfo|EntitlementInfos|getEntitlements'
bucket "adapty/qonversion/superwall" 'adapty|qonversion|superwall'
bucket "play-billing" 'BillingClient|queryPurchases|isAcknowledged|BillingResponseCode'
bucket "lvl" 'LicenseChecker|Policy.LICENSED|allowAccess'
bucket "local-gates" 'isPro|isPremium|isSubscribed|hasPremium|hasPurchased|isFeatureEnabled|canAccess|isUnlocked'
bucket "remote-config" 'RemoteConfig|getBoolean|featureFlag'
echo "-- ads --"
bucket "ads" 'MobileAds|AdRequest|interstitial|rewarded|UnityAds|AppLovin|IronSource|AudienceNetwork|loadAd|showAd'
echo "-- modern stacks (kotlin) --"
bucket "ktor" 'HttpClient|client\.get\(|client\.post\(|defaultRequest|BearerTokens|loadTokens|refreshTokens'
bucket "apollo/graphql" 'ApolloClient|serverUrl|OPERATION_DOCUMENT'
bucket "koin" 'org\.koin|module \{|single<|factory<|singleOf|by inject'
bucket "hilt/dagger" '@HiltAndroidApp|@AndroidEntryPoint|@Provides|@Binds|@Inject'
echo
echo "Next: run targeted rg per bucket above, then smali-verify (see docs/reverse-engineering.md)."
echo "Tip: BuildConfig first: rg 'BASE_URL|API_URL|FLAVOR|API_KEY' -g 'BuildConfig.java' $DIR"
