package com.zeldrisho.patches.threads.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Feed-merge entry point (BarcelonaFeedCache.A0F on 434, A0G on 445).
 *
 * WHY THIS TARGET:
 * Every fetched main-feed list funnels through the merge method before merging into the visible
 * feed, so filtering the list parameter here drops sponsored units before they can
 * render (gap-free, cache stays clean). There is no ad-specific construction hook
 * on the main-feed path — ads are ordinary feed units whose only ad signal is
 * Media.DED()/DGK() (confirmed by on-device probes: thousands of calls per scroll).
 *
 * WHY THIS FINGERPRINT IS STABLE:
 * The defining class is non-obfuscated and the INVOKE_DIRECT_RANGE into the
 * addAndSaveItemsFromFeedFetchSuccess$2$1 save-callback is structural, not a bare
 * R8 name match. Do not match the R8 method name or its obfuscated object
 * parameter types; the List remains p5 and all parameters occupy one register.
 * The same fingerprint matches A0F on 434 and A0G on 445: both share the param
 * shape (LX/obf, Integer, String, String, List, LX/obf, Function3, Z, .locals 37)
 * and both contain the single $2$1.<init> range-invoke (only the obfuscated
 * continuation/inner types differ, which this fingerprint does not constrain).
 *
 * VERIFIED 434.0.0.41.74 (versionCode 510406926):
 *   BarcelonaFeedCache.smali — public final A0F(...)Ljava/lang/Object; with the
 *   $2$1.<init> range-invoke present.
 * VERIFIED 445.0.0.46.83 (versionCode 511507647):
 *   BarcelonaFeedCache.smali — public final A0G(...)Ljava/lang/Object; with the
 *   $2$1.<init> range-invoke present (A0F now has a different signature and no callback).
 * Re-verify per update; see
 * docs/qa-checklist.md §4 (APKPure ships the same version name with a different
 * versionCode — smali matched, but fingerprints must be re-confirmed).
 */
internal object FeedMergeMethod : Fingerprint(
    definingClass = "Lcom/instagram/barcelona/feed/data/cache/BarcelonaFeedCache;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "L",
        "Ljava/lang/Integer;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/util/List;",
        "L",
        "Lkotlin/jvm/functions/Function3;",
        "Z",
    ),
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_DIRECT_RANGE,
            definingClass = "Lcom/instagram/barcelona/feed/data/cache/" +
                "BarcelonaFeedCache\$addAndSaveItemsFromFeedFetchSuccess\$2\$1;",
            name = "<init>",
            returnType = "V",
        ),
    ),
)

/** Ad-predicate implementation selected by its stable GraphQL field literals. */
internal object MediaAdPredicateHelper : Fingerprint(
    returnType = "Z",
    parameters = listOf("L"),
    custom = { candidate, _ ->
        val method = candidate as com.android.tools.smali.dexlib2.iface.Method
        val literals = method.getImplementation()?.getInstructions()?.toList().orEmpty()
            .filterIsInstance<WideLiteralInstruction>()
            .map { it.wideLiteral }
            .toSet()
        -0x79965650L in literals && 0x10e895f0L in literals
    },
)

/** Media predicate that constructs the helper argument and directly returns its boolean result. */
internal fun mediaAdPredicate(helper: MethodReference) = Fingerprint(
    definingClass = "Lcom/instagram/feed/media/Media;",
    returnType = "Z",
    parameters = emptyList(),
    custom = { candidate, _ ->
        val method = candidate as com.android.tools.smali.dexlib2.iface.Method
        val instructions = method.getImplementation()?.getInstructions()?.toList().orEmpty()
        val constructsArgument = instructions.any { it.opcode == Opcode.NEW_INSTANCE }
        val returnsHelperResult = instructions.indices.any { index ->
            val reference = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            reference?.let {
                it.definingClass == helper.definingClass && it.name == helper.name &&
                    it.parameterTypes == helper.parameterTypes && it.returnType == helper.returnType
            } == true && index + 2 < instructions.size &&
                instructions[index + 1].opcode == Opcode.MOVE_RESULT &&
                instructions[index + 2].opcode == Opcode.RETURN
        }
        constructsArgument && returnsHelperResult
    },
)

/** Feed-wrapper's feedContent accessor uniquely anchors the wrapper class. */
internal object FeedContentAccessor : Fingerprint(
    returnType = "L",
    parameters = emptyList(),
    filters = listOf(string("feedContent")),
)

/** Matches the feed wrapper's thread getter by its return type's stable simple role. */
internal fun feedThreadAccessor(anchor: MethodReference) = Fingerprint(
    definingClass = anchor.definingClass,
    returnType = "L",
    parameters = emptyList(),
    custom = { candidate, _ ->
        val method = candidate as com.android.tools.smali.dexlib2.iface.Method
        val instructions = method.getImplementation()?.getInstructions()?.toList().orEmpty()
        val callsAnchor = instructions.filterIsInstance<ReferenceInstruction>().any { instruction ->
            (instruction.reference as? MethodReference)?.let { reference ->
                reference.definingClass == anchor.definingClass && reference.name == anchor.name &&
                    reference.parameterTypes == anchor.parameterTypes && reference.returnType == anchor.returnType
            } == true
        }
        val castsThreadIntf = instructions.any { it.opcode == Opcode.CHECK_CAST } &&
            instructions.filterIsInstance<ReferenceInstruction>().any { instruction ->
                (instruction.reference as? FieldReference)?.type?.endsWith("/ThreadIntf;") == true
            }
        callsAnchor && castsThreadIntf
    },
)

/** Resolves the unique abstract List getter on the resolved ThreadIntf interface. */
internal fun threadItemsAccessor(threadAccessor: MethodReference) = Fingerprint(
    definingClass = threadAccessor.returnType,
    returnType = "Ljava/util/List;",
    parameters = emptyList(),
    custom = { candidate, _ ->
        val method = candidate as com.android.tools.smali.dexlib2.iface.Method
        AccessFlags.PUBLIC.isSet(method.accessFlags) &&
            AccessFlags.ABSTRACT.isSet(method.accessFlags) &&
            !AccessFlags.STATIC.isSet(method.accessFlags)
    },
)

/** Finds a wrapper accessor in the class owning the matched feedContent accessor. */
internal fun threadItemMediaAccessor() = Fingerprint(
    definingClass = "Lcom/instagram/api/schemas/ThreadItemIntf;",
    returnType = "Lcom/instagram/feed/media/Media;",
    parameters = emptyList(),
    custom = { candidate, _ ->
        val method = candidate as com.android.tools.smali.dexlib2.iface.Method
        AccessFlags.PUBLIC.isSet(method.accessFlags) &&
            AccessFlags.ABSTRACT.isSet(method.accessFlags) &&
            !AccessFlags.STATIC.isSet(method.accessFlags)
    },
)

/**
 * Matches a no-argument wrapper accessor in [anchor]'s class with the requested [returnType].
 *
 * The method must call the anchor and contain a thread cast/field read or a media
 * instance check/interface call, depending on the requested role.
 */
internal fun feedWrapperAccessor(anchor: MethodReference, returnType: String) = Fingerprint(
    definingClass = anchor.definingClass,
    returnType = returnType,
    parameters = emptyList(),
    custom = { candidate, _ ->
        val method = candidate as com.android.tools.smali.dexlib2.iface.Method
        val instructions = method.getImplementation()?.getInstructions()?.toList().orEmpty()
        val callsAnchor = instructions.filterIsInstance<ReferenceInstruction>().any { instruction ->
            (instruction.reference as? MethodReference)?.let { reference ->
                reference.definingClass == anchor.definingClass && reference.name == anchor.name &&
                    reference.parameterTypes == anchor.parameterTypes && reference.returnType == anchor.returnType
            } == true
        }
        val semanticShape = if (returnType == "Lcom/instagram/api/schemas/ThreadIntf;") {
            instructions.any { it.opcode == Opcode.CHECK_CAST } &&
                instructions.filterIsInstance<ReferenceInstruction>().any { instruction ->
                    (instruction.reference as? com.android.tools.smali.dexlib2.iface.reference.FieldReference)
                        ?.type == returnType
                }
        } else {
            instructions.any { it.opcode == Opcode.INSTANCE_OF } &&
                instructions.filterIsInstance<ReferenceInstruction>().any { instruction ->
                    instruction.opcode == Opcode.INVOKE_INTERFACE &&
                        (instruction.reference as? MethodReference)?.returnType == returnType
                }
        }
        callsAnchor && semanticShape
    },
)
