package app.zeldrisho.zalo.extension;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;

/** Switches between Zalo's original launcher alias and the patch-supplied custom alias. */
public final class LauncherIcon {
  private static final String ORIGINAL = "com.zing.zalo.ui.SplashActivity";
  private static final String CUSTOM = "com.zing.zalo.ui.ZeldrisCustomIcon";
  private LauncherIcon() {}

  public static boolean isCustom(Context context) {
    try {
      return context.getPackageManager().getComponentEnabledSetting(new ComponentName(context, CUSTOM))
          == PackageManager.COMPONENT_ENABLED_STATE_ENABLED;
    } catch (RuntimeException ignored) {
      return false;
    }
  }

  /** Enables the destination first; never disable the old launcher if that fails. */
  public static boolean select(Context context, boolean custom) {
    PackageManager pm = context.getPackageManager();
    ComponentName original = new ComponentName(context, ORIGINAL);
    ComponentName alternate = new ComponentName(context, CUSTOM);
    ComponentName enable = custom ? alternate : original;
    ComponentName disable = custom ? original : alternate;
    try {
      pm.getActivityInfo(enable, PackageManager.MATCH_DISABLED_COMPONENTS);
      pm.getActivityInfo(disable, PackageManager.MATCH_DISABLED_COMPONENTS);
      pm.setComponentEnabledSetting(enable, PackageManager.COMPONENT_ENABLED_STATE_ENABLED, PackageManager.DONT_KILL_APP);
      pm.setComponentEnabledSetting(disable, PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP);
      return true;
    } catch (PackageManager.NameNotFoundException | RuntimeException ignored) {
      return false;
    }
  }
}
