package app.morphe.extension.reddit.settings.preference.categories;

import static app.morphe.extension.shared.StringRef.str;

import android.content.Context;
import android.preference.PreferenceScreen;

import app.morphe.extension.reddit.patches.NsfwFeedModePatch;
import app.morphe.extension.reddit.settings.Settings;
import app.morphe.extension.reddit.settings.preference.BooleanSettingPreference;

@SuppressWarnings("deprecation")
public class NsfwPreferenceCategory extends ConditionalPreferenceCategory {
    public NsfwPreferenceCategory(Context context, PreferenceScreen screen) {
        super(context, screen);
        setTitle(str("morphe_screen_nsfw_title"));
    }

    @Override
    public boolean getSettingsStatus() {
        return NsfwFeedModePatch.isPatchIncluded();
    }

    @Override
    public void addPreferences(Context context) {
        addPreference(new BooleanSettingPreference(
                context,
                Settings.NSFW_FEED_MODE
        ));
    }
}
