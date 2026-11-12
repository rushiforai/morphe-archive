package app.variablenine.patches.duet

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourceXml

/**
 * Everything the Duet reminders patches do to an app, which is deliberately little:
 * the extension is merged in, and the manifest gains one provider, one service and a
 * few `<queries>` entries.
 *
 * No method of the app is matched or changed. There is no fingerprint that an app
 * update could break, and nothing here can collide with what other patch bundles do to
 * the app's code.
 */

internal const val EXTENSION = "extensions/duetnudge.mpe"

private const val PROVIDER_CLASS = "app.variablenine.nudge.NudgeProvider"
private const val LISTENER_CLASS = "app.variablenine.nudge.NudgeListenerService"

/**
 * The provider authority is the app's package name plus this suffix.
 *
 * It is derived from the package rather than fixed because other patches rename
 * packages (GmsCore support renames YouTube, Clone app renames anything) and rewrite
 * the authorities that start with the old name. An authority built this way follows
 * along whichever patch runs first, so two differently named copies of one app never
 * end up claiming the same authority, which Android would refuse to install.
 */
internal const val AUTHORITY_SUFFIX = ".duetnudge"

/** Package names the patched YouTube can end up with. Stock name first, renamed second. */
internal val YOUTUBE_PACKAGES = listOf("com.google.android.youtube", "app.morphe.android.youtube")

/** Package names the patched Reddit can end up with. */
internal val REDDIT_PACKAGES = listOf("com.reddit.frontpage", "com.reddit.frontpage.morphe")

/**
 * @param siblingPackages package names of the other apps this bundle patches. The app
 * is allowed to see their reminder providers so that reminders can be kept in step
 * between the apps.
 */
internal fun addReminderSpot(siblingPackages: List<String>) {
    resourceXml("AndroidManifest.xml").use { manifest ->
        val root = manifest.root
        val packageName = root.attribute("package")?.takeIf { it.isNotBlank() }
            ?: throw PatchException("The app manifest declares no package name")
        val application = root.children("application").firstOrNull()
            ?: throw PatchException("The app manifest has no <application> element")

        // Applying the patch twice must not declare the components twice.
        if (application.children("provider").none { it.attribute("android:name") == PROVIDER_CLASS }) {
            application.appendChild("provider") {
                setAttribute("android:name", PROVIDER_CLASS)
                setAttribute("android:authorities", packageName + AUTHORITY_SUFFIX)
                // Exported so the other patched apps can reach it. The provider itself
                // only answers callers that are signed with the same key as this app.
                setAttribute("android:exported", "true")
            }
        }

        if (application.children("service").none { it.attribute("android:name") == LISTENER_CLASS }) {
            application.appendChild("service") {
                setAttribute("android:name", LISTENER_CLASS)
                setAttribute("android:label", "Duet reminders")
                setAttribute("android:exported", "true")
                // Only the system can bind a service that asks for this permission.
                setAttribute("android:permission", "android.permission.BIND_NOTIFICATION_LISTENER_SERVICE")
                appendChild("intent-filter") {
                    appendChild("action") {
                        setAttribute("android:name", "android.service.notification.NotificationListenerService")
                    }
                }
            }
        }

        val queries = root.children("queries").firstOrNull() ?: root.appendChild("queries")
        val known = queries.children("provider").mapNotNull { it.attribute("android:authorities") }.toSet()
        siblingPackages
            .filter { it != packageName }
            .map { it + AUTHORITY_SUFFIX }
            .filter { it !in known }
            .forEach { authority ->
                queries.appendChild("provider") { setAttribute("android:authorities", authority) }
            }
    }
}
