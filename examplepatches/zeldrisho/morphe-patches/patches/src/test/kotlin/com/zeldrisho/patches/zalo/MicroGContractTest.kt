package com.zeldrisho.patches.zalo

import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.zeldrisho.patches.zalo.microg.SYNC_GOOGLE_ACCOUNT_BASE_VIEW
import com.zeldrisho.patches.zalo.microg.accountTypeClasses
import com.zeldrisho.patches.zalo.microg.isAccountRefreshCall
import com.zeldrisho.patches.zalo.microg.validateMicroGReplacementCounts
import kotlin.test.Test
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class MicroGContractTest {
    /** Checks refresh-call recognition and rejection of mismatched owners, methods, and parameters. */
    @Test
    fun accountRefreshRecognitionRequiresExpectedOwnerMethodAndSignature() {
        val expected = ImmutableMethodReference(
            SYNC_GOOGLE_ACCOUNT_BASE_VIEW,
            "A6",
            listOf("Ljava/lang/String;"),
            "V",
        )
        assertTrue(isAccountRefreshCall(SYNC_GOOGLE_ACCOUNT_BASE_VIEW, "onActivityResult", expected))
        assertFalse(isAccountRefreshCall("Lother/View;", "onActivityResult", expected))
        assertFalse(isAccountRefreshCall(SYNC_GOOGLE_ACCOUNT_BASE_VIEW, "other", expected))
        assertFalse(
            isAccountRefreshCall(
                SYNC_GOOGLE_ACCOUNT_BASE_VIEW,
                "onActivityResult",
                ImmutableMethodReference(SYNC_GOOGLE_ACCOUNT_BASE_VIEW, "A6", emptyList(), "V"),
            ),
        )
        assertFalse(isAccountRefreshCall(SYNC_GOOGLE_ACCOUNT_BASE_VIEW, "onActivityResult", null))
    }

    /** Checks valid microG totals and rejection when any required replacement count is too low. */
    @Test
    fun replacementSummaryAcceptsExpectedCountsAndRejectsMissingTargets() {
        validateMicroGReplacementCounts(1, 1, 2, 1, 1)
        assertFailsWith<IllegalStateException> { validateMicroGReplacementCounts(0, 1, 2, 1, 1) }
        assertFailsWith<IllegalStateException> { validateMicroGReplacementCounts(1, 0, 2, 1, 1) }
        assertFailsWith<IllegalStateException> { validateMicroGReplacementCounts(1, 1, 1, 1, 1) }
        assertFailsWith<IllegalStateException> { validateMicroGReplacementCounts(1, 1, 2, 0, 1) }
        assertFailsWith<IllegalStateException> { validateMicroGReplacementCounts(1, 1, 2, 1, 0) }
    }

    /** Checks that the account-type allowlist includes the known Drive account and restore flows. */
    @Test
    fun accountTypeClassAllowlistContainsAllDriveFlows() {
        assertTrue(accountTypeClasses.contains(SYNC_GOOGLE_ACCOUNT_BASE_VIEW))
        assertTrue(accountTypeClasses.contains("Lcom/zing/zalo/ui/backuprestore/drive/ManageGoogleAccountView;"))
        assertTrue(accountTypeClasses.contains("Lcom/zing/zalo/ui/backuprestore/drive/SyncGoogleAccountMediaRestoreView;"))
        assertTrue(accountTypeClasses.contains("Lul/g;"))
        assertTrue(accountTypeClasses.contains("Ln71/d0;"))
    }
}
