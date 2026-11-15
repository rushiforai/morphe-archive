/*
 * Copyright 2026 xboyrex contributors
 * https://github.com/xboyrex/rex-ig-lite
 *
 * Modified for xboyrex (Instagram), 2026.
 */
package app.morphe.extension.suite.instagram.settings;

import static app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.category;
import static app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.toggle;

import android.content.Context;
import android.preference.PreferenceCategory;
import android.preference.PreferenceScreen;

import java.util.Set;

import app.morphe.extension.suite.shared.L10n;

/** Builds the Battery category of xboyrex settings. */
final class BatteryCategory {
    private BatteryCategory() { }

    static void add(xboyrexPreferenceFragment page, PreferenceScreen screen, Context context, Set<PatchFamily> build) {
        if (build.contains(PatchFamily.STOP_HEARTBEAT)) {
            PreferenceCategory battery = category(screen, L10n.t("Battery"), SettingsIcons.BATTERY,
                    L10n.t("Stop background work Instagram doesn't need."));
            battery.addPreference(toggle(context, Settings.STOP_HEARTBEAT, L10n.t("Stop the background heartbeat"),
                    L10n.t("Instagram wakes your phone every minute or two, screen off included, only to note that it "
                            + "is still running. This stops that. Messages, notifications and everything you see are "
                            + "unaffected.")));
            battery.addPreference(toggle(context, Settings.STOP_UPLOAD_ALARM, L10n.t("Stop the analytics upload alarm"),
                    L10n.t("Instagram sets an alarm to wake your phone and send its usage events five minutes later. "
                            + "This stops that alarm. The events go the next time you use the app.")));
            battery.addPreference(toggle(context, Settings.STOP_BACKGROUND_FETCH, L10n.t("Stop background feed refresh"),
                    L10n.t("About every half hour, Instagram wakes your phone to download your feed ahead of time. "
                            + "This stops that. The feed loads when you open the app instead, and messages and "
                            + "notifications still arrive.")));
        }
    }
}
