package dev.vortexnode.sbrowserx.extension;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public final class SBrowserXGoogleTranslator {
    private static final String TAG = "SBrowserXTranslate";
    private static final ExecutorService EXECUTOR = Executors.newFixedThreadPool(4);
    private static final String CHROME_UA =
            "Mozilla/5.0 (Linux; Android 16; SM-S901U1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36";
    private static final String EDGE_UA =
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0";

    private static volatile String sBingIg = null;
    private static volatile String sBingIid = null;
    private static volatile String sBingKey = null;
    private static volatile String sBingToken = null;
    private static volatile String sBingCookie = null;
    private static volatile long sBingExpiryMs = 0L;

    public static final String[][] SUPPORTED_LANGUAGES = new String[][] {
            {"en", "English"},
            {"ru", "Русский (Russian)"},
            {"uk", "Українська (Ukrainian)"},
            {"es", "Español (Spanish)"},
            {"pt", "Português (Portuguese)"},
            {"de", "Deutsch (German)"},
            {"fr", "Français (French)"},
            {"it", "Italiano (Italian)"},
            {"pl", "Polski (Polish)"},
            {"tr", "Türkçe (Turkish)"},
            {"ar", "العربية (Arabic)"},
            {"hi", "हिन्दी (Hindi)"},
            {"zh-CN", "中文 简体 (Chinese Simplified)"},
            {"zh-TW", "中文 繁體 (Chinese Traditional)"},
            {"ja", "日本語 (Japanese)"},
            {"ko", "한국어 (Korean)"},
            {"nl", "Nederlands (Dutch)"},
            {"sv", "Svenska (Swedish)"},
            {"cs", "Čeština (Czech)"},
            {"ro", "Română (Romanian)"},
            {"el", "Ελληνικά (Greek)"},
            {"he", "עברית (Hebrew)"},
            {"th", "ไทย (Thai)"},
            {"vi", "Tiếng Việt (Vietnamese)"},
            {"id", "Bahasa Indonesia (Indonesian)"},
            {"ms", "Bahasa Melayu (Malay)"},
            {"fa", "فارسی (Persian)"},
            {"bg", "Български (Bulgarian)"},
            {"sr", "Српски (Serbian)"},
            {"hr", "Hrvatski (Croatian)"},
            {"sk", "Slovenčina (Slovak)"},
            {"hu", "Magyar (Hungarian)"},
            {"fi", "Suomi (Finnish)"},
            {"da", "Dansk (Danish)"},
            {"no", "Norsk (Norwegian)"},
            {"ca", "Català (Catalan)"},
            {"lt", "Lietuvių (Lithuanian)"},
            {"lv", "Latviešu (Latvian)"},
            {"et", "Eesti (Estonian)"},
            {"sl", "Slovenščina (Slovenian)"}
    };

    public static final class BatchResult {
        public final String[] translations;
        public final String detectedLang;

        public BatchResult(String[] translations, String detectedLang) {
            this.translations = translations;
            this.detectedLang = detectedLang;
        }
    }

    private SBrowserXGoogleTranslator() {}

    public static String getLanguageDisplayName(String code) {
        if (code == null) return "English";
        String norm = normalizeLang(code);
        for (String[] pair : SUPPORTED_LANGUAGES) {
            if (pair[0].equalsIgnoreCase(norm) || pair[0].equalsIgnoreCase(code)) {
                return pair[1];
            }
        }
        return code;
    }

    private static boolean isEnabled() {
        Context ctx = SBrowserXPrefs.getAppContext();
        return ctx == null || SBrowserXPrefs.isGoogleTranslateEnabled(ctx);
    }

    private static boolean isTranslateV2() {
        try {
            Class<?> cls = Class.forName("com.sec.android.app.sbrowser.common.extensions.SixStatus");
            Object inst = cls.getMethod("getInstance").invoke(null);
            Boolean v2 = (Boolean) cls.getMethod("isTranslateV2").invoke(inst);
            return v2 != null && v2;
        } catch (Throwable t) {
            return true;
        }
    }

    /**
     * Native batch HTML translation using Google Chrome's dict-chrome-ex endpoint (or Microsoft Edge NMT),
     * preserving sentence context and inline HTML tags without hacky text separators.
     */
    public static BatchResult translateBatchHtml(String engine, String sl, String tl, String[] items) throws Exception {
        if (items == null || items.length == 0) {
            return new BatchResult(new String[0], "");
        }
        String src = (sl == null || sl.isEmpty() || "auto".equalsIgnoreCase(sl) || "und".equalsIgnoreCase(sl))
                ? "auto" : normalizeLang(sl);
        String dst = (tl == null || tl.isEmpty()) ? "en" : normalizeLang(tl);

        if ("gemini".equalsIgnoreCase(engine)) {
            Context ctx = SBrowserXPrefs.getAppContext();
            String key = ctx != null ? SBrowserXPrefs.getTranslateApiKey(ctx).trim() : "";
            if (!key.isEmpty()) {
                try {
                    return translateBatchGemini(key, src, dst, items);
                } catch (Throwable t) {
                    Log.w(TAG, "Gemini Translator failed, falling back to Google Chrome NMT", t);
                }
            }
        } else if ("deepl".equalsIgnoreCase(engine)) {
            Context ctx = SBrowserXPrefs.getAppContext();
            String key = ctx != null ? SBrowserXPrefs.getTranslateApiKey(ctx).trim() : "";
            if (!key.isEmpty()) {
                try {
                    return translateBatchDeepL(key, src, dst, items);
                } catch (Throwable t) {
                    Log.w(TAG, "DeepL Translator failed, falling back to Google Chrome NMT", t);
                }
            }
        } else if ("bing".equalsIgnoreCase(engine) || "microsoft".equalsIgnoreCase(engine)) {
            try {
                return translateBatchBing(src, dst, items);
            } catch (Throwable t) {
                Log.w(TAG, "Bing Translator failed, falling back to Google Chrome NMT", t);
            }
        } else if ("yandex".equalsIgnoreCase(engine)) {
            try {
                return translateBatchYandex(src, dst, items);
            } catch (Throwable t) {
                Log.w(TAG, "Yandex Translate failed, falling back to Google Chrome NMT", t);
            }
        }
        return translateBatchGoogleChrome(src, dst, items);
    }

    private static BatchResult translateBatchGoogleChrome(String sl, String tl, String[] items) throws Exception {
        try {
            return translateBatchGoogleEndpoint("gtx", sl, tl, items);
        } catch (Throwable t) {
            Log.w(TAG, "Google gtx failed, falling back to dict-chrome-ex", t);
            return translateBatchGoogleEndpoint("dict-chrome-ex", sl, tl, items);
        }
    }

    private static BatchResult translateBatchGoogleEndpoint(String client, String sl, String tl, String[] items) throws Exception {
        String urlStr = "https://translate.googleapis.com/translate_a/t?client=" + client
                + "&sl=" + URLEncoder.encode(sl, "UTF-8")
                + "&tl=" + URLEncoder.encode(tl, "UTF-8")
                + "&format=html";

        StringBuilder form = new StringBuilder();
        for (int i = 0; i < items.length; i++) {
            if (i > 0) form.append('&');
            form.append("q=").append(URLEncoder.encode(items[i] != null ? items[i] : "", "UTF-8"));
        }
        byte[] bodyBytes = form.toString().getBytes(StandardCharsets.UTF_8);

        HttpURLConnection conn = (HttpURLConnection) new URL(urlStr).openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        conn.setConnectTimeout(10000);
        conn.setReadTimeout(15000);
        conn.setRequestProperty("User-Agent", CHROME_UA);
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
        try {
            try (OutputStream os = conn.getOutputStream()) {
                os.write(bodyBytes);
            }
            int code = conn.getResponseCode();
            if (code != 200) {
                throw new IllegalStateException("Google dict-chrome-ex HTTP " + code);
            }
            String resp = readUtf8(conn.getInputStream());
            JSONArray root = new JSONArray(resp);
            String[] out = new String[items.length];
            String detected = "";

            // When sl="auto", dict-chrome-ex returns [["translated", "en"], ...]
            // When sl is explicit, it returns ["translated1", "translated2", ...]
            for (int i = 0; i < items.length; i++) {
                if (i < root.length()) {
                    Object el = root.get(i);
                    if (el instanceof JSONArray) {
                        JSONArray pair = (JSONArray) el;
                        out[i] = pair.optString(0, items[i]);
                        if (detected.isEmpty() && pair.length() > 1) {
                            detected = normalizeLang(pair.optString(1, ""));
                        }
                    } else if (el instanceof String) {
                        out[i] = (String) el;
                    } else {
                        out[i] = items[i];
                    }
                } else {
                    out[i] = items[i];
                }
            }
            return new BatchResult(out, detected);
        } finally {
            conn.disconnect();
        }
    }

    public static void warmUpIfNeeded(Context ctx) {
        if (ctx == null) return;
        String eng = SBrowserXPrefs.getTranslateEngine(ctx);
        if ("bing".equalsIgnoreCase(eng) || "microsoft".equalsIgnoreCase(eng)) {
            EXECUTOR.execute(() -> {
                try { ensureBingSession(); } catch (Throwable ignored) {}
            });
        }
    }

    private static synchronized void ensureBingSession() throws Exception {
        long now = System.currentTimeMillis();
        if (sBingToken != null && sBingKey != null && sBingIg != null && now < sBingExpiryMs) {
            return;
        }
        HttpURLConnection conn = (HttpURLConnection) new URL("https://www.bing.com/translator").openConnection();
        conn.setConnectTimeout(10000);
        conn.setReadTimeout(12000);
        conn.setRequestProperty("User-Agent", EDGE_UA);
        conn.setRequestProperty("Accept-Language", "en-US,en;q=0.9");
        try {
            if (conn.getResponseCode() != 200) {
                throw new IllegalStateException("Bing session HTTP " + conn.getResponseCode());
            }
            java.util.List<String> setCookies = conn.getHeaderFields().get("Set-Cookie");
            StringBuilder cookieSb = new StringBuilder();
            if (setCookies != null) {
                for (String c : setCookies) {
                    if (c == null) continue;
                    int semi = c.indexOf(';');
                    String pair = semi > 0 ? c.substring(0, semi) : c;
                    if (cookieSb.length() > 0) cookieSb.append("; ");
                    cookieSb.append(pair);
                }
            }
            String html = readUtf8(conn.getInputStream());
            java.util.regex.Matcher igM = java.util.regex.Pattern.compile("IG:\"([A-F0-9]+)\"").matcher(html);
            java.util.regex.Matcher iidM = java.util.regex.Pattern.compile("data-iid=\"([^\"]+)\"").matcher(html);
            java.util.regex.Matcher tokM = java.util.regex.Pattern.compile("params_AbusePreventionHelper\\s*=\\s*\\[(\\d+),\"([^\"]+)\"").matcher(html);
            if (!igM.find() || !tokM.find()) {
                throw new IllegalStateException("Bing token parse failed");
            }
            sBingIg = igM.group(1);
            sBingIid = iidM.find() ? iidM.group(1) : "translator.5028";
            sBingKey = tokM.group(1);
            sBingToken = tokM.group(2);
            sBingCookie = cookieSb.toString();
            sBingExpiryMs = now + 8L * 60L * 1000L;
        } finally {
            conn.disconnect();
        }
    }

    private static BatchResult translateBatchBing(String sl, String tl, String[] items) throws Exception {
        ensureBingSession();
        String fromLang = "auto".equals(sl) ? "auto-detect" : toMicrosoftLang(sl);
        String toLang = toMicrosoftLang(tl);
        String[] out = new String[items.length];
        String detected = "";
        int i = 0;
        while (i < items.length) {
            int start = i;
            StringBuilder joined = new StringBuilder();
            while (i < items.length) {
                String piece = items[i] != null ? items[i] : "";
                String sep = (i == start) ? "" : "\n|||SBX" + (i - start) + "|||\n";
                if (i > start && joined.length() + sep.length() + piece.length() > 3000) break;
                joined.append(sep).append(piece);
                i++;
            }
            int count = i - start;
            String endpoint = "https://www.bing.com/ttranslatev3?isVertical=1&&IG=" + sBingIg + "&IID=" + sBingIid + ".1";
            String form = "fromLang=" + URLEncoder.encode(fromLang, "UTF-8")
                    + "&to=" + URLEncoder.encode(toLang, "UTF-8")
                    + "&text=" + URLEncoder.encode(joined.toString(), "UTF-8")
                    + "&token=" + URLEncoder.encode(sBingToken, "UTF-8")
                    + "&key=" + URLEncoder.encode(sBingKey, "UTF-8");
            byte[] payload = form.getBytes(StandardCharsets.UTF_8);
            HttpURLConnection conn = (HttpURLConnection) new URL(endpoint).openConnection();
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            conn.setConnectTimeout(10000);
            conn.setReadTimeout(15000);
            conn.setRequestProperty("User-Agent", EDGE_UA);
            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
            conn.setRequestProperty("Referer", "https://www.bing.com/translator");
            if (sBingCookie != null && !sBingCookie.isEmpty()) {
                conn.setRequestProperty("Cookie", sBingCookie);
            }
            try {
                try (OutputStream os = conn.getOutputStream()) { os.write(payload); }
                int code = conn.getResponseCode();
                if (code != 200) {
                    sBingExpiryMs = 0L;
                    throw new IllegalStateException("Bing HTTP " + code);
                }
                String body = readUtf8(conn.getInputStream());
                if (!body.trim().startsWith("[")) {
                    sBingExpiryMs = 0L;
                    throw new IllegalStateException("Bing non-array response");
                }
                JSONArray root = new JSONArray(body);
                JSONObject first = root.getJSONObject(0);
                if (detected.isEmpty()) {
                    JSONObject dl = first.optJSONObject("detectedLanguage");
                    if (dl != null) detected = normalizeLang(dl.optString("language", ""));
                }
                String translatedAll = first.getJSONArray("translations").getJSONObject(0).getString("text");
                if (count == 1) {
                    out[start] = translatedAll;
                } else {
                    String[] split = translatedAll.split("\\s*\\|\\|\\|SBX\\d+\\|\\|\\|\\s*", -1);
                    if (split.length == count) {
                        for (int k = 0; k < count; k++) out[start + k] = split[k].trim();
                    } else {
                        throw new IllegalStateException("Bing separator mismatch: " + split.length + " vs " + count);
                    }
                }
            } finally {
                conn.disconnect();
            }
        }
        return new BatchResult(out, detected);
    }

    private static BatchResult translateBatchYandex(String sl, String tl, String[] items) throws Exception {
        String yTo = toYandexLang(tl);
        String langParam = "auto".equals(sl) ? yTo : (toYandexLang(sl) + "-" + yTo);
        String urlStr = "https://translate.yandex.net/api/v1/tr.json/translate?srv=browser_video_translation&lang="
                + URLEncoder.encode(langParam, "UTF-8");
        StringBuilder form = new StringBuilder();
        for (int i = 0; i < items.length; i++) {
            if (i > 0) form.append('&');
            form.append("text=").append(URLEncoder.encode(items[i] != null ? items[i] : "", "UTF-8"));
        }
        byte[] payload = form.toString().getBytes(StandardCharsets.UTF_8);
        HttpURLConnection conn = (HttpURLConnection) new URL(urlStr).openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        conn.setConnectTimeout(10000);
        conn.setReadTimeout(15000);
        conn.setRequestProperty("User-Agent", CHROME_UA);
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
        try {
            try (OutputStream os = conn.getOutputStream()) { os.write(payload); }
            int code = conn.getResponseCode();
            if (code != 200) throw new IllegalStateException("Yandex HTTP " + code);
            JSONObject root = new JSONObject(readUtf8(conn.getInputStream()));
            if (root.optInt("code", 200) != 200) {
                throw new IllegalStateException("Yandex API code " + root.optInt("code"));
            }
            String detected = "";
            String respLang = root.optString("lang", "");
            int dash = respLang.indexOf('-');
            if (dash > 0) detected = normalizeLang(respLang.substring(0, dash));
            JSONArray arr = root.getJSONArray("text");
            String[] out = new String[items.length];
            for (int i = 0; i < items.length; i++) {
                out[i] = i < arr.length() ? arr.optString(i, items[i]) : items[i];
            }
            return new BatchResult(out, detected);
        } finally {
            conn.disconnect();
        }
    }

    private static String toYandexLang(String code) {
        if ("zh-CN".equalsIgnoreCase(code) || "zh-TW".equalsIgnoreCase(code)) return "zh";
        return code;
    }

    private static String toMicrosoftLang(String code) {
        if ("zh-CN".equalsIgnoreCase(code)) return "zh-Hans";
        if ("zh-TW".equalsIgnoreCase(code)) return "zh-Hant";
        return code;
    }

    private static String toDeepLLang(String code, boolean isTarget) {
        if (code == null || code.isEmpty()) return "EN";
        if ("zh-CN".equalsIgnoreCase(code)) return isTarget ? "ZH-HANS" : "ZH";
        if ("zh-TW".equalsIgnoreCase(code)) return isTarget ? "ZH-HANT" : "ZH";
        if ("pt".equalsIgnoreCase(code) && isTarget) return "PT-PT";
        if ("en".equalsIgnoreCase(code) && isTarget) return "EN-US";
        return code.toUpperCase(java.util.Locale.US);
    }

    private static BatchResult translateBatchDeepL(String apiKey, String sl, String tl, String[] items) throws Exception {
        boolean isFree = apiKey.endsWith(":fx");
        String endpoint = isFree ? "https://api-free.deepl.com/v2/translate" : "https://api.deepl.com/v2/translate";
        JSONObject req = new JSONObject();
        JSONArray textArr = new JSONArray();
        for (String item : items) textArr.put(item != null ? item : "");
        req.put("text", textArr);
        req.put("target_lang", toDeepLLang(tl, true));
        if (!"auto".equals(sl)) {
            req.put("source_lang", toDeepLLang(sl, false));
        }
        req.put("tag_handling", "html");
        byte[] payload = req.toString().getBytes(StandardCharsets.UTF_8);
        HttpURLConnection conn = (HttpURLConnection) new URL(endpoint).openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        conn.setConnectTimeout(10000);
        conn.setReadTimeout(18000);
        conn.setRequestProperty("Authorization", "DeepL-Auth-Key " + apiKey);
        conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
        try {
            try (OutputStream os = conn.getOutputStream()) { os.write(payload); }
            int code = conn.getResponseCode();
            if (code != 200) throw new IllegalStateException("DeepL HTTP " + code);
            JSONObject root = new JSONObject(readUtf8(conn.getInputStream()));
            JSONArray trans = root.getJSONArray("translations");
            String[] out = new String[items.length];
            String detected = "";
            for (int i = 0; i < items.length; i++) {
                JSONObject entry = trans.optJSONObject(i);
                if (entry != null) {
                    if (detected.isEmpty()) detected = normalizeLang(entry.optString("detected_source_language", ""));
                    out[i] = entry.optString("text", items[i]);
                } else {
                    out[i] = items[i];
                }
            }
            return new BatchResult(out, detected);
        } finally {
            conn.disconnect();
        }
    }

    private static BatchResult translateBatchGemini(String apiKey, String sl, String tl, String[] items) throws Exception {
        String targetName = getLanguageDisplayName(tl);
        JSONArray inputArr = new JSONArray();
        for (String item : items) inputArr.put(item != null ? item : "");
        String prompt = "Translate every string in the JSON array into natural, idiomatic " + targetName
                + " (code: " + tl + "). Preserve all HTML tags, attributes, placeholders, numbers, brand names, and array order/length ("
                + items.length + " items). Return ONLY a JSON array of " + items.length + " translated strings.\n"
                + inputArr.toString();
        JSONObject part = new JSONObject().put("text", prompt);
        JSONObject content = new JSONObject().put("parts", new JSONArray().put(part));
        JSONObject genCfg = new JSONObject()
                .put("temperature", 0.1)
                .put("responseMimeType", "application/json");
        JSONObject body = new JSONObject()
                .put("contents", new JSONArray().put(content))
                .put("generationConfig", genCfg);
        String[] models = new String[] {
                "gemini-3.5-flash-lite", "gemini-flash-lite-latest", "gemini-3.6-flash", "gemini-flash-latest"
        };
        byte[] payload = body.toString().getBytes(StandardCharsets.UTF_8);
        JSONObject root = null;
        int lastCode = 0;
        for (String model : models) {
            String urlStr = "https://generativelanguage.googleapis.com/v1beta/models/" + model
                    + ":generateContent?key=" + URLEncoder.encode(apiKey, "UTF-8");
            HttpURLConnection conn = (HttpURLConnection) new URL(urlStr).openConnection();
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            conn.setConnectTimeout(12000);
            conn.setReadTimeout(25000);
            conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
            try {
                try (OutputStream os = conn.getOutputStream()) { os.write(payload); }
                lastCode = conn.getResponseCode();
                if (lastCode == 200) {
                    root = new JSONObject(readUtf8(conn.getInputStream()));
                    break;
                }
                if (lastCode != 404 && lastCode != 400) break;
            } finally {
                conn.disconnect();
            }
        }
        if (root == null) throw new IllegalStateException("Gemini HTTP " + lastCode);
        try {
            String text = root.getJSONArray("candidates").getJSONObject(0)
                    .getJSONObject("content").getJSONArray("parts").getJSONObject(0).getString("text").trim();
            if (text.startsWith("```")) {
                int nl = text.indexOf('\n');
                if (nl > 0) text = text.substring(nl + 1);
                if (text.endsWith("```")) text = text.substring(0, text.length() - 3).trim();
            }
            JSONArray outArr = new JSONArray(text);
            if (outArr.length() != items.length) {
                throw new IllegalStateException("Gemini length mismatch: " + outArr.length() + " vs " + items.length);
            }
            String[] out = new String[items.length];
            for (int i = 0; i < items.length; i++) {
                out[i] = outArr.optString(i, items[i]);
            }
            return new BatchResult(out, "auto".equals(sl) ? "" : sl);
        } finally {
            // connections closed per attempt above
        }
    }

    public static String detectLanguageFast(String sampleText) {
        try {
            if (sampleText == null || sampleText.trim().length() < 12) return "";
            String cut = sampleText.length() > 220 ? sampleText.substring(0, 220) : sampleText;
            BatchResult br = translateBatchGoogleChrome("auto", "en", new String[] {cut});
            return br.detectedLang != null ? br.detectedLang : "";
        } catch (Throwable t) {
            return "";
        }
    }

    // --- SixTransService lifecycle callbacks ---

    public static boolean handleGetSupport(Object service, long cb) {
        if (service == null || !isEnabled()) return false;
        String support = isTranslateV2() ? "ON_DEVICE_V2" : "ON_DEVICE";
        deliverArray(service, "getSupportResult", cb, new String[] {"Success", support});
        return true;
    }

    public static boolean handleGetMode(Object service, long cb) {
        if (service == null || !isEnabled()) return false;
        String mode = isTranslateV2() ? "ON_DEVICE_V2" : "CLOUD";
        deliverArray(service, "getModeResult", cb, new String[] {"Success", mode});
        return true;
    }

    public static boolean handleCreateTrans(Object service, long cb) {
        if (service == null || !isEnabled()) return false;
        deliverArray(service, "createTransResult", cb, new String[] {"Success"});
        return true;
    }

    public static boolean handleDestroyTrans(Object service, long cb) {
        if (service == null || !isEnabled()) return false;
        deliverArray(service, "destroyTransResult", cb, new String[] {"Success"});
        return true;
    }

    public static boolean handleClear(Object service, long cb) {
        if (service == null || !isEnabled()) return false;
        deliverString(service, "clearResult", cb, "Success");
        return true;
    }

    public static boolean handleRefresh(Object service, long cb) {
        if (service == null || !isEnabled()) return false;
        deliverString(service, "refreshResult", cb, "Success");
        return true;
    }

    public static boolean handleGetLangList(Object service, String direction, long cb) {
        if (service == null || !isEnabled()) return false;
        boolean v2 = isTranslateV2();
        int extra = v2 ? 0 : 1;
        String[] langs = new String[SUPPORTED_LANGUAGES.length + extra];
        if (!v2) langs[0] = "Success";
        for (int i = 0; i < SUPPORTED_LANGUAGES.length; i++) {
            langs[i + extra] = SUPPORTED_LANGUAGES[i][0];
        }
        String dir = direction != null ? direction : "TARGET";
        new Handler(Looper.getMainLooper()).post(() -> {
            try {
                Method m = service.getClass().getMethod("getLangListResult", long.class, String.class, String[].class);
                m.invoke(service, cb, dir, langs);
            } catch (Throwable t) {
                Log.e(TAG, "deliver getLangListResult failed", t);
            }
        });
        return true;
    }

    public static boolean handleDetectionLang(Object service, String text, long cb) {
        if (service == null || !isEnabled()) return false;
        EXECUTOR.execute(() -> {
            String detected = detectLanguageFast(text);
            if (detected.isEmpty()) detected = "en";
            boolean v2 = isTranslateV2();
            String[] res = v2 ? new String[] {detected} : new String[] {"Success", detected};
            deliverArray(service, "detectionLangResult", cb, res);
        });
        return true;
    }

    public static boolean handleTranslate(
            Object sixTransService,
            String sourceLang,
            String targetLang,
            String[] textList,
            long nativeCallback
    ) {
        if (sixTransService == null || textList == null || textList.length == 0) return false;
        if (!isEnabled()) return false;

        Context ctx = SBrowserXPrefs.getAppContext();
        final String sl = (sourceLang == null || sourceLang.isEmpty() || "auto".equalsIgnoreCase(sourceLang))
                ? "auto" : normalizeLang(sourceLang);
        String resolvedTarget = targetLang;
        if ((resolvedTarget == null || resolvedTarget.isEmpty()) && ctx != null) {
            resolvedTarget = SBrowserXPrefs.getTranslateTargetLang(ctx);
        }
        final String tl = (resolvedTarget == null || resolvedTarget.isEmpty())
                ? "en" : normalizeLang(resolvedTarget);
        final String engine = ctx != null ? SBrowserXPrefs.getTranslateEngine(ctx) : "google";

        if (ctx != null && !"auto".equals(sl) && !sl.equalsIgnoreCase(tl)) {
            Set<String> never = SBrowserXPrefs.getTranslateNeverLangs(ctx);
            Set<String> always = SBrowserXPrefs.getTranslateAlwaysLangs(ctx);
            if (never.contains(sl) && !always.contains(sl)) {
                deliverTranslatePayload(sixTransService, nativeCallback, textList);
                return true;
            }
        }

        EXECUTOR.execute(() -> {
            try {
                BatchResult br = translateBatchHtml(engine, sl, tl, textList);
                deliverTranslatePayload(sixTransService, nativeCallback, br.translations);
            } catch (Throwable t) {
                Log.e(TAG, "handleTranslate failed", t);
                deliverTranslatePayload(sixTransService, nativeCallback, textList);
            }
        });
        return true;
    }

    private static void deliverTranslatePayload(Object service, long cb, String[] results) {
        boolean v2 = isTranslateV2();
        if (v2) {
            deliverArray(service, "translateResult", cb, results);
        } else {
            String[] wrapped = new String[results.length + 1];
            wrapped[0] = "Success";
            System.arraycopy(results, 0, wrapped, 1, results.length);
            deliverArray(service, "translateResult", cb, wrapped);
        }
    }

    public static String normalizeLang(String code) {
        if (code == null || code.isEmpty()) return "";
        String c = code.trim().replace('_', '-');
        if (c.equalsIgnoreCase("zh-cn") || c.equalsIgnoreCase("zh-hans")) return "zh-CN";
        if (c.equalsIgnoreCase("zh-tw") || c.equalsIgnoreCase("zh-hant")) return "zh-TW";
        int dash = c.indexOf('-');
        return dash > 0 ? c.substring(0, dash).toLowerCase() : c.toLowerCase();
    }

    private static void deliverArray(Object service, String methodName, long cb, String[] payload) {
        new Handler(Looper.getMainLooper()).post(() -> {
            try {
                Method m = service.getClass().getMethod(methodName, long.class, String[].class);
                m.invoke(service, cb, payload);
            } catch (Throwable t) {
                Log.e(TAG, "deliver " + methodName + " failed", t);
            }
        });
    }

    private static void deliverString(Object service, String methodName, long cb, String payload) {
        new Handler(Looper.getMainLooper()).post(() -> {
            try {
                Method m = service.getClass().getMethod(methodName, long.class, String.class);
                m.invoke(service, cb, payload);
            } catch (Throwable t) {
                Log.e(TAG, "deliver " + methodName + " failed", t);
            }
        });
    }

    private static String readUtf8(InputStream is) throws Exception {
        try (InputStream in = is; ByteArrayOutputStream bos = new ByteArrayOutputStream()) {
            byte[] buf = new byte[4096];
            int n;
            while ((n = in.read(buf)) != -1) {
                bos.write(buf, 0, n);
            }
            return new String(bos.toByteArray(), StandardCharsets.UTF_8);
        }
    }
}
