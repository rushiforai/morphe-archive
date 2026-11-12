package app.zeldrisho.patches.zalo.misc

import app.zeldrisho.patches.zalo.native.nonArm64NativeEntries
import kotlin.test.Test
import kotlin.test.assertEquals

class NativeAbiTest {
    @Test fun removesOnlyNonArm64LibraryEntries() {
        val entries = listOf(
            "lib/", "lib/arm64-v8a/", "lib/arm64-v8a/libnative_utils.so", "lib/arm64-v8a/libother.so",
            "lib/armeabi-v7a/", "lib/armeabi-v7a/libnative_utils.so",
            "lib/x86/libtest.so", "lib/x86_64/libtest.so", "assets/file",
        )
        assertEquals(entries.subList(4, 8), nonArm64NativeEntries(entries))
    }
}
