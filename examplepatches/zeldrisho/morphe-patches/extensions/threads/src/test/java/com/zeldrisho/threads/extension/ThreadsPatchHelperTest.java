package com.zeldrisho.threads.extension;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

/** Unit tests for the pure, device-independent core of {@link ThreadsPatchHelper}. */
public class ThreadsPatchHelperTest {
  @Test
  public void stripSecureFlag_removesFlagSecureOnly() {
    assertEquals(0x100, ThreadsPatchHelper.stripSecureFlag(0x100 | 0x2000));
    assertEquals(0x100, ThreadsPatchHelper.stripSecureFlag(0x100));
    assertEquals(0, ThreadsPatchHelper.stripSecureFlag(0x2000));
  }
}
