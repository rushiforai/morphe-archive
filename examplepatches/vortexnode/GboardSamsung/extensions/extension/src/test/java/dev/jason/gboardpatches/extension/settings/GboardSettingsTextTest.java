package dev.jason.gboardpatches.extension.settings;

import android.content.Context;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;

import dev.jason.gboardpatches.extension.R;

@RunWith(RobolectricTestRunner.class)
public final class GboardSettingsTextTest {
    @Test
    public void nullContextRemainsSafeForStaticFeatureInitialization() {
        Assert.assertEquals("Patch settings", GboardSettingsText.get(
                null, R.string.gboard_patches_header_title));
    }

    @Test
    public void runtimeTextFollowsPatchLanguagePreference() {
        Context context = RuntimeEnvironment.getApplication();
        GboardPatchesSettings.preferences(context).edit()
                .putString(GboardPatchesSettings.PREF_KEY_SETTINGS_UI_LANGUAGE,
                        GboardSettingsLocaleManager.LANGUAGE_ENGLISH)
                .commit();

        Assert.assertEquals("Choose theme source", GboardSettingsText.get(context,
                R.string.gboard_patches_custom_theme_source_chooser_title));
        Assert.assertEquals("Create from photo", GboardSettingsText.get(context,
                R.string.gboard_patches_custom_theme_source_photo));
        Assert.assertEquals("Import theme (.zip)", GboardSettingsText.get(context,
                R.string.gboard_patches_custom_theme_source_zip));
        Assert.assertEquals("Choose a theme to import", GboardSettingsText.get(context,
                R.string.gboard_patches_custom_theme_choose_import));

        GboardPatchesSettings.preferences(context).edit()
                .putString(GboardPatchesSettings.PREF_KEY_SETTINGS_UI_LANGUAGE,
                        GboardSettingsLocaleManager.LANGUAGE_RUSSIAN)
                .commit();
        Assert.assertEquals("Выберите источник темы", GboardSettingsText.get(context,
                R.string.gboard_patches_custom_theme_source_chooser_title));
        Assert.assertEquals("Выберите тему для импорта", GboardSettingsText.get(context,
                R.string.gboard_patches_custom_theme_choose_import));
    }

    @Test
    public void authoritativeCopyResolvesBothLocalesWithoutCallerFallback() {
        Assert.assertEquals(
                "Patch settings",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_header_title,
                        "en"));
        Assert.assertEquals(
                "Настройки патчей",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_header_title,
                        "ru"));
    }

    @Test
    public void localeNormalizationAndFormattingStayBehindTheSeam() {
        Assert.assertEquals(
                "Системный (Русский)",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_language_system_value,
                        "ru-RU",
                        "Русский"));
        Assert.assertEquals(
                "System default (English)",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_language_system_value,
                        "fr-FR",
                        "English"));
    }

    @Test
    public void authorityEliminatesLegacyCallerFallbackDrift() {
        Assert.assertEquals(
                "",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_group_keyboard_header_summary,
                        "en"));
        Assert.assertEquals(
                "Controls Gboard AI Writing Tools availability, keyboard support, "
                        + "and backend routing.",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_ai_writing_tools_summary,
                        "en"));
    }

    @Test
    public void quantityProjectionUsesTheSameLocaleAuthority() {
        Assert.assertEquals(
                "1 minute",
                GboardSettingsText.resolveStableQuantityForTesting(
                        R.plurals.gboard_patches_minutes,
                        "en",
                        1));
        Assert.assertEquals(
                "2 minutes",
                GboardSettingsText.resolveStableQuantityForTesting(
                        R.plurals.gboard_patches_minutes,
                        "en",
                        2));
        Assert.assertEquals(
                "2 минуты",
                GboardSettingsText.resolveStableQuantityForTesting(
                        R.plurals.gboard_patches_minutes,
                        "ru",
                        2));
    }

    @Test
    public void everyGeneratedSettingsStringHasEnglishAndRussianCoverage()
            throws Exception {
        for (Field field : R.string.class.getDeclaredFields()) {
            if (!Modifier.isStatic(field.getModifiers()) || field.getType() != int.class) {
                continue;
            }
            int resId = field.getInt(null);
            Assert.assertNotNull(
                    field.getName() + " missing English settings text",
                    GboardSettingsText.resolveStableTextForTesting(resId, "en"));
            Assert.assertNotNull(
                    field.getName() + " missing Russian settings text",
                    GboardSettingsText.resolveStableTextForTesting(resId, "ru"));
        }
    }
}
