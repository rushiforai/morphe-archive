package app.zeldrisho.zalo.extension;

import android.content.Context;
import android.content.res.Configuration;
import android.view.View;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/** Pure black surfaces in Zalo's dark theme; light mode is untouched. */
public final class AmoledTheme {
  private static final Set<String> SURFACES = new HashSet<>(Arrays.asList(
      "PrimaryBackgroundColor", "SecondaryBackgroundColor", "BottomNav", "TabBackgroundColor",
      "ChatBarBackgroundColor", "FooterBackgroundColor", "ProfilePrimaryBackgroundColor",
      "ProfileSecondaryBackgroundColor", "TimelinePrimaryBackgroundColor",
      "TimelineSecondaryBackgroundColor", "PopupBackgroundColor", "list_item_background",
      "HeaderStartColor", "HeaderEndColor", "ProfileBackgroundColor", "ProfileUserInfoBackgroundColor",
      "ProfileSectionPhotoPrimaryBackgroundColor", "StoryPrimaryBackgroundColor", "SearchBackgroundColor",
      "GalleryPickerViewBackgroundColor", "ChatFooterBackgroundNormal",
      "social_timeline_background_color_content_centric", "header_blue_container", "header_white_container",
      "layer_background", "bgCSC_Background", "CSCPrimaryBackground"));
  private static volatile Method themeMode;

  private AmoledTheme() {}

  /** Applied after Zalo installs its dark theme, so XML inflation sees the same black surfaces. */
  public static void applyDarkOverlay(Context context) {
    if (!isDark(context)) return;
    try {
      int style = context.getResources().getIdentifier("ZeldrisAmoledOverlay", "style", context.getPackageName());
      if (style != 0) context.getTheme().applyStyle(style, true);
    } catch (RuntimeException ignored) {
      // Preserve Zalo's native theme if the optional overlay is unavailable.
    }
  }

  /** Replaces the Me tab root background, whose theme attribute is resolved before the overlay. */
  public static void forceBlackBackground(View view) {
    if (view == null || !isDark(view.getContext())) return;
    try {
      view.setBackgroundColor(0xff000000);
    } catch (RuntimeException ignored) {
      // Keep the inflated background if the platform rejects the replacement.
    }
  }

  public static boolean blackSurface(Context context, int attribute) {
    if (!isDark(context)) return false;
    try {
      if (!"attr".equals(context.getResources().getResourceTypeName(attribute))
          || !SURFACES.contains(context.getResources().getResourceEntryName(attribute))) return false;
      return true;
    } catch (RuntimeException ignored) {
      return false;
    }
  }

  /** Zalo's selected theme mode: 0 is light, any other value is a dark theme. */
  private static boolean isDark(Context context) {
    try {
      Method method = themeMode;
      if (method == null) {
        method = Class.forName("ef1.c").getMethod("b");
        themeMode = method;
      }
      return ((Number) method.invoke(null)).intValue() != 0;
    } catch (ReflectiveOperationException | RuntimeException ignored) {
      if (context == null) return false;
      Configuration configuration = context.getResources().getConfiguration();
      return (configuration.uiMode & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
    }
  }
}
