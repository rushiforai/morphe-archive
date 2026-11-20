package app.zeldrisho.patches.zalo.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.returnEarly
import app.zeldrisho.patches.shared.Constants.COMPATIBILITY_ZALO_STABLE
import app.zeldrisho.patches.zalo.navigation.zeldrisSettingsPatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val AMOLED_GUARD = """
    invoke-static {p0, p1}, Lapp/zeldrisho/zalo/extension/AmoledTheme;->blackSurface(Landroid/content/Context;I)Z
    move-result v0
    if-eqz v0, :native_color
    const v0, -0x1000000
    return v0
    :native_color
    nop
"""

/** Adds a black overlay style without changing Zalo's native dark resources. */
private val amoledOverlayResources = resourcePatch {
    compatibleWith(COMPATIBILITY_ZALO_STABLE)
    execute {
        document("res/values/styles.xml").use { document ->
            val style = document.createElement("style")
            style.setAttribute("name", "ZeldrisAmoledOverlay")
            for (name in listOf("PrimaryBackgroundColor", "SecondaryBackgroundColor", "BottomNav",
                "TabBackgroundColor", "ChatBarBackgroundColor", "FooterBackgroundColor",
                "ProfilePrimaryBackgroundColor", "ProfileSecondaryBackgroundColor",
                "TimelinePrimaryBackgroundColor", "TimelineSecondaryBackgroundColor", "PopupBackgroundColor",
                "list_item_background", "HeaderStartColor", "HeaderEndColor", "ProfileBackgroundColor",
                "ProfileUserInfoBackgroundColor", "ProfileSectionPhotoPrimaryBackgroundColor",
                "StoryPrimaryBackgroundColor", "SearchBackgroundColor", "GalleryPickerViewBackgroundColor",
                "ChatFooterBackgroundNormal", "social_timeline_background_color_content_centric",
                "header_blue_container", "header_white_container", "layer_background", "bgCSC_Background",
                "CSCPrimaryBackground")) {
                val item = document.createElement("item")
                item.setAttribute("name", name)
                item.textContent = "#ff000000"
                style.appendChild(item)
            }
            document.documentElement.appendChild(style)
        }
    }
}

/** Hooks host theme creation and themed-color lookup; light mode remains native. */
@Suppress("unused")
val zaloAmoledThemePatch = bytecodePatch(
    name = "AMOLED dark theme",
    description = "Forces pure black surfaces across Zalo's dark theme, including the Me tab root. " +
        "Light mode is untouched.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ZALO_STABLE)
    dependsOn(zeldrisSettingsPatch, amoledOverlayResources)
    execute {
        val capability = mutableClassDefBy("Lapp/zeldrisho/zalo/extension/ZeldrisSettingsContent;")
            .methods.single { it.name == "hasAmoledThemeSettings" && it.parameterTypes.isEmpty() && it.returnType == "Z" }
        capability.returnEarly(true)

        val method = ThemeColor261002.matchAll(1..1).single().method
        check(method.implementation!!.registerCount == 5) { "Zalo themed color lookup register layout changed" }
        val dark = classDefBy("Lil1;").methods.singleOrNull {
            it.name == "d" && it.parameterTypes == listOf("Landroid/content/Context;") && it.returnType == "Z" &&
                AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags)
        }
        check(dark != null) { "Zalo context-aware dark theme detector changed" }
        // The Me tab root keeps the theme attribute resolved at inflation time, so force it here.
        val meTab = MeTabLayout261002.matchAll(1..1).single().method
        val meTabInstructions = meTab.implementation!!.instructions.toList()
        val inflate = meTabInstructions.indexOfFirst { instruction ->
            (instruction as? ReferenceInstruction)?.reference?.toString() ==
                "Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;"
        }
        check(inflate >= 0) { "Zalo Me tab layout inflation changed" }
        check(meTabInstructions[inflate + 1].opcode == Opcode.MOVE_RESULT_OBJECT) {
            "Zalo Me tab layout inflation result changed"
        }
        meTab.addInstructions(inflate + 2,
            "invoke-static {p1}, Lapp/zeldrisho/zalo/extension/AmoledTheme;->forceBlackBackground(Landroid/view/View;)V")
        // Apply after the native dark setTheme, before any dependent views are inflated.
        // The native light branch uses the separate setTheme(v6,p1) call and is untouched.
        val setup = ThemeSetup261002.matchAll(1..1).single().method
        val setupInstructions = setup.implementation!!.instructions.toList()
        check(setup.implementation!!.registerCount == 13) { "Zalo theme setup registers changed" }
        val darkCalls = setupInstructions.indices.filter { index ->
            val instruction = setupInstructions[index]
            val invoke = instruction as? FiveRegisterInstruction
            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                (instruction as? ReferenceInstruction)?.reference?.toString() ==
                    "Landroid/content/Context;->setTheme(I)V" &&
                invoke?.registerCount == 2 && invoke.registerC == 6 && invoke.registerD == 9
        }
        check(darkCalls.size == 1) { "Zalo dark-theme setTheme call changed" }
        setup.addInstructions(darkCalls.single() + 1,
            "invoke-static {v6}, Lapp/zeldrisho/zalo/extension/AmoledTheme;->applyDarkOverlay(Landroid/content/Context;)V")
        // v0 is not live at entry; p0/p1 are v3/v4. Native lookup remains intact on false.
        method.addInstructionsWithLabels(0, AMOLED_GUARD)
    }
}

private object ThemeSetup261002 : Fingerprint(
    definingClass = "Lil1;", name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("I", "I", "Ljava/util/ArrayList;", "Z"), returnType = "V",
    filters = listOf(string("SAVE_SETTING_THEME_SELECTED_POSITION"),
        methodCall(definingClass = "Landroid/content/Context;", name = "setTheme", parameters = listOf("I"), returnType = "V")),
)

private object MeTabLayout261002 : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/maintab/me/TabMeView;", name = "n5",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;"),
    returnType = "Landroid/view/View;",
    filters = listOf(methodCall(definingClass = "Landroid/view/LayoutInflater;", name = "inflate",
        parameters = listOf("I", "Landroid/view/ViewGroup;", "Z"), returnType = "Landroid/view/View;")),
)

private object ThemeColor261002 : Fingerprint(
    definingClass = "Lil1;", name = "g",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/content/Context;", "I"), returnType = "I",
    filters = listOf(methodCall(definingClass = "Lmrx;", name = "f0",
        parameters = listOf("Landroid/content/Context;", "I"), returnType = "I")),
)
