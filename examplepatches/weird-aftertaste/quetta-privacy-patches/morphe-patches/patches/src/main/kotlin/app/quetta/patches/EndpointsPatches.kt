package app.quetta.patches

import app.morphe.patcher.patch.BytecodePatchContext

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

/**
 * Common handling for a group of endpoint replacements.
 *
 * Re-running a patch on an APK that was already processed is a no-op: the group's own dead markers
 * prove an earlier run, so failing would only break users who patch twice. A group whose hosts are
 * absent *and* never replaced means the app moved its endpoints, which is a real failure.
 */
private fun BytecodePatchContext.rewriteGroup(
    label: String,
    hosts: List<Pair<String, String>>
) {
    val result = rewriteHosts(hosts)
    when {
        result.rewritten > 0 ->
            println("$label: rewrote ${result.rewritten} string(s)")

        result.alreadyPatched ->
            println("$label: already patched, nothing to change")

        else -> throw PatchException(
            "none of the expected hosts were found, so the app moved or removed them. " +
                "Searched for: " + hosts.joinToString { it.first }
        )
    }
}

@Suppress("unused")
val analyticsEndpointsPatch = bytecodePatch(
    name = "Strip analytics endpoints",
    description = "Points usage reporting, crash reporting and telemetry beacon hosts at a " +
        "non-resolvable domain, so they cannot be uploaded.",
    default = false
) {
    compatibleWith(COMPATIBILITY_QUETTA, COMPATIBILITY_QUETTA_OFFICIAL)

    dependsOn(nativeAnalyticsEndpointsPatch)

    execute {
        rewriteGroup("analytics endpoints", ANALYTICS_HOSTS)
    }
}

@Suppress("unused")
val vendorEndpointsPatch = bytecodePatch(
    name = "Strip vendor tracking endpoints",
    description = "Points the favicon proxy, start page, video sniffing and share link hosts at a " +
        "non-resolvable domain. Site icons and start page suggestions stop loading.",
    default = false
) {
    compatibleWith(COMPATIBILITY_QUETTA, COMPATIBILITY_QUETTA_OFFICIAL)

    dependsOn(nativeVendorEndpointsPatch)

    execute {
        rewriteGroup("vendor endpoints", VENDOR_HOSTS)
    }
}

@Suppress("unused")
val updatePushEndpointsPatch = bytecodePatch(
    name = "Disable update and push endpoints",
    description = "Points the component update and push registration hosts at a non-resolvable " +
        "domain. Component and ad-block list updates stop, and push notifications do not arrive.",
    default = false
) {
    compatibleWith(COMPATIBILITY_QUETTA, COMPATIBILITY_QUETTA_OFFICIAL)

    dependsOn(nativeUpdatePushEndpointsPatch)

    execute {
        rewriteGroup("update and push endpoints", UPDATE_PUSH_HOSTS)
    }
}
