package com.instagram.common.ui.widget.reboundviewpager;

import android.content.Context;
import android.view.View;
import android.widget.Adapter;
import android.widget.FrameLayout;

public class ReboundViewPager extends FrameLayout {
    public ReboundViewPager(Context context) {
        super(context);
    }

    public final Adapter getAdapter() {
        return null;
    }

    public final View getCurrentActiveView() {
        return null;
    }

    public final int getCurrentDataIndex() {
        return 0;
    }
}
