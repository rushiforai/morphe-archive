package io.github.xd33m.watchtime.patches

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/** The Watchtime Tracker app's provider (protocol v1 of its gap source). */
private const val PROVIDER_AUTHORITY = "io.github.xd33m.watchtimetracker.gaps"

private const val REGISTER_METHOD = "Lio/github/xd33m/watchtime/addon/WatchtimeAddOn;->register()V"

/** YouTube as the official patches declare it; no versions of its own: whatever the official patches support. */
private val COMPATIBILITY_YOUTUBE = Compatibility(
    name = "YouTube",
    packageName = "com.google.android.youtube",
    apkFileType = ApkFileType.APK_REQUIRED,
    appIconColor = 0xFF0033,
    signatures = setOf(
        // Android 13+
        "5aad2bee6db95d17e05a08d7d1e64c10a1511879154483916b6ae6c7fd9cb0c6",
        // Android 7+
        "3d7a1223019aa39d9ea0e3436ab7c0896bfb4fb679f4de5fe7c23f326c8f994a",
    ),
)

/** Android 11+ hides other apps' providers unless the manifest declares them in `<queries>`. */
private val providerQueryPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.getElementsByTagName("manifest").item(0) as Element
            val queries = document.getElementsByTagName("queries").item(0) as Element?
                ?: document.createElement("queries").also { manifest.appendChild(it) }
            queries.appendChild(
                document.createElement("provider").apply { setAttribute("android:authorities", PROVIDER_AUTHORITY) },
            )
        }
    }
}

@Suppress("unused")
val reportShortsPatch = bytecodePatch(
    name = "Report Shorts to Watchtime Tracker",
    description = "Lets the Watchtime Tracker app count the Shorts you watch. " +
        "Needs the official Morphe patches and the Watchtime Tracker app.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(providerQueryPatch)
    extendWith("extensions/extension.mpe")

    // In finalize: the official extension, with the add-on manager, is merged while the official patches execute.
    finalize {
        registerAddOn(REGISTER_METHOD)
    }
}
