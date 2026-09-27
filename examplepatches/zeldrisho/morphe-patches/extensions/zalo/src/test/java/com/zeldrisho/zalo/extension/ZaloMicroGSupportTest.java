package com.zeldrisho.zalo.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Handler;
import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.List;
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

  @Test
  public void providerWithoutApplicationInfoIsRejected() {
    assertFalse(ZaloMicroGSupport.isProviderEnabled(new PackageInfo()));
  }

  @Test
  public void invalidRefreshRequestsAreIgnoredWithoutTouchingTheMainLooper() {
    ZaloMicroGSupport.scheduleAccountRefresh(null, "account@example.com");
    ZaloMicroGSupport.scheduleAccountRefresh(new Object(), null);
    ZaloMicroGSupport.scheduleAccountRefresh(new Object(), "");
  }

  /** Verifies that delayed refresh tolerates a missing target method or null target. */
  @Test
  public void delayedRefreshIgnoresMissingOrChangedTargetMethods() throws Exception {
    RecordingScheduler scheduler = new RecordingScheduler();
    ZaloMicroGSupport.scheduleAccountRefresh(new Object(), "account@example.com", scheduler);
    scheduler.scheduled.get(0).run();

    Constructor<?> constructor = refreshRequestConstructor();
    Runnable nullTarget = (Runnable) constructor.newInstance(null, "account@example.com");
    nullTarget.run();
  }

  /** Verifies that exceptions from the reflective refresh target do not escape the callback. */
  @Test
  public void delayedRefreshContainsTargetExceptions() throws Exception {
    RecordingScheduler scheduler = new RecordingScheduler();
    ZaloMicroGSupport.scheduleAccountRefresh(
        new FailingRefreshTarget(), "account@example.com", scheduler);
    scheduler.scheduled.get(0).run();
  }

  /** Verifies fail-open behavior for null and unattached activities. */
  @Test
  public void publicProviderCheckAllowsNullAndContainsUnattachedActivityFailure() {
    assertTrue(ZaloMicroGSupport.checkGmsCore(null));
    assertTrue(ZaloMicroGSupport.checkGmsCore(new Activity()));
  }

  /** Verifies that an enabled provider returned by the resolver passes the check. */
  @Test
  public void providerResolverAcceptsEnabledProvider() {
    assertTrue(
        ZaloMicroGSupport.checkGmsCore(
            new Activity(), () -> packageInfo(true), (activity, install, cancel) -> {}));
  }

  @Test
  public void packageManagerFailuresFailOpen() {
    boolean result =
        ZaloMicroGSupport.checkGmsCore(
            new Activity(),
            () -> {
              throw new IllegalStateException("package manager unavailable");
            },
            (activity, install, cancel) -> {
              throw new AssertionError("prompt must not be shown");
            });
    assertTrue(result);
  }

  /** Exercises install and cancel callbacks when the resolver returns no package information. */
  @Test
  public void nullProviderPromptAndDownloadFallbackAreHandled() {
    Activity activity = new Activity();
    boolean result =
        ZaloMicroGSupport.checkGmsCore(
            activity,
            () -> null,
            (current, install, cancel) -> {
              install.run();
              cancel.run();
            });
    assertFalse(result);
  }

  /** Verifies that prompt callbacks tolerate a missing provider on an unattached activity. */
  @Test
  public void providerPromptInstallAndCancelCallbacksAreSafe() {
    Activity activity = new Activity();
    boolean result =
        ZaloMicroGSupport.checkGmsCore(
            activity,
            () -> {
              throw new PackageManager.NameNotFoundException();
            },
            (current, install, cancel) -> {
              install.run();
              cancel.run();
            });
    assertFalse(result);
  }

  @Test
  public void missingProviderPromptsAndCancellationDoesNotInstall() {
    List<String> actions = new ArrayList<>();
    boolean result =
        ZaloMicroGSupport.checkGmsCore(
            new Activity(),
            () -> {
              throw new PackageManager.NameNotFoundException();
            },
            (activity, install, cancel) -> {
              actions.add("prompt");
              cancel.run();
            });
    assertFalse(result);
    assertEquals(List.of("prompt"), actions);
  }

  @Test
  public void finishingOrDestroyedActivitiesDoNotReceiveInstallDialogs() {
    assertFalse(ZaloMicroGSupport.canShowInstallDialog(true, false));
    assertFalse(ZaloMicroGSupport.canShowInstallDialog(false, true));
  }

  /**
   * Exercises cancellation with a null handler and checks the cause if reflection propagates it.
   */
  @Test
  public void handlerSchedulerContainsAHandlerFailure() throws Exception {
    Class<?> schedulerClass =
        Class.forName("com.zeldrisho.zalo.extension.ZaloMicroGSupport$HandlerScheduler");
    Constructor<?> constructor = schedulerClass.getDeclaredConstructor(Handler.class);
    constructor.setAccessible(true);
    Object scheduler = constructor.newInstance(new Object[] {null});
    java.lang.reflect.Method cancel = schedulerClass.getDeclaredMethod("cancel", Runnable.class);
    cancel.setAccessible(true);
    try {
      cancel.invoke(scheduler, (Runnable) () -> {});
    } catch (java.lang.reflect.InvocationTargetException expected) {
      assertTrue(expected.getCause() instanceof RuntimeException);
    }
  }

  /** Verifies that dialog creation failure is contained after activity lifecycle checks pass. */
  @Test
  public void dialogCreationFailureIsContainedAfterLifecycleCheck() throws Exception {
    Activity usable =
        new Activity() {
          /** Keeps the test activity eligible for the dialog creation failure path. */
          @Override
          public boolean isFinishing() {
            return false;
          }

          /** Keeps the test activity eligible for the dialog creation failure path. */
          @Override
          public boolean isDestroyed() {
            return false;
          }
        };
    java.lang.reflect.Method method =
        ZaloMicroGSupport.class.getDeclaredMethod(
            "showInstallDialog", Activity.class, Runnable.class, Runnable.class);
    method.setAccessible(true);
    method.invoke(null, usable, (Runnable) () -> {}, (Runnable) () -> {});
  }

  @Test
  public void unavailableBrowserIsContained() throws Exception {
    java.lang.reflect.Method method =
        ZaloMicroGSupport.class.getDeclaredMethod("openDownload", Activity.class);
    method.setAccessible(true);
    method.invoke(null, new NoBrowserActivity());
  }

  @Test
  public void repeatedSelectionCancelsTheOlderRefresh() {
    RecordingScheduler scheduler = new RecordingScheduler();
    Object target = new Object();
    ZaloMicroGSupport.scheduleAccountRefresh(target, "first@example.com", scheduler);
    ZaloMicroGSupport.scheduleAccountRefresh(target, "second@example.com", scheduler);
    assertEquals(2, scheduler.scheduled.size());
    assertEquals(1, scheduler.cancelled.size());
    assertNotSame(scheduler.cancelled.get(0), scheduler.scheduled.get(1));
  }

  @Test
  public void cancelledCallbackDoesNotRefreshThePreviousAccount() {
    RecordingScheduler scheduler = new RecordingScheduler();
    RefreshTarget target = new RefreshTarget();
    ZaloMicroGSupport.scheduleAccountRefresh(target, "first@example.com", scheduler);
    ZaloMicroGSupport.scheduleAccountRefresh(target, "second@example.com", scheduler);

    scheduler.scheduled.get(0).run();

    assertEquals(0, target.refreshCount);
    scheduler.scheduled.get(1).run();
    assertEquals(1, target.refreshCount);
  }

  private static Constructor<?> refreshRequestConstructor() throws Exception {
    Class<?> requestClass =
        Class.forName("com.zeldrisho.zalo.extension.ZaloMicroGSupport$RefreshRequest");
    Constructor<?> constructor = requestClass.getDeclaredConstructor(Object.class, String.class);
    constructor.setAccessible(true);
    return constructor;
  }

  private static final class FailingRefreshTarget {
    @SuppressWarnings("unused")
    public void A6(String accountName) {
      throw new IllegalStateException("simulated stale lifecycle target");
    }
  }

  public static final class RefreshTarget {
    int refreshCount;

    @SuppressWarnings("unused")
    public void A6(String accountName) {
      refreshCount++;
    }
  }

  private static final class NoBrowserActivity extends Activity {
    @Override
    public void startActivity(Intent intent) {
      throw new ActivityNotFoundException();
    }
  }

  private static final class RecordingScheduler implements ZaloMicroGSupport.RefreshScheduler {
    final List<Runnable> scheduled = new ArrayList<>();
    final List<Runnable> cancelled = new ArrayList<>();

    @Override
    public void schedule(Runnable request, long delayMillis) {
      scheduled.add(request);
      assertEquals(250L, delayMillis);
    }

    @Override
    public void cancel(Runnable request) {
      cancelled.add(request);
    }
  }

  private static PackageInfo packageInfo(boolean enabled) {
    PackageInfo packageInfo = new PackageInfo();
    packageInfo.applicationInfo = new ApplicationInfo();
    packageInfo.applicationInfo.enabled = enabled;
    return packageInfo;
  }
}
