package app.zeldrisho.patches.zalo.misc

import app.morphe.patcher.patch.SupportedAbi
import app.zeldrisho.patches.shared.Constants
import kotlin.test.Test
import kotlin.test.assertEquals

class ZaloCompatibilityTest {
    @Test fun onlyAdvertisesValidatedAbiForEachTarget() {
        val targets = Constants.COMPATIBILITY_ZALO.targets.associateBy { it.version }
        assertEquals(mapOf(SupportedAbi.ARM64_V8A to Constants.TESTED_ZALO_VERSION_CODE),
            targets.getValue("26.08.01").versionCodes)
        assertEquals(mapOf(SupportedAbi.ARM64_V8A to Constants.TESTED_ZALO_VERSION_CODE_261002),
            targets.getValue("26.10.02").versionCodes)
    }
}
