package com.zeldrisho.threads.patches.ads

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef

/** Pinned reflection ABI used by FeedAdFilter; validate before injecting any code. */
internal data class FeedReflectionMember(val owner: String, val name: String, val returnType: String)

/**
 * 434.0.0.41.74 member set (versionCode 510406926).
 *
 * Feed unit wrapper LX/3oS exposes media via A05() and the thread via A02();
 * sponsored posts are detected via Media.DED() (direct X/1qQ headers carry
 * their own DED flag, thread-carried items go A02() -> Ckh() -> CDh() -> DED()).
 */
internal val feedReflectionMembers434 = listOf(
    FeedReflectionMember("Lcom/instagram/feed/media/Media;", "DED", "Z"),
    FeedReflectionMember("LX/1qQ;", "DED", "Z"),
    FeedReflectionMember("LX/3oS;", "A05", "Lcom/instagram/feed/media/Media;"),
    FeedReflectionMember("LX/3oS;", "A02", "Lcom/instagram/barcelona/model/ThreadIntf;"),
    FeedReflectionMember("Lcom/instagram/barcelona/model/ThreadIntf;", "Ckh", "Ljava/util/List;"),
    FeedReflectionMember("Lcom/instagram/api/schemas/ThreadItemIntf;", "CDh", "Lcom/instagram/feed/media/Media;"),
)

/**
 * 445.0.0.46.83 member set (versionCode 511507647).
 *
 * Re-hunted from the original APKMirror bundle (base.apk via apktool):
 * - Feed merge moved BarcelonaFeedCache.A0F -> A0G (same param shape, .locals 37).
 * - Wrapper LX/3oS -> LX/0hJ; A05/A02 method names kept, but A02 now returns
 *   `com.instagram.api.schemas.ThreadIntf` (barcelona/model/ThreadIntf is gone).
 * - Media.DED -> Media.DGK: same inner constants prove it (wrapper 0x775627d1,
 *   E7l(-0x79965650), CC6(0x10e895f0) non-null check — renames of E3k/C7J).
 * - Direct header LX/1qQ.DED (field A0W) -> LX/2xO.DGK (field A0W; DB1/DDR/DGK
 *   mirror D8f/DBK/DED one-to-one).
 * - ThreadIntf.Ckh -> Cnd, ThreadItemIntf.CDh -> CIV (positional mapping on both
 *   interfaces; Media/CDh return types unchanged).
 */
internal val feedReflectionMembers445 = listOf(
    FeedReflectionMember("Lcom/instagram/feed/media/Media;", "DGK", "Z"),
    FeedReflectionMember("LX/2xO;", "DGK", "Z"),
    FeedReflectionMember("LX/0hJ;", "A05", "Lcom/instagram/feed/media/Media;"),
    FeedReflectionMember("LX/0hJ;", "A02", "Lcom/instagram/api/schemas/ThreadIntf;"),
    FeedReflectionMember("Lcom/instagram/api/schemas/ThreadIntf;", "Cnd", "Ljava/util/List;"),
    FeedReflectionMember("Lcom/instagram/api/schemas/ThreadItemIntf;", "CIV", "Lcom/instagram/feed/media/Media;"),
)

/**
 * Legacy alias for the 434 set; kept so existing tests and callers keep compiling.
 */
internal val feedReflectionMembers: List<FeedReflectionMember> = feedReflectionMembers434

/** All supported per-version member sets; an APK must satisfy exactly one of them. */
internal val feedReflectionMemberSets: List<List<FeedReflectionMember>> =
    listOf(feedReflectionMembers434, feedReflectionMembers445)

/** Returns the reflection members absent from the supplied class surface. */
private fun missingMembers(
    members: List<FeedReflectionMember>,
    classByType: (String) -> ClassDef?,
): List<FeedReflectionMember> = members.filter { member ->
    classByType(member.owner)?.methods?.any { method ->
        method.name == member.name && method.parameterTypes.isEmpty() &&
            method.returnType == member.returnType &&
            AccessFlags.PUBLIC.isSet(method.accessFlags) &&
            !AccessFlags.STATIC.isSet(method.accessFlags)
    } != true
}

/**
 * This checks member availability, not whether DED/DGK still means sponsored content.
 * Runtime/device QA remains required. Concrete pinned owners declare these methods;
 * fail closed on hierarchy changes rather than guessing inherited replacements.
 *
 * An APK must satisfy one complete per-version set (434 or 445); mixed-version
 * matches are rejected so a half-drifted app fails loudly instead of filtering
 * with the wrong predicate.
 */
internal fun validateFeedReflectionContract(classByType: (String) -> ClassDef?) {
    val perSetMissing = feedReflectionMemberSets.map { missingMembers(it, classByType) }
    check(perSetMissing.count { it.isEmpty() } == 1) {
        "Threads feed reflection contract changed: " +
            perSetMissing.flatten().distinct().joinToString {
                "${it.owner}->${it.name}()${it.returnType}"
            } +
            ". Re-hunt against the original APK; see docs/reverse-engineering.md and docs/qa-checklist.md."
    }
}
