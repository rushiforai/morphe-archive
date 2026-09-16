package com.zeldrisho.zalo.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;

/** Runtime checks for the optional MicroG provider used by Zalo Drive support. */
@SuppressWarnings("unused")
public final class ZaloMicroGSupport {
  private static final String GMS_CORE_PACKAGE = "app.revanced.android.gms";
  private static final String GMS_CORE_DOWNLOAD =
      "https://github.com/zeldrisho/MicroG-RE/releases/latest";

  /** Prevents instantiation of this static runtime helper. */
  private ZaloMicroGSupport() {}

  /** Returns whether a resolved provider package is present and enabled. */
  static boolean isProviderEnabled(android.content.pm.PackageInfo packageInfo) {
    return packageInfo != null
        && packageInfo.applicationInfo != null
        && packageInfo.applicationInfo.enabled;
  }

  /**
   * Shows an optional installation prompt when MicroG is unavailable.
   *
   * @return true when the provider is installed or the check failed; false when the caller should
   *     stop the current provider-dependent operation and let the user retry after installation.
   */
  public static boolean checkGmsCore(Activity activity) {
    if (activity == null) return true;

    try {
      PackageManager packageManager = activity.getPackageManager();
      android.content.pm.PackageInfo packageInfo =
          packageManager.getPackageInfo(GMS_CORE_PACKAGE, PackageManager.GET_ACTIVITIES);
      if (!isProviderEnabled(packageInfo)) {
        showInstallDialog(activity);
        return false;
      }
      return true;
    } catch (PackageManager.NameNotFoundException exception) {
      showInstallDialog(activity);
      return false;
    } catch (Throwable ignored) {
      // Never turn an optional provider check into a host-app crash.
      return true;
    }
  }

  /**
   * Gives Zalo time to persist the AccountManager result before refreshing Drive state.
   *
   * <p>The picker callback otherwise starts the first Drive request while Zalo still has its old
   * account/token state. Re-entering the backup screen works because that lifecycle boundary
   * performs the same refresh later, so mirror that boundary explicitly here.
   *
   * @param view the Zalo Drive view to refresh; {@code null} skips scheduling
   * @param accountName the selected account name; {@code null} or empty skips scheduling
   */
  public static void scheduleAccountRefresh(Object view, String accountName) {
    if (view == null || accountName == null || accountName.isEmpty()) return;

    new Handler(Looper.getMainLooper())
        .postDelayed(
            () -> {
              try {
                java.lang.reflect.Method refresh = view.getClass().getMethod("A6", String.class);
                refresh.invoke(view, accountName);
              } catch (Throwable ignored) {
                // A changed/hidden Zalo method must not crash the host app.
              }
            },
            250L);
  }

  /** Prompts the user to install MicroG before retrying the provider-dependent operation. */
  private static void showInstallDialog(Activity activity) {
    if (activity == null || activity.isFinishing()) return;

    try {
      new AlertDialog.Builder(activity)
          .setTitle("MicroG required")
          .setMessage(
              "Google Drive backup and restore requires MicroG-RE. Install it and try again, or "
                  + "cancel to continue using Zalo normally.")
          .setNegativeButton("Cancel", null)
          .setPositiveButton("Install", (dialog, which) -> openDownload(activity))
          .show();
    } catch (Throwable ignored) {
      // Dialog creation is best effort; normal app use must remain unaffected.
    }
  }

  /** Opens the configured MicroG download page when an external activity is available. */
  private static void openDownload(Activity activity) {
    try {
      activity.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(GMS_CORE_DOWNLOAD)));
    } catch (ActivityNotFoundException ignored) {
      // No browser is available; leave the user in the host app.
    } catch (Throwable ignored) {
      // A malformed/blocked external intent must not crash the host app.
    }
  }
}
