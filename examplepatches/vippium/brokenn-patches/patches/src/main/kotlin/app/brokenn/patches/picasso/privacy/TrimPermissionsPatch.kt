package app.brokenn.patches.picasso.privacy

import app.brokenn.patches.picasso.shared.Constants.COMPATIBILITY_PICASSO
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import org.w3c.dom.Node

// Nothing in the app reads the phone state, the advertising id or a launcher badge,
// these are all declared by SDK manifests that got merged in.
private val UNWANTED = setOf(
    "android.permission.READ_PHONE_STATE",
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
    "android.permission.ACCESS_ADSERVICES_TOPICS",
    "android.permission.READ_APP_BADGE",
    "me.everything.badger.permission.BADGE_COUNT_READ",
    "me.everything.badger.permission.BADGE_COUNT_WRITE",
    "com.sec.android.provider.badge.permission.READ",
    "com.sec.android.provider.badge.permission.WRITE",
    "com.sonymobile.home.permission.PROVIDER_INSERT_BADGE",
    "com.sonyericsson.home.permission.BROADCAST_BADGE",
    "com.htc.launcher.permission.READ_SETTINGS",
    "com.htc.launcher.permission.UPDATE_SHORTCUT",
    "com.huawei.android.launcher.permission.CHANGE_BADGE",
    "com.huawei.android.launcher.permission.READ_SETTINGS",
    "com.huawei.android.launcher.permission.WRITE_SETTINGS",
    "com.oppo.launcher.permission.READ_SETTINGS",
    "com.oppo.launcher.permission.WRITE_SETTINGS",
    "com.anddoes.launcher.permission.UPDATE_COUNT",
    "com.majeur.launcher.permission.UPDATE_BADGE",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
)

private val PERMISSION_TAGS = setOf("uses-permission", "uses-permission-sdk-23")

@Suppress("unused")
val trimPermissionsPatch = resourcePatch(
    name = "Remove unused permissions",
    description = "Removes phone state, advertising id, install referrer and badge permissions.",
) {
    compatibleWith(COMPATIBILITY_PICASSO)

    execute {
        val removed = mutableListOf<String>()
        document("AndroidManifest.xml").use { manifest ->
            val root = manifest.documentElement
            val children = root.childNodes
            val matches = (0 until children.length).mapNotNull { children.item(it) }
                .filterIsInstance<Element>()
                .filter { it.tagName in PERMISSION_TAGS && it.getAttribute("android:name") in UNWANTED }
            for (node in matches) {
                removed.add(node.getAttribute("android:name"))
                root.removeChild(node as Node)
            }
        }
        // Every entry above ships in the manifest, a shortfall means the layout changed.
        if (removed.size < UNWANTED.size) {
            throw PatchException("Removed ${removed.size} of ${UNWANTED.size} permissions")
        }
    }
}
