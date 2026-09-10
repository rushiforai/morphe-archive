package com.zeldrisho.threads.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /** Tested build: APKMirror versionCode 510406926 (APKPure ships the same
     * version name with versionCode 510406907 — smali matched, but re-verify
     * fingerprints per update; see docs/qa-checklist.md §4). */
    const val TESTED_VERSION_CODE = 510406926

    /** Second tested build: 445.0.0.46.83 / versionCode 511507647 (APKMirror).
     * Feed merge moved A0F -> A0G (same param shape, .locals 37); R8 renames:
     * LX/3oS -> LX/0hJ (A05/A02 names kept), Media.DED -> DGK, LX/1qQ.DED ->
     * LX/2xO.DGK, ThreadIntf.Ckh -> Cnd (class moved to api.schemas),
     * ThreadItemIntf.CDh -> CIV. See FeedReflectionContract for the per-version sets. */
    const val TESTED_VERSION_CODE_445 = 511507647

    // Threads (Meta codename "Barcelona") is built from the Instagram codebase and is heavily
    // R8-obfuscated. Obfuscated class/method names shift on nearly every Meta release, so a
    // null ("any") version is NOT realistic here (and the Morphe Manager cannot parse a null
    // version anyway — it aborts the whole bundle). The feed merge is structurally matched in
    // BarcelonaFeedCache, but the extension's reflection ABI still uses pinned R8 names.
    // Patch-time ABI validation detects missing members, not changed ad-predicate semantics.
    val COMPATIBILITY_THREADS = Compatibility(
        name = "Threads",
        packageName = "com.instagram.barcelona",
        // Distributed as split APKs (base + config.arm64_v8a + config.<dpi>); supply as .apks.
        apkFileType = ApkFileType.APKS,
        appIconColor = 0x000000, // Threads brand black (info.json accent_color 000000), 0xRRGGBB
        targets = listOf(
            AppTarget(
                version = "434.0.0.41.74",
                minSdk = 28,
            ),
            AppTarget(
                version = "445.0.0.46.83",
                minSdk = 28,
            ),
        ),
    )
}
