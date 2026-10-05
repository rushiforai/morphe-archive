/*
 * Copyright 2026 warleysr.
 * https://github.com/warleysr/reddit-nsfw-blocker
 *
 * Based on Morphe Patches, Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package io.github.warleysr.nsfwblocker.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import io.github.warleysr.nsfwblocker.patches.Constants.COMPATIBILITY_REDDIT
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import java.util.logging.Logger

private const val EXTENSION_CLASS =
    "Lio/github/warleysr/nsfwblocker/extension/BlockNsfwContentPatch;"

private val hideIncognitoNsfwTogglesPatch = resourcePatch {
    execute {
        val layout = "res/layout/screen_leave_incognito_mode_modal.xml"
        if (!get(layout).exists()) {
            Logger.getLogger(this::class.java.name).warning(
                "Could not find $layout. The incognito NSFW toggles will not be hidden."
            )
            return@execute
        }

        document(layout).use { document ->
            val views = document.getElementsByTagName("*")
            for (i in 0 until views.length) {
                val view = views.item(i) as? org.w3c.dom.Element ?: continue
                val id = view.getAttribute("android:id")
                if (id.endsWith("/toggle_over18") || id.endsWith("/toggle_blur_nsfw")) {
                    view.setAttribute("android:visibility", "gone")
                }
            }
        }
    }
}

@Suppress("unused")
val blockNsfwContentPatch = bytecodePatch(
    name = "Block NSFW content",
    description = "Hides NSFW posts, always turns off 'Show mature content' (also on the Reddit account) " +
            "and turns on safe search and NSFW image blurring. " +
            "Removes the NSFW options from settings and incognito mode. " +
            "This patch cannot be turned off in the app settings."
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    // Uses its own extension instead of the Morphe shared extension,
    // so this patch can be used together with the Morphe patches.
    extendWith("extensions/nsfwblocker.mpe")

    dependsOn(hideIncognitoNsfwTogglesPatch)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        // region Force 'Show mature content (I'm over 18)' off.

        // The extension turns off the account preference on Reddit's servers if it's on.
        AccountPreferencesGetOver18Fingerprint.method.addInstructions(
            0,
            """
                iget-boolean p0, p0, $ACCOUNT_PREFERENCES_CLASS->over18:Z
                invoke-static { p0 }, $EXTENSION_CLASS->getAccountOver18(Z)Z
                move-result p0
                return p0
            """
        )
        AccountPreferencesGetSearchIncludeOver18Fingerprint.method.returnEarly(false)

        // Logged in, logged out and incognito.
        PreferenceRepositoryIsOver18Fingerprint.method.addInstructions(
            0,
            """
                invoke-static { p0 }, $EXTENSION_CLASS->setPreferenceRepository(Ljava/lang/Object;)V
                const/4 v0, 0x0
                return v0
            """
        )

        // Anything that tries to turn on mature content saves 'false' instead.
        // This also updates the account preference on Reddit's servers.
        PreferenceRepositorySetOver18Fingerprint.method.addInstruction(
            0,
            "const/4 p1, 0x0"
        )

        // endregion

        // region Force NSFW image blurring on.

        PreferenceRepositoryIsBlurNsfwFingerprint.matchOrNull()?.method?.returnEarly(true)
            ?: logger.warning("Could not force NSFW image blurring on")

        // endregion

        // region Force safe search on.

        SafeSearchStoredValueFingerprint.matchOrNull()?.let {
            val safeSearchOn = """
                sget-object p0, Lcom/reddit/domain/SafeSearch;->On:Lcom/reddit/domain/SafeSearch;
                return-object p0
            """

            it.method.addInstructions(0, safeSearchOn)
            SafeSearchValueFingerprint.method.addInstructions(0, safeSearchOn)
            SafeSearchEnabledFingerprint.method.returnEarly(true)
        } ?: logger.warning("Could not find the safe search repository")

        // endregion

        // region Hide the 'Show mature content' and 'Blur NSFW images' settings items.

        listOf("key_pref_over18", "key_pref_blur_nsfw").forEach { key ->
            settingsItemSessionsFingerprint(key).matchOrNull()?.method?.addInstructions(
                0,
                """
                    invoke-static { }, Ljava/util/Collections;->emptySet()Ljava/util/Set;
                    move-result-object p0
                    return-object p0
                """
            ) ?: logger.severe("Could not hide the '$key' settings item")
        }

        // endregion

        // region Filter NSFW posts.

        // Compose feeds.
        FeedDataConstructorFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p1 }, $EXTENSION_CLASS->filterFeedItems(Ljava/util/List;)Ljava/util/List;
                move-result-object p1
            """
        )

        // Legacy listings.
        fun filterListing(fingerprint: Fingerprint) {
            fingerprint.let {
                it.method.apply {
                    val index = it.instructionMatches.first().index
                    val register = getInstruction<TwoRegisterInstruction>(index).registerA

                    addInstructions(
                        index,
                        """
                            invoke-static { v$register }, $EXTENSION_CLASS->filterLinks(Ljava/util/List;)Ljava/util/List;
                            move-result-object v$register
                        """
                    )
                }
            }
        }

        filterListing(ListingFingerprint)

        // endregion
    }
}
