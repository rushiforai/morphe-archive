/*
 * Copyright 2026 brealorg.
 * Adapted from https://github.com/brealorg/breal-morphe-patches (82d70f7).
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

package app.morphe.extension.boost.settings;

import android.content.Context;
import android.content.res.Resources;
import android.os.Bundle;

import androidx.preference.PreferenceFragmentCompat;

public class MorpheSettingsFragment extends PreferenceFragmentCompat {
    public static final String CONTRACT_MARKER =
            "MORPHE_BOOST_TOP_LEVEL_SETTINGS_ISSUE106_V1";

    private static final String RESOURCE_NAME = "morphe_boost_settings_skeleton";
    private static final String BOOST_PACKAGE = "com.rubenmayayo.reddit";

    protected String resourceName() {
        return RESOURCE_NAME;
    }

    @Override
    public void onCreatePreferences(Bundle savedInstanceState, String rootKey) {
        setPreferencesFromResource(resourceId("xml", resourceName()), rootKey);
    }

    protected final int resourceId(String type, String name) {
        Context context = requireContext();
        Resources resources = context.getResources();

        int resourceId = resources.getIdentifier(
                name,
                type,
                context.getPackageName()
        );

        if (resourceId == 0) {
            resourceId = resources.getIdentifier(
                    name,
                    type,
                    BOOST_PACKAGE
            );
        }

        if (resourceId == 0) {
            throw new IllegalStateException(
                    "Missing Morphe settings resource: " + type + "/" + name
            );
        }

        return resourceId;
    }

}
