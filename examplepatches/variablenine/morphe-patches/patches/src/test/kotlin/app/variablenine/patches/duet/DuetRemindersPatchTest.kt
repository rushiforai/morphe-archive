package app.variablenine.patches.duet

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.classDefBy
import app.morphe.patcher.patch.loadPatchesFromJar
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import kotlinx.coroutines.runBlocking
import java.io.File
import kotlin.io.path.createTempDirectory
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNotNull
import kotlin.test.assertTrue

private const val YOUTUBE = "com.google.android.youtube"
private const val YOUTUBE_RENAMED = "app.morphe.android.youtube"
private const val REDDIT = "com.reddit.frontpage"

private const val PROVIDER = "app.variablenine.nudge.NudgeProvider"
private const val LISTENER = "app.variablenine.nudge.NudgeListenerService"

/** What the tests read back out of a patched app. */
private class Facts(
    val packageName: String,
    val authorities: List<String>,
    val providerExported: String?,
    val listeners: Int,
    val listenerPermission: String?,
    val listenerActions: List<String>,
    val queriedAuthorities: List<String>,
    val hasExtension: Boolean,
)

/**
 * Applies the bundle, exactly as it is released, to a small stand-in app and checks what
 * comes out. Runs in CI on every change.
 *
 * The combination with the real official patches and the real apps is checked by
 * `scripts/compat-check.sh` (see docs/MAINTENANCE.md), because neither the apps nor a
 * network download belong in a unit test.
 */
class DuetRemindersPatchTest {

    private val bundle = File(System.getProperty("duet.bundle"))

    private val patches: Set<Patch> by lazy { loadPatchesFromJar(setOf(bundle)) }

    private fun patchFor(packageName: String): Patch =
        patches.single { patch -> patch.compatibility!!.any { it.packageName == packageName } }

    private fun run(apk: File, vararg selected: Patch, out: File? = null) {
        val work = createTempDirectory("duet-patcher").toFile()
        try {
            Patcher(PatcherConfig(apkFile = apk, temporaryFilesPath = work)).use { patcher ->
                patcher += selected.toSet()
                runBlocking {
                    patcher().collect { result -> result.exception?.let { throw it } }
                }
                out?.let { patcher.writeApk(it) }
            }
        } finally {
            work.deleteRecursively()
        }
    }

    private fun patched(dir: File, packageName: String, vararg selected: Patch): File {
        val out = dir.resolve("patched-${System.nanoTime()}.apk")
        run(StubApk.build(dir, packageName), *selected, out = out)
        return out
    }

    /** Reads the facts with the patcher's own API, so the test depends on nothing else. */
    private fun inspect(apk: File): Facts {
        lateinit var facts: Facts
        val reader = patch(name = "Read back", description = "Test only", default = true) {
            execute {
                resourceXml("AndroidManifest.xml").use { manifest ->
                    val root = manifest.root
                    val application = root.children("application").single()
                    val providers = application.children("provider")
                        .filter { it.attribute("android:name") == PROVIDER }
                    val services = application.children("service")
                        .filter { it.attribute("android:name") == LISTENER }
                    facts = Facts(
                        packageName = root.attribute("package")!!,
                        authorities = providers.mapNotNull { it.attribute("android:authorities") },
                        providerExported = providers.firstOrNull()?.attribute("android:exported"),
                        listeners = services.size,
                        listenerPermission = services.firstOrNull()?.attribute("android:permission"),
                        listenerActions = services.flatMap { it.elements("action") }
                            .mapNotNull { it.attribute("android:name") }.toList(),
                        queriedAuthorities = root.children("queries").flatMap { it.children("provider") }
                            .mapNotNull { it.attribute("android:authorities") },
                        hasExtension = runCatching {
                            classDefBy("L${PROVIDER.replace('.', '/')};")
                            classDefBy("L${LISTENER.replace('.', '/')};")
                            classDefBy("Lapp/variablenine/nudge/ui/OverlayController;")
                        }.isSuccess,
                    )
                }
            }
        }
        run(apk, reader)
        return facts
    }

    /** What the official "GmsCore support" patch does to the manifest of YouTube, in miniature. */
    private fun rename(name: String, from: String, to: String) =
        patch(name = name, description = "Test only", default = true) {
            compatibleWith(Compatibility(name = "Stub", packageName = from))
            execute {
                resourceXml("AndroidManifest.xml").use { manifest ->
                    manifest.elements().toList().forEach { element ->
                        element.attributeNames.toList().forEach { attribute ->
                            val value = element.attribute(attribute) ?: return@forEach
                            val renames = attribute == "package" || attribute == "android:authorities"
                            if (renames && value.startsWith(from)) {
                                element.setAttribute(attribute, to + value.removePrefix(from))
                            }
                        }
                    }
                }
            }
        }

    private fun tempDir() = createTempDirectory("duet-test").toFile()

    @Test
    fun `the bundle offers one patch for YouTube and one for Reddit`() {
        assertEquals(2, patches.size)
        patches.forEach { patch ->
            assertEquals("Duet reminders", patch.name)
            assertTrue(patch.default, "selected by default")
            assertTrue(!patch.description.isNullOrBlank())
            val compatibility = patch.compatibility!!.single()
            // Any version: the patch does not depend on the app's code.
            assertTrue(compatibility.targets.all { it.version == null })
        }
        // Morphe Manager matches these exact names against the changelog to flag an app as updated.
        assertEquals(
            mapOf(YOUTUBE to "YouTube", REDDIT to "Reddit"),
            patches.associate { it.compatibility!!.single().let { c -> c.packageName!! to c.name!! } },
        )
    }

    @Test
    fun `YouTube gains the provider, the listener, the queries and the code`() {
        val dir = tempDir()
        val facts = inspect(patched(dir, YOUTUBE, patchFor(YOUTUBE)))
        assertEquals(YOUTUBE, facts.packageName)
        assertEquals(listOf("$YOUTUBE.duetnudge"), facts.authorities)
        assertEquals("true", facts.providerExported)
        assertEquals(1, facts.listeners)
        assertEquals("android.permission.BIND_NOTIFICATION_LISTENER_SERVICE", facts.listenerPermission)
        assertEquals(listOf("android.service.notification.NotificationListenerService"), facts.listenerActions)
        assertEquals(listOf("$REDDIT.duetnudge", "$REDDIT.morphe.duetnudge"), facts.queriedAuthorities)
        assertTrue(facts.hasExtension, "extension classes merged into the app")
        dir.deleteRecursively()
    }

    @Test
    fun `Reddit gains the same and can see both names YouTube may have`() {
        val dir = tempDir()
        val facts = inspect(patched(dir, REDDIT, patchFor(REDDIT)))
        assertEquals(listOf("$REDDIT.duetnudge"), facts.authorities)
        assertEquals(1, facts.listeners)
        assertEquals(listOf("$YOUTUBE.duetnudge", "$YOUTUBE_RENAMED.duetnudge"), facts.queriedAuthorities)
        assertTrue(facts.hasExtension)
        dir.deleteRecursively()
    }

    @Test
    fun `the authority follows a package rename whichever patch runs first`() {
        val dir = tempDir()
        // Patches run in order of their names. "GmsCore support" sorts after "Duet reminders" ...
        val after = inspect(patched(dir, YOUTUBE, patchFor(YOUTUBE), rename("GmsCore support", YOUTUBE, YOUTUBE_RENAMED)))
        assertEquals(YOUTUBE_RENAMED, after.packageName)
        assertEquals(listOf("$YOUTUBE_RENAMED.duetnudge"), after.authorities)
        // ... and a rename that sorts before it must lead to the same result.
        val before = inspect(patched(dir, YOUTUBE, patchFor(YOUTUBE), rename("A rename", YOUTUBE, YOUTUBE_RENAMED)))
        assertEquals(YOUTUBE_RENAMED, before.packageName)
        assertEquals(listOf("$YOUTUBE_RENAMED.duetnudge"), before.authorities)
        // Reddit's authority, which YouTube only looks up, is left alone.
        assertEquals(listOf("$REDDIT.duetnudge", "$REDDIT.morphe.duetnudge"), after.queriedAuthorities)
        dir.deleteRecursively()
    }

    @Test
    fun `patching an already patched app declares nothing twice`() {
        val dir = tempDir()
        val once = patched(dir, REDDIT, patchFor(REDDIT))
        val twice = dir.resolve("twice.apk")
        run(once, patchFor(REDDIT), out = twice)
        val facts = inspect(twice)
        assertEquals(listOf("$REDDIT.duetnudge"), facts.authorities)
        assertEquals(1, facts.listeners)
        assertEquals(2, facts.queriedAuthorities.size)
        assertNotNull(facts.listenerPermission)
        dir.deleteRecursively()
    }
}
