package app.morphe.extension.rex.settings;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

@SuppressWarnings("unused")
public class StringSetting extends Setting<String> {

    public StringSetting(String key, String defaultValue) {
        super(key, defaultValue);
    }
}