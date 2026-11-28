package dev.vortexnode.sbrowserx.patches.core

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import app.morphe.patcher.patch.resourcePatch
import dev.vortexnode.sbrowserx.patches.branding.SBrowserPackageRenameTarget
import dev.vortexnode.sbrowserx.shared.Constants.ANDROID_NS
import dev.vortexnode.sbrowserx.shared.Constants.COMPATIBILITY_SBROWSER
import dev.vortexnode.sbrowserx.shared.findMethodOrThrow
import dev.vortexnode.sbrowserx.shared.returnConstantBoolean
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val SBROWSER_APP_CLASS = "Lcom/sec/android/app/sbrowser/SBrowserApplication;"
private const val SBROWSER_MAIN_ACTIVITY_CLASS = "Lcom/sec/android/app/sbrowser/SBrowserMainActivity;"
private const val SBROWSER_CMDLINE_CLASS = "Lcom/sec/android/app/sbrowser/init/SBrowserCommandLine;"
private const val BADGE_MANAGER_CLASS = "Lcom/sec/android/app/sbrowser/toolbar/BadgeManager;"
private const val DEBUG_SETTINGS_CLASS = "Lcom/sec/android/app/sbrowser/common/device/DebugSettings;"
private const val PREF_FRAGMENT_CUSTOM_CLASS = "Lcom/sec/android/app/sbrowser/common/settings/PreferenceFragmentCustom;"

private const val SETTINGS_ACTIVITY_CLASS =
    "dev.vortexnode.sbrowserx.extension.settings.SBrowserXSettingsActivity"
private const val TRANSLATE_SETTINGS_ACTIVITY_CLASS =
    "dev.vortexnode.sbrowserx.extension.settings.SBrowserXTranslateSettingsActivity"
private const val EXT_MANAGER_ACTIVITY_CLASS =
    "dev.vortexnode.sbrowserx.extension.settings.SBrowserXExtensionsActivity"
private const val WEBRTC_DIALOG_ACTIVITY_CLASS =
    "dev.vortexnode.sbrowserx.extension.settings.SBrowserXWebRtcDialogActivity"
private const val EXT_BRIDGE_ACTIVITY_CLASS =
    "dev.vortexnode.sbrowserx.extension.settings.SBrowserXExtensionsBridgeActivity"
private const val EXT_DL_DIALOG_ACTIVITY_CLASS =
    "dev.vortexnode.sbrowserx.extension.settings.SBrowserXExternalDownloaderDialogActivity"
private const val TRANSPARENCY_DIALOG_ACTIVITY_CLASS =
    "dev.vortexnode.sbrowserx.extension.settings.SBrowserXTransparencyDialogActivity"
private const val COMPACT_BTN_DIALOG_ACTIVITY_CLASS =
    "dev.vortexnode.sbrowserx.extension.settings.SBrowserXCompactButtonDialogActivity"
private const val BACKUP_ACTIVITY_CLASS =
    "dev.vortexnode.sbrowserx.extension.settings.SBrowserXBackupActivity"
private const val BROWSING_ASSIST_ACTIVITY_CLASS =
    "dev.vortexnode.sbrowserx.extension.settings.SBrowserXBrowsingAssistActivity"
private const val AI_SUMMARY_ACTIVITY_CLASS =
    "dev.vortexnode.sbrowserx.extension.settings.SBrowserXAiSummaryActivity"
private const val START_PAGE_ACTIVITY_CLASS =
    "dev.vortexnode.sbrowserx.extension.settings.SBrowserXStartPageSettingsActivity"
private const val BOOKMARKS_BRIDGE_ACTIVITY_CLASS =
    "dev.vortexnode.sbrowserx.extension.settings.SBrowserXBookmarksBridgeActivity"
private const val APP_MENU_HANDLER_CLASS =
    "Lcom/sec/android/app/sbrowser/main_view/menu/AppMenuHandler;"
private const val PRIVACY_PREF_FRAGMENT_CLASS =
    "Lcom/sec/android/app/sbrowser/settings/security_panel/PrivacyPreferenceFragment;"

private fun createIntentPref(
    xml: Document,
    key: String,
    title: String,
    summary: String,
    targetPkg: String,
    targetClass: String,
): Element {
    val pref = xml.createElement("com.sec.android.app.sbrowser.common.settings.PreferenceCustom")
    pref.setAttributeNS(ANDROID_NS, "android:key", key)
    pref.setAttributeNS(ANDROID_NS, "android:title", title)
    pref.setAttributeNS(ANDROID_NS, "android:summary", summary)
    val intent = xml.createElement("intent")
    intent.setAttributeNS(ANDROID_NS, "android:targetPackage", targetPkg)
    intent.setAttributeNS(ANDROID_NS, "android:targetClass", targetClass)
    pref.appendChild(intent)
    return pref
}

private fun createSwitchPref(
    xml: Document,
    key: String,
    title: String,
    summary: String,
    defaultValue: Boolean,
): Element {
    val pref = xml.createElement("com.sec.android.app.sbrowser.common.settings.SwitchPreferenceCustom")
    pref.setAttributeNS(ANDROID_NS, "android:key", key)
    pref.setAttributeNS(ANDROID_NS, "android:title", title)
    pref.setAttributeNS(ANDROID_NS, "android:summary", summary)
    pref.setAttributeNS(ANDROID_NS, "android:defaultValue", defaultValue.toString())
    pref.setAttributeNS(ANDROID_NS, "android:persistent", "false")
    return pref
}

private fun createCategory(xml: Document, key: String, title: String = "SBrowserX"): Element {
    val cat = xml.createElement("androidx.preference.PreferenceCategory")
    cat.setAttributeNS(ANDROID_NS, "android:selectable", "false")
    cat.setAttributeNS(ANDROID_NS, "android:key", key)
    if (title.isNotEmpty()) {
        cat.setAttributeNS(ANDROID_NS, "android:title", title)
    }
    return cat
}

internal val sbrowserXCoreResourcePatch = resourcePatch(
    description = "Adds the SBrowserX settings hub and integrates extra privacy, appearance, and utility options into browser Settings.",
) {
    finalize {
        var manifestPkg = "com.sec.android.app.sbrowser"

        document("AndroidManifest.xml").use { manifest ->
            val root = manifest.documentElement ?: error("Missing <manifest>")
            val pkgAttr = root.getAttribute("package")
            if (!pkgAttr.isNullOrBlank()) {
                manifestPkg = pkgAttr.trim()
            }
            val application = root.getElementsByTagName("application").item(0) as? Element
                ?: error("Missing <application>")

            ensureActivity(manifest, application, SETTINGS_ACTIVITY_CLASS, "@android:style/Theme.DeviceDefault.NoActionBar")
            ensureActivity(manifest, application, TRANSLATE_SETTINGS_ACTIVITY_CLASS, "@android:style/Theme.DeviceDefault.NoActionBar")
            ensureActivity(manifest, application, EXT_MANAGER_ACTIVITY_CLASS, "@android:style/Theme.DeviceDefault.NoActionBar")
            ensureActivity(manifest, application, WEBRTC_DIALOG_ACTIVITY_CLASS, "@android:style/Theme.Translucent.NoTitleBar")
            ensureActivity(manifest, application, EXT_BRIDGE_ACTIVITY_CLASS, "@android:style/Theme.Translucent.NoTitleBar")
            ensureActivity(manifest, application, EXT_DL_DIALOG_ACTIVITY_CLASS, "@android:style/Theme.Translucent.NoTitleBar")
            ensureActivity(manifest, application, TRANSPARENCY_DIALOG_ACTIVITY_CLASS, "@android:style/Theme.Translucent.NoTitleBar")
            ensureActivity(manifest, application, COMPACT_BTN_DIALOG_ACTIVITY_CLASS, "@android:style/Theme.Translucent.NoTitleBar")
            ensureActivity(manifest, application, BACKUP_ACTIVITY_CLASS, "@android:style/Theme.DeviceDefault.NoActionBar")
            ensureActivity(manifest, application, BROWSING_ASSIST_ACTIVITY_CLASS, "@android:style/Theme.DeviceDefault.NoActionBar")
            ensureActivity(manifest, application, AI_SUMMARY_ACTIVITY_CLASS, "@android:style/Theme.Translucent.NoTitleBar")
            ensureActivity(manifest, application, START_PAGE_ACTIVITY_CLASS, "@android:style/Theme.DeviceDefault.NoActionBar")
            ensureActivity(manifest, application, BOOKMARKS_BRIDGE_ACTIVITY_CLASS, "@android:style/Theme.Translucent.NoTitleBar")
        }

        val targetPkg = SBrowserPackageRenameTarget.packageName ?: manifestPkg

        // 1. Main Settings: Unified SBrowserX top card (Hub, Extensions, Assist, Backup, Bookmarks)
        //    + clean bottom About card (About Samsung Browser + SBrowserX v1.3.7 + Morphe source)
        document("res/xml/settings_fragment.xml").use { xml ->
            val screen = xml.documentElement ?: error("Missing PreferenceScreen in settings_fragment.xml")

            val hubPref = createIntentPref(
                xml, "sbrowserx_settings_hub", "SBrowserX",
                "Extensions • Privacy • Interface",
                targetPkg, SETTINGS_ACTIVITY_CLASS,
            )
            val extPref = createIntentPref(
                xml, "sbrowserx_settings_extensions", "@string/extensions_title",
                "Chrome Web Store",
                targetPkg, EXT_BRIDGE_ACTIVITY_CLASS,
            )
            val assistPref = createIntentPref(
                xml, "sbrowserx_browsing_assist", "Browsing assist",
                "Gemini • Translator",
                targetPkg, BROWSING_ASSIST_ACTIVITY_CLASS,
            )
            val syncBackupPref = createIntentPref(
                xml, "sbrowserx_sync_backup", "Sync & Backup",
                "Local backup • Google Drive",
                targetPkg, BACKUP_ACTIVITY_CLASS,
            )
            syncBackupPref.setAttributeNS(ANDROID_NS, "android:singleLineTitle", "false")
            val bookmarksPref = createIntentPref(
                xml, "sbrowserx_settings_bookmarks", "Bookmarks",
                "Quick access",
                targetPkg, BOOKMARKS_BRIDGE_ACTIVITY_CLASS,
            )
            val cardDivider = createCategory(xml, "sbrowserx_top_card_divider", "")

            val firstChild = screen.firstChild
            if (firstChild != null) {
                screen.insertBefore(hubPref, firstChild)
                screen.insertBefore(extPref, firstChild)
                screen.insertBefore(assistPref, firstChild)
                screen.insertBefore(syncBackupPref, firstChild)
                screen.insertBefore(bookmarksPref, firstChild)
                screen.insertBefore(cardDivider, firstChild)
            } else {
                screen.appendChild(hubPref)
                screen.appendChild(extPref)
                screen.appendChild(assistPref)
                screen.appendChild(syncBackupPref)
                screen.appendChild(bookmarksPref)
                screen.appendChild(cardDivider)
            }

            // Tag the stock bottom "Privacy" category so SBrowserXHooks can safely hide it via setVisible(false)
            val allNodes = screen.childNodes
            for (i in 0 until allNodes.length) {
                val node = allNodes.item(i) as? Element ?: continue
                if (node.tagName == "androidx.preference.PreferenceCategory" &&
                    node.getAttributeNS(ANDROID_NS, "title") == "@string/pref_category_privacy"
                ) {
                    node.setAttributeNS(ANDROID_NS, "android:key", "sbrowserx_stock_privacy_cat")
                }
            }

            // Append "SBrowserX" & "Morphe patch source" directly in the bottom About card
            // (Click handlers attached cleanly at runtime in SBrowserXHooks so Uri is never null)
            val aboutVerPref = xml.createElement("com.sec.android.app.sbrowser.common.settings.PreferenceCustom")
            aboutVerPref.setAttributeNS(ANDROID_NS, "android:key", "sbrowserx_about_version")
            aboutVerPref.setAttributeNS(ANDROID_NS, "android:title", "SBrowserX")
            aboutVerPref.setAttributeNS(ANDROID_NS, "android:summary", " ")
            screen.appendChild(aboutVerPref)

            val aboutMorphePref = xml.createElement("com.sec.android.app.sbrowser.common.settings.PreferenceCustom")
            aboutMorphePref.setAttributeNS(ANDROID_NS, "android:key", "sbrowserx_about_morphe")
            aboutMorphePref.setAttributeNS(ANDROID_NS, "android:title", "Morphe patch source")
            aboutMorphePref.setAttributeNS(ANDROID_NS, "android:summary", " ")
            screen.appendChild(aboutMorphePref)

            val aboutSupportPref = xml.createElement("com.sec.android.app.sbrowser.common.settings.PreferenceCustom")
            aboutSupportPref.setAttributeNS(ANDROID_NS, "android:key", "sbrowserx_about_support")
            aboutSupportPref.setAttributeNS(ANDROID_NS, "android:title", "Support the author")
            aboutSupportPref.setAttributeNS(ANDROID_NS, "android:summary", " ")
            screen.appendChild(aboutSupportPref)
        }

        // 2. Privacy & Security: WebRTC in-place dialog + native in-place switches
        document("res/xml/privacy_preferences.xml").use { xml ->
            val screen = xml.documentElement ?: error("Missing PreferenceScreen in privacy_preferences.xml")

            val cat = createCategory(xml, "sbrowserx_webrtc_card_category", "SBrowserX")
            val webrtcPref = createIntentPref(
                xml, "sbrowserx_privacy_webrtc", "WebRTC IP handling policy",
                "WebRTC leak protection", targetPkg, WEBRTC_DIALOG_ACTIVITY_CLASS,
            )
            val fpPref = createSwitchPref(
                xml, "sbrowserx_privacy_fingerprint", "Fingerprint protection",
                "Native WebAudio & Screen anti-fingerprinting", true,
            )
            val nodes = screen.childNodes
            var inserted = false
            for (i in 0 until nodes.length) {
                val node = nodes.item(i) as? Element ?: continue
                if (node.getAttributeNS(ANDROID_NS, "key") == "enhanced_clean_category") {
                    screen.insertBefore(cat, node)
                    screen.insertBefore(webrtcPref, node)
                    screen.insertBefore(fpPref, node)
                    inserted = true
                    break
                }
            }
            if (!inserted) {
                screen.appendChild(cat)
                screen.appendChild(webrtcPref)
                screen.appendChild(fpPref)
            }
        }

        // 3. Sites & Downloads: External downloader dialog + native in-place switch for images
        document("res/xml/sites_content_preferences.xml").use { xml ->
            val screen = xml.documentElement ?: error("Missing PreferenceScreen in sites_content_preferences.xml")

            screen.appendChild(
                createIntentPref(
                    xml, "sbrowserx_external_downloader", "External download manager",
                    "ADM, 1DM, ABDM, Seal", targetPkg, EXT_DL_DIALOG_ACTIVITY_CLASS,
                ),
            )
            screen.appendChild(
                createSwitchPref(
                    xml, "sbrowserx_external_downloader_images", "Also forward images to downloader",
                    "ON: all files & images. OFF: browser saves images natively", false,
                ),
            )
        }

        // 4. Dark Mode: Native in-place switches (AMOLED, Vivid Images, Force Day Dark)
        document("res/xml/manage_dark_mode_preference.xml").use { xml ->
            val screen = xml.documentElement ?: error("Missing PreferenceScreen in manage_dark_mode_preference.xml")

            screen.appendChild(
                createSwitchPref(
                    xml, "sbrowserx_dark_amoled", "AMOLED Mode",
                    "Pure #000000 for browser UI and darkened websites", false,
                ),
            )
        }

        // 5. Layout & Menu: In-place One UI dialogs for Panel Transparency & Compact AI-slot button
        document("res/xml/layout_preferences.xml").use { xml ->
            val screen = xml.documentElement ?: error("Missing PreferenceScreen in layout_preferences.xml")

            screen.appendChild(createCategory(xml, "sbrowserx_layout_category", "SBrowserX"))
            screen.appendChild(
                createIntentPref(
                    xml, "sbrowserx_layout_transparency", "Panel & address bar translucency",
                    "Bottom bar, address bar, compact pill & side menu blur",
                    targetPkg, TRANSPARENCY_DIALOG_ACTIVITY_CLASS,
                ),
            )
            screen.appendChild(
                createIntentPref(
                    xml, "sbrowserx_layout_compact_button", "Compact bar custom button (replaces AI)",
                    "New tab",
                    targetPkg, COMPACT_BTN_DIALOG_ACTIVITY_CLASS,
                ),
            )
            screen.appendChild(
                createSwitchPref(
                    xml, "sbrowserx_home_long_press_close_bg", "Long-press Home closes background tabs",
                    "Hold Home (~500 ms) to close all background tabs and open/reload Start Page",
                    false,
                ),
            )
        }

        // 6. Useful Features: Built-in Translator settings screen
        document("res/xml/useful_feature_preferences.xml").use { xml ->
            val screen = xml.documentElement ?: error("Missing PreferenceScreen in useful_feature_preferences.xml")

            screen.appendChild(createCategory(xml, "sbrowserx_useful_category", "SBrowserX"))
            screen.appendChild(
                createIntentPref(
                    xml, "sbrowserx_useful_translate", "Built-in Translator (SBrowserX)",
                    "Google, Microsoft, DeepL, Gemini 2.5 Flash",
                    targetPkg, TRANSLATE_SETTINGS_ACTIVITY_CLASS,
                ),
            )
            screen.appendChild(
                createSwitchPref(
                    xml, "sbrowserx_unlimited_tabs", "Remove 99-tab limit",
                    "Allows up to 9999 open tabs instead of 99", true,
                ),
            )
        }
    }
}

private fun ensureActivity(
    manifest: org.w3c.dom.Document,
    application: Element,
    className: String,
    theme: String,
) {
    val activities = application.getElementsByTagName("activity")
    for (i in 0 until activities.length) {
        val el = activities.item(i) as? Element ?: continue
        if (el.getAttributeNS(ANDROID_NS, "name") == className) return
    }
    val el = manifest.createElement("activity")
    el.setAttributeNS(ANDROID_NS, "android:name", className)
    el.setAttributeNS(ANDROID_NS, "android:exported", "false")
    el.setAttributeNS(ANDROID_NS, "android:theme", theme)
    application.appendChild(el)
}

@Suppress("unused")
val sbrowserXCorePatch = bytecodePatch(
    name = "SBrowserX Settings, Extensions & Privacy Core",
    description = "Adds SBrowserX settings hub and mirrors all toggles natively in-place across Samsung Internet's settings sections.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SBROWSER)
    extendWith("extensions/sbrowserx.rve")
    dependsOn(sbrowserXCoreResourcePatch)

    execute {
        findMethodOrThrow(
            classType = SBROWSER_APP_CLASS,
            methodName = "onCreate",
            parameterTypes = emptyList(),
            returnType = "V",
        ).addInstruction(
            0,
            "invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->onApplicationCreate(Landroid/app/Application;)V",
        )

        findMethodOrThrow(
            classType = SBROWSER_MAIN_ACTIVITY_CLASS,
            methodName = "onResume",
            parameterTypes = emptyList(),
            returnType = "V",
        ).addInstruction(
            0,
            "invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->onMainActivityResume(Landroid/app/Activity;)V",
        )

        val cmdMethod = findMethodOrThrow(
            classType = SBROWSER_CMDLINE_CLASS,
            methodName = "setCustomFeatures",
            parameterTypes = emptyList(),
            returnType = "V",
        )
        val cmdInsns = cmdMethod.implementation?.instructions
            ?: error("Missing implementation in SBrowserCommandLine.setCustomFeatures")
        cmdMethod.addInstruction(
            cmdInsns.size - 1,
            "invoke-static {}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->onCommandLineCustomFeatures()V",
        )

        findMethodOrThrow(
            classType = BADGE_MANAGER_CLASS,
            methodName = "getNewExtensionCount",
            parameterTypes = emptyList(),
            returnType = "I",
        ).returnConstantBoolean(false)

        val setScreenMethod = findMethodOrThrow(
            classType = PREF_FRAGMENT_CUSTOM_CLASS,
            methodName = "setPreferenceScreen",
            parameterTypes = listOf("Landroidx/preference/PreferenceScreen;"),
            returnType = "V",
        )
        val setScreenInsns = setScreenMethod.implementation?.instructions
            ?: error("Missing instructions in PreferenceFragmentCustom.setPreferenceScreen")
        setScreenMethod.addInstruction(
            setScreenInsns.size - 1,
            "invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->localizeCustomPreferences(Ljava/lang/Object;)V",
        )

        findMethodOrThrow(
            classType = PREF_FRAGMENT_CUSTOM_CLASS,
            methodName = "onViewCreated",
            parameterTypes = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
            returnType = "V",
        ).addInstruction(
            0,
            "invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->localizeCustomPreferences(Ljava/lang/Object;)V",
        )

        findMethodOrThrow(
            classType = PREF_FRAGMENT_CUSTOM_CLASS,
            methodName = "onResume",
            parameterTypes = emptyList(),
            returnType = "V",
        ).addInstruction(
            0,
            "invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->localizeCustomPreferences(Ljava/lang/Object;)V",
        )

        // Permanently disable Samsung's built-in Ad Blockers menu & partner recommendations
        findMethodOrThrow(
            classType = DEBUG_SETTINGS_CLASS,
            methodName = "isContentBlockerSupported",
            parameterTypes = emptyList(),
            returnType = "Z",
        ).returnConstantBoolean(false)

        // Hook PrivacyPreferenceFragment.showPreferenceOnReady()V so Russian localization applies
        // immediately when privacy_preferences.xml is inflated asynchronously (zero English flash!)
        val showReadyMethod = findMethodOrThrow(
            classType = PRIVACY_PREF_FRAGMENT_CLASS,
            methodName = "showPreferenceOnReady",
            parameterTypes = emptyList(),
            returnType = "V",
        )
        showReadyMethod.addInstruction(
            0,
            "invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->recordPrivacyFragment(Ljava/lang/Object;)V",
        )
        val showReadyInsns = showReadyMethod.implementation?.instructions
            ?: error("Missing instructions in PrivacyPreferenceFragment.showPreferenceOnReady")
        showReadyMethod.addInstruction(
            showReadyInsns.size - 1,
            "invoke-static {}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->localizePrivacyFragmentFromTL()V",
        )

        // Attach persistent top-right circular Restart button to Samsung Internet's SettingsActivity toolbar
        findMethodOrThrow(
            classType = "Lcom/sec/android/app/sbrowser/settings/SettingsActivity;",
            methodName = "onResume",
            parameterTypes = emptyList(),
            returnType = "V",
        ).addInstruction(
            0,
            "invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXRestartManager;->onSettingsActivityResume(Landroid/app/Activity;)V",
        )

        findMethodOrThrow(
            classType = "Lcom/sec/android/app/sbrowser/settings/SettingsActivity;",
            methodName = "onConfigurationChanged",
            parameterTypes = listOf("Landroid/content/res/Configuration;"),
            returnType = "V",
        ).addInstruction(
            0,
            "invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXRestartManager;->onSettingsActivityConfigChanged(Landroid/app/Activity;)V",
        )

        // Intercept More Menu -> "Browsing assist" click to launch Gemini 2.5 Flash AI Page Summary
        findMethodOrThrow(
            classType = APP_MENU_HANDLER_CLASS,
            methodName = "onBrowsingAssistClicked",
            parameterTypes = emptyList(),
            returnType = "V",
        ).addInstructions(
            0,
            """
                invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->handleBrowsingAssistClick(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :sbrowserx_stock_assist
                return-void
                :sbrowserx_stock_assist
                nop
            """.trimIndent(),
        )

        // Prevent stock HideToolbarManager.onDestroy() crash ("The Sbixby instance is NULL")
        // on renamed packages and non-Samsung devices (matches Samsung Beta APK behavior).
        findMethodOrThrow(
            classType = "Lcom/sec/android/app/sbrowser/hide_toolbar/HideToolbarManager;",
            methodName = "initBixbyInterativeGuide",
            parameterTypes = emptyList(),
            returnType = "V",
        ).addInstruction(0, "return-void")

        // Inject "SBrowserX Start Page" option inside native Settings -> Homepage screen
        findMethodOrThrow(
            classType = "Lcom/sec/android/app/sbrowser/settings/homepage/HomePagePreferenceFragment;",
            methodName = "onResume",
            parameterTypes = emptyList(),
            returnType = "V",
        ).addInstruction(
            0,
            "invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->injectStartPageIntoHomepageSettings(Ljava/lang/Object;)V",
        )

        // Hide internal 127.0.0.1 loopback address and prevent "about:blank" in Standard/Bottom and Compact omniboxes
        listOf(
            "Lcom/sec/android/app/sbrowser/omnibox/LocationBar;",
            "Lcom/sec/android/app/sbrowser/omnibox/UrlBar;",
        ).forEach { omniboxCls ->
            findMethodOrThrow(
                classType = omniboxCls,
                methodName = "setUrlToEditText",
                parameterTypes = listOf("Ljava/lang/String;", "Z"),
                returnType = "V",
            ).addInstructions(
                0,
                """
                    invoke-static {p1, p2}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->shouldForceBlankOmnibox(Ljava/lang/String;Z)Z
                    move-result p2
                    invoke-static {p1}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->sanitizeOmniboxUrl(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object p1
                """.trimIndent(),
            )
        }

        // Show clean "SBrowserX Start Page" label instead of http://127.0.0.1:47391/ in Settings -> Homepage
        val hpSummaryMethod = findMethodOrThrow(
            classType = "Lcom/sec/android/app/sbrowser/settings/homepage/HomePagePreferenceFragment;",
            methodName = "getHomepageSummary",
            parameterTypes = listOf("I"),
            returnType = "Ljava/lang/String;",
        )
        val retIndices = hpSummaryMethod.implementation!!.instructions
            .mapIndexedNotNull { idx, insn -> if (insn.opcode == Opcode.RETURN_OBJECT) idx else null }
            .reversed()
        for (retIdx in retIndices) {
            val reg = (hpSummaryMethod.implementation!!.instructions.elementAt(retIdx) as OneRegisterInstruction).registerA
            hpSummaryMethod.addInstructions(
                retIdx,
                """
                    invoke-static {v$reg}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->formatStartPageDisplayUrl(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$reg
                """.trimIndent(),
            )
        }

        // Also show clean "SBrowserX Start Page" label in Main Settings -> Homepage summary
        val mainSettingsHpMethod = findMethodOrThrow(
            classType = "Lcom/sec/android/app/sbrowser/settings/SettingsFragment;",
            methodName = "updateHomepageSummary",
            parameterTypes = emptyList(),
            returnType = "V",
        )
        val mainHpInsns = mainSettingsHpMethod.implementation!!.instructions.toList()
        val getHpIdx = mainHpInsns.indexOfFirst { insn ->
            insn.opcode == Opcode.INVOKE_VIRTUAL &&
                insn.toString().contains("HomePageSettings;->getHomePage()Ljava/lang/String;")
        }
        val moveResultIdx = if (getHpIdx >= 0 && getHpIdx + 1 < mainHpInsns.size &&
            mainHpInsns[getHpIdx + 1].opcode == Opcode.MOVE_RESULT_OBJECT
        ) {
            getHpIdx + 1
        } else {
            // Fallback: find HomePageSettings;->getHomePage via ReferenceInstruction
            mainHpInsns.indexOfFirst { insn ->
                val ref = (insn as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference
                ref is com.android.tools.smali.dexlib2.iface.reference.MethodReference &&
                    ref.definingClass == "Lcom/sec/android/app/sbrowser/homepage/HomePageSettings;" &&
                    ref.name == "getHomePage"
            }.let { idx -> if (idx >= 0) idx + 1 else -1 }
        }
        if (moveResultIdx >= 0 && mainHpInsns[moveResultIdx].opcode == Opcode.MOVE_RESULT_OBJECT) {
            val reg = (mainHpInsns[moveResultIdx] as OneRegisterInstruction).registerA
            mainSettingsHpMethod.addInstructions(
                moveResultIdx + 1,
                """
                    invoke-static {v$reg}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->formatStartPageDisplayUrl(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$reg
                """.trimIndent(),
            )
        }

        // Keep SBrowserX Start Page toggle synced when user switches Homepage in native Settings -> Homepage
        findMethodOrThrow(
            classType = "Lcom/sec/android/app/sbrowser/homepage/HomePageSettings;",
            methodName = "setHomePageType",
            parameterTypes = listOf("Ljava/lang/String;"),
            returnType = "V",
        ).addInstruction(
            0,
            "invoke-static {p1}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->onNativeHomepageTypeChanged(Ljava/lang/String;)V",
        )
        findMethodOrThrow(
            classType = "Lcom/sec/android/app/sbrowser/homepage/HomePageSettings;",
            methodName = "setHomePage",
            parameterTypes = listOf("Ljava/lang/String;"),
            returnType = "V",
        ).addInstruction(
            0,
            "invoke-static {p1}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->onNativeHomepageUrlChanged(Ljava/lang/String;)V",
        )

        // When SBrowserX Start Page is active, tapping the gear icon next to "Custom page" opens Start Page settings
        // instead of showing the raw http://127.0.0.1:47391/ EditText dialog.
        findMethodOrThrow(
            classType = "Lcom/sec/android/app/sbrowser/settings/homepage/HomePagePreferenceFragment;",
            methodName = "showSetHomePageDialog",
            parameterTypes = emptyList(),
            returnType = "V",
        ).addInstructions(
            0,
            """
                invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->tryOpenStartPageSettingsFromDialog(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :sbrowserx_stock_hp_dlg
                return-void
                :sbrowserx_stock_hp_dlg
                nop
            """.trimIndent(),
        )

        // Keep HomePagePreferenceFragment summaries clean (never leak 127.0.0.1 on unselected Custom Page)
        val hpUpdateGuiMethod = findMethodOrThrow(
            classType = "Lcom/sec/android/app/sbrowser/settings/homepage/HomePagePreferenceFragment;",
            methodName = "updateSummaryAndGui",
            parameterTypes = listOf("I"),
            returnType = "V",
        )
        val hpGuiRetIndices = hpUpdateGuiMethod.implementation!!.instructions
            .mapIndexedNotNull { idx, insn -> if (insn.opcode == Opcode.RETURN_VOID) idx else null }
            .reversed()
        for (retIdx in hpGuiRetIndices) {
            hpUpdateGuiMethod.addInstruction(
                retIdx,
                "invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->onHomepageFragmentUpdated(Ljava/lang/Object;)V",
            )
        }

        // Redirect PreferenceGroup.getPreference(I) in HomePagePreferenceFragment (getHomepageSummary & updateSummaryAndGui)
        // to skip our native top card & category divider, keeping Samsung's 0..2 radio buttons 100% native and intact!
        listOf(hpSummaryMethod, hpUpdateGuiMethod).forEach { targetMethod ->
            val insns = targetMethod.implementation!!.instructions.toList()
            val matchIndices = insns.mapIndexedNotNull { idx, insn ->
                val ref = (insn as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference
                if (insn.opcode == Opcode.INVOKE_VIRTUAL &&
                    ref is com.android.tools.smali.dexlib2.iface.reference.MethodReference &&
                    ref.definingClass == "Landroidx/preference/PreferenceGroup;" &&
                    ref.name == "getPreference"
                ) {
                    idx
                } else {
                    null
                }
            }.reversed()
            for (callIdx in matchIndices) {
                val inv = insns[callIdx] as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
                val regObj = inv.registerC
                val regIdx = inv.registerD
                val nextInsn = insns.getOrNull(callIdx + 1)
                if (nextInsn != null && nextInsn.opcode == Opcode.MOVE_RESULT_OBJECT) {
                    val regDst = (nextInsn as OneRegisterInstruction).registerA
                    targetMethod.addInstruction(
                        callIdx + 2,
                        "check-cast v$regDst, Landroidx/preference/Preference;",
                    )
                    targetMethod.replaceInstruction(
                        callIdx,
                        "invoke-static {v$regObj, v$regIdx}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->getHomepageRadioPreference(Ljava/lang/Object;I)Ljava/lang/Object;",
                    )
                }
            }
        }

        // Route "Add page to -> Quick access" to SBrowserX Start Page when it is the active start page,
        // or fall through to Samsung's stock QuickAccess when stock QuickAccess is selected.
        // AddToMenu.addQuickAccess()V (.locals 4 -> v0 free)
        findMethodOrThrow(
            classType = "Lcom/sec/android/app/sbrowser/main_view/menu/AddToMenu;",
            methodName = "addQuickAccess",
            parameterTypes = emptyList(),
            returnType = "V",
        ).addInstructions(
            0,
            """
                invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->tryAddCurrentPageToStartPage(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :sbrowserx_stock_add_qa
                return-void
                :sbrowserx_stock_add_qa
                nop
            """.trimIndent(),
        )

        // Optional long-press on Home button: close all background tabs & open/reload Start Page.
        // ToolbarEventHandler.performToolbarButtonLongClick(I)Z (.locals 7 -> v0 free)
        findMethodOrThrow(
            classType = "Lcom/sec/android/app/sbrowser/main_view/toolbar/ToolbarEventHandler;",
            methodName = "performToolbarButtonLongClick",
            parameterTypes = listOf("I"),
            returnType = "Z",
        ).addInstructions(
            0,
            """
                invoke-static {p0, p1}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->onToolbarButtonLongClick(Ljava/lang/Object;I)Z
                move-result v0
                if-eqz v0, :sbrowserx_orig_toolbar_long_click
                const/4 v0, 0x1
                return v0
                :sbrowserx_orig_toolbar_long_click
                nop
            """.trimIndent(),
        )

        // Inject Permissions, Privacy Notice History & Debug Settings buttons cleanly into AboutFragment
        // AboutFragment.onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V (.locals 9)
        val aboutOnViewCreated = findMethodOrThrow(
            classType = "Lcom/sec/android/app/sbrowser/settings/about/AboutFragment;",
            methodName = "onViewCreated",
            parameterTypes = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
            returnType = "V",
        )
        val aboutRetIndices = aboutOnViewCreated.implementation!!.instructions
            .mapIndexedNotNull { idx, insn -> if (insn.opcode == Opcode.RETURN_VOID) idx else null }
            .reversed()
        for (retIdx in aboutRetIndices) {
            aboutOnViewCreated.addInstruction(
                retIdx,
                "invoke-static {p0, p1}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->onAboutFragmentViewCreated(Ljava/lang/Object;Landroid/view/View;)V",
            )
        }
    }
}
