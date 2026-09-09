package com.zeldrisho.threads.extension;

import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.provider.Settings;
import android.view.Window;

/**
 * Threads-scoped port of doom-patches' {@code UniversalPatchHelper}.
 *
 * <p>Centralizes the small, app-agnostic runtime guards future Threads patches can delegate to via
 * smali hooks, instead of inlining the same smali in every patch. Only the subset relevant to
 * Threads is ported: Play Integrity bind suppression, FLAG_SECURE stripping (screenshots), and
 * mock-location guards. WebView dark-mode CSS, VPN/proxy hiding, and audio-capture helpers from the
 * upstream file are intentionally omitted — Threads has no WebView-theming patch and adding unused
 * helpers only grows the extension dex.
 *
 * <p>All methods are static, null-tolerant, and swallow nothing the caller needs to see: they
 * return safe fallbacks so a hook degrades to stock behavior rather than crashing the host.
 */
@SuppressWarnings("unused")
public final class ThreadsPatchHelper {
  /** {@code WindowManager.LayoutParams.FLAG_SECURE}; stripped so screenshots keep working. */
  private static final int FLAG_SECURE = 0x2000;

  private ThreadsPatchHelper() {}

  /**
   * Drop binds to Play Integrity / PlayCore integrity services; delegate everything else.
   *
   * @return false when the bind was suppressed, otherwise the real {@code bindService} result.
   */
  public static boolean bindService(
      Context context, Intent intent, ServiceConnection connection, int flags) {
    if (intent != null) {
      String text =
          String.valueOf(intent.getAction()).toLowerCase()
              + " "
              + String.valueOf(intent.getPackage()).toLowerCase()
              + " "
              + String.valueOf(intent).toLowerCase();
      if (text.contains("integrity") || text.contains("playcore.integrity")) {
        return false;
      }
    }
    return context.bindService(intent, connection, flags);
  }

  /** Adds window flags minus FLAG_SECURE so patched activities stay screenshottable. */
  public static void addWindowFlags(Window window, int flags) {
    if (window != null) {
      window.addFlags(flags & ~FLAG_SECURE);
    }
  }

  /** Sets window flags minus FLAG_SECURE (mask included) for the same reason. */
  public static void setWindowFlags(Window window, int flags, int mask) {
    if (window != null) {
      window.setFlags(flags & ~FLAG_SECURE, mask | FLAG_SECURE);
    }
  }

  /** Hides mock-location state from host checks; delegates for every other key. */
  public static int getSettingsSecureInt(
      android.content.ContentResolver resolver, String name, int def) {
    if ("mock_location".equals(name)) {
      return 0;
    }
    return Settings.Secure.getInt(resolver, name, def);
  }

  /** String variant of the mock-location guard above. */
  public static String getSettingsSecureString(
      android.content.ContentResolver resolver, String name) {
    if ("mock_location".equals(name)) {
      return "0";
    }
    return Settings.Secure.getString(resolver, name);
  }

  /** Pure helper: strip FLAG_SECURE from a flags int (unit-testable core of the above). */
  static int stripSecureFlag(int flags) {
    return flags & ~FLAG_SECURE;
  }
}
