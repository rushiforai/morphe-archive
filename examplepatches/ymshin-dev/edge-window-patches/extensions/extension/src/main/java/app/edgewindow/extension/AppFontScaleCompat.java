package app.edgewindow.extension;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;

import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

/** Applies a font-scale override without overriding display density or layout configuration. */
public final class AppFontScaleCompat {
    private static final float MIN_FONT_SCALE = 0.5f;
    private static final float MAX_FONT_SCALE = 2.0f;
    private static final Map<Activity, Boolean> SCALED_ACTIVITIES =
            Collections.synchronizedMap(new WeakHashMap<Activity, Boolean>());

    private AppFontScaleCompat() {
    }

    public static Context wrap(Activity activity, Context base, float multiplier) {
        if (activity == null || base == null || multiplier == 1.0f) {
            return base;
        }

        synchronized (SCALED_ACTIVITIES) {
            if (SCALED_ACTIVITIES.containsKey(activity)) {
                return base;
            }

            try {
                // Keep the framework context type intact: createConfigurationContext()
                // returns a real ContextImpl, so app code that inspects the base context
                // does not receive an unexpected ContextWrapper.
                Configuration current = base.getResources().getConfiguration();
                Configuration override = new Configuration();
                override.fontScale = Math.max(
                        MIN_FONT_SCALE,
                        Math.min(MAX_FONT_SCALE, current.fontScale * multiplier)
                );

                Context scaled = base.createConfigurationContext(override);
                if (scaled == null) {
                    return base;
                }

                SCALED_ACTIVITIES.put(activity, Boolean.TRUE);
                return scaled;
            } catch (RuntimeException exception) {
                // Preserve normal app startup if a vendor Context rejects overrides.
                return base;
            }
        }
    }
}
