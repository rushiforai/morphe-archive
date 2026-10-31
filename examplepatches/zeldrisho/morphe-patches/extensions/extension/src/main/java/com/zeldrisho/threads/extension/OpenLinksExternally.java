package com.zeldrisho.threads.extension;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;

/** Opens valid web URLs through Android's normal external activity resolution. */
public final class OpenLinksExternally {
  /** Prevents instantiation of this static link handler. */
  private OpenLinksExternally() {}

  /** Accepts URI hosts or validates Unicode reg-names with IDN rules. */
  private static boolean hasValidHost(java.net.URI uri) {
    int uriPort = uri.getPort();
    if (uriPort < -1 || uriPort > 65535) return false;

    String host = uri.getHost();
    if (host != null) return !host.isEmpty();

    String authority = uri.getRawAuthority();
    if (authority == null || authority.isEmpty() || authority.indexOf('@') >= 0) return false;
    String idnHost = authority;
    int colon = authority.lastIndexOf(':');
    if (colon >= 0) {
      if (authority.indexOf(':') != colon) return false;
      String port = authority.substring(colon + 1);
      if (port.isEmpty()) return false;
      for (int index = 0; index < port.length(); index++) {
        char digit = port.charAt(index);
        if (digit < '0' || digit > '9') return false;
      }
      try {
        int portNumber = Integer.parseInt(port);
        if (portNumber < 0 || portNumber > 65535) return false;
      } catch (NumberFormatException ignored) {
        return false;
      }
      idnHost = authority.substring(0, colon);
    }
    try {
      return !java.net.IDN.toASCII(idnHost, java.net.IDN.USE_STD3_ASCII_RULES).isEmpty();
    } catch (IllegalArgumentException ignored) {
      return false;
    }
  }

  /** Returns true only when an external activity was successfully launched. */
  public static boolean open(Context context, String rawUrl) {
    if (context == null || rawUrl == null) return false;
    try {
      java.net.URI validated = new java.net.URI(rawUrl.trim());
      String validatedScheme = validated.getScheme();
      if (validatedScheme == null
          || !(validatedScheme.equalsIgnoreCase("http")
              || validatedScheme.equalsIgnoreCase("https"))
          || !hasValidHost(validated)) {
        return false;
      }
      Uri uri = Uri.parse(rawUrl.trim());
      String scheme = uri.getScheme();
      if (scheme == null
          || !(scheme.equalsIgnoreCase("http") || scheme.equalsIgnoreCase("https"))
          || uri.getHost() == null
          || uri.getHost().isEmpty()) {
        return false;
      }
      Intent intent = new Intent(Intent.ACTION_VIEW, uri);
      android.content.ComponentName resolved = intent.resolveActivity(context.getPackageManager());
      if (resolved != null && context.getPackageName().equals(resolved.getPackageName()))
        return false;
      if (!(context instanceof android.app.Activity)) {
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
      }
      context.startActivity(intent);
      return true;
    } catch (java.net.URISyntaxException ignored) {
      return false;
    } catch (ActivityNotFoundException | SecurityException ignored) {
      return false;
    } catch (RuntimeException ignored) {
      // Malformed URLs or host-context failures should retain Threads' own handler.
      return false;
    }
  }
}
