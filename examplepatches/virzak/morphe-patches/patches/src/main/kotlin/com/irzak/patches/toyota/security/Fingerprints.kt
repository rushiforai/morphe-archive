package com.irzak.patches.toyota.security

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

/**
 * The constructor of the app's security verdict aggregator.
 *
 * In 3.6.0 this is `Lvs/g;-><init>`, the single class that implements the detector
 * interface `Lvs/b;` and folds the individual detectors into one verdict:
 *
 *     a()Z  "device is secure"     = BuildWrapper.p() || KeyguardManager.isDeviceSecure()
 *     b()Z  "device is compromised" = !BuildWrapper.p() && (root || emulator || tampering)
 *     c()Z  "is emulator"          = emulatorDetected
 *
 * Every consumer in the app (SplashActivity, SecurityActivity, the runtime
 * DeviceIntegrityMonitor, the dashboard and the QR scanner) reads the verdict through
 * `Lvs/b;`, and `vs/g` is its only implementer, so this class is the single choke point.
 *
 * The class and method names are all minified, so the constructor is matched by the
 * five Kotlin parameter null-check strings it emits ("buildWrapper",
 * "rootDeviceDetector", ...). Those come from the constructor's parameter names, which
 * survive obfuscation, and no other method in the app carries all five. The patch
 * resolves the defining class from this match and rewrites its a()/b() verdict methods.
 */
object SecurityVerdictConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    filters = listOf(
        string("buildWrapper"),
        string("rootDeviceDetector"),
        string("emulatorDeviceDetector"),
        string("deviceLockedDetector"),
        string("tamperingDetector"),
    ),
)
