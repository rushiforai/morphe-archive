package com.zeldrisho.patches.zalo.microg

import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val MICROG_ACCOUNT_TYPE = "app.revanced"
internal const val MICROG_PACKAGE = "app.revanced.android.gms"
internal const val ACCOUNT_PICKER_REQUEST_CODE = 0x3eb
internal const val ALLOWABLE_ACCOUNT_TYPE_COUNT = 1
internal const val ACCOUNT_PICKER_REGISTER_COUNT = 8
internal const val ACCOUNT_REFRESH_ARGUMENT_COUNT = 2
internal const val MAX_FOUR_BIT_REGISTER = 15
internal const val ON_CREATE_PARAMETER_COUNT = 2
internal const val MICROG_EXTENSION_CLASS =
    "Lcom/zeldrisho/zalo/extension/ZaloMicroGSupport;"
internal const val ZALO_LAUNCHER_CLASS = "Lcom/zing/zalo/ui/ZaloLauncherActivity;"
internal const val SYNC_GOOGLE_ACCOUNT_BASE_VIEW =
    "Lcom/zing/zalo/ui/backuprestore/drive/SyncGoogleAccountBaseView;"

/** Requires one local register beyond onCreate(Bundle)'s p0 and p1 parameters. */
internal fun requireProviderCheckScratch(registerCount: Int) {
    check(registerCount > ON_CREATE_PARAMETER_COUNT) {
        "Zalo launcher onCreate has no scratch local for provider check"
    }
}

/** Returns whether [methodReference] names Zalo's account-refresh call in the Drive result handler. */
internal fun isAccountRefreshCall(
    classType: String,
    methodName: String,
    methodReference: MethodReference?,
): Boolean {
    if (classType != SYNC_GOOGLE_ACCOUNT_BASE_VIEW || methodName != "onActivityResult") return false
    return methodReference?.let {
        it.name == "A6" && it.parameterTypes == listOf("Ljava/lang/String;")
    } ?: false
}

/** Preserves the source invoke encoding, including high-register range invokes. */
internal fun accountRefreshInvocation(instruction: Any): String = when (instruction) {
    is FiveRegisterInstruction -> {
        check(instruction.registerCount == ACCOUNT_REFRESH_ARGUMENT_COUNT)
        check(instruction.registerC <= MAX_FOUR_BIT_REGISTER && instruction.registerD <= MAX_FOUR_BIT_REGISTER) {
            "Zalo microG support: non-range invoke uses a register above v15"
        }
        "invoke-static { v${instruction.registerC}, v${instruction.registerD} }, " +
            "$MICROG_EXTENSION_CLASS->scheduleAccountRefresh(Ljava/lang/Object;Ljava/lang/String;)V"
    }

    is RegisterRangeInstruction -> {
        check(instruction.registerCount == ACCOUNT_REFRESH_ARGUMENT_COUNT)
        "invoke-static/range { v${instruction.startRegister} .. v${instruction.startRegister + 1} }, " +
            "$MICROG_EXTENSION_CLASS->scheduleAccountRefresh(Ljava/lang/Object;Ljava/lang/String;)V"
    }

    else -> error("Zalo microG support: unsupported A6 invoke format")
}

internal const val STOCK_VNG_CERT_HEX =
    "3082019d30820106a00302010202044f178971300d06092a864886f70d010105050030133111300f060355040313087a" +
        "696e6774616c6b301e170d3132303131393033303933375a170d3337303131323033303933375a30133111300f060355" +
        "040313087a696e6774616c6b30819f300d06092a864886f70d010101050003818d0030818902818100d8dc86eeaccd8d" +
        "7fe722391a3a1ae034082b24af0ca63244d2ff12cc9fda4d6a9c1bdff5c587c648ac3e99e54852ca52cee01203cb99f5" +
        "94593ab1e023bcd8a6be9b1e056c3de73631c56f85f5ed8576e850f67ddbca000b5338481df238a0d27c293b9e28b69a" +
        "ce24c9c9263063223832094c85201001b7be7f2107a452835f0203010001300d06092a864886f70d0101050500038181" +
        "00aebd8af27fc3178b6082d1db7a5f66aad1db55c823145c5dd21fe721e229f90b7702738654432b5c5e8667f4995e9d" +
        "206adb7d26c3db70f2c971638d44b762416df5d510a08526ed91fdd1c1e8e6751d8832ec32154c11680e647e605c0e86" +
        "12702c70524324a611424c69c4d3e43a2756551eec5f4e4de966331194c74484a1"

internal val accountTypeClasses = setOf(
    "Lcom/zing/zalo/ui/backuprestore/drive/SyncGoogleAccountBaseView;",
    "Lcom/zing/zalo/ui/backuprestore/drive/ManageGoogleAccountView;",
    "Lcom/zing/zalo/ui/backuprestore/drive/SyncGoogleAccountMediaRestoreView;",
    "Lul/g;",
    "Ln71/d0;",
)
