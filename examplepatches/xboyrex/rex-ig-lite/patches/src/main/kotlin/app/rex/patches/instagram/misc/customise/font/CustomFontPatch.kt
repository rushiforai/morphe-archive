/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.customise.font

import app.rex.patches.instagram.misc.settings.SettingsStatusLoadFingerprint
import app.rex.patches.instagram.misc.settings.settingsPatch
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.Constants.CUSTOM_FONT_DESCRIPTOR
import app.rex.patches.instagram.utils.enableSettings
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import app.morphe.patcher.util.findFreeRegister
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.Method

private object EmojiCompatProcessFingerprint : Fingerprint(
    returnType = "Ljava/lang/CharSequence;",
    parameters = listOf("Ljava/lang/CharSequence;", "I", "I", "I", "I"),
    filters = listOf(
        string("end should be < than charSequence length"),
        string("maxEmojiCount cannot be negative"),
    ),
)

private object EmojiReplacementSpanDrawFingerprint : Fingerprint(
    name = "draw",
    returnType = "V",
    parameters = listOf(
        "Landroid/graphics/Canvas;",
        "Ljava/lang/CharSequence;",
        "I", "I", "F", "I", "I", "I",
        "Landroid/graphics/Paint;",
    ),
    custom = { _, classDef ->
        classDef.superclass == "Landroid/text/style/ReplacementSpan;" &&
            (classDef.type.startsWith("Landroidx/emoji") ||
                classDef.type.startsWith("Lcom/facebook/") ||
                classDef.type.contains("Emoji"))
    },
)

@Suppress("unused")
val customFontPatch =
    patch(
        name = "Custom font",
        description = "Adds an option to replace the app font with a font file from the device storage.",
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        dependsOn(settingsPatch)
        execute {
            runCatching { enableSettings("customFont") }
            runCatching {
                SettingsStatusLoadFingerprint.method.addInstruction(
                    0,
                    "invoke-static {}, $LOAD_CUSTOM_FONT",
                )

                // Hook EmojiCompat.process to replace all emojis when a custom Emoji pack is active
                runCatching {
                    EmojiCompatProcessFingerprint.matchOrNull()?.method?.addInstructions(
                        0,
                        """
                        invoke-static/range {p5 .. p5}, $CUSTOM_FONT_DESCRIPTOR->emojiReplaceStrategy(I)I
                        move-result p5
                        """.trimIndent(),
                    )
                }

                // Hook EmojiCompat ReplacementSpan.draw to render emojis using the active custom Emoji typeface
                runCatching {
                    EmojiReplacementSpanDrawFingerprint.matchAllOrNull()?.forEach { match ->
                        match.method.apply {
                            val freeReg = findFreeRegister(0)
                            addInstructionsWithLabels(
                                0,
                                """
                                invoke-static/range {p0 .. p9}, $CUSTOM_FONT_DESCRIPTOR->drawEmojiSpan(Ljava/lang/Object;Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFIIILandroid/graphics/Paint;)Z
                                move-result v$freeReg
                                if-eqz v$freeReg, :default_emoji_draw
                                return-void
                                """.trimIndent(),
                                ExternalLabel("default_emoji_draw", getInstruction(0)),
                            )
                        }
                    }
                }

                val typefaceRepository = TypefaceRepositoryLoadFingerprint.classDef.type
                TypefaceRepositoryLoadFingerprint.method.hookResolvedTypefaces()

                ComposePlatformTypefacesFingerprint.method.hookWrappedTypeface()

                ReactNativeFontRegistrationFingerprint.let {
                    it.method.hookReactNativeFontRegistration(it.instructionMatches[1])
                }

                val contentFontResolvers = contentFontResolverFingerprint(typefaceRepository).matchAll()
                contentFontResolvers.forEach { it.method.markAsContentFontResolver() }

                LegacyStoryFontFingerprint.classDef.methods
                    .filter { it.returnsTypeface() }
                    .forEach { it.markAsContentFontResolver() }

                PlatformTextWidgetFingerprint.matchAll().distinctBy { it.classDef.type }.forEach {
                    it.classDef.overrideTypefaceAssignment()
                }

                val contentFontClasses =
                    contentFontResolvers.map { it.originalClassDef.type }.toSet() +
                        LegacyStoryFontFingerprint.classDef.type
                paintTypefaceFingerprint(contentFontClasses).matchAll().forEach {
                    it.method.hookPaintTypefaceCalls()
                }

                PlatformSpanFingerprint.matchAll().forEach {
                    it.method.replaceCreations(PLATFORM_TYPEFACE_SPANS)
                }
                RexWidgetCreatorFingerprint.matchAllOrNull()?.forEach {
                    it.method.replaceCreations(REX_TEXT_WIDGETS)
                }
            }
        }
    }

/** Abstract and native methods have no returns to hook, so they are never of interest. */
private fun Method.returnsTypeface() = returnType == TYPEFACE_CLASS && implementation != null
