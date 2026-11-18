package app.zeldrisho.zalo.extension;

import android.content.Context;

/**
 * Applies a patch-generated theme overlay that overrides Zalo's brand theme attributes.
 * Only the preset styles written by the patch are used; unknown values fall back to the native theme.
 */
public final class AccentColor {
  static final String PREFS = "zeldris_patch_settings";
  static final String KEY = "accent_color";

  /** Preset colors, in the same order as the generated overlay styles. */
  private static final String[] PRESETS = {"Blue", "Purple", "Green", "Red", "Orange"};
  private static final int[] COLORS = {
      0xff0068ff, 0xff6941c6, 0xff067647, 0xffb42318, 0xffb54708,
  };

  private AccentColor() {}

  public static void applyLight(Context context) {
    apply(context, "Light");
  }

  public static void applyDark(Context context) {
    apply(context, "Dark");
  }

  private static void apply(Context context, String mode) {
    if (context == null) return;
    try {
      int selected = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).getInt(KEY, 0);
      String preset = null;
      for (int i = 0; i < COLORS.length; i++) {
        if (COLORS[i] == selected) {
          preset = PRESETS[i];
          break;
        }
      }
      if (preset == null) return;
      int style = context.getResources()
          .getIdentifier("ZeldrisAccent" + preset + mode, "style", context.getPackageName());
      if (style == 0) return;
      // The native setTheme call already ran; the overlay only replaces brand attributes.
      context.getTheme().applyStyle(style, true);
    } catch (RuntimeException ignored) {
      // A missing style or theme must leave Zalo's native colors untouched.
    }
  }
}
