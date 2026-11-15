/*
 * Copyright 2026 xboyrex contributors
 * https://github.com/xboyrex/rex-ig-lite
 *
 * Modified for xboyrex (Instagram), 2026.
 */
package app.morphe.extension.suite.instagram.settings;

import static app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.SOURCE_ADDRESS;
import static app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.SOURCE_URL;
import static app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.category;
import static app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.info;
import static app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.mark;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceScreen;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.RelativeSizeSpan;
import android.text.style.TypefaceSpan;

import java.util.Set;

import app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.Row;
import app.morphe.extension.suite.shared.L10n;
import app.morphe.extension.suite.shared.Logger;
import app.morphe.extension.suite.shared.Utils;

/** Builds the About category of xboyrex settings. */
final class AboutCategory {
    private AboutCategory() { }

    static void add(xboyrexPreferenceFragment page, PreferenceScreen screen, Context context, Set<PatchFamily> build) {
        PreferenceCategory about = category(screen, L10n.t("About"), SettingsIcons.ABOUT,
                L10n.t("Your version, the source code and licenses."));
        page.about = about;
        Preference version = info(context, L10n.t("Version"), "");
        version.setSummary(versionSummary(L10n.f("xboyrex %1$s on Instagram %2$s",
                L10n.isolate(Utils.getPatchesReleaseVersion()), L10n.isolate(Utils.getAppVersionName())),
                L10n.isolate(Utils.getSourceBuildIdentity())));
        about.addPreference(mark(version, SettingsIcons.ABOUT));

        Preference source = new Row(context);
        source.setTitle(L10n.t("Source code and issues"));
        source.setSummary(SOURCE_ADDRESS);
        source.setPersistent(false);
        source.setOnPreferenceClickListener(p -> {
            try {
                page.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(SOURCE_URL)));
            } catch (ActivityNotFoundException | SecurityException missing) {
                // No browser, or none switched on. Uncaught, Android's exception closed Instagram.
                Logger.printInfo(() -> "No app opened the source code link");
                // The address in a toast of its own: after the sentence it ran to a third line.
                Utils.showToastLong(L10n.t("No app can open this link."));
                Utils.showToastLong(SOURCE_ADDRESS);
            }
            return true;
        });
        about.addPreference(mark(source, SettingsIcons.OPENING));

        // Section 7b asks that its notice reach the person using the software, and a file in the
        // repository does not reach them.
        Preference licenses = new Row(context);
        licenses.setTitle(L10n.t("Licenses"));
        licenses.setSummary(L10n.t("GPL-3.0, with the notices of the projects this is built on"));
        licenses.setPersistent(false);
        licenses.setOnPreferenceClickListener(p -> {
            page.showNotice(context);
            return true;
        });
        about.addPreference(mark(licenses, SettingsIcons.LICENSE));
    }

    /**
     * The versions, then the build identity in a smaller fixed-width face, so the long hash reads as
     * one code to copy into a report rather than a sentence broken over three lines.
     */
    static CharSequence versionSummary(String versions, String identity) {
        SpannableStringBuilder summary = new SpannableStringBuilder(versions).append('\n');
        int start = summary.length();
        summary.append(identity);
        summary.setSpan(new TypefaceSpan("monospace"), start, summary.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        summary.setSpan(new RelativeSizeSpan(0.9f), start, summary.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        return summary;
    }
}
