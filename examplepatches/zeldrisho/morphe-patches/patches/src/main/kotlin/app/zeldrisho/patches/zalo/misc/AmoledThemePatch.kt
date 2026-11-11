package app.zeldrisho.patches.zalo.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.string
import app.zeldrisho.patches.shared.Constants.COMPATIBILITY_ZALO_261002
import app.zeldrisho.patches.zalo.navigation.zeldrisSettingsPatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
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

private val amoledDarkColors = setOf(
    // Palette surfaces shared by the design-system themes (Me tab root, layer backgrounds).
    "ng95",
    // Legacy dark-theme surfaces used by themes that predate the design-system attributes.
    "Dark_PrimaryBackgroundColor", "Dark_BottomNav", "Dark_TabBackgroundColor",
    "Dark_ChatBarBackgroundColor", "Dark_FooterBackgroundColor", "Dark_ProfilePrimaryBackgroundColor",
    "Dark_ProfileSecondaryBackgroundColor", "Dark_TimelinePrimaryBackgroundColor",
    "Dark_TimelineSecondaryBackgroundColor", "Dark_PopupBackgroundColor", "Dark_HeaderStartColor",
    "Dark_HeaderEndColor", "Dark_StoryPrimaryBackgroundColor", "Dark_SearchBackgroundColor",
    "Dark_GalleryPickerViewBackgroundColor", "Dark_ChatFooterBackgroundNormal",
    "Dark_CSCPrimaryBackground",
)

/**
 * Rewrites dark surface colors, not only the overlay style: activity themes are created before the
 * runtime overlay is applied, so XML-inflated roots such as the Me tab keep the palette value.
 */
private val amoledOverlayResources = resourcePatch {
    compatibleWith(COMPATIBILITY_ZALO_261002)
    execute {
        document("res/values/colors.xml").use { document ->
            val matched = mutableSetOf<String>()
            val colors = document.getElementsByTagName("color")
            for (index in 0 until colors.length) {
                val color = colors.item(index) as Element
                if (color.getAttribute("name") in amoledDarkColors) {
                    color.textContent = "#ff000000"
                    matched.add(color.getAttribute("name"))
                }
            }
            check(matched == amoledDarkColors) {
                "AMOLED dark colors changed: ${amoledDarkColors - matched}"
            }
        }
        document("res/values/styles.xml").use { document ->
            // Transparent roots such as the Me tab fall through to the window background, which is
            // inherited from the framework theme; the overlay style alone cannot reach it.
            val darkThemes = mutableSetOf<String>()
            val styles = document.getElementsByTagName("style")
            for (index in 0 until styles.length) {
                val candidate = styles.item(index) as Element
                val items = candidate.getElementsByTagName("item")
                val isDark = (0 until items.length).any {
                    val item = items.item(it) as Element
                    item.getAttribute("name") == "PrimaryBackgroundColor" &&
                        item.textContent == "@color/Dark_PrimaryBackgroundColor"
                }
                if (!isDark) continue
                darkThemes.add(candidate.getAttribute("name"))
                val window = document.createElement("item")
                window.setAttribute("name", "android:windowBackground")
                window.textContent = "#ff000000"
                candidate.appendChild(window)
            }
            check(darkThemes.isNotEmpty()) { "AMOLED dark themes changed" }
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
                "header_blue_container", "header_white_container",
                // Design-system surfaces used by the Me tab root, tab containers and conversations.
                "layer_background", "bgCSC_Background", "CSCPrimaryBackground")) {
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
    compatibleWith(COMPATIBILITY_ZALO_261002)
    dependsOn(zeldrisSettingsPatch, amoledOverlayResources)
    execute {
        val method = ThemeColor261002.matchAll(1..1).single().method
        check(method.implementation!!.registerCount == 5) { "Zalo themed color lookup register layout changed" }
        val dark = classDefBy("Lef1/c;").methods.singleOrNull {
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
    definingClass = "Lef1/c;", name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("I", "I", "Ljava/util/ArrayList;", "Z"), returnType = "V",
    filters = listOf(string("SAVE_SETTING_THEME_SELECTED_POSITION"),
        methodCall(definingClass = "Landroid/content/Context;", name = "setTheme", parameters = listOf("I"), returnType = "V")),
)

private object MeTabLayout261002 : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/maintab/me/TabMeView;", name = "l5",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;"),
    returnType = "Landroid/view/View;",
    filters = listOf(methodCall(definingClass = "Landroid/view/LayoutInflater;", name = "inflate",
        parameters = listOf("I", "Landroid/view/ViewGroup;", "Z"), returnType = "Landroid/view/View;")),
)

private object ThemeColor261002 : Fingerprint(
    definingClass = "Lef1/c;", name = "g",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/content/Context;", "I"), returnType = "I",
    filters = listOf(methodCall(definingClass = "Lp60/p0;", name = "C",
        parameters = listOf("Landroid/content/Context;", "I"), returnType = "I")),
)
