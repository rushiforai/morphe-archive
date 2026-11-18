package com.morphe.patches.zankremote

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal object LicenseCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    returnType = "V",
    filters = listOf(
        string("Cannot check license with null context.")
    )
)

internal object IsProFingerprint : Fingerprint(
    definingClass = "Lzank/remote/MyApp;",
    name = "d",
    returnType = "Z",
    filters = listOf(
        string("remote1")
    )
)

internal object AppOpenManagerShowAdFingerprint : Fingerprint(
    definingClass = "Lzank/remote/AppOpenManager;",
    name = "d",
    returnType = "Z",
    filters = listOf(
        string("OpenAdsLimit"),
        string("showAdOpen")
    )
)
