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

    private static volatile String sEdgeToken = null;
    private static volatile long sEdgeTokenExpiryMs = 0L;

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

        if ("microsoft".equalsIgnoreCase(engine)) {
            try {
                return translateBatchMicrosoft(src, dst, items);
            } catch (Throwable t) {
                Log.w(TAG, "Microsoft Translator failed, falling back to Google Chrome NMT", t);
            }
        }
        return translateBatchGoogleChrome(src, dst, items);
    }

    private static BatchResult translateBatchGoogleChrome(String sl, String tl, String[] items) throws Exception {
        String urlStr = "https://translate.googleapis.com/translate_a/t?client=dict-chrome-ex"
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

    private static synchronized String getEdgeAuthToken() throws Exception {
        long now = System.currentTimeMillis();
        if (sEdgeToken != null && now < sEdgeTokenExpiryMs) {
            return sEdgeToken;
        }
        HttpURLConnection conn = (HttpURLConnection) new URL("https://edge.microsoft.com/translate/auth").openConnection();
        conn.setConnectTimeout(8000);
        conn.setReadTimeout(10000);
        conn.setRequestProperty("User-Agent", EDGE_UA);
        try {
            if (conn.getResponseCode() != 200) {
                throw new IllegalStateException("Edge auth HTTP " + conn.getResponseCode());
            }
            String tok = readUtf8(conn.getInputStream()).trim();
            if (tok.length() < 20) throw new IllegalStateException("Empty Edge token");
            sEdgeToken = tok;
            sEdgeTokenExpiryMs = now + 8 * 60 * 1000L;
            return tok;
        } finally {
            conn.disconnect();
        }
    }

    private static BatchResult translateBatchMicrosoft(String sl, String tl, String[] items) throws Exception {
        String token = getEdgeAuthToken();
        String msTo = toMicrosoftLang(tl);
        StringBuilder urlSb = new StringBuilder(
                "https://api-edge.cognitive.microsofttranslator.com/translate?api-version=3.0&textType=html&to=")
                .append(URLEncoder.encode(msTo, "UTF-8"));
        if (!"auto".equals(sl)) {
            urlSb.append("&from=").append(URLEncoder.encode(toMicrosoftLang(sl), "UTF-8"));
        }

        JSONArray reqArr = new JSONArray();
        for (String item : items) {
            JSONObject obj = new JSONObject();
            obj.put("Text", item != null ? item : "");
            reqArr.put(obj);
        }
        byte[] payload = reqArr.toString().getBytes(StandardCharsets.UTF_8);

        HttpURLConnection conn = (HttpURLConnection) new URL(urlSb.toString()).openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        conn.setConnectTimeout(10000);
        conn.setReadTimeout(15000);
        conn.setRequestProperty("User-Agent", EDGE_UA);
        conn.setRequestProperty("Authorization", "Bearer " + token);
        conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
        try {
            try (OutputStream os = conn.getOutputStream()) {
                os.write(payload);
            }
            int code = conn.getResponseCode();
            if (code == 401) {
                sEdgeToken = null;
                sEdgeTokenExpiryMs = 0L;
            }
            if (code != 200) {
                throw new IllegalStateException("Microsoft Translate HTTP " + code);
            }
            JSONArray root = new JSONArray(readUtf8(conn.getInputStream()));
            String[] out = new String[items.length];
            String detected = "";
            for (int i = 0; i < items.length; i++) {
                JSONObject entry = root.optJSONObject(i);
                if (entry != null) {
                    if (detected.isEmpty()) {
                        JSONObject dl = entry.optJSONObject("detectedLanguage");
                        if (dl != null) detected = normalizeLang(dl.optString("language", ""));
                    }
                    JSONArray trans = entry.optJSONArray("translations");
                    if (trans != null && trans.length() > 0) {
                        out[i] = trans.getJSONObject(0).optString("text", items[i]);
                        continue;
                    }
                }
                out[i] = items[i];
            }
            return new BatchResult(out, detected);
        } finally {
            conn.disconnect();
        }
    }

    private static String toMicrosoftLang(String code) {
        if ("zh-CN".equalsIgnoreCase(code)) return "zh-Hans";
        if ("zh-TW".equalsIgnoreCase(code)) return "zh-Hant";
        return code;
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
