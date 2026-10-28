/*
 * Copyright 2026 wchill.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

package app.morphe.extension.boost.settings;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;

import androidx.preference.Preference;
import androidx.preference.PreferenceCategory;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import app.morphe.extension.boost.debug.FatalCrashLogs;

public final class FatalCrashLogsFragment extends MorpheSettingsFragment {
    private static final String TAG = "MorpheCrashLogs";
    private static final String REPORTS = "morphe_boost_crash_logs_reports";

    private final Handler main = new Handler(Looper.getMainLooper());
    private final ExecutorService worker = Executors.newSingleThreadExecutor();
    private volatile boolean destroyed;
    private boolean busy;

    @Override
    protected String resourceName() {
        return "morphe_boost_fatal_crash_logs";
    }

    @Override
    public void onResume() {
        super.onResume();
        if (!busy) refreshReports();
    }

    @Override
    public void onDestroy() {
        destroyed = true;
        worker.shutdownNow();
        super.onDestroy();
    }

    private void refreshReports() {
        Context context = requireContext().getApplicationContext();
        setBusy(true);
        worker.execute(() -> {
            FatalCrashLogs.Listing listing = FatalCrashLogs.list(context);
            main.post(() -> {
                if (destroyed || !isAdded()) return;
                PreferenceCategory reports = findPreference(REPORTS);
                reports.removeAll();
                for (FatalCrashLogs.Entry entry : listing.entries) {
                    reports.addPreference(reportPreference(entry.uri, entry.name));
                }
                if (listing.entries.isEmpty()) {
                    Preference preference = new Preference(requireContext(), null);
                    preference.setTitle("No crash reports found");
                    preference.setSingleLineTitle(false);
                    preference.setPersistent(false);
                    preference.setSelectable(false);
                    reports.addPreference(preference);
                }
                setBusy(false);
            });
        });
    }

    private Preference reportPreference(Uri uri, String name) {
        Intent viewIntent = new Intent(Intent.ACTION_VIEW);
        viewIntent.setDataAndType(uri, "text/plain");
        viewIntent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);

        Preference preference = new Preference(requireContext(), null);
        preference.setKey(uri.toString());
        preference.setTitle(name);
        preference.setSingleLineTitle(false);
        preference.setPersistent(false);
        preference.setIntent(viewIntent);
        return preference;
    }

    private void setBusy(boolean value) {
        busy = value;
    }
}
