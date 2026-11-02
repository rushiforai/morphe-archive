/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.settings;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;

public final class SettingsShortcutActivity extends Activity {
    private static final String TAG = "RexSettingsShortcut";
    private static final String ACTION_OPEN_REX_SETTINGS =
            "app.morphe.extension.instagram.action.OPEN_REX_SETTINGS";

    private static boolean acceptsAction(String action) {
        return ACTION_OPEN_REX_SETTINGS.equals(action);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        try {
            Intent source = getIntent();
            if (source != null && acceptsAction(source.getAction())) {
                Intent target = new Intent(this, SettingsActivity.class);
                target.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_SINGLE_TOP);
                startActivity(target);
            }
        } catch (RuntimeException exception) {
            Log.e(TAG, "Failed to open xboyrex settings from the launcher shortcut", exception);
        } finally {
            finish();
        }
    }
}
