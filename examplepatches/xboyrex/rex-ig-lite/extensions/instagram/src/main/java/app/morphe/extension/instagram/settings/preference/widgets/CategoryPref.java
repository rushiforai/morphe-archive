/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.settings.preference.widgets;

import android.content.Context;
import android.graphics.Typeface;
import android.preference.PreferenceCategory;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

public class CategoryPref extends PreferenceCategory {
    private boolean firstCategory;

    public CategoryPref(Context context) {
        super(context);
    }

    public CategoryPref(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public CategoryPref(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public void setFirstCategory(boolean firstCategory) {
        this.firstCategory = firstCategory;
    }

    @Override
    protected View onCreateView(ViewGroup parent) {
        TextView title = new TextView(getContext());
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
        title.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        title.setLetterSpacing(0.03f);
        applyCategoryStyle(title);
        title.setLayoutParams(new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));
        return title;
    }

    @Override
    protected void onBindView(View view) {
        TextView title = (TextView) view;
        title.setText(getTitle());
        title.setTextColor(InstagramPreferenceStyle.REX_CYAN_ACCENT);
        applyCategoryStyle(title);
        title.setEnabled(isEnabled());
    }

    private void applyCategoryStyle(TextView title) {
        int topPadding = firstCategory ? 14 : 22;
        title.setPadding(
                InstagramPreferenceStyle.dp(getContext(), 22),
                InstagramPreferenceStyle.dp(getContext(), topPadding),
                InstagramPreferenceStyle.dp(getContext(), 22),
                InstagramPreferenceStyle.dp(getContext(), 8)
        );
        title.setBackgroundColor(InstagramPreferenceStyle.AMOLED_BLACK);
    }
}
