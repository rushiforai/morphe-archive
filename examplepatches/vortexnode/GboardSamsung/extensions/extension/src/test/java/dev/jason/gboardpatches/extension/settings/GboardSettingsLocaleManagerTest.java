package dev.jason.gboardpatches.extension.settings;

import org.junit.Assert;
import org.junit.Test;

import java.util.Locale;

public final class GboardSettingsLocaleManagerTest {
    @Test
    public void systemPreferenceSelectsRussianForRussianDeviceLocales() {
        Assert.assertEquals(
                GboardSettingsLocaleManager.LANGUAGE_RUSSIAN,
                GboardSettingsLocaleManager.resolveEffectiveLanguageTag(
                        GboardSettingsLocaleManager.LANGUAGE_SYSTEM,
                        Locale.forLanguageTag("ru-RU")));
        Assert.assertEquals(
                GboardSettingsLocaleManager.LANGUAGE_RUSSIAN,
                GboardSettingsLocaleManager.resolveEffectiveLanguageTag(
                        GboardSettingsLocaleManager.LANGUAGE_SYSTEM,
                        Locale.forLanguageTag("ru")));
    }

    @Test
    public void systemPreferenceFallsBackToEnglishForEnglishAndUnsupportedLocales() {
        Assert.assertEquals(
                GboardSettingsLocaleManager.LANGUAGE_ENGLISH,
                GboardSettingsLocaleManager.resolveEffectiveLanguageTag(
                        GboardSettingsLocaleManager.LANGUAGE_SYSTEM,
                        Locale.US));
        Assert.assertEquals(
                GboardSettingsLocaleManager.LANGUAGE_ENGLISH,
                GboardSettingsLocaleManager.resolveEffectiveLanguageTag(
                        GboardSettingsLocaleManager.LANGUAGE_SYSTEM,
                        Locale.GERMANY));
        Assert.assertEquals(
                GboardSettingsLocaleManager.LANGUAGE_ENGLISH,
                GboardSettingsLocaleManager.resolveEffectiveLanguageTag(
                        GboardSettingsLocaleManager.LANGUAGE_SYSTEM,
                        Locale.JAPAN));
        Assert.assertEquals(
                GboardSettingsLocaleManager.LANGUAGE_ENGLISH,
                GboardSettingsLocaleManager.resolveEffectiveLanguageTag(
                        GboardSettingsLocaleManager.LANGUAGE_SYSTEM,
                        Locale.forLanguageTag("zh-Hant-TW")));
    }

    @Test
    public void explicitOverrideTakesPrecedenceOverDeviceLocale() {
        Assert.assertEquals(
                GboardSettingsLocaleManager.LANGUAGE_RUSSIAN,
                GboardSettingsLocaleManager.resolveEffectiveLanguageTag(
                        GboardSettingsLocaleManager.LANGUAGE_RUSSIAN,
                        Locale.US));
        Assert.assertEquals(
                GboardSettingsLocaleManager.LANGUAGE_ENGLISH,
                GboardSettingsLocaleManager.resolveEffectiveLanguageTag(
                        GboardSettingsLocaleManager.LANGUAGE_ENGLISH,
                        Locale.forLanguageTag("ru-RU")));
    }

    @Test
    public void legacyOrUnknownPreferencesNormalizeToSystem() {
        Assert.assertEquals(
                GboardSettingsLocaleManager.LANGUAGE_SYSTEM,
                GboardSettingsLocaleManager.normalizePreferenceValue("zh-Hant"));
        Assert.assertEquals(
                GboardSettingsLocaleManager.LANGUAGE_SYSTEM,
                GboardSettingsLocaleManager.normalizePreferenceValue("zh-TW"));
        Assert.assertEquals(
                GboardSettingsLocaleManager.LANGUAGE_SYSTEM,
                GboardSettingsLocaleManager.normalizePreferenceValue(null));
        Assert.assertEquals(
                GboardSettingsLocaleManager.LANGUAGE_SYSTEM,
                GboardSettingsLocaleManager.normalizePreferenceValue(""));
    }
}
