/*
 * Copyright 2026 xboyrex contributors
 * https://github.com/xboyrex/xboyrex
 */
package app.morphe.extension.suite.instagram.settings;

import static app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.category;
import static app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.clearViewingHistory;
import static app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.mark;
import static app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.toggle;
import static app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.viewingHistoryRow;

import android.content.Context;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceScreen;

import java.util.Set;

import app.morphe.extension.suite.shared.L10n;

/** Builds the Viewing history category of xboyrex settings (#228). It was part of Ads and privacy before. */
final class ViewingHistoryCategory {
    private ViewingHistoryCategory() { }

    static void add(xboyrexPreferenceFragment page, PreferenceScreen screen, Context context, Set<PatchFamily> build) {
        if (!build.contains(PatchFamily.VIDEO_DOWNLOAD)) return;
        PreferenceCategory section = category(screen, L10n.t("Viewing history"), SettingsIcons.UPDATES,
                L10n.t("Find a post, reel, story or profile you saw before."));
        section.addPreference(toggle(context, Settings.VIEWING_HISTORY, L10n.t("Keep a viewing history"),
                L10n.t("Remembers the posts, reels, stories and profiles that come up on screen, and who posted "
                        + "them, newest first, on this phone only. The list shows their pictures, loaded from "
                        + "Instagram's image servers and kept on the phone. Turn it off and it stops at once.")));
        Preference history = viewingHistoryRow(context);
        section.addPreference(history);
        xboyrexPreferenceFragment.Row clear = new xboyrexPreferenceFragment.Row(context);
        clear.setKey(xboyrexPreferenceFragment.CLEAR_VIEWING_HISTORY);
        clear.setPersistent(false);
        clear.actsAtOnce = true;
        clear.setTitle(L10n.t("Clear viewing history"));
        clear.setSummary(L10n.t("Forgets every post, reel, story and profile on the list, for all your accounts. "
                + "The switch stays as it is."));
        clear.setOnPreferenceClickListener(p -> {
            clearViewingHistory(p, history);
            return true;
        });
        section.addPreference(mark(clear, SettingsIcons.DELETE));
    }
}
