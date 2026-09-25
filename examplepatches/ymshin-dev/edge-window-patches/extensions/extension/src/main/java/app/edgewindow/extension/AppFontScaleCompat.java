package app.edgewindow.extension;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Configuration;

import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

/** Applies a font-scale override without overriding display density or layout configuration. */
public final class AppFontScaleCompat {
    private static final float MAX_FONT_SCALE = 2.0f;
    private static final float MIN_FONT_SCALE = 0.5f;
    private static final Map<Activity, Boolean> SCALED_ACTIVITIES =
            Collections.synchronizedMap(new WeakHashMap<>());

    private AppFontScaleCompat() {}

    public static Context wrap(Activity activity, Context base, float multiplier) {
        if (activity == null || base == null || multiplier == 1.0f) {
            return base;
        }

        synchronized (SCALED_ACTIVITIES) {
            if (SCALED_ACTIVITIES.containsKey(activity)) {
                return base;
            }

            if (base instanceof FontScaleContext) {
                SCALED_ACTIVITIES.put(activity, Boolean.TRUE);
                return base;
            }

            Configuration current = base.getResources().getConfiguration();
            float fontScale = Math.max(
                    MIN_FONT_SCALE,
                    Math.min(MAX_FONT_SCALE, current.fontScale * multiplier)
            );

            Configuration override = new Configuration();
            override.fontScale = fontScale;

            try {
                Context scaled = new FontScaleContext(base.createConfigurationContext(override));
                SCALED_ACTIVITIES.put(activity, Boolean.TRUE);
                return scaled;
            } catch (RuntimeException exception) {
                // Preserve normal app startup if a vendor Context rejects configuration overrides.
                return base;
            }
        }
    }

    private static final class FontScaleContext extends ContextWrapper {
        FontScaleContext(Context base) {
            super(base);
        }
    }
}
