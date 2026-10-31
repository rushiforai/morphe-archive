package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    /** Tested build: APKMirror versionCode 510406926 (APKMirror ships the same
     * version name with versionCode 510406907 on APKPure — smali matched, but re-verify
     * fingerprints per update; see docs/testing.md). */
    const val TESTED_VERSION_CODE = 510406926

    /** Second tested build: 445.0.0.46.83 / versionCode 511507647 (APKMirror).
     * Feed merge moved A0F -> A0G (same param shape, .locals 37); R8 renames:
     * LX/3oS -> LX/0hJ (A05/A02 names kept), Media.DED -> DGK, LX/1qQ.DED ->
     * LX/2xO.DGK, ThreadIntf.Ckh -> Cnd (class moved to api.schemas),
     * ThreadItemIntf.CDh -> CIV. See FeedReflectionContract for the per-version sets. */
    const val TESTED_VERSION_CODE_445 = 511507647

    /** Third tested build: 449.0.0.54.82 / versionCode 511908382 (APKMirror). */
    const val TESTED_VERSION_CODE_449 = 511908382

    /** Fourth tested build: 453.0.0.56.79 / versionCode 512308696 (APKMirror).
     * Feed reflection members moved to Media.DVT, ThreadIntf.D0S and
     * ThreadItemIntf.CSU; see FeedReflectionContract. */
    const val TESTED_VERSION_CODE_453 = 512308696

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
            AppTarget(
                version = "449.0.0.54.82",
                minSdk = 28,
            ),
            AppTarget(
                version = "453.0.0.56.79",
                minSdk = 28,
            ),
        ),
    )
    /** Zalo 26.08.01 (versionCode 260801903, APKMirror arm64-v8a) fingerprint target.
     * Obfuscated members (Lvx/s2, Ljt classes, synthetic A6) are pinned to this exact
     * version; re-verify smali per update. See analysis/zalo/26.08.01/notes/. */
    const val TESTED_ZALO_VERSION_CODE = 260801903

    /** Tested 26.10.02 build: versionCode 261002903 (APKMirror arm64-v8a).
     * 26.10.02 targets are pinned separately (for example SeenReceiptSend261002);
     * see analysis/com.zing.zalo/26.10.02/notes/. */
    const val TESTED_ZALO_VERSION_CODE_261002 = 261002903

    val COMPATIBILITY_ZALO_261002 = Compatibility(
        name = "Zalo",
        packageName = "com.zing.zalo",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0068FF,
        targets = listOf(
            AppTarget(
                version = "26.10.02",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to TESTED_ZALO_VERSION_CODE_261002),
                minSdk = 24,
            ),
        ),
    )

    val COMPATIBILITY_ZALO = Compatibility(
        name = "Zalo",
        packageName = "com.zing.zalo",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0068FF,
        targets = listOf(
            AppTarget(
                version = "26.08.01",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to TESTED_ZALO_VERSION_CODE),
                minSdk = 24,
            ),
            AppTarget(
                version = "26.10.02",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to TESTED_ZALO_VERSION_CODE_261002),
                minSdk = 24,
            ),
        ),
    )
}
