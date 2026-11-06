package app.whythishome.patches.shealth

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/** Samsung Health 7.00.6.011 My Page manufacturer gate. */
object HealthSharingIsSamsungDeviceFingerprint : Fingerprint(
    definingClass = "Lls10;",
    name = "h",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
)
