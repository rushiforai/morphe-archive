/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.settings

import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.packageMetadata
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.patch
import app.morphe.util.ResourceGroup
import app.morphe.util.copyResources
import org.w3c.dom.Element

val settingsResourcePatch =
    patch(
        description = "Settings resource patch.",
    ) {
        execute {
            runCatching {
            // Add xboyrex Settings to the launcher icon long-press shortcuts
            document("res/xml/shortcuts.xml").use {
                val existing = it.getElementsByTagName("shortcut")
                for (index in 0 until existing.length) {
                    val sc = existing.item(index) as? Element ?: continue
                    if (sc.getAttribute("android:shortcutId") == "rex_settings") return@use
                }

                val rexExtra =
                    it.createElement("extra").apply {
                        setAttribute("android:name", "rex")
                        setAttribute("android:value", "true")
                    }
                val launchTypeExtra =
                    it.createElement("extra").apply {
                        setAttribute("android:name", "rex_launch_type")
                        setAttribute("android:value", "settings")
                    }
                val shortcutExtra =
                    it.createElement("extra").apply {
                        setAttribute("android:name", "shortcut")
                        setAttribute("android:value", "settings")
                    }
                val intentElement =
                    it.createElement("intent").apply {
                        setAttribute("android:targetPackage", packageMetadata.packageName)
                        setAttribute("android:action", "android.intent.action.VIEW")
                        setAttribute("android:targetClass", "com.instagram.modal.ModalActivity")
                        appendChild(rexExtra)
                        appendChild(launchTypeExtra)
                        appendChild(shortcutExtra)
                    }
                val shortcutElement =
                    it.createElement("shortcut").apply {
                        setAttribute("android:icon", "@drawable/rex_settings_shortcut_icon")
                        setAttribute("android:enabled", "true")
                        setAttribute("android:shortcutId", "rex_settings")
                        setAttribute("android:shortcutShortLabel", "@string/rex_title_settings")
                        setAttribute("android:shortcutLongLabel", "@string/rex_title_settings")
                        appendChild(intentElement)
                    }
                it.documentElement.insertBefore(shortcutElement, it.documentElement.firstChild)
            }

            copyResources(
                "instagram/settings",
                ResourceGroup(
                    "drawable",
                    "rex_settings_shortcut_icon.xml",
                    "rex_settings_shortcut_foreground.xml",
                    "rex_ghost_icon.xml",
                ),
                ResourceGroup(
                    "raw",
                    "rex_tabler_icons_license.txt",
                ),
            )
        
            }
        }
    }
