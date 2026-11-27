package dev.vortexnode.sbrowserx.extension.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.os.Bundle;

import dev.vortexnode.sbrowserx.extension.SBrowserXHooks;
import dev.vortexnode.sbrowserx.extension.SBrowserXPrefs;
import dev.vortexnode.sbrowserx.extension.SBrowserXStrings;

public final class SBrowserXCompactButtonDialogActivity extends Activity {
    private static final String[] VALUES = new String[] {
            SBrowserXPrefs.COMPACT_BTN_NEW_TAB,
            SBrowserXPrefs.COMPACT_BTN_BOOKMARKS,
            SBrowserXPrefs.COMPACT_BTN_SHARE,
            SBrowserXPrefs.COMPACT_BTN_DOWNLOADS,
            SBrowserXPrefs.COMPACT_BTN_HISTORY,
            SBrowserXPrefs.COMPACT_BTN_HOME,
            SBrowserXPrefs.COMPACT_BTN_HIDE
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        SBrowserXPrefs.init(this);

        boolean night = SBrowserXHooks.isBrowserNightMode(this);
        int theme = night
                ? android.R.style.Theme_DeviceDefault_Dialog_Alert
                : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert;

        String[] labels = new String[VALUES.length];
        for (int i = 0; i < VALUES.length; i++) {
            labels[i] = SBrowserXStrings.compactButtonLabel(VALUES[i]);
        }

        String current = SBrowserXPrefs.getCompactAiButton(this);
        int selected = 0;
        for (int i = 0; i < VALUES.length; i++) {
            if (VALUES[i].equals(current)) {
                selected = i;
                break;
            }
        }

        new AlertDialog.Builder(this, theme)
                .setTitle(SBrowserXStrings.get(SBrowserXStrings.COMPACT_AI_BTN_TITLE))
                .setSingleChoiceItems(labels, selected, (dialog, which) -> {
                    SBrowserXPrefs.setCompactAiButton(this, VALUES[which]);
                    SBrowserXHooks.notifyCompactToolbarUpdated();
                    dialog.dismiss();
                    finish();
                })
                .setNegativeButton(android.R.string.cancel, (d, w) -> finish())
                .setOnCancelListener(d -> finish())
                .show();
    }
}
