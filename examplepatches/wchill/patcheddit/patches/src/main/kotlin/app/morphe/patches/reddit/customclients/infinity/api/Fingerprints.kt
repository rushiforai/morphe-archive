/*
 * Copyright 2026 wchill.
 * https://github.com/wchill/patcheddit
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.morphe.patches.reddit.customclients.infinity.api

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall

internal object GetDefaultUserAgentFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS_NAME,
    name = "getDefaultUserAgent"
)

internal object GetDefaultRedirectUriFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS_NAME,
    name = "getDefaultRedirectUri"
)

internal object GetDefaultClientIdFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS_NAME,
    name = "getDefaultClientId"
)

internal object ClientIdFingerprint : Fingerprint(
    filters = listOf(
        methodCall(
            definingClass = "Lml/docilealligator/infinityforreddit/utils/APIUtils;",
            name = "getId",
            parameters = emptyList(),
            returnType = "Ljava/lang/String;"
        )
    )
)

internal fun userAgentFingerprint(versionName: String, prefix: String) = Fingerprint(
    strings = listOf("${prefix}ml.docilealligator.infinityforreddit:$versionName (by /u/Hostilenemy)"),
    custom = { _, classDef -> !classDef.type.startsWith("Lapp/morphe/") }
)

internal object RedirectUriFingerprint : Fingerprint(
    strings = listOf("infinity://localhost"),
    custom = { _, classDef -> !classDef.type.startsWith("Lapp/morphe/") }
)

internal object BillingClientOnServiceConnectedFingerprint : Fingerprint(
    name = "onServiceConnected",
    returnType = "V",
    parameters = listOf("Landroid/content/ComponentName;", "Landroid/os/IBinder;"),
    strings = listOf("Billing service connected.")
)

internal object InfinityStartSubscriptionActivityFingerprint : Fingerprint(
    definingClass = "Lml/docilealligator/infinityforreddit/Infinity;",
    returnType = "V",
    strings = listOf("account_name"),
    filters = listOf(literal(0x10008000))
)
