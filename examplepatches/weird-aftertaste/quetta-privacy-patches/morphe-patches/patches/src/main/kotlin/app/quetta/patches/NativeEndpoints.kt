package app.quetta.patches

import app.morphe.patcher.patch.rawResourcePatch

/**
 * Chromium keeps its own copies of some endpoints inside libchrome.so (reporting tables, crash
 * uploader, vendor URLs). Bytecode patches cannot reach those, so rewrite the libraries.
 *
 * Each group has its own patch so that enabling one endpoint group also covers its native copies,
 * and nothing else.
 */
internal fun nativeEndpointsPatch(name: String, description: String, hosts: List<Pair<String, String>>) =
    rawResourcePatch(name = name, description = description, default = false) {
        compatibleWith(COMPATIBILITY_QUETTA, COMPATIBILITY_QUETTA_OFFICIAL)

        execute {
            var changed = 0
            for (entry in listApkEntries("lib/").filter { it.endsWith(".so") }) {
                // copy = true extracts the library to the working directory so it can be read.
                val file = get(entry)
                val content = String(file.readBytes(), Charsets.ISO_8859_1)
                var replaced = content
                for ((from, to) in hosts) {
                    if (replaced.contains(from)) replaced = replaced.replace(from, to)
                }
                if (replaced == content) continue
                file.writeBytes(replaced.toByteArray(Charsets.ISO_8859_1))
                changed++
            }
            if (changed == 0) println("no endpoint found in native libraries, nothing to change")
        }
    }

internal val nativeAnalyticsEndpointsPatch = nativeEndpointsPatch(
    name = "Strip analytics endpoints from native libraries",
    description = "Rewrites analytics and crash reporting hosts in lib*.so, which bytecode patches cannot reach.",
    hosts = ANALYTICS_HOSTS
)

internal val nativeVendorEndpointsPatch = nativeEndpointsPatch(
    name = "Strip vendor endpoints from native libraries",
    description = "Rewrites Quetta vendor endpoints in lib*.so, which bytecode patches cannot reach.",
    hosts = VENDOR_HOSTS
)

internal val nativeUpdatePushEndpointsPatch = nativeEndpointsPatch(
    name = "Strip update and push endpoints from native libraries",
    description = "Rewrites update and push hosts in lib*.so, which bytecode patches cannot reach.",
    hosts = UPDATE_PUSH_HOSTS
)
