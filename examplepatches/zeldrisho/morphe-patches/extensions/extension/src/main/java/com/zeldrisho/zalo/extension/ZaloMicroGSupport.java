package com.zeldrisho.zalo.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;

/** Runtime checks for the optional MicroG provider used by Zalo Drive support. */
@SuppressWarnings("unused")
public final class ZaloMicroGSupport {
  private static final String GMS_CORE_PACKAGE = "app.revanced.android.gms";
  private static final String GMS_CORE_DOWNLOAD = "https://morphe.software/microg";
  private static final long ACCOUNT_REFRESH_DELAY_MS = 250L;
  private static volatile Handler mainHandler;
  private static final Object REFRESH_LOCK = new Object();
  private static final Map<Object, RefreshRequest> PENDING_REFRESHES = new WeakHashMap<>();

  interface ProviderResolver {
    android.content.pm.PackageInfo resolve() throws PackageManager.NameNotFoundException;
  }

  interface InstallPrompt {
    void show(Activity activity, Runnable install, Runnable cancel);
  }

  interface RefreshScheduler {
    void schedule(Runnable request, long delayMillis);

    void cancel(Runnable request);
  }

  private ZaloMicroGSupport() {}

  static boolean isProviderEnabled(android.content.pm.PackageInfo packageInfo) {
    return packageInfo != null
        && packageInfo.applicationInfo != null
        && packageInfo.applicationInfo.enabled;
  }

  /**
   * Checks the optional provider and prompts when it is missing or disabled.
   *
   * @return {@code false} when the provider is unavailable so the current operation can stop;
   *     {@code true} when the provider is enabled, the activity is null, or the check fails
   *     unexpectedly
   */
  public static boolean checkGmsCore(Activity activity) {
    if (activity == null) return true;
    return checkGmsCore(
        activity,
        () ->
            activity
                .getPackageManager()
                .getPackageInfo(GMS_CORE_PACKAGE, PackageManager.GET_ACTIVITIES),
        ZaloMicroGSupport::showInstallDialog);
  }

  /** Performs the provider check through the supplied resolver and prompt callbacks. */
  static boolean checkGmsCore(Activity activity, ProviderResolver resolver, InstallPrompt prompt) {
    if (activity == null) return true;
    try {
      if (!isProviderEnabled(resolver.resolve())) {
        prompt.show(activity, () -> openDownload(activity), () -> {});
        return false;
      }
      return true;
    } catch (PackageManager.NameNotFoundException exception) {
      prompt.show(activity, () -> openDownload(activity), () -> {});
      return false;
    } catch (RuntimeException ignored) {
      // Never turn an optional provider check into a host-app crash.
      return true;
    }
  }

  /**
   * Schedules a delayed Drive refresh for the selected account. Invalid arguments are ignored, and
   * a newer selection for the same view cancels its pending refresh.
   *
   * @param view the Zalo Drive view to refresh
   * @param accountName the selected account name
   */
  public static void scheduleAccountRefresh(Object view, String accountName) {
    if (view == null || accountName == null || accountName.isEmpty()) return;
    scheduleAccountRefresh(view, accountName, new HandlerScheduler(handler()));
  }

  /** Schedules through {@code scheduler}, replacing any pending refresh for the same view. */
  static void scheduleAccountRefresh(Object view, String accountName, RefreshScheduler scheduler) {
    if (view == null || accountName == null || accountName.isEmpty()) return;
    RefreshRequest request = new RefreshRequest(view, accountName);
    synchronized (REFRESH_LOCK) {
      RefreshRequest previous = PENDING_REFRESHES.put(view, request);
      if (previous != null) scheduler.cancel(previous);
    }
    scheduler.schedule(request, ACCOUNT_REFRESH_DELAY_MS);
  }

  private static Handler handler() {
    Handler result = mainHandler;
    if (result == null) {
      synchronized (REFRESH_LOCK) {
        result = mainHandler;
        if (result == null) {
          result = new Handler(Looper.getMainLooper());
          mainHandler = result;
        }
      }
    }
    return result;
  }

  private static final class HandlerScheduler implements RefreshScheduler {
    private final Handler handler;

    HandlerScheduler(Handler handler) {
      this.handler = handler;
    }

    @Override
    public void schedule(Runnable request, long delayMillis) {
      handler.postDelayed(request, delayMillis);
    }

    @Override
    public void cancel(Runnable request) {
      handler.removeCallbacks(request);
    }
  }

  /** A coalesced refresh that does not retain the host view past its lifecycle. */
  private static final class RefreshRequest implements Runnable {
    private final WeakReference<Object> view;
    private final String accountName;

    RefreshRequest(Object view, String accountName) {
      this.view = new WeakReference<>(view);
      this.accountName = accountName;
    }

    @Override
    public void run() {
      Object target = view.get();
      try {
        if (target != null) {
          synchronized (REFRESH_LOCK) {
            if (PENDING_REFRESHES.get(target) != this) return;
            java.lang.reflect.Method refresh = target.getClass().getMethod("A6", String.class);
            refresh.invoke(target, accountName);
          }
        }
      } catch (ReflectiveOperationException | RuntimeException ignored) {
        // A changed/hidden Zalo method must not crash the host app.
      } finally {
        synchronized (REFRESH_LOCK) {
          if (PENDING_REFRESHES.get(target) == this) PENDING_REFRESHES.remove(target);
        }
      }
    }
  }

  static boolean canShowInstallDialog(Activity activity) {
    return activity != null && canShowInstallDialog(activity.isFinishing(), activity.isDestroyed());
  }

  static boolean canShowInstallDialog(boolean finishing, boolean destroyed) {
    return !finishing && !destroyed;
  }

  /** Shows the install prompt on a usable activity and dispatches the selected callback. */
  private static void showInstallDialog(Activity activity, Runnable install, Runnable cancel) {
    if (!canShowInstallDialog(activity)) return;
    try {
      new AlertDialog.Builder(activity)
          .setTitle("MicroG required")
          .setMessage(
              "Google Drive backup and restore requires MicroG-RE. Install it and try again, or "
                  + "cancel to continue using Zalo normally.")
          .setNegativeButton("Cancel", (dialog, which) -> cancel.run())
          .setPositiveButton("Install", (dialog, which) -> install.run())
          .show();
    } catch (RuntimeException ignored) {
      // Dialog creation is best effort; normal app use must remain unaffected.
    }
  }

  /**
   * Opens the configured download page without failing the host app when no browser is available.
   */
  private static void openDownload(Activity activity) {
    try {
      activity.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(GMS_CORE_DOWNLOAD)));
    } catch (ActivityNotFoundException ignored) {
      // No browser is available; leave the user in the host app.
    } catch (RuntimeException ignored) {
      // A malformed/blocked external intent must not crash the host app.
    }
  }
}
