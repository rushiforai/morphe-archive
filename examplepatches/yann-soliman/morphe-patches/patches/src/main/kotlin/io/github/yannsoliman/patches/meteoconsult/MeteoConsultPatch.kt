package io.github.yannsoliman.patches.meteoconsult

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.*
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val LICENSE_PROVIDER = "Lcom/pairip/licensecheck/LicenseContentProvider;"
private const val LICENSE_CLIENT = "Lcom/pairip/licensecheck/LicenseClient;"
private const val ADVERTISING_MANAGER =
    "Lcom/lachainemeteo/advertisingmanager/AdvertisingManager;"
private const val ADVERTISING_SPACE_ID =
    "Lcom/lachainemeteo/advertisingmanager/AdvertisingSpaceId;"
private const val AD = "Lcom/lachainemeteo/advertisingmanager/models/Ad;"
private const val CONFIGURATION_CONTENT =
    "Lcom/meteoconsult/androidapp/network/model/configuration/ConfigurationContent;"
private const val PROMOTION_VIEW_MODEL = "Lkm/q;"
private const val APPLICATION = "Lcom/meteoconsult/androidapp/MeteoTerrestreApplication;"
private const val CURRENT_OFFER_COORDINATOR = "Lsl/c;"

private fun endEvent(label: String) = Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    filters = listOf(string(label))
)

@Suppress("unused")
val meteoConsultPatch = bytecodePatch(
    name = "Meteo Consult: remove ads and subscription prompts",
    description = "Remove advertisements and automatic subscription prompts, including the end-of-forecast screen. Also bypass the Play installation check for locally signed builds. Meteo Consult 1.1.4 only. Does not unlock or extend forecasts."
) {
    compatibleWith(Compatibility(
        name = "Meteo Consult",
        packageName = "com.meteoconsult.androidapp",
        apkFileType = ApkFileType.XAPK,
        targets = listOf(AppTarget(version = "1.1.4"))
    ))
    execute {
        // A locally signed build can be redirected to Play by this provider
        // before the application UI is shown. Keep the provider and its true
        // return value, but skip only the installation check.
        val startup = Fingerprint(
            name = "onCreate",
            returnType = "Z",
            parameters = emptyList(),
            custom = { method, _ -> method.definingClass == LICENSE_PROVIDER },
            filters = listOf(
                methodCall(definingClass = LICENSE_CLIENT, name = "<init>",
                    parameters = listOf("Landroid/content/Context;"), returnType = "V"),
                methodCall(definingClass = LICENSE_CLIENT, name = "initializeLicenseCheck",
                    parameters = emptyList(), returnType = "V")
            )
        ).matchAll(1..1).single()
        val startupInstructions = startup.method.implementation!!.instructions.toList()
        check(startupInstructions.map { it.opcode } == listOf(
            Opcode.NEW_INSTANCE, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT,
            Opcode.INVOKE_DIRECT, Opcode.INVOKE_VIRTUAL, Opcode.CONST_4, Opcode.RETURN
        )) { "Unexpected Play installation provider layout" }
        check(startup.instructionMatches.map { it.index } == listOf(3, 4))
        check((startupInstructions[5] as NarrowLiteralInstruction).narrowLiteral == 1)
        check((startupInstructions[5] as OneRegisterInstruction).registerA ==
            (startupInstructions[6] as OneRegisterInstruction).registerA)
        startup.method.replaceInstruction(4, "nop")

        // The callback opens the subscription screen after the last available
        // forecast hour. Its result is ignored, so suppress this navigation only.
        val bulletin = endEvent("BulletinEndReached")
            .matchAll(1..1).single().method.definingClass
        val comparator = endEvent("ComparatorEndReached")
            .matchAll(1..1).single().method.definingClass
        val callback = Fingerprint(
            name = "invoke",
            returnType = "Ljava/lang/Object;",
            parameters = listOf("Ljava/lang/Object;"),
            filters = listOf(
                fieldAccess(definingClass = bulletin, type = bulletin, opcode = Opcode.SGET_OBJECT),
                methodCall(definingClass = "Ljava/lang/Object;", name = "equals"),
                methodCall(definingClass = "Ljava/lang/Boolean;", name = "booleanValue"),
                methodCall(
                    definingClass = "Lkotlin/jvm/functions/Function0;",
                    name = "invoke",
                    parameters = emptyList(),
                    returnType = "Ljava/lang/Object;",
                    opcodes = listOf(Opcode.INVOKE_INTERFACE)
                ),
                fieldAccess(definingClass = comparator, type = comparator, opcode = Opcode.SGET_OBJECT)
            )
        ).matchAll(1..1).single()
        val hits = callback.instructionMatches
        val start = hits[0].index
        check(hits.map { it.index - start } == listOf(0, 1, 7, 10, 12)) {
            "Unexpected forecast end handler layout"
        }
        val instructions = callback.method.implementation!!.instructions.toList()
        val expected = listOf(
            Opcode.SGET_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.IF_EQZ,
            Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST,
            Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.IF_EQZ,
            Opcode.INVOKE_INTERFACE, Opcode.GOTO, Opcode.SGET_OBJECT
        )
        check(instructions.drop(start).take(expected.size).map { it.opcode } == expected) {
            "Unexpected forecast end handler instructions"
        }
        callback.method.replaceInstruction(hits[3].index, "nop")

        // Report no ad inventory so existing empty/error paths remove ad views.
        // The advertising manager remains initialized and weather requests are untouched.
        val getAd = Fingerprint(
            definingClass = ADVERTISING_MANAGER,
            name = "getAdForSpace",
            returnType = AD,
            parameters = listOf(ADVERTISING_SPACE_ID),
        ).matchAll(1..1).single().method
        val getAdInstructions = getAd.implementation!!.instructions.toList()
        check(getAdInstructions.map { it.opcode } == listOf(
            Opcode.INVOKE_VIRTUAL, Opcode.IGET_OBJECT, Opcode.INVOKE_INTERFACE,
            Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST, Opcode.RETURN_OBJECT,
        )) { "Unexpected AdvertisingManager.getAdForSpace layout" }

        val getCount = Fingerprint(
            definingClass = ADVERTISING_MANAGER,
            name = "getCountProviderForSpace",
            returnType = "I",
            parameters = listOf(ADVERTISING_SPACE_ID),
        ).matchAll(1..1).single().method
        val getCountInstructions = getCount.implementation!!.instructions.toList()
        check(getCountInstructions.map { it.opcode } == listOf(
            Opcode.INVOKE_VIRTUAL, Opcode.IGET_OBJECT, Opcode.INVOKE_INTERFACE,
            Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST, Opcode.IF_EQZ,
            Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.IF_EQZ,
            Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.RETURN,
            Opcode.CONST_4, Opcode.RETURN,
        )) { "Unexpected AdvertisingManager.getCountProviderForSpace layout" }
        getAd.removeInstructions(0, getAdInstructions.size)
        getAd.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
        getCount.removeInstructions(0, getCountInstructions.size)
        getCount.addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        // Disable automatic paywall promotions. Voluntary account and
        // subscription screens remain reachable through their normal routes.
        val configuration = Fingerprint(
            definingClass = CONFIGURATION_CONTENT,
            name = "isPopupPaywallActive",
            returnType = "Z",
            parameters = emptyList(),
        ).matchAll(1..1).single().method
        val configurationInstructions = configuration.implementation!!.instructions.toList()
        check(configurationInstructions.map { it.opcode } == listOf(
            Opcode.IGET_BOOLEAN, Opcode.RETURN,
        )) { "Unexpected ConfigurationContent.isPopupPaywallActive layout" }
        configuration.removeInstructions(0, configurationInstructions.size)
        configuration.addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        // A final guard prevents a remote configuration response from selecting
        // the automatic interstitial paywall promotion.
        val promotionDecision = Fingerprint(
            definingClass = PROMOTION_VIEW_MODEL,
            name = "b",
            returnType = "Ljava/lang/Enum;",
            parameters = listOf(PROMOTION_VIEW_MODEL, "Ltr/c;"),
            filters = listOf(
                fieldAccess(
                    definingClass = "Lsk/a;",
                    name = "e",
                    type = "Lsk/a;",
                    opcode = Opcode.SGET_OBJECT,
                )
            )
        ).matchAll(1..1).single()
        val promotionHit = promotionDecision.instructionMatches.single()
        val promotionInstructions = promotionDecision.method.implementation!!.instructions.toList()
        check(promotionHit.index > 0 &&
            promotionInstructions[promotionHit.index - 1].opcode == Opcode.IF_LT &&
            promotionHit.index + 1 < promotionInstructions.size &&
            promotionInstructions[promotionHit.index + 1].opcode == Opcode.RETURN_OBJECT
        ) { "Unexpected subscription promotion decision layout" }
        val register = (promotionHit.instruction as? OneRegisterInstruction)?.registerA
            ?: error("Subscription promotion field access has no destination register")
        promotionDecision.method.replaceInstruction(
            promotionHit.index,
            "const/4 v$register, 0x0",
        )

        // The launch-time trial offer (for example "0 € pendant 2 semaines")
        // uses a separate CurrentOfferCoordinator and does not pass through the
        // remote popup flag or the interstitial promotion decision above.
        val currentOfferStartup = Fingerprint(
            definingClass = APPLICATION,
            name = "onCreate",
            returnType = "V",
            parameters = emptyList(),
            filters = listOf(
                fieldAccess(
                    definingClass = APPLICATION,
                    name = "d",
                    type = CURRENT_OFFER_COORDINATOR,
                    opcode = Opcode.IGET_OBJECT,
                ),
                methodCall(
                    definingClass = "Ljava/util/concurrent/atomic/AtomicBoolean;",
                    name = "compareAndSet",
                    parameters = listOf("Z", "Z"),
                    returnType = "Z",
                ),
            ),
        ).matchAll(1..1).single()
        val offerRead = currentOfferStartup.instructionMatches.first()
        val applicationInstructions =
            currentOfferStartup.method.implementation!!.instructions.toList()
        val offerLaunches = applicationInstructions.withIndex().filter { (index, instruction) ->
            if (index <= offerRead.index) return@filter false
            val reference =
                ((instruction as? ReferenceInstruction)?.reference as? MethodReference)
                    ?: return@filter false
            reference.definingClass == "Lkotlinx/coroutines/BuildersKt;" &&
                reference.name == "launch\$default" &&
                reference.returnType == "Lkotlinx/coroutines/Job;"
        }
        check(offerLaunches.size == 1) {
            "Unexpected CurrentOfferCoordinator launch count: ${offerLaunches.size}"
        }
        val offerLaunch = offerLaunches.single()
        check(offerLaunch.value.opcode == Opcode.INVOKE_STATIC_RANGE &&
            offerLaunch.index + 1 < applicationInstructions.size &&
            applicationInstructions[offerLaunch.index + 1].opcode == Opcode.RETURN_VOID
        ) { "Unexpected CurrentOfferCoordinator launch layout" }
        currentOfferStartup.method.replaceInstruction(offerLaunch.index, "nop")
    }
}
