package com.zeldrisho.patches

import com.zeldrisho.patches.threads.ads.FeedMergeMethod
import com.zeldrisho.patches.zalo.ads.AdtimaLatRead
import com.zeldrisho.patches.zalo.ads.CommunityAdsConfig
import com.zeldrisho.patches.zalo.ads.GoogleAdsNetworkGate
import com.zeldrisho.patches.zalo.ads.OfflineAdsGate
import com.zeldrisho.patches.zalo.ads.OfflineAdsWindow
import com.zeldrisho.patches.zalo.ads.StoryAdsConfig
import com.zeldrisho.patches.zalo.backup.BackupConfiguration
import com.zeldrisho.patches.zalo.chat.businessBoxFingerprints
import com.zeldrisho.patches.zalo.media.mediaFingerprints
import com.zeldrisho.patches.zalo.notif.StoryChannelArm
import com.zeldrisho.patches.zalo.notif.VideoChannelArm
import com.zeldrisho.patches.zalo.telemetry.telemetryFingerprints
import kotlin.test.Test
import kotlin.test.assertFalse

class FingerprintDescriptorInventoryTest {
    /** Exercises descriptor and filter access for the collected fingerprints without loading an APK. */
    @Test
    fun zaloFingerprintDefinitionsExposeNonEmptyDescriptorsAndFilters() {
        val fingerprints = mediaFingerprints + businessBoxFingerprints + telemetryFingerprints + listOf(
            FeedMergeMethod,
            OfflineAdsWindow,
            OfflineAdsGate,
            GoogleAdsNetworkGate,
            StoryAdsConfig,
            AdtimaLatRead,
            CommunityAdsConfig,
            BackupConfiguration,
            StoryChannelArm,
            VideoChannelArm,
        )
        assertFalse(fingerprints.isEmpty())
        fingerprints.forEach { fingerprint ->
            // Call-site fingerprints can intentionally omit class, name, and return metadata.
            fingerprint.definingClass
            fingerprint.name
            fingerprint.parameters
            fingerprint.returnType
            fingerprint.filters
            fingerprint.strings
        }
    }
}
