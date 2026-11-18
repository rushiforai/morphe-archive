/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.customise.font;

import android.content.Context;
import android.graphics.Typeface;
import android.util.AttributeSet;
import android.widget.EditText;

/** Replaces the platform {@link EditText} in rex's own code. */
@SuppressWarnings("unused")
public final class CustomFontEditText extends EditText {
    public CustomFontEditText(Context context) {
        super(context);
        super.setTypeface(CustomFont.forRexView(getTypeface()));
    }

    public CustomFontEditText(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        super.setTypeface(CustomFont.forRexView(getTypeface()));
    }

    @Override
    public void setTypeface(Typeface typeface) {
        super.setTypeface(CustomFont.forRexView(typeface));
    }

    @Override
    public void setTypeface(Typeface tf, int style) {
        Typeface base = style == Typeface.NORMAL
                ? tf
                : Typeface.create(tf != null ? tf : Typeface.DEFAULT, style);
        super.setTypeface(CustomFont.forRexView(base), style);
    }
}
