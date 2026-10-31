package dev.skulldogged.cobalt.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import org.w3c.dom.Node

private const val EXTENSION_CLASS =
    "Ldev/skulldogged/cobalt/extension/CobaltDownloader;"

private val cobaltDownloadsManifestPatch = resourcePatch {
    compatibleWith(YOUTUBE_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.getElementsByTagName("manifest").item(0)
            val application = document.getElementsByTagName("application").item(0)

            fun addPermissionIfMissing(permission: String) {
                val permissions = document.getElementsByTagName("uses-permission")
                for (index in 0 until permissions.length) {
                    val element = permissions.item(index) as Element
                    if (element.getAttribute("android:name") == permission) return
                }

                val element = document.createElement("uses-permission")
                element.setAttribute("android:name", permission)
                manifest.insertBefore(element, application)
            }

            addPermissionIfMissing("android.permission.INTERNET")
            addPermissionIfMissing("android.permission.FOREGROUND_SERVICE")
            addPermissionIfMissing("android.permission.FOREGROUND_SERVICE_DATA_SYNC")

            val serviceName =
                "dev.skulldogged.cobalt.extension.CobaltDownloadService"
            val services = document.getElementsByTagName("service")
            var serviceExists = false
            for (index in 0 until services.length) {
                val element = services.item(index) as Element
                if (element.getAttribute("android:name") == serviceName) {
                    serviceExists = true
                    break
                }
            }

            if (!serviceExists) {
                val service = document.createElement("service")
                service.setAttribute("android:name", serviceName)
                service.setAttribute("android:exported", "false")
                service.setAttribute("android:foregroundServiceType", "dataSync")
                application.appendChild(service)
            }

            fun addActivityIfMissing(activityName: String, launchMode: String? = null) {
                val activities = document.getElementsByTagName("activity")
                for (index in 0 until activities.length) {
                    val element = activities.item(index) as Element
                    if (element.getAttribute("android:name") == activityName) return
                }

                val activity = document.createElement("activity")
                activity.setAttribute("android:name", activityName)
                activity.setAttribute("android:exported", "false")
                if (launchMode != null) {
                    activity.setAttribute("android:launchMode", launchMode)
                }
                application.appendChild(activity)
            }

            addActivityIfMissing(
                "dev.skulldogged.cobalt.extension.CobaltDownloadsActivity",
                "singleTop",
            )
            addActivityIfMissing(
                "dev.skulldogged.cobalt.extension.CobaltTurnstileActivity",
            )
        }
    }

    finalize {
        fun Node.addPreference(tag: String, attributes: Map<String, String>, block: (Element.() -> Unit)? = null): Element {
            val element = ownerDocument.createElement(tag)
            attributes.forEach(element::setAttribute)
            block?.invoke(element)
            appendChild(element)
            return element
        }

        fun addCobaltSettings(path: String, icon: String?) {
            if (!get(path).exists()) return

            document(path).use { document ->
                val root = document.documentElement
                val existing = document.getElementsByTagName("PreferenceScreen")
                for (index in 0 until existing.length) {
                    val element = existing.item(index) as Element
                    if (element.getAttribute("android:key") == "cobalt_settings_screen") return@use
                }

                val screenAttributes = linkedMapOf(
                    "android:key" to "cobalt_settings_screen",
                    "android:title" to "Cobalt downloads",
                    "android:summary" to "Download YouTube videos through your cobalt instance",
                )
                if (icon != null) {
                    screenAttributes["android:icon"] = icon
                    screenAttributes["android:layout"] = "@layout/preference_with_icon"
                }

                root.addPreference("PreferenceScreen", screenAttributes) {
                    addPreference("PreferenceCategory", mapOf(
                        "android:title" to "Connection"
                    )) {
                        addPreference("SwitchPreference", mapOf(
                            "android:key" to "cobalt_enabled",
                            "android:title" to "Use cobalt downloads",
                            "android:summary" to "Override YouTube's download button; turn off to use YouTube's original action",
                            "android:defaultValue" to "true",
                        ))
                        addPreference("EditTextPreference", mapOf(
                            "android:key" to "cobalt_api_url_v2",
                            "android:title" to "API endpoint",
                            "android:summary" to "Required HTTPS cobalt processing endpoint, including any path such as /api/",
                            "android:dialogTitle" to "API endpoint",
                            "android:defaultValue" to "",
                            "android:inputType" to "textUri",
                            "android:dependency" to "cobalt_enabled",
                        ))
                        addPreference("EditTextPreference", mapOf(
                            "android:key" to "cobalt_turnstile_url",
                            "android:title" to "Turnstile webpage",
                            "android:summary" to "Optional cobalt web frontend used when the API requires Cloudflare Turnstile",
                            "android:dialogTitle" to "Turnstile webpage",
                            "android:defaultValue" to "",
                            "android:inputType" to "textUri",
                            "android:dependency" to "cobalt_enabled",
                        ))
                        addPreference("EditTextPreference", mapOf(
                            "android:key" to "cobalt_api_key",
                            "android:title" to "API key",
                            "android:summary" to "Optional Api-Key authentication token",
                            "android:dialogTitle" to "API key",
                            "android:defaultValue" to "",
                            "android:inputType" to "textPassword",
                            "android:dependency" to "cobalt_enabled",
                        ))
                    }

                    addPreference("PreferenceCategory", mapOf(
                        "android:title" to "Download preferences"
                    )) {
                        addPreference("dev.skulldogged.cobalt.extension.CobaltListPreference", mapOf(
                            "android:key" to "cobalt_download_mode",
                            "android:title" to "Download type",
                            "android:dialogTitle" to "Download type",
                            "android:defaultValue" to "auto",
                            "android:dependency" to "cobalt_enabled",
                        ))
                        addPreference("dev.skulldogged.cobalt.extension.CobaltListPreference", mapOf(
                            "android:key" to "cobalt_video_quality",
                            "android:title" to "Video quality",
                            "android:dialogTitle" to "Video quality",
                            "android:defaultValue" to "1440",
                            "android:dependency" to "cobalt_enabled",
                        ))
                        addPreference("dev.skulldogged.cobalt.extension.CobaltListPreference", mapOf(
                            "android:key" to "cobalt_video_codec",
                            "android:title" to "Preferred video codec",
                            "android:dialogTitle" to "Preferred video codec",
                            "android:defaultValue" to "av1",
                            "android:dependency" to "cobalt_enabled",
                        ))
                        addPreference("dev.skulldogged.cobalt.extension.CobaltListPreference", mapOf(
                            "android:key" to "cobalt_filename_style",
                            "android:title" to "Filename style",
                            "android:dialogTitle" to "Filename style",
                            "android:defaultValue" to "pretty",
                            "android:dependency" to "cobalt_enabled",
                        ))
                        addPreference("SwitchPreference", mapOf(
                            "android:key" to "cobalt_better_youtube_audio",
                            "android:title" to "Prefer higher-quality YouTube audio",
                            "android:summary" to "Use a higher-quality audio stream when cobalt can provide one",
                            "android:defaultValue" to "false",
                            "android:dependency" to "cobalt_enabled",
                        ))
                    }
                }
            }
        }

        addCobaltSettings("res/xml/morphe_prefs.xml", null)
        addCobaltSettings(
            "res/xml/morphe_prefs_icons.xml",
            "@drawable/morphe_settings_screen_12_video"
        )
        addCobaltSettings(
            "res/xml/morphe_prefs_icons_bold.xml",
            "@drawable/morphe_settings_screen_12_video_bold"
        )
    }
}

@Suppress("unused")
val cobaltDownloadsPatch = bytecodePatch(
    name = "Cobalt downloads",
    description = "Replaces YouTube's download action and Downloads page with a native cobalt manager.",
    default = false,
) {
    dependsOn(cobaltDownloadsManifestPatch)
    compatibleWith(YOUTUBE_COMPATIBILITY)

    extendWith("extensions/cobalt-downloads.mpe")

    execute {
        YouTubeApplicationInitFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->initialize(Ljava/lang/Object;)V",
        )

        OfflineVideoEndpointFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static/range { p3 .. p3 }, $EXTENSION_CLASS->onDownloadButtonClick(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :show_native_downloader
                return-void
                :show_native_downloader
                nop
            """.trimIndent(),
        )
    }
}
