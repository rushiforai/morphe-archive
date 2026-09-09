package com.zeldrisho.threads.patches.ads

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef

/** Pinned reflection ABI used by FeedAdFilter; validate before injecting any code. */
internal data class FeedReflectionMember(val owner: String, val name: String, val returnType: String)

internal val feedReflectionMembers = listOf(
    FeedReflectionMember("Lcom/instagram/feed/media/Media;", "DED", "Z"),
    FeedReflectionMember("LX/1qQ;", "DED", "Z"),
    FeedReflectionMember("LX/3oS;", "A05", "Lcom/instagram/feed/media/Media;"),
    FeedReflectionMember("LX/3oS;", "A02", "Lcom/instagram/barcelona/model/ThreadIntf;"),
    FeedReflectionMember("Lcom/instagram/barcelona/model/ThreadIntf;", "Ckh", "Ljava/util/List;"),
    FeedReflectionMember("Lcom/instagram/api/schemas/ThreadItemIntf;", "CDh", "Lcom/instagram/feed/media/Media;"),
)

/**
 * This checks member availability, not whether DED still means sponsored content.
 * Runtime/device QA remains required. Concrete pinned owners declare these methods;
 * fail closed on hierarchy changes rather than guessing inherited replacements.
 */
internal fun validateFeedReflectionContract(classByType: (String) -> ClassDef?) {
    val missing = feedReflectionMembers.filter { member ->
        classByType(member.owner)?.methods?.any { method ->
            method.name == member.name && method.parameterTypes.isEmpty() &&
                method.returnType == member.returnType &&
                AccessFlags.PUBLIC.isSet(method.accessFlags) &&
                !AccessFlags.STATIC.isSet(method.accessFlags)
        } != true
    }
    check(missing.isEmpty()) {
        "Threads feed reflection contract changed: " +
            missing.joinToString { "${it.owner}->${it.name}()${it.returnType}" } +
            ". Re-hunt against the original APK; see docs/reverse-engineering.md and docs/qa-checklist.md."
    }
}
