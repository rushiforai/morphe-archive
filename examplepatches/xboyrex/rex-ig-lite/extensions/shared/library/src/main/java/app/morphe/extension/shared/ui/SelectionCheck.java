/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.shared.ui;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.widget.Checkable;

import androidx.appcompat.widget.AppCompatImageView;

public final class SelectionCheck extends AppCompatImageView implements Checkable {
    private boolean checked;

    public SelectionCheck(Context context, Drawable drawable) {
        super(context);
        setScaleType(ScaleType.CENTER);
        setImageDrawable(drawable);
        // The parent item handles interaction and accessibility; this view only shows its state.
        setClickable(false);
        setFocusable(false);
        setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
    }

    @Override public boolean isChecked() { return checked; }

    @Override public void setChecked(boolean checked) {
        if (this.checked == checked) return;
        this.checked = checked;
        refreshDrawableState();
    }

    @Override public void toggle() { setChecked(!checked); }

    @Override public int[] onCreateDrawableState(int extraSpace) {
        int[] state = super.onCreateDrawableState(extraSpace + 1);
        if (checked) mergeDrawableStates(state, new int[]{android.R.attr.state_checked});
        return state;
    }
}
