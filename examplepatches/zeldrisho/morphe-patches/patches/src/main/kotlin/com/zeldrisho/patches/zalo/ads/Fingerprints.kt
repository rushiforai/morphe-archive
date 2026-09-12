package com.zeldrisho.patches.zalo.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/*
 * Zalo 26.08.01 ad gates (versionCode 260801903, APKMirror arm64-v8a).
 *
 * All smali quotes live in analysis/zalo-26.08.01/notes/candidate-evidence.md.
 * Obfuscated holders (Lvx/s2, Ljt classes) are matched only under the pinned
 * COMPATIBILITY_ZALO version; re-verify per update.
 */

/** Offline-ads time window: `Lvx/s2.h()Z` checks `Lu52/d.I+G+time`. Forced false. */
internal object OfflineAdsWindow : Fingerprint(
    definingClass = "Lvx/s2;",
    name = "h",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(definingClass = "Lu52/d;", name = "I", type = "Z"),
        methodCall(definingClass = "Ljava/lang/Long;", name = "longValue"),
    ),
)

/** Offline-ads tracker gate: `Lvx/s2.g()Z` consults h() plus `Lu52/d.J`. Forced false. */
internal object OfflineAdsGate : Fingerprint(
    definingClass = "Lvx/s2;",
    name = "g",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        methodCall(definingClass = "Lvx/s2;", name = "h", returnType = "Z"),
        fieldAccess(definingClass = "Lu52/d;", name = "J", type = "Z"),
    ),
)

/**
 * Google-network switch: `Adtima.updateSupportNetwork()` drops admob/dfp/ima
 * only when the server flag says so. The patch NOPs the skip-branch so the
 * removal always runs. Stable SDK class; strings are unordered content keys.
 */
internal object GoogleAdsNetworkGate : Fingerprint(
    definingClass = "Lcom/adtima/Adtima;",
    name = "updateSupportNetwork",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(definingClass = "Lu52/d;", name = "L", type = "Z"),
        opcode(Opcode.IF_NEZ),
        string("admob"),
        string("dfp"),
        string("ima"),
    ),
)

/**
 * Story-ads config reads (`social@story@story_ads@enable` via `Lvj0/m.f`).
 * Two call sites on 26.08.01 (StoryDetailsView + kz0/u); the patch zeroes the
 * config result register after MOVE_RESULT in every matched method.
 */
internal object StoryAdsConfig : Fingerprint(
    filters = listOf(
        string("social@story@story_ads@enable"),
        methodCall(definingClass = "Lvj0/m;", name = "f", returnType = "I"),
        opcode(Opcode.MOVE_RESULT),
        opcode(Opcode.IF_NE),
    ),
)

/**
 * Adtima limit-ad-tracking read: `com/adtima/d.doInBackground()` fetches
 * `AdvertisingIdClient.getAdvertisingIdInfo()` and stores the opt-out flag in
 * `Adtima.mIsLat` (consumed by the ad-roll renderers). Stable `com.adtima`
 * holder; the patch reports opted-out without touching the Play API.
 */
internal object AdtimaLatRead : Fingerprint(
    definingClass = "Lcom/adtima/d;",
    name = "doInBackground",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;",
            name = "getAdvertisingIdInfo",
        ),
        methodCall(
            definingClass = "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;",
            name = "isLimitAdTrackingEnabled",
            returnType = "Z",
        ),
    ),
)

/**
 * Community-ads config reads (`community.community_ads.enable` via `Lvj0/m.f`).
 * Two call sites on 26.08.01 (jt/m.c + jt/e.Q); patched the same way as story.
 */
internal object CommunityAdsConfig : Fingerprint(
    filters = listOf(
        string("community.community_ads.enable"),
        methodCall(definingClass = "Lvj0/m;", name = "f", returnType = "I"),
        opcode(Opcode.MOVE_RESULT),
        opcode(Opcode.IF_NE),
    ),
)
