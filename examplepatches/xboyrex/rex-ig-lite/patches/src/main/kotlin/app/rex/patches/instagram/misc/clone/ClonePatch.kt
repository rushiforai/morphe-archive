/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.clone

import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.StringFilter
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.string
import app.morphe.util.asSequence
import app.morphe.util.findElementByAttributeValue
import app.morphe.util.forEachChildElement
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.matchAllMethodIndicesForEach
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.w3c.dom.Element
import org.w3c.dom.NodeList

private const val ORIGINAL_PACKAGE_NAME = "com.instagram.android"
private const val DEFAULT_CLONE_PACKAGE_NAME = "com.xboyrex.instarex"
private const val DEFAULT_APP_NAME = "InstaRex"

@Suppress("unused")
val clonePatch =
    patch(
        name = "Clone",
        description =
            "Changes the package name to com.xboyrex.instarex and the app label/icon to InstaRex. " +
                "Allows installing the patched InstaRex Clone alongside the original Instagram app without authority or Google Play Store conflicts.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)

        val packageName by stringOption(
            key = "packageName",
            default = DEFAULT_CLONE_PACKAGE_NAME,
            title = "Package name",
            description = "Package name for the patched app (use com.xboyrex.instarex for Clone or com.instagram.android for UnClone).",
            required = true,
        ) {
            it?.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$")) == true
        }

        val appName by stringOption(
            key = "appName",
            default = DEFAULT_APP_NAME,
            title = "App name",
            description = "Display name (label) shown in the Android launcher and recent apps.",
            required = true,
        )

        execute {
            runCatching {
                val newPackageName = (packageName ?: DEFAULT_CLONE_PACKAGE_NAME).trim()
                val resolvedAppName = (appName ?: DEFAULT_APP_NAME).trim().ifEmpty { DEFAULT_APP_NAME }
                val isCloneVariant = newPackageName != ORIGINAL_PACKAGE_NAME

                /** Pairs of the original authority and the renamed authority */
                val providerReplacements = mutableListOf<Pair<String, String>>()

                document("AndroidManifest.xml").use { document ->
                    val manifest = document.documentElement

                    if (isCloneVariant) {
                        // Change package name for Clone variant (com.xboyrex.instarex)
                        manifest.setAttribute("package", newPackageName)

                        // Rename custom permissions & corresponding uses-permission tags
                        val permissions = manifest.getElementsByTagName("permission")
                        val usesPermissions = manifest.getElementsByTagName("uses-permission")

                        permissions.elementsForEach {
                            val oldName = it.getAttribute("android:name")
                            if (oldName.startsWith('.')) {
                                return@elementsForEach
                            }
                            val newName = if (oldName.startsWith(ORIGINAL_PACKAGE_NAME)) {
                                oldName.replaceFirst(ORIGINAL_PACKAGE_NAME, newPackageName)
                            } else {
                                "$newPackageName.permission.${oldName.substringAfterLast('.')}"
                            }
                            it.setAttribute("android:name", newName)

                            usesPermissions
                                .findElementByAttributeValue("android:name", oldName)
                                ?.setAttribute("android:name", newName)
                        }
                    }

                    val application = manifest.getElementsByTagName("application").item(0) as? Element
                    if (application != null) {
                        // Apply InstaRex display label and custom launcher icon on <application>
                        application.setAttribute("android:label", resolvedAppName)
                        application.setAttribute("android:icon", "@drawable/rex_ic_launcher_instarex")
                        application.setAttribute("android:roundIcon", "@drawable/rex_ic_launcher_round")

                        if (isCloneVariant) {
                            // Rename all provider authorities so Clone installs alongside official Instagram without conflict
                            application.getElementsByTagName("provider").elementsForEach { provider ->
                                val oldAuthority = provider.getAttribute("android:authorities")
                                if (oldAuthority.isNotEmpty()) {
                                    val newAuthority = oldAuthority.split(';').joinToString(";") { auth ->
                                        val trimmed = auth.trim()
                                        if (trimmed.startsWith("$ORIGINAL_PACKAGE_NAME.")) {
                                            trimmed.replaceFirst(ORIGINAL_PACKAGE_NAME, newPackageName)
                                        } else {
                                            "${newPackageName}_$trimmed"
                                        }
                                    }
                                    provider.setAttribute("android:authorities", newAuthority)
                                    oldAuthority.split(';').zip(newAuthority.split(';')).forEach { (oldA, newA) ->
                                        if (oldA.isNotBlank() && oldA != newA) {
                                            providerReplacements.add(oldA.trim() to newA.trim())
                                        }
                                    }
                                }
                            }
                        }

                        // Apply InstaRex label & icon on MAIN/LAUNCHER activities and activity-aliases
                        listOf("activity", "activity-alias").forEach { tagName ->
                            application.getElementsByTagName(tagName).elementsForEach { actEl ->
                                val intents = actEl.getElementsByTagName("category")
                                var isLauncher = false
                                intents.elementsForEach { cat ->
                                    if (cat.getAttribute("android:name") == "android.intent.category.LAUNCHER") {
                                        isLauncher = true
                                    }
                                }
                                if (isLauncher || actEl.getAttribute("android:name").contains("MainTabActivity")) {
                                    actEl.setAttribute("android:label", resolvedAppName)
                                    actEl.setAttribute("android:icon", "@drawable/rex_ic_launcher_instarex")
                                    actEl.setAttribute("android:roundIcon", "@drawable/rex_ic_launcher_round")
                                }
                            }
                        }
                    }
                }

                // Change app name in res/values/strings.xml
                if (resolvedAppName.isNotEmpty() && resolvedAppName != "Instagram") {
                    runCatching {
                        document("res/values/strings.xml").use { document ->
                            document.documentElement.forEachChildElement {
                                if (it.textContent == "Instagram") {
                                    it.textContent = resolvedAppName
                                }
                            }
                        }
                    }
                }

                if (isCloneVariant) {
                    // transformStringReferences across all matching string constants in bytecode
                    val targets: List<StringFilter> = listOf(
                        string(ORIGINAL_PACKAGE_NAME),
                    ) + providerReplacements.map { string(it.first, StringComparisonType.CONTAINS) }
                    targets.forEach { stringFilter ->
                        Fingerprint(
                            filters = listOf(stringFilter)
                        ).matchAllMethodIndicesForEach(requireMatches = false) { index ->
                            val instruction = getInstruction(index)
                            val foundString = instruction.getReference<StringReference>()!!.string
                            val transformedString = if (foundString == ORIGINAL_PACKAGE_NAME) {
                                newPackageName
                            } else {
                                val matchedReplacement = providerReplacements.find { foundString.contains(it.first) }
                                if (matchedReplacement != null) {
                                    foundString.replaceFirst(matchedReplacement.first, matchedReplacement.second)
                                } else {
                                    null
                                }
                            } ?: return@matchAllMethodIndicesForEach

                            replaceInstruction(
                                index,
                                BuilderInstruction21c(
                                    Opcode.CONST_STRING,
                                    (instruction as OneRegisterInstruction).registerA,
                                    ImmutableStringReference(transformedString)
                                )
                            )
                        }
                    }
                }
            }
        }

        finalize {
            runCatching {
                val resolvedPkg = (packageName ?: DEFAULT_CLONE_PACKAGE_NAME).trim()
                document("res/xml/shortcuts.xml").use {
                    it.getElementsByTagName("intent")
                        .findElementByAttributeValue("android:targetPackage", ORIGINAL_PACKAGE_NAME)
                        ?.setAttribute("android:targetPackage", resolvedPkg)
                }
            }
        }
    }

private fun NodeList.elementsForEach(action: (Element) -> Unit) = asSequence().map { it as Element }.forEach(action)
