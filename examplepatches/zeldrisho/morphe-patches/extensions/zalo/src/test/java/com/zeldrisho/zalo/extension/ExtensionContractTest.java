package com.zeldrisho.zalo.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import org.junit.Test;

/** ABI contracts used by the injected Zalo invoke-static calls. */
public class ExtensionContractTest {
  @Test
  public void providerCheckHasExactInjectedAbi() throws Exception {
    Method method = ZaloMicroGSupport.class.getDeclaredMethod("checkGmsCore", Activity.class);
    assertTrue(Modifier.isPublic(method.getModifiers()));
    assertTrue(Modifier.isStatic(method.getModifiers()));
    assertEquals(boolean.class, method.getReturnType());
  }

  @Test
  public void refreshHookHasExactInjectedAbi() throws Exception {
    Method method =
        ZaloMicroGSupport.class.getDeclaredMethod(
            "scheduleAccountRefresh", Object.class, String.class);
    assertTrue(Modifier.isPublic(method.getModifiers()));
    assertTrue(Modifier.isStatic(method.getModifiers()));
    assertEquals(void.class, method.getReturnType());
  }
}
