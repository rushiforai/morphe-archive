/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.utils;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.LocaleList;

import java.util.Locale;
import java.util.concurrent.ConcurrentHashMap;

import app.morphe.extension.rex.sharedPreference.SharedPref;
import app.morphe.extension.shared.Utils;

public final class IgStr {

    public static final String KEY_APP_UI_LANGUAGE = "rex_app_ui_language";
    private static final ConcurrentHashMap<String, Integer> idCache = new ConcurrentHashMap<>();
    private static volatile Context baseContext;
    private static volatile Context localizedContext;
    private static volatile String cachedLangKey;

    private IgStr() {
    }

    public static String getAppUiLanguageName() {
        try {
            String pref = SharedPref.getStringPref(KEY_APP_UI_LANGUAGE, "English");
            if (pref != null && !pref.trim().isEmpty()) {
                return pref.trim();
            }
        } catch (Throwable ignored) {
        }
        return "English";
    }

    public static void setAppUiLanguageName(String languageName) {
        String safe = (languageName == null || languageName.trim().isEmpty()) ? "English" : languageName.trim();
        SharedPref.setStringPref(KEY_APP_UI_LANGUAGE, safe);
        refreshLocale();
    }

    public static Locale resolveSelectedLocale() {
        return localeForLanguageName(getAppUiLanguageName());
    }

    public static Locale localeForLanguageName(String languageName) {
        if (languageName == null) return Locale.ENGLISH;
        String lower = languageName.trim().toLowerCase(Locale.ROOT);
        if (lower.startsWith("portuguese")) return new Locale("pt", "BR");
        if (lower.startsWith("hindi")) return new Locale("hi", "IN");
        if (lower.startsWith("arabic")) return new Locale("ar", "SA");
        if (lower.startsWith("turkish")) return new Locale("tr", "TR");
        if (lower.startsWith("indonesian")) return new Locale("id", "ID");
        if (lower.startsWith("russian")) return new Locale("ru", "RU");
        if (lower.startsWith("spanish")) return new Locale("es", "ES");
        if (lower.startsWith("french")) return new Locale("fr", "FR");
        if (lower.startsWith("german")) return new Locale("de", "DE");
        if (lower.startsWith("japanese")) return new Locale("ja", "JP");
        if (lower.startsWith("korean")) return new Locale("ko", "KR");
        return Locale.ENGLISH;
    }

    public static synchronized void refreshLocale() {
        localizedContext = null;
        cachedLangKey = null;
        try {
            Locale target = resolveSelectedLocale();
            Locale.setDefault(target);
            Context base = baseContext();
            if (base != null) {
                applyLocaleToContext(base);
            }
        } catch (Throwable ignored) {
        }
    }

    public static Context applyLocaleToContext(Context ctx) {
        if (ctx == null) return null;
        try {
            Locale target = resolveSelectedLocale();
            Locale.setDefault(target);
            Resources res = ctx.getResources();
            if (res != null) {
                Configuration cfg = new Configuration(res.getConfiguration());
                cfg.setLocale(target);
                cfg.setLocales(new LocaleList(target));
                // Keep LTR layout direction for Settings cards unless explicitly requested
                cfg.setLayoutDirection(Locale.ENGLISH);
                res.updateConfiguration(cfg, res.getDisplayMetrics());
                return ctx.createConfigurationContext(cfg);
            }
        } catch (Throwable ignored) {
        }
        return ctx;
    }

    public static String str(String name) {
        try {
            Context ctx = localizedContext();
            if (ctx == null) return name;
            Integer cached = idCache.get(name);
            int id = cached != null ? cached : ctx.getResources().getIdentifier(name, "string", ctx.getPackageName());
            if (id == 0) return name;
            if (cached == null) idCache.put(name, id);
            return ctx.getString(id);
        } catch (Exception e) {
            return name;
        }
    }

    public static String str(String name, Object... args) {
        String template = str(name);
        if (template.equals(name)) return name;
        try {
            return String.format(resolveSelectedLocale(), template, args);
        } catch (Exception e) {
            return template;
        }
    }

    private static Context localizedContext() {
        Context base = baseContext();
        if (base == null) return null;
        String currentLang = getAppUiLanguageName();
        Context loc = localizedContext;
        if (loc != null && currentLang.equals(cachedLangKey)) {
            return loc;
        }
        synchronized (IgStr.class) {
            Locale target = localeForLanguageName(currentLang);
            try {
                Configuration cfg = new Configuration(base.getResources().getConfiguration());
                cfg.setLocale(target);
                cfg.setLocales(new LocaleList(target));
                cfg.setLayoutDirection(Locale.ENGLISH);
                localizedContext = base.createConfigurationContext(cfg);
                cachedLangKey = currentLang;
                return localizedContext;
            } catch (Throwable ignored) {
                return base;
            }
        }
    }

    private static Context baseContext() {
        if (baseContext != null) return baseContext;
        Context ctx = Utils.getContext();
        while (ctx instanceof ContextWrapper) {
            Context base = ((ContextWrapper) ctx).getBaseContext();
            if (base == null || base == ctx) break;
            ctx = base;
        }
        baseContext = ctx;
        return baseContext;
    }
}