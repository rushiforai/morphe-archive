package com.zeldrisho.zalo.extension;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import org.junit.Test;

public class ZaloMicroGSupportTest {
  @Test
  public void enabledProviderIsAccepted() {
    assertTrue(ZaloMicroGSupport.isProviderEnabled(packageInfo(true)));
  }

  @Test
  public void disabledProviderIsRejected() {
    assertFalse(ZaloMicroGSupport.isProviderEnabled(packageInfo(false)));
  }

  @Test
  public void missingProviderIsRejected() {
    assertFalse(ZaloMicroGSupport.isProviderEnabled(null));
  }

  private static PackageInfo packageInfo(boolean enabled) {
    PackageInfo packageInfo = new PackageInfo();
    packageInfo.applicationInfo = new ApplicationInfo();
    packageInfo.applicationInfo.enabled = enabled;
    return packageInfo;
  }
}
