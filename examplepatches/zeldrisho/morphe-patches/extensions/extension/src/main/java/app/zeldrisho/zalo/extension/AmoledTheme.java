package app.zeldrisho.zalo.extension;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.view.View;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

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
  // Resource IDs can differ between resource tables; do not retain activity resources indefinitely.
  private static final Map<Resources, Map<Integer, Boolean>> SURFACE_IDS = new WeakHashMap<>();

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

  /**
   * Returns whether an attribute resource ID names a supported surface in the selected dark theme.
   * Returns false in light mode or if surface resource lookup fails. Errors reading the system
   * configuration during theme-detection fallback can propagate.
   */
  public static boolean blackSurface(Context context, int attribute) {
    if (!isDark(context)) return false;
    try {
      Resources resources = context.getResources();
      synchronized (SURFACE_IDS) {
        Map<Integer, Boolean> ids = SURFACE_IDS.get(resources);
        if (ids == null) {
          ids = new HashMap<>();
          SURFACE_IDS.put(resources, ids);
        }
        Boolean cached = ids.get(attribute);
        if (cached != null) return cached;
        boolean surface = "attr".equals(resources.getResourceTypeName(attribute))
            && SURFACES.contains(resources.getResourceEntryName(attribute));
        ids.put(attribute, surface);
        return surface;
      }
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
