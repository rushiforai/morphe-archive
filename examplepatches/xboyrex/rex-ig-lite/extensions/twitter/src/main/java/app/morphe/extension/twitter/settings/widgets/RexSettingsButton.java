/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.twitter.settings.widgets;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import androidx.appcompat.widget.AppCompatButton;
import app.morphe.extension.twitter.Utils;
import app.morphe.extension.twitter.settings.Settings;
import app.morphe.extension.twitter.settings.ActivityHook;

public class RexSettingsButton extends AppCompatButton implements View.OnClickListener {

    // Constructors
    public RexSettingsButton(Context context) {
        super(context);
        init();
    }

    public RexSettingsButton(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public RexSettingsButton(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    // Initialization method
    private void init() {
        setOnClickListener(this);
        if (!Utils.getBooleanPref(Settings.MISC_QUICK_SETTINGS_BUTTON)) {
            setVisibility(GONE);
        }
    }

    // Override the onClick method
    @Override
    public void onClick(View v) {
        try {
            ActivityHook.startSettingsActivity();
        } catch (Exception e) {
            app.morphe.extension.rex.RexUtils.logger(e);
        }

    }
}
