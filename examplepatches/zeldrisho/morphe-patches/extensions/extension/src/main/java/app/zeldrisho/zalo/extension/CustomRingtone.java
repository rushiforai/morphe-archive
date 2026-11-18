package app.zeldrisho.zalo.extension;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.UriPermission;
import android.net.Uri;

/** A persisted document URI used only for incoming-call ringtone selection. */
public final class CustomRingtone {
  static final String PREFS = "zeldris_patch_settings";
  static final String KEY = "custom_call_ringtone";

  private CustomRingtone() {}

  /** Resolve a ringtone when an obfuscated host field contains a Context. */
  public static String resolveObject(Object context, String nativeRingtone) {
    return context instanceof Context ? resolve((Context) context, nativeRingtone) : nativeRingtone;
  }

  static boolean hasPersistedReadGrant(Context context, Uri uri) {
    if (context == null || uri == null) return false;
    for (UriPermission permission : context.getContentResolver().getPersistedUriPermissions()) {
      if (permission.isReadPermission() && uri.equals(permission.getUri())) return true;
    }
    return false;
  }

  static void releaseReadGrant(Context context, Uri uri) {
    if (context == null || uri == null) return;
    try {
      context.getContentResolver().releasePersistableUriPermission(uri, Intent.FLAG_GRANT_READ_URI_PERMISSION);
    } catch (SecurityException ignored) {
      // The provider may have revoked the grant already.
    }
  }

  static boolean reset(Context context) {
    if (context == null) return false;
    SharedPreferences preferences = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    String selected = preferences.getString(KEY, null);
    if (!preferences.edit().remove(KEY).commit()) return false;
    if (selected != null) releaseReadGrant(context, Uri.parse(selected));
    return true;
  }

  /** Retain the host ringtone if no readable persisted grant is available. */
  public static String resolve(Context context, String nativeRingtone) {
    if (context == null || nativeRingtone == null || nativeRingtone.isEmpty()) return nativeRingtone;
    try {
      String selected = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).getString(KEY, null);
      if (selected == null) return nativeRingtone;
      Uri uri = Uri.parse(selected);
      if (hasPersistedReadGrant(context, uri)) return selected;
    } catch (RuntimeException ignored) {
      // A stale grant or preference must not prevent the host from ringing.
    }
    return nativeRingtone;
  }
}
