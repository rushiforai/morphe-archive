package app.zeldrisho.zalo.extension;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Build;
import android.provider.Settings;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.Toast;

/** Content for the patch-created subclass of Zalo's BaseSettingView. */
public final class ZeldrisSettingsContent {
  private static final String PREFS = "zeldris_patch_settings";

  private ZeldrisSettingsContent() {}

  /** Replaced at patch time only when the corresponding feature is installed. */
  public static boolean hasNavigationSettings() { return false; }
  public static boolean hasStrangerNotificationSettings() { return false; }
  public static boolean hasBackupIntervalSettings() { return false; }
  public static boolean hasRecallSettings() { return false; }
  public static boolean hasAccentColorSettings() { return false; }
  public static boolean hasCustomRingtoneSettings() { return false; }
  public static boolean hasNotificationSoundSettings() { return false; }

  /**
   * Appends the installed features' settings rows to {@code parent} and returns it.
   * If host resources or reflective setup are unavailable, returns the parent with any rows
   * already added. Preference and locale access before setup may still throw runtime exceptions.
   */
  public static View build(LinearLayout parent) {
    Context context = parent.getContext();
    SharedPreferences preferences = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    boolean vi = isVietnamese(context);
    try {
      int layout = context.getResources().getIdentifier("setting_v2_view", "layout", context.getPackageName());
      int privacy = context.getResources().getIdentifier("itemPrivacy", "id", context.getPackageName());
      int messages = context.getResources().getIdentifier("itemMessage", "id", context.getPackageName());
      int notifications = context.getResources().getIdentifier("itemNotification", "id", context.getPackageName());
      if (layout == 0 || privacy == 0 || messages == 0 || notifications == 0) return parent;
      LinearLayout temporary = new LinearLayout(context);
      LayoutInflater.from(context).inflate(layout, temporary, true);
      if (hasNavigationSettings()) {
        View discovery = temporary.findViewById(privacy);
        View timeline = temporary.findViewById(messages);
        if (discovery == null || timeline == null) return parent;
        configure(discovery, vi ? "Ẩn Khám phá" : "Hide Discovery", "hide_discovery",
            "zds_ic_more_grid_line_24", false, preferences, vi);
        configure(timeline, vi ? "Ẩn Nhật ký" : "Hide Timeline", "hide_timeline",
            "zds_ic_new_feed_line_24", false, preferences, vi);
        ((ViewGroup) discovery.getParent()).removeView(discovery);
        ((ViewGroup) timeline.getParent()).removeView(timeline);
        parent.addView(discovery);
        parent.addView(timeline);
        int contactsId = context.getResources().getIdentifier("itemContact", "id", context.getPackageName());
        View contacts = temporary.findViewById(contactsId);
        if (contacts != null) {
          configure(contacts, vi ? "Ẩn Danh bạ" : "Hide Contacts", "hide_contacts",
              "zds_ic_contact_list_line_24", false, preferences, vi);
          ((ViewGroup) contacts.getParent()).removeView(contacts);
          parent.addView(contacts);
        }
      }
      if (hasStrangerNotificationSettings()) {
        View stranger = temporary.findViewById(notifications);
        if (stranger == null) return parent;
        configure(stranger, vi ? "Cho phép thông báo người lạ" : "Allow stranger notifications",
            "stranger_notifications", "zds_ic_stranger_line_24", false, preferences, vi);
        ((ViewGroup) stranger.getParent()).removeView(stranger);
        parent.addView(stranger);
      }
      if (hasBackupIntervalSettings()) {
        int backupId = context.getResources().getIdentifier("itemBackupAndRestore", "id", context.getPackageName());
        View backup = temporary.findViewById(backupId);
        if (backup == null) return parent;
        Class<?> cls = backup.getClass();
        cls.getMethod("setTitle", CharSequence.class).invoke(backup, vi ? "Khoảng thời gian sao lưu" : "Backup interval");
        configureIcon(backup, "zds_ic_backup_message_line_24");
        cls.getMethod("setShowChevronRight", boolean.class).invoke(backup, true);
        backup.setOnClickListener(view -> ZeldrisSettings.openBackupSettings());
        ((ViewGroup) backup.getParent()).removeView(backup);
        parent.addView(backup);
      }
      if (hasCustomRingtoneSettings()) {
        addRingtoneChoice(parent, layout, notifications, preferences, vi);
      }
      if (hasNotificationSoundSettings()) {
        addNotificationSoundChoice(parent, layout, notifications, vi);
      }
      if (hasAccentColorSettings()) {
        addAccentColorChoice(parent, layout, privacy, preferences, vi);
      }
      if (hasRecallSettings()) {
        addToggle(parent, layout, privacy, vi ? "Giữ tin nhắn đã thu hồi" : "Keep recalled messages",
            "keep_recalled_messages", "zds_ic_backup_message_line_24", false, preferences, vi);
      }
    } catch (ReflectiveOperationException | RuntimeException ignored) {
      // A host ABI mismatch must not crash the app.
    }
    return parent;
  }

  /** Opens Android's notification settings without changing or recreating user-owned channels. */
  private static void addNotificationSoundChoice(LinearLayout parent, int layout, int rowId,
      boolean vi) throws ReflectiveOperationException {
    Context context = parent.getContext();
    LinearLayout temporary = new LinearLayout(context);
    LayoutInflater.from(context).inflate(layout, temporary, true);
    View row = temporary.findViewById(rowId);
    if (row == null) return;
    Class<?> cls = row.getClass();
    cls.getMethod("setTitle", CharSequence.class).invoke(row,
        vi ? "Âm thanh thông báo" : "Notification sounds");
    configureIcon(row, "zds_ic_notif_line_24");
    cls.getMethod("setShowChevronRight", boolean.class).invoke(row, true);
    row.setId(View.NO_ID);
    row.setOnClickListener(view -> {
      try {
        Intent intent;
        if (Build.VERSION.SDK_INT >= 26) {
          intent = new Intent(Settings.ACTION_APP_NOTIFICATION_SETTINGS)
              .putExtra(Settings.EXTRA_APP_PACKAGE, context.getPackageName());
        } else {
          intent = new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS,
              Uri.parse("package:" + context.getPackageName()));
        }
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(intent);
      } catch (RuntimeException ignored) {
        Toast.makeText(context, vi ? "Không thể mở cài đặt thông báo" : "Notification settings unavailable",
            Toast.LENGTH_SHORT).show();
      }
    });
    ((ViewGroup) row.getParent()).removeView(row);
    parent.addView(row);
  }

  private static void addRingtoneChoice(LinearLayout parent, int layout, int rowId,
      SharedPreferences preferences, boolean vi) throws ReflectiveOperationException {
    Context context = parent.getContext();
    LinearLayout temporary = new LinearLayout(context);
    LayoutInflater.from(context).inflate(layout, temporary, true);
    View row = temporary.findViewById(rowId);
    if (row == null) return;
    Class<?> cls = row.getClass();
    cls.getMethod("setTitle", CharSequence.class).invoke(row,
        vi ? "Nhạc chuông cuộc gọi" : "Call ringtone");
    configureIcon(row, "zds_ic_notif_line_24");
    cls.getMethod("setShowChevronRight", boolean.class).invoke(row, true);
    row.setId(View.NO_ID);
    row.setTag(CustomRingtone.KEY);
    row.setOnClickListener(view -> ZeldrisSettings.openRingtoneSettings());
    ((ViewGroup) row.getParent()).removeView(row);
    parent.addView(row);
  }

  private static void addAccentColorChoice(LinearLayout parent, int layout, int rowId,
      SharedPreferences preferences, boolean vi) throws ReflectiveOperationException {
    Context context = parent.getContext();
    LinearLayout temporary = new LinearLayout(context);
    LayoutInflater.from(context).inflate(layout, temporary, true);
    View row = temporary.findViewById(rowId);
    if (row == null) return;
    Class<?> cls = row.getClass();
    cls.getMethod("setTitle", CharSequence.class).invoke(row,
        vi ? "Màu nhấn" : "Accent color");
    configureIcon(row, "zds_ic_setting_line_24");
    cls.getMethod("setShowChevronRight", boolean.class).invoke(row, true);
    row.setId(View.NO_ID);
    row.setTag(AccentColor.KEY);
    row.setOnClickListener(view -> ZeldrisSettings.openAccentSettings());
    ((ViewGroup) row.getParent()).removeView(row);
    parent.addView(row);
  }

  /** Inflate independent template rows so feature selections never steal each other's widgets. */
  private static void addToggle(LinearLayout parent, int layout, int rowId, String title, String key,
      String iconName, boolean defaultValue, SharedPreferences preferences, boolean vi) throws ReflectiveOperationException {
    LinearLayout temporary = new LinearLayout(parent.getContext());
    LayoutInflater.from(parent.getContext()).inflate(layout, temporary, true);
    View row = temporary.findViewById(rowId);
    if (row == null) return;
    configure(row, title, key, iconName, defaultValue, preferences, vi);
    // Reusing a template also reuses its ID; these rows are addressed by their preference key instead.
    row.setId(View.NO_ID);
    row.setTag(key);
    ((ViewGroup) row.getParent()).removeView(row);
    parent.addView(row);
  }

  private static void configure(View item, String title, String key, String iconName, boolean defaultValue,
      SharedPreferences preferences, boolean vi)
      throws ReflectiveOperationException {
    Class<?> cls = item.getClass();
    cls.getMethod("setTitle", CharSequence.class).invoke(item, title);
    configureIcon(item, iconName);
    cls.getMethod("setShowChevronRight", boolean.class).invoke(item, false);
    cls.getMethod("setSwitch", boolean.class).invoke(item, preferences.getBoolean(key, defaultValue));
    boolean[] updating = {false};
    CompoundButton.OnCheckedChangeListener listener = (button, checked) -> {
      if (updating[0]) return;
      if (checked && "keep_recalled_messages".equals(key)) {
        // Do not save or display an enabled switch until the warning is accepted.
        updating[0] = true;
        button.setChecked(false);
        updating[0] = false;
        try {
          NativeConfirmationDialog.show(item.getContext(),
              vi ? "Giữ tin nhắn đã thu hồi" : "Keep recalled messages",
              vi
                  ? "Chỉ giữ nội dung nhận được sau khi bật. Không khôi phục nội dung đã mất. Tắt không xóa nội dung đã giữ. Khởi động lại Zalo để áp dụng."
                  : "Only future recalls are affected. Missing content cannot be recovered. Turning this off does not delete retained content or labels. Restart Zalo to apply.",
              vi ? "Bật" : "Enable", vi ? "Hủy" : "Cancel", () -> {
                preferences.edit().putBoolean(key, true).apply();
                updating[0] = true;
                button.setChecked(true);
                updating[0] = false;
                restartNotice(item, vi);
              });
        } catch (RuntimeException ignored) {
          // A missing activity/dialog window must leave recall retention disabled.
        }
        return;
      }
      preferences.edit().putBoolean(key, checked).apply();
      // The notification gate reads this preference on each event; it does not
      // need the app restart required by navigation, theme and recall policy.
      if (!"stranger_notifications".equals(key)) restartNotice(item, vi);
    };
    cls.getMethod("setCheckedChangeListener", CompoundButton.OnCheckedChangeListener.class).invoke(item, listener);
  }

  private static void restartNotice(View item, boolean vi) {
    Toast.makeText(item.getContext(), vi ? "Khởi động lại Zalo để áp dụng" : "Restart Zalo to apply",
        Toast.LENGTH_SHORT).show();
  }

  private static void configureIcon(View item, String iconName) throws ReflectiveOperationException {
    Context context = item.getContext();
    Class<?> cls = item.getClass();
    int iconId = context.getResources().getIdentifier(iconName, "drawable", context.getPackageName());
    if (iconId != 0) {
      ImageView icon = new ImageView(context);
      int size = (int) (24 * context.getResources().getDisplayMetrics().density);
      icon.setLayoutParams(new FrameLayout.LayoutParams(size, size));
      icon.setImageResource(iconId);
      icon.setColorFilter(0xFF0068FF);
      cls.getMethod("m", View.class).invoke(item, icon);
      cls.getMethod("setLeadingItemVisibility", int.class).invoke(item, View.VISIBLE);
    } else {
      cls.getMethod("setLeadingItemVisibility", int.class).invoke(item, View.GONE);
    }
  }

  /** Accent choices are native settings rows; restart is required to update inflated views. */
  public static View buildAccentSettings(LinearLayout parent) {
    Context context = parent.getContext();
    SharedPreferences preferences = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    boolean vi = isVietnamese(context);
    String[] titles = vi ? new String[] {"Mặc định", "Xanh dương", "Tím", "Xanh lá", "Đỏ", "Cam"}
        : new String[] {"Default", "Blue", "Purple", "Green", "Red", "Orange"};
    int[] colors = {0, 0xff0068ff, 0xff6941c6, 0xff067647, 0xffb42318, 0xffb54708};
    try {
      int layout = context.getResources().getIdentifier("setting_v2_view", "layout", context.getPackageName());
      int rowId = context.getResources().getIdentifier("itemPrivacy", "id", context.getPackageName());
      int selected = preferences.getInt(AccentColor.KEY, 0);
      View[] rows = new View[colors.length];
      for (int i = 0; i < rows.length; i++) {
        View row = inflateChoiceRow(context, layout, rowId, titles[i], selected == colors[i]);
        if (row == null) return parent;
        rows[i] = row;
      }
      for (int i = 0; i < rows.length; i++) {
        final int selectedIndex = i;
        View row = rows[i];
        row.setOnClickListener(view -> {
          preferences.edit().putInt(AccentColor.KEY, colors[selectedIndex]).apply();
          for (int j = 0; j < rows.length; j++) {
            try { rows[j].getClass().getMethod("setTick", boolean.class).invoke(rows[j], j == selectedIndex); }
            catch (ReflectiveOperationException | RuntimeException ignored) { }
          }
          restartNotice(view, vi);
        });
        parent.addView(row);
      }
    } catch (ReflectiveOperationException | RuntimeException ignored) { }
    return parent;
  }

  public static View buildRingtoneSettings(LinearLayout parent) {
    Context context = parent.getContext();
    SharedPreferences preferences = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    boolean vi = isVietnamese(context);
    try {
      int layout = context.getResources().getIdentifier("setting_v2_view", "layout", context.getPackageName());
      int rowId = context.getResources().getIdentifier("itemNotification", "id", context.getPackageName());
      View choose = inflateChoiceRow(context, layout, rowId, vi ? "Chọn tệp âm thanh" : "Choose audio file", false);
      View reset = inflateChoiceRow(context, layout, rowId, vi ? "Mặc định" : "Use Zalo default", false);
      if (choose == null || reset == null) return parent;
      choose.setOnClickListener(view -> {
        try {
          Intent intent = new Intent(view.getContext(), RingtonePickerActivity.class);
          if (!(view.getContext() instanceof android.app.Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
          view.getContext().startActivity(intent);
        } catch (RuntimeException ignored) {
          Toast.makeText(view.getContext(), vi ? "Không thể mở trình chọn âm thanh" : "Audio picker unavailable", Toast.LENGTH_SHORT).show();
        }
      });
      reset.setOnClickListener(view -> {
        if (CustomRingtone.reset(view.getContext())) {
          Toast.makeText(view.getContext(), vi ? "Đã khôi phục mặc định" : "Using Zalo default", Toast.LENGTH_SHORT).show();
        } else {
          Toast.makeText(view.getContext(), vi ? "Không thể khôi phục mặc định" : "Could not reset ringtone", Toast.LENGTH_SHORT).show();
        }
      });
      parent.addView(choose);
      parent.addView(reset);
    } catch (ReflectiveOperationException | RuntimeException ignored) { }
    return parent;
  }

  private static View inflateChoiceRow(Context context, int layout, int rowId, String title, boolean tick)
      throws ReflectiveOperationException {
    if (layout == 0 || rowId == 0) return null;
    LinearLayout temporary = new LinearLayout(context);
    LayoutInflater.from(context).inflate(layout, temporary, true);
    View row = temporary.findViewById(rowId);
    if (row == null) return null;
    Class<?> cls = row.getClass();
    cls.getMethod("setTitle", CharSequence.class).invoke(row, title);
    cls.getMethod("setLeadingItemVisibility", int.class).invoke(row, View.GONE);
    cls.getMethod("setShowChevronRight", boolean.class).invoke(row, false);
    cls.getMethod("setTick", boolean.class).invoke(row, tick);
    row.setId(View.NO_ID);
    ((ViewGroup) row.getParent()).removeView(row);
    return row;
  }

  /** Builds a native single-choice screen; zero preserves the account's native interval. */
  public static View buildBackupInterval(LinearLayout parent) {
    Context context = parent.getContext();
    SharedPreferences preferences = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    boolean vi = isVietnamese(context);
    int[] hours = {0, 1, 3, 6, 12};
    String[] names = {"itemPrivacy", "itemMessage", "itemNotification", "itemCall", "itemContact"};
    String[] titles = vi ? new String[] {"Mặc định", "1 giờ", "3 giờ", "6 giờ", "12 giờ"}
        : new String[] {"Native", "1 hour", "3 hours", "6 hours", "12 hours"};
    try {
      int layout = context.getResources().getIdentifier("setting_v2_view", "layout", context.getPackageName());
      if (layout == 0) return parent;
      LinearLayout temporary = new LinearLayout(context);
      LayoutInflater.from(context).inflate(layout, temporary, true);
      View[] rows = new View[hours.length];
      int selected = preferences.getInt("backup_interval_hours", 0);
      if (selected != 1 && selected != 3 && selected != 6 && selected != 12) selected = 0;
      for (int i = 0; i < rows.length; i++) {
        int id = context.getResources().getIdentifier(names[i], "id", context.getPackageName());
        View row = temporary.findViewById(id);
        if (row == null) return parent;
        Class<?> cls = row.getClass();
        cls.getMethod("setTitle", CharSequence.class).invoke(row, titles[i]);
        cls.getMethod("setLeadingItemVisibility", int.class).invoke(row, View.GONE);
        cls.getMethod("setShowChevronRight", boolean.class).invoke(row, false);
        cls.getMethod("setTick", boolean.class).invoke(row, selected == hours[i]);
        rows[i] = row;
      }
      for (int i = 0; i < rows.length; i++) {
        final int index = i;
        View row = rows[i];
        row.setOnClickListener(view -> {
          preferences.edit().putInt("backup_interval_hours", hours[index]).apply();
          for (int j = 0; j < rows.length; j++) {
            try {
              rows[j].getClass().getMethod("setTick", boolean.class).invoke(rows[j], j == index);
            } catch (ReflectiveOperationException | RuntimeException ignored) {
              // Keep the saved selection if the host cannot redraw a tick.
            }
          }
        });
        ((ViewGroup) row.getParent()).removeView(row);
        parent.addView(row);
      }
    } catch (ReflectiveOperationException | RuntimeException ignored) {
      // Keep the host's native backup interval if the screen cannot be built.
    }
    return parent;
  }

  /** Called from the host base class; native settings screens must remain unchanged. */
  public static void setTitleForPatchedScreen(Object screen) {
    if (screen == null) return;
    switch (screen.getClass().getName()) {
      case "app.zeldrisho.zalo.extension.ZeldrisSettingsView": setTitle(screen); break;
      case "app.zeldrisho.zalo.extension.ZeldrisBackupSettingsView": setBackupTitle(screen); break;
      case "app.zeldrisho.zalo.extension.ZeldrisAccentSettingsView": setAccentTitle(screen); break;
      case "app.zeldrisho.zalo.extension.ZeldrisRingtoneSettingsView": setRingtoneTitle(screen); break;
      default: break;
    }
  }

  public static void setTitle(Object screen) {
    setNativeTitle(screen, "Zeldris Patches");
  }

  public static void setBackupTitle(Object screen) {
    try {
      Context context = (Context) screen.getClass().getMethod("M5").invoke(screen);
      setNativeTitle(screen, context != null && isVietnamese(context)
          ? "Khoảng thời gian sao lưu" : "Backup interval");
    } catch (ReflectiveOperationException | RuntimeException ignored) {
      setNativeTitle(screen, "Backup interval");
    }
  }

  public static void setAccentTitle(Object screen) { setLocalizedTitle(screen, "Màu nhấn", "Accent color"); }
  public static void setRingtoneTitle(Object screen) { setLocalizedTitle(screen, "Nhạc chuông cuộc gọi", "Call ringtone"); }

  private static void setLocalizedTitle(Object screen, String vi, String en) {
    try {
      Context context = (Context) screen.getClass().getMethod("M5").invoke(screen);
      setNativeTitle(screen, context != null && isVietnamese(context) ? vi : en);
    } catch (ReflectiveOperationException | RuntimeException ignored) { setNativeTitle(screen, en); }
  }

  private static void setNativeTitle(Object screen, String title) {
    try {
      Object actionBar;
      try {
        actionBar = screen.getClass().getField("y1").get(screen);
      } catch (NoSuchFieldException ignored) {
        actionBar = screen.getClass().getField("p1").get(screen);
      }
      if (actionBar != null) actionBar.getClass().getMethod("setMiddleTitle", String.class).invoke(actionBar, title);
    } catch (ReflectiveOperationException | RuntimeException ignored) {
      // Host action bar unavailable.
    }
  }

  @SuppressWarnings("deprecation")
  private static boolean isVietnamese(Context context) {
    return "vi".equals(context.getResources().getConfiguration().locale.getLanguage());
  }
}
