package app.zeldrisho.zalo.extension;

import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import java.lang.ref.WeakReference;
import java.util.ArrayList;

/** Zalo-local settings. Tab changes take effect when the app is restarted. */
public final class ZeldrisSettings {
  private static final String PREFS = "zeldris_patch_settings";
  private static final String DISCOVERY = "hide_discovery";
  private static final String TIMELINE = "hide_timeline";
  private static final String ENTRY = "zeldris_patch_settings_entry";
  private static final String TRACKING_MARKER = "zeldris_patches_settings";
  private static WeakReference<Object> mainView = new WeakReference<>(null);
  private static volatile Boolean recallRetention;

  private ZeldrisSettings() {}

  private static Context appContext() {
    try {
      return (Context) Class.forName("com.zing.zalo.MainApplication")
          .getMethod("getAppContext").invoke(null);
    } catch (ReflectiveOperationException | RuntimeException ignored) {
      return null;
    }
  }

  private static boolean visible(boolean original, String key, boolean defaultHidden) {
    Context context = appContext();
    if (context == null) return original;
    try {
      return original && !context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
          .getBoolean(key, defaultHidden);
    } catch (RuntimeException ignored) {
      return original;
    }
  }

  /** Null means preferences were unavailable; do not cache a failed read as a user choice. */
  private static Boolean readRecallPreference() {
    Context context = appContext();
    if (context == null) return null;
    try {
      return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
          .getBoolean("keep_recalled_messages", false);
    } catch (RuntimeException ignored) {
      return null;
    }
  }

  /** Stable for this process so toggling cannot split an in-flight recall across opposite policies. */
  public static boolean keepRecalledMessages() {
    Boolean value = recallRetention;
    if (value == null) {
      synchronized (ZeldrisSettings.class) {
        value = recallRetention;
        if (value == null) {
          value = readRecallPreference();
          if (value != null) recallRetention = value;
        }
      }
    }
    return Boolean.TRUE.equals(value);
  }

  /**
   * Returns the stranger-notification preference, defaulting to true when unset and false when
   * the app context is unavailable. Preference access errors propagate.
   */
  public static boolean strangerNotificationsEnabled() {
    Context context = appContext();
    return context != null && context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
        .getBoolean("stranger_notifications", true);
  }

  /**
   * Returns the chosen backup interval in milliseconds, or the account-specific native interval
   * when no supported override is set or preferences cannot be read.
   */
  public static long backupIntervalMillis(long nativeInterval) {
    Context context = appContext();
    if (context == null) return nativeInterval;
    try {
      int hours = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).getInt("backup_interval_hours", 0);
      return BackupIntervalPolicy.select(nativeInterval, hours);
    } catch (RuntimeException ignored) {
      // Malformed preferences must not interfere with Zalo's scheduler.
    }
    return nativeInterval;
  }

  /** Preserves the native visibility unless the Discovery tab is hidden in preferences. */
  public static boolean showDiscovery(boolean original) {
    return visible(original, DISCOVERY, false);
  }

  /** Called only at the native PHONEBOOK list insertion, before indices are derived. */
  public static void addContactsTab(ArrayList<Object> tabs, Object contacts) {
    if (visible(true, "hide_contacts", false)) tabs.add(contacts);
  }

  /** Preserves the native visibility unless the Timeline tab is hidden in preferences. */
  public static boolean showTimeline(boolean original) {
    return visible(original, TIMELINE, false);
  }

  /** Adds the entry immediately after the profile section in the Zinstant Me layout. */
  public static void attachAfterProfile(Object host, View profile) {
    if (profile == null || !(profile.getParent() instanceof LinearLayout)) return;
    LinearLayout parent = (LinearLayout) profile.getParent();
    for (int i = 0; i < parent.getChildCount(); i++) {
      if (ENTRY.equals(parent.getChildAt(i).getTag())) return;
    }
    Context context = profile.getContext();
    try {
      Class<?> itemClass = Class.forName("com.zing.zalo.ui.settings.widget.ListItemSetting");
      View entry = (View) itemClass.getConstructor(Context.class).newInstance(context);
      itemClass.getMethod("setTitle", CharSequence.class).invoke(entry, "Zeldris Patches");
      itemClass.getMethod("setShowChevronRight", boolean.class).invoke(entry, true);
      itemClass.getMethod("x", boolean.class).invoke(entry, false);
      addLeadingIcon(entry);
      entry.setTag(ENTRY);
      entry.setLayoutParams(new LinearLayout.LayoutParams(-1, -2));
      entry.setOnClickListener(view -> show(context));
      // The host's d() creates and appends its own themed section separator.
      Object separator = host.getClass().getMethod("d").invoke(host);
      if (!(separator instanceof View) || ((View) separator).getParent() != parent) return;
      parent.addView(entry, parent.indexOfChild((View) separator) + 1);
    } catch (ReflectiveOperationException | RuntimeException ignored) {
      // Do not disrupt the host if the version-specific native component changes.
    }
  }

  /** Adds a native Me model after the profile model in the non-Zinstant layout. */
  @SuppressWarnings({"unchecked", "rawtypes"})
  public static void insertAfterProfile(ArrayList<?> items) {
    if (items == null) return;
    try {
      Class<?> profileClass = Class.forName("nj1.m0");
      Class<?> itemClass = Class.forName("nj1.e");
      Class<?> idClass = Class.forName("xa1.q");
      int profileIndex = -1;
      for (int i = 0; i < items.size(); i++) {
        Object item = items.get(i);
        if (profileClass.isInstance(item)) {
          if (profileIndex >= 0) return;
          profileIndex = i;
        }
        if (itemClass.isInstance(item) && TRACKING_MARKER.equals(itemClass.getField("p").get(item))) return;
      }
      if (profileIndex < 0) return;
      Object id = Enum.valueOf((Class<? extends Enum>) idClass.asSubclass(Enum.class), "UNKNOWN");
      Context context = appContext();
      int icon = context == null ? 0 : context.getResources()
          .getIdentifier("zds_ic_setting_line_24", "drawable", context.getPackageName());
      Object item = itemClass.getConstructor(idClass, int.class, String.class, int.class, int.class)
          .newInstance(id, icon, "Zeldris Patches", 5, 0);
      itemClass.getField("p").set(item, TRACKING_MARKER);
      int insertion = profileIndex + 1;
      Class<?> separatorClass = Class.forName("nj1.a");
      if (insertion >= items.size() || !separatorClass.isInstance(items.get(insertion))) {
        ((ArrayList) items).add(insertion, separatorClass.getConstructor().newInstance());
      }
      ((ArrayList) items).add(insertion + 1, item);
    } catch (ReflectiveOperationException | RuntimeException ignored) {
      // Keep the original list unchanged when host structures drift.
    }
  }

  /** Overrides only the inserted row's click action after native binding. */
  public static void bindSettingsRow(View view, Object item) {
    if (view == null || item == null) return;
    try {
      Class<?> itemClass = Class.forName("nj1.e");
      if (itemClass.isInstance(item) && TRACKING_MARKER.equals(itemClass.getField("p").get(item))) {
        view.setOnClickListener(clicked -> show(clicked.getContext()));
        view.getClass().getMethod("x", boolean.class).invoke(view, false);
      }
    } catch (ReflectiveOperationException | RuntimeException ignored) {
      // Leave the host's native row behavior untouched.
    }
  }

  private static void addLeadingIcon(View entry) throws ReflectiveOperationException {
    Context context = entry.getContext();
    int icon = context.getResources().getIdentifier("zds_ic_setting_line_24", "drawable", context.getPackageName());
    if (icon == 0) return;
    ImageView image = new ImageView(context);
    int size = (int) (24 * context.getResources().getDisplayMetrics().density);
    image.setLayoutParams(new android.widget.FrameLayout.LayoutParams(size, size));
    image.setImageResource(icon);
    image.setColorFilter(0xFF0068FF);
    entry.getClass().getMethod("m", View.class).invoke(entry, image);
  }

  public static void registerMainView(Object view) {
    mainView = new WeakReference<>(view);
  }

  public static void openBackupSettings() {
    openScreen("app.zeldrisho.zalo.extension.ZeldrisBackupSettingsView");
  }

  private static void show(Context context) {
    openScreen("app.zeldrisho.zalo.extension.ZeldrisSettingsView");
  }

  private static void openScreen(String className) {
    try {
      Object host = mainView.get();
      if (host == null) return;
      Object navigator = host.getClass().getMethod("T4").invoke(host);
      if (navigator == null) return;
      Class<?> screen = Class.forName(className);
      navigator.getClass().getMethod("R0", Class.class, Bundle.class, int.class, String.class, int.class, boolean.class)
          .invoke(navigator, screen, null, 0, null, 1, true);
    } catch (ReflectiveOperationException | RuntimeException ignored) {
      // Do not navigate if the version-specific host ABI has changed.
    }
  }
}
