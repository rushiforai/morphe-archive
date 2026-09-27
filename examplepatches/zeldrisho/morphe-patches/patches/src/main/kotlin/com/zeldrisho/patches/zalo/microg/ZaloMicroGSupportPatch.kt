package com.zeldrisho.patches.zalo.microg

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.zeldrisho.patches.shared.bytecode.clearBody
import com.zeldrisho.patches.shared.bytecode.ensureRegisters
import com.zeldrisho.patches.zalo.shared.Constants.COMPATIBILITY_ZALO

/** Replace account discovery/add-account with the system picker. */
internal fun replaceWithAccountPicker(method: MutableMethod) {
    method.ensureRegisters(ACCOUNT_PICKER_REGISTER_COUNT)
    method.clearBody()
    method.addInstructionsWithLabels(
        0,
        """
            const/4 v0, $ALLOWABLE_ACCOUNT_TYPE_COUNT
            new-array v3, v0, [Ljava/lang/String;
            const/4 v1, 0x0
            const/4 v2, 0x0
            const-string v4, "$MICROG_ACCOUNT_TYPE"
            aput-object v4, v3, v1
            const/4 v4, 0x0
            const/4 v5, 0x0
            const/4 v6, 0x0
            const/4 v7, 0x0
            invoke-static/range { v1 .. v7 }, Landroid/accounts/AccountManager;->newChooseAccountIntent(Landroid/accounts/Account;Ljava/util/List;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;
            move-result-object v0
            iget-object v2, p0, Lcom/zing/zalo/ui/zviews/BaseZaloView;->U0:Lcom/zing/zalo/ui/zviews/BaseZaloView;
            invoke-virtual { v2 }, Lcom/zing/zalo/zview/a0;->u4()Landroid/content/Context;
            move-result-object v2
            check-cast v2, Landroid/app/Activity;
            invoke-static { v2 }, $MICROG_EXTENSION_CLASS->checkGmsCore(Landroid/app/Activity;)Z
            move-result v1
            if-eqz v1, :microg_missing
            const/16 v1, $ACCOUNT_PICKER_REQUEST_CODE
            invoke-virtual { v2, v0, v1 }, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
            :microg_missing
            return-void
        """.trimIndent(),
    )
}

/** Dispatches compatible class members through the method transformer and totals the edits. */
internal fun rewriteMicroGClass(
    classType: String,
    methods: Iterable<Pair<Method, MutableMethod>>,
): MicroGMethodReplacementCounts {
    val replacement = when (classType) {
        "Lo9/a;" -> "com.google.android.gms" to MICROG_PACKAGE
        in accountTypeClasses -> "com.google" to MICROG_ACCOUNT_TYPE
        ZALO_LAUNCHER_CLASS -> "" to ""
        else -> return MicroGMethodReplacementCounts()
    }
    var total = MicroGMethodReplacementCounts()
    methods.forEach { (method, mutableMethod) ->
        if (method.implementation == null) return@forEach
        val count = rewriteMicroGMethod(classType, method, mutableMethod, replacement)
        total = MicroGMethodReplacementCounts(
            total.binding + count.binding,
            total.accountType + count.accountType,
            total.accountPicker + count.accountPicker,
            total.accountRefresh + count.accountRefresh,
            total.launchCheck + count.launchCheck,
        )
    }
    return total
}

/** Scans selected classes and applies all microG rewrites with final count validation. */
internal fun rewriteMicroGClasses(
    classes: Iterable<ClassDef>,
    mutableClassFor: (ClassDef) -> MutableClass,
): MicroGMethodReplacementCounts {
    var total = MicroGMethodReplacementCounts()
    classes.forEach { classDef ->
        if (classDef.type != "Lo9/a;" && classDef.type !in accountTypeClasses &&
            classDef.type != ZALO_LAUNCHER_CLASS
        ) {
            return@forEach
        }
        val mutableClass = mutableClassFor(classDef)
        val methods = classDef.methods.mapNotNull { method ->
            if (method.implementation == null) return@mapNotNull null
            val mutableMethod = mutableClass.methods.first { candidate ->
                candidate.name == method.name &&
                    candidate.parameterTypes == method.parameterTypes &&
                    candidate.returnType == method.returnType
            }
            method to mutableMethod
        }
        val count = rewriteMicroGClass(classDef.type, methods)
        total = MicroGMethodReplacementCounts(
            total.binding + count.binding,
            total.accountType + count.accountType,
            total.accountPicker + count.accountPicker,
            total.accountRefresh + count.accountRefresh,
            total.launchCheck + count.launchCheck,
        )
    }
    validateMicroGReplacementCounts(total.binding, total.accountType, total.accountPicker, total.accountRefresh, total.launchCheck)
    return total
}

/** Applies one method's applicable microG rewrites and reports their counts. */
internal fun rewriteMicroGMethod(
    classType: String,
    method: Method,
    mutableMethod: MutableMethod,
    replacement: Pair<String, String>,
): MicroGMethodReplacementCounts = rewriteMicroGMethodBody(classType, method, mutableMethod, replacement)

/**
 * Requires one binding, two pickers, one refresh, one launch check, and at least one account type.
 *
 * Throws if the totals indicate that an expected microG transformation was missed or duplicated.
 */
internal fun validateMicroGReplacementCounts(
    bindingReplacements: Int,
    accountTypeReplacements: Int,
    accountPickerReplacements: Int,
    accountRefreshReplacements: Int,
    launchChecks: Int,
) {
    check(bindingReplacements == 1) {
        "Zalo microG support: expected one o9/a service-binding replacement, found $bindingReplacements"
    }
    check(accountTypeReplacements > 0) {
        "Zalo microG support: no Drive account-type literals were found"
    }
    check(accountPickerReplacements == 2) {
        "Zalo microG support: expected two account-picker replacements, found $accountPickerReplacements"
    }
    check(accountRefreshReplacements == 1) {
        "Zalo microG support: expected one delayed account refresh, found $accountRefreshReplacements"
    }
    check(launchChecks == 1) {
        "Zalo microG support: expected one launcher provider check, found $launchChecks"
    }
}

/**
 * Redirects Zalo's Google Drive account and token plumbing to microG-RE.
 * Account selection is delegated to AccountManager so Android grants Zalo
 * visibility to the selected app.revanced account. The provider check is performed
 * immediately before the picker and is fail-open on unexpected errors.
 */
@Suppress("unused")
val zaloMicroGSupportPatch = bytecodePatch(
    name = "microG Drive support",
    description = "Adds Zalo launch/provider checks and redirects Google Drive account " +
        "selection and token binding to microG-RE (app.revanced / " +
        "app.revanced.android.gms). Initial photo restore and the complete backup/restore " +
        "cycle were device-validated on Zalo 26.08.01.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)
    extendWith("extensions/zalo.mpe")
    dependsOn(zaloMicroGManifestPatch)

    execute {
        val classes = mutableListOf<ClassDef>()
        classDefForEach(classes::add)
        rewriteMicroGClasses(classes) { classDef -> mutableClassDefBy(classDef) }
    }
}
