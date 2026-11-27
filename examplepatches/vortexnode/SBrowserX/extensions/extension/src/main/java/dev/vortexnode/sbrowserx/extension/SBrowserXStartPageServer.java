package dev.vortexnode.sbrowserx.extension;

import android.content.Context;
import android.content.Intent;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Featherweight local loopback server (127.0.0.1) serving the SBrowserX Start Page:
 * - Completely empty minimal canvas when there are no shortcuts (AMOLED black or custom/daily wallpaper).
 * - Optional Open-Meteo weather widget (OFF by default, free, no API key).
 * - Custom shortcuts persisted in SBrowserXPrefs (automatically included in Local & Google Drive backups).
 * - Wallpaper sources: AMOLED Black, Phone Gallery photo, or Bing Daily HD wallpapers with daily auto-rotation.
 */
public final class SBrowserXStartPageServer {
    private static final String TAG = "SBrowserXStartPage";
    private static final int PREFERRED_PORT = 47391;
    private static final long WEATHER_CACHE_TTL_MS = 20L * 60L * 1000L;

    public static final String WALLPAPER_AMOLED = "amoled";
    public static final String WALLPAPER_LOCAL = "local";
    public static final String WALLPAPER_ONLINE = "online";

    private static volatile boolean sStarted = false;
    private static volatile int sPort = PREFERRED_PORT;
    private static volatile Context sAppCtx;

    private static volatile String sCachedWeatherJson = null;
    private static volatile String sCachedWeatherKey = null;
    private static volatile long sCachedWeatherTs = 0L;

    private SBrowserXStartPageServer() {}

    public static String getBaseUrl() {
        return "http://127.0.0.1:" + sPort + "/";
    }

    public static boolean isStartPageUrl(String url) {
        return url != null && url.startsWith("http://127.0.0.1:" + sPort);
    }

    public static void invalidateWeatherCache() {
        sCachedWeatherJson = null;
        sCachedWeatherKey = null;
        sCachedWeatherTs = 0L;
    }

    public static File getLocalWallpaperFile(Context ctx) {
        return new File(ctx.getApplicationContext().getFilesDir(), "sbrowserx_wallpaper_local.jpg");
    }

    public static File getOnlineWallpaperFile(Context ctx) {
        return new File(ctx.getApplicationContext().getFilesDir(), "sbrowserx_wallpaper_online.jpg");
    }

    public static synchronized void ensureStarted(Context ctx) {
        if (ctx != null) sAppCtx = ctx.getApplicationContext();
        if (sStarted) return;
        sStarted = true;
        Thread t = new Thread(SBrowserXStartPageServer::runServerLoop, "SBrowserX-StartPage");
        t.setDaemon(true);
        t.start();
    }

    private static void runServerLoop() {
        ServerSocket server = null;
        try {
            InetAddress lo = InetAddress.getByName("127.0.0.1");
            try {
                server = new ServerSocket(PREFERRED_PORT, 16, lo);
                sPort = PREFERRED_PORT;
            } catch (Throwable busy) {
                server = new ServerSocket(0, 16, lo);
                sPort = server.getLocalPort();
            }
            while (!server.isClosed()) {
                final Socket client = server.accept();
                new Thread(() -> handleClient(client), "SBrowserX-SP-Req").start();
            }
        } catch (Throwable t) {
            Log.w(TAG, "StartPage server stopped", t);
            sStarted = false;
        } finally {
            if (server != null) {
                try { server.close(); } catch (Throwable ignored) {}
            }
        }
    }

    private static void handleClient(Socket socket) {
        try {
            socket.setSoTimeout(5000);
            InputStream in = new BufferedInputStream(socket.getInputStream());
            OutputStream out = socket.getOutputStream();

            String requestLine = readLine(in);
            if (requestLine == null || requestLine.isEmpty()) return;
            String[] parts = requestLine.split(" ");
            if (parts.length < 2) return;
            String method = parts[0];
            String rawPath = parts[1];
            String path = rawPath;
            int qIdx = rawPath.indexOf('?');
            if (qIdx >= 0) path = rawPath.substring(0, qIdx);

            int contentLength = 0;
            String headerLine;
            while ((headerLine = readLine(in)) != null && !headerLine.isEmpty()) {
                int colon = headerLine.indexOf(':');
                if (colon > 0) {
                    String name = headerLine.substring(0, colon).trim().toLowerCase(Locale.US);
                    if ("content-length".equals(name)) {
                        try {
                            contentLength = Integer.parseInt(headerLine.substring(colon + 1).trim());
                        } catch (Throwable ignored) {}
                    }
                }
            }

            byte[] bodyBytes = new byte[0];
            if (contentLength > 0 && contentLength < 256 * 1024) {
                bodyBytes = new byte[contentLength];
                int read = 0;
                while (read < contentLength) {
                    int n = in.read(bodyBytes, read, contentLength - read);
                    if (n < 0) break;
                    read += n;
                }
            }

            Context ctx = sAppCtx != null ? sAppCtx : SBrowserXPrefs.getAppContext();
            if ("/".equals(path) || "/index.html".equals(path)) {
                sendResponse(out, "200 OK", "text/html; charset=utf-8", buildHtmlPage().getBytes(StandardCharsets.UTF_8));
            } else if ("/api/state".equals(path)) {
                sendResponse(out, "200 OK", "application/json; charset=utf-8", buildStateJson(ctx).getBytes(StandardCharsets.UTF_8));
            } else if ("/api/shortcuts".equals(path) && "POST".equalsIgnoreCase(method)) {
                String jsonBody = new String(bodyBytes, StandardCharsets.UTF_8).trim();
                JSONArray arr = new JSONArray(jsonBody);
                if (ctx != null) {
                    SBrowserXPrefs.setStartPageShortcutsJson(ctx, arr.toString());
                }
                sendResponse(out, "200 OK", "application/json; charset=utf-8", "{\"ok\":true}".getBytes(StandardCharsets.UTF_8));
            } else if ("/api/weather".equals(path)) {
                String wJson = fetchWeatherJson(ctx);
                sendResponse(out, "200 OK", "application/json; charset=utf-8", wJson.getBytes(StandardCharsets.UTF_8));
            } else if ("/api/wallpaper".equals(path)) {
                byte[] img = loadWallpaperBytes(ctx);
                if (img != null && img.length > 0) {
                    sendResponse(out, "200 OK", "image/jpeg", img);
                } else {
                    sendResponse(out, "404 Not Found", "text/plain", new byte[0]);
                }
            } else if ("/api/open-settings".equals(path)) {
                if (ctx != null) {
                    try {
                        Intent intent = new Intent(ctx, dev.vortexnode.sbrowserx.extension.settings.SBrowserXStartPageSettingsActivity.class);
                        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                        ctx.startActivity(intent);
                    } catch (Throwable ignored) {}
                }
                sendResponse(out, "200 OK", "application/json; charset=utf-8", "{\"ok\":true}".getBytes(StandardCharsets.UTF_8));
            } else {
                sendResponse(out, "404 Not Found", "text/plain", "Not Found".getBytes(StandardCharsets.UTF_8));
            }
        } catch (Throwable ignored) {
        } finally {
            try { socket.close(); } catch (Throwable ignored) {}
        }
    }

    private static String readLine(InputStream in) throws Exception {
        ByteArrayOutputStream baos = new ByteArrayOutputStream(64);
        int b;
        while ((b = in.read()) != -1) {
            if (b == '\n') break;
            if (b != '\r') baos.write(b);
        }
        if (b == -1 && baos.size() == 0) return null;
        return baos.toString("UTF-8");
    }

    private static void sendResponse(OutputStream out, String status, String contentType, byte[] body) throws Exception {
        String headers = "HTTP/1.1 " + status + "\r\n"
                + "Content-Type: " + contentType + "\r\n"
                + "Content-Length: " + body.length + "\r\n"
                + "Cache-Control: no-store, no-cache, must-revalidate\r\n"
                + "Connection: close\r\n\r\n";
        out.write(headers.getBytes(StandardCharsets.US_ASCII));
        out.write(body);
        out.flush();
    }

    private static String buildStateJson(Context ctx) {
        try {
            JSONObject obj = new JSONObject();
            String mode = ctx != null ? SBrowserXPrefs.getStartPageWallpaperMode(ctx) : WALLPAPER_AMOLED;
            int dim = ctx != null ? SBrowserXPrefs.getStartPageWallpaperDim(ctx) : 30;
            boolean weatherOn = ctx != null && SBrowserXPrefs.isStartPageWeatherEnabled(ctx);
            String city = ctx != null ? SBrowserXPrefs.getStartPageWeatherCity(ctx) : "";
            String unit = ctx != null ? SBrowserXPrefs.getStartPageWeatherUnit(ctx) : "C";
            String shortcutsRaw = ctx != null ? SBrowserXPrefs.getStartPageShortcutsJson(ctx) : "[]";
            JSONArray shortcuts;
            try {
                shortcuts = new JSONArray(shortcutsRaw);
            } catch (Throwable ignored) {
                shortcuts = new JSONArray();
            }

            boolean hasWallpaper = false;
            if (ctx != null) {
                if (WALLPAPER_LOCAL.equals(mode)) {
                    hasWallpaper = getLocalWallpaperFile(ctx).exists();
                } else if (WALLPAPER_ONLINE.equals(mode)) {
                    hasWallpaper = true; // will auto-fetch if not cached yet
                }
            }

            obj.put("wallpaperMode", mode);
            obj.put("wallpaperDim", dim);
            obj.put("hasWallpaper", hasWallpaper);
            obj.put("wallpaperVer", ctx != null ? SBrowserXPrefs.getStartPageWallpaperVersion(ctx) : 1);
            obj.put("weatherEnabled", weatherOn);
            obj.put("weatherCity", city);
            obj.put("weatherUnit", unit);
            obj.put("shortcuts", shortcuts);
            obj.put("lang", Locale.getDefault().getLanguage().startsWith("ru") ? "ru" : "en");
            return obj.toString();
        } catch (Throwable t) {
            return "{}";
        }
    }

    // --- Wallpaper Fetching (Local + Bing Daily HD Online) ---

    public static boolean fetchNextOnlineWallpaper(Context ctx, boolean advanceIndex) {
        if (ctx == null) return false;
        try {
            int idx = SBrowserXPrefs.getStartPageOnlineWallpaperIndex(ctx);
            if (advanceIndex) {
                idx = (idx + 1) % 8;
                SBrowserXPrefs.setStartPageOnlineWallpaperIndex(ctx, idx);
            }
            String apiUrl = "https://www.bing.com/HPImageArchive.aspx?format=js&idx=" + idx + "&n=1&mkt=en-US";
            String jsonStr = httpGetString(apiUrl, 8000);
            JSONObject root = new JSONObject(jsonStr);
            JSONArray images = root.optJSONArray("images");
            if (images == null || images.length() == 0) return false;
            String relUrl = images.getJSONObject(0).optString("url", "");
            if (relUrl.isEmpty()) return false;
            String imgUrl = relUrl.startsWith("http") ? relUrl : ("https://www.bing.com" + relUrl);
            byte[] bytes = httpGetBytes(imgUrl, 12000);
            if (bytes == null || bytes.length < 1024) return false;

            File outFile = getOnlineWallpaperFile(ctx);
            try (FileOutputStream fos = new FileOutputStream(outFile)) {
                fos.write(bytes);
                fos.flush();
            }
            String today = new SimpleDateFormat("yyyy-MM-dd", Locale.US).format(new Date());
            SBrowserXPrefs.setStartPageOnlineWallpaperDate(ctx, today);
            SBrowserXPrefs.bumpStartPageWallpaperVersion(ctx);
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "fetchNextOnlineWallpaper failed", t);
            return false;
        }
    }

    private static byte[] loadWallpaperBytes(Context ctx) {
        if (ctx == null) return null;
        String mode = SBrowserXPrefs.getStartPageWallpaperMode(ctx);
        if (WALLPAPER_LOCAL.equals(mode)) {
            return readFileBytes(getLocalWallpaperFile(ctx));
        }
        if (WALLPAPER_ONLINE.equals(mode)) {
            File f = getOnlineWallpaperFile(ctx);
            String today = new SimpleDateFormat("yyyy-MM-dd", Locale.US).format(new Date());
            String lastDate = SBrowserXPrefs.getStartPageOnlineWallpaperDate(ctx);
            boolean autoDaily = SBrowserXPrefs.isStartPageDailyWallpaperEnabled(ctx);
            if (!f.exists() || (autoDaily && !today.equals(lastDate))) {
                fetchNextOnlineWallpaper(ctx, f.exists() && autoDaily && !today.equals(lastDate));
            }
            return readFileBytes(f);
        }
        return null;
    }

    private static byte[] readFileBytes(File f) {
        if (f == null || !f.exists()) return null;
        try (FileInputStream fis = new FileInputStream(f);
             ByteArrayOutputStream baos = new ByteArrayOutputStream()) {
            byte[] buf = new byte[8192];
            int n;
            while ((n = fis.read(buf)) > 0) baos.write(buf, 0, n);
            return baos.toByteArray();
        } catch (Throwable ignored) {
            return null;
        }
    }

    // --- Open-Meteo Weather Engine (Free, No API Key, Russian & English City Support) ---

    private static String fetchWeatherJson(Context ctx) {
        if (ctx == null || !SBrowserXPrefs.isStartPageWeatherEnabled(ctx)) {
            return "{\"enabled\":false}";
        }
        String cityPref = SBrowserXPrefs.getStartPageWeatherCity(ctx).trim();
        String unit = SBrowserXPrefs.getStartPageWeatherUnit(ctx);
        String lang = Locale.getDefault().getLanguage().startsWith("ru") ? "ru" : "en";
        String cacheKey = cityPref + "|" + unit + "|" + lang;
        long now = System.currentTimeMillis();
        if (sCachedWeatherJson != null && cacheKey.equals(sCachedWeatherKey) && (now - sCachedWeatherTs) < WEATHER_CACHE_TTL_MS) {
            return sCachedWeatherJson;
        }

        try {
            double lat = 0.0;
            double lon = 0.0;
            String displayCity = cityPref;
            boolean resolved = false;

            if (!cityPref.isEmpty()) {
                String geoUrl = "https://geocoding-api.open-meteo.com/v1/search?name="
                        + URLEncoder.encode(cityPref, "UTF-8")
                        + "&count=1&language=" + lang + "&format=json";
                JSONObject geo = new JSONObject(httpGetString(geoUrl, 6000));
                JSONArray results = geo.optJSONArray("results");
                if (results != null && results.length() > 0) {
                    JSONObject first = results.getJSONObject(0);
                    lat = first.getDouble("latitude");
                    lon = first.getDouble("longitude");
                    displayCity = first.optString("name", cityPref);
                    resolved = true;
                }
            }

            if (!resolved) {
                // Automatic IP geolocation fallback (no GPS permission needed)
                JSONObject ipGeo = new JSONObject(httpGetString("https://ipwho.is/", 6000));
                if (ipGeo.optBoolean("success", false)) {
                    lat = ipGeo.getDouble("latitude");
                    lon = ipGeo.getDouble("longitude");
                    displayCity = ipGeo.optString("city", "");
                    resolved = true;
                }
            }

            if (!resolved) {
                return "{\"error\":\"location\"}";
            }

            String tempUnitParam = "F".equalsIgnoreCase(unit) ? "&temperature_unit=fahrenheit" : "";
            String wxUrl = "https://api.open-meteo.com/v1/forecast?latitude=" + lat
                    + "&longitude=" + lon
                    + "&current=temperature_2m,apparent_temperature,weather_code,is_day"
                    + "&daily=temperature_2m_max,temperature_2m_min"
                    + "&timezone=auto&forecast_days=1" + tempUnitParam;
            JSONObject wx = new JSONObject(httpGetString(wxUrl, 6000));
            JSONObject cur = wx.getJSONObject("current");
            JSONObject daily = wx.optJSONObject("daily");

            JSONObject out = new JSONObject();
            out.put("enabled", true);
            out.put("city", displayCity);
            out.put("temp", Math.round(cur.getDouble("temperature_2m")));
            out.put("feels", Math.round(cur.getDouble("apparent_temperature")));
            out.put("code", cur.optInt("weather_code", 0));
            out.put("isDay", cur.optInt("is_day", 1) == 1);
            out.put("unit", "F".equalsIgnoreCase(unit) ? "°F" : "°C");
            if (daily != null) {
                JSONArray maxArr = daily.optJSONArray("temperature_2m_max");
                JSONArray minArr = daily.optJSONArray("temperature_2m_min");
                if (maxArr != null && maxArr.length() > 0) out.put("hi", Math.round(maxArr.getDouble(0)));
                if (minArr != null && minArr.length() > 0) out.put("lo", Math.round(minArr.getDouble(0)));
            }

            String resStr = out.toString();
            sCachedWeatherJson = resStr;
            sCachedWeatherKey = cacheKey;
            sCachedWeatherTs = now;
            return resStr;
        } catch (Throwable t) {
            Log.w(TAG, "fetchWeatherJson failed", t);
            return "{\"error\":\"network\"}";
        }
    }

    private static String httpGetString(String urlStr, int timeoutMs) throws Exception {
        byte[] b = httpGetBytes(urlStr, timeoutMs);
        return b != null ? new String(b, StandardCharsets.UTF_8) : "";
    }

    private static byte[] httpGetBytes(String urlStr, int timeoutMs) throws Exception {
        HttpURLConnection conn = null;
        try {
            conn = (HttpURLConnection) new java.net.URL(urlStr).openConnection();
            conn.setConnectTimeout(timeoutMs);
            conn.setReadTimeout(timeoutMs);
            conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Linux; Android 15) AppleWebKit/537.36 Chrome/131.0");
            int code = conn.getResponseCode();
            if (code < 200 || code >= 300) return null;
            try (InputStream is = conn.getInputStream();
                 ByteArrayOutputStream baos = new ByteArrayOutputStream()) {
                byte[] buf = new byte[8192];
                int n;
                while ((n = is.read(buf)) > 0) baos.write(buf, 0, n);
                return baos.toByteArray();
            }
        } finally {
            if (conn != null) conn.disconnect();
        }
    }

    // --- Handcrafted Ultra-Clean Start Page HTML/CSS/JS ---

    private static String buildHtmlPage() {
        return "<!DOCTYPE html><html lang=\"en\"><head>"
                + "<meta charset=\"utf-8\">"
                + "<meta name=\"viewport\" content=\"width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no,viewport-fit=cover\">"
                + "<title>SBrowserX</title>"
                + "<style>"
                + "*{box-sizing:border-box;-webkit-tap-highlight-color:transparent;margin:0;padding:0}"
                + "html{width:100%;min-height:100lvh;background:#000 center/cover no-repeat fixed}"
                + "body{width:100%;min-height:100lvh;background:transparent;color:#f5f5f7;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif;overflow-x:hidden}"
                + "#bg{position:fixed;top:0;left:0;right:0;height:100lvh;min-height:calc(100vh + 240px);background:#000 center/cover no-repeat;z-index:0;transition:opacity .35s ease}"
                + "#dim{position:fixed;top:0;left:0;right:0;height:100lvh;min-height:calc(100vh + 240px);background:#000;opacity:0;z-index:1;pointer-events:none}"
                + "#wrap{position:relative;z-index:2;min-height:100lvh;padding:max(20px,env(safe-area-inset-top)) 18px 140px;display:flex;flex-direction:column;align-items:center}"
                + ".top-actions{position:fixed;top:max(14px,env(safe-area-inset-top));right:14px;z-index:10;display:flex;gap:8px}"
                + ".fab-btn{width:38px;height:38px;border-radius:50%;border:1px solid rgba(255,255,255,.14);background:rgba(16,18,24,.42);backdrop-filter:blur(14px);-webkit-backdrop-filter:blur(14px);color:rgba(255,255,255,.78);font-size:18px;display:flex;align-items:center;justify-content:center;cursor:pointer;opacity:.58;transition:opacity .2s,transform .15s}"
                + ".fab-btn:active{opacity:1;transform:scale(.94)}"
                + "#weather{display:none;margin-top:34px;margin-bottom:26px;padding:14px 20px;border-radius:24px;background:rgba(18,20,28,.48);backdrop-filter:blur(18px);-webkit-backdrop-filter:blur(18px);border:1px solid rgba(255,255,255,.12);min-width:220px;max-width:340px;width:100%;align-items:center;justify-content:space-between;gap:14px}"
                + ".wx-left{display:flex;align-items:center;gap:12px}"
                + ".wx-ico{font-size:32px;line-height:1}"
                + ".wx-temp{font-size:30px;font-weight:700;letter-spacing:-.5px}"
                + ".wx-right{text-align:right}"
                + ".wx-city{font-size:15px;font-weight:600;color:#fff}"
                + ".wx-sub{font-size:12px;color:rgba(255,255,255,.72);margin-top:2px}"
                + "#grid{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:16px 12px;width:100%;max-width:460px;margin-top:44px}"
                + "#weather[style*='flex'] + #grid{margin-top:8px}"
                + ".tile{display:flex;flex-direction:column;align-items:center;text-decoration:none;color:#f5f5f7;user-select:none;-webkit-user-select:none}"
                + ".tile-ico{width:56px;height:56px;border-radius:18px;background:rgba(20,22,30,.58);backdrop-filter:blur(14px);-webkit-backdrop-filter:blur(14px);border:1px solid rgba(255,255,255,.12);display:flex;align-items:center;justify-content:center;overflow:hidden;font-size:22px;font-weight:700;color:#93c5fd;transition:transform .12s}"
                + ".tile:active .tile-ico{transform:scale(.93)}"
                + ".tile-ico img{width:30px;height:30px;border-radius:7px;object-fit:contain}"
                + ".tile-lbl{margin-top:7px;font-size:12px;text-align:center;max-width:74px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;text-shadow:0 1px 4px rgba(0,0,0,.75)}"
                + "#modalBg{display:none;position:fixed;inset:0;background:rgba(0,0,0,.68);backdrop-filter:blur(8px);z-index:30;align-items:center;justify-content:center;padding:20px}"
                + ".modal{width:100%;max-width:340px;background:#14161d;border:1px solid rgba(255,255,255,.12);border-radius:24px;padding:20px}"
                + ".modal h3{font-size:18px;font-weight:700;margin-bottom:14px}"
                + ".modal input{width:100%;padding:12px 14px;border-radius:14px;border:1px solid rgba(255,255,255,.14);background:#0b0c10;color:#fff;font-size:15px;margin-bottom:10px;outline:none}"
                + ".modal input:focus{border-color:#3b82f6}"
                + ".m-row{display:flex;gap:10px;margin-top:8px}"
                + ".btn{flex:1;padding:11px;border-radius:14px;border:none;font-size:14px;font-weight:600;cursor:pointer}"
                + ".btn-pri{background:#2563eb;color:#fff}"
                + ".btn-sec{background:#232632;color:#cbd5e1}"
                + ".btn-del{background:#3f1820;color:#fda4af}"
                + "</style></head><body>"
                + "<div id=\"bg\"></div><div id=\"dim\"></div>"
                + "<div class=\"top-actions\">"
                + "<button class=\"fab-btn\" id=\"btnAdd\" title=\"Add shortcut\">+</button>"
                + "<button class=\"fab-btn\" id=\"btnCfg\" title=\"Settings\">&#9881;</button>"
                + "</div>"
                + "<div id=\"wrap\">"
                + "<div id=\"weather\"><div class=\"wx-left\"><div class=\"wx-ico\" id=\"wxIco\">&#9728;</div><div class=\"wx-temp\" id=\"wxTemp\">--</div></div>"
                + "<div class=\"wx-right\"><div class=\"wx-city\" id=\"wxCity\"></div><div class=\"wx-sub\" id=\"wxSub\"></div></div></div>"
                + "<div id=\"grid\"></div>"
                + "</div>"
                + "<div id=\"modalBg\"><div class=\"modal\">"
                + "<h3 id=\"mTitle\">Shortcut</h3>"
                + "<input id=\"inName\" type=\"text\" placeholder=\"Name\" autocomplete=\"off\">"
                + "<input id=\"inUrl\" type=\"url\" placeholder=\"https://example.com\" autocomplete=\"off\">"
                + "<div class=\"m-row\"><button class=\"btn btn-sec\" id=\"mCancel\">Cancel</button><button class=\"btn btn-del\" id=\"mDel\" style=\"display:none\">Delete</button><button class=\"btn btn-pri\" id=\"mSave\">Save</button></div>"
                + "</div></div>"
                + "<script>"
                + "let STATE={shortcuts:[],lang:'en'};let EDIT_IDX=-1;"
                + "const T={en:{add:'Add shortcut',edit:'Edit shortcut',name:'Title',url:'https://example.com',cancel:'Cancel',del:'Delete',save:'Save',feels:'Feels like'},"
                + "ru:{add:'Новый ярлык',edit:'Изменить ярлык',name:'Название',url:'https://example.com',cancel:'Отмена',del:'Удалить',save:'Сохранить',feels:'Ощущается'}};"
                + "function wxIcon(c,day){if(c===0)return day?'&#9728;':'&#127769;';if(c<=2)return day?'&#9925;':'&#9729;';if(c===3)return '&#9729;';if(c<=48)return '&#127787;';if(c<=67)return '&#127783;';if(c<=77)return '&#10052;';if(c<=82)return '&#127782;';return '&#9928;';}"
                + "function getHost(u){try{return new URL(u).hostname;}catch(e){return '';}}"
                + "function renderShortcuts(){"
                + "  const g=document.getElementById('grid');g.innerHTML='';"
                + "  const list=STATE.shortcuts||[];"
                + "  if(list.length===0){g.style.display='none';return;}"
                + "  g.style.display='grid';"
                + "  list.forEach((s,idx)=>{"
                + "    const a=document.createElement('a');a.className='tile';a.href=s.url;"
                + "    const ico=document.createElement('div');ico.className='tile-ico';"
                + "    const host=getHost(s.url);const letter=((s.title||host||'?')[0]||'?').toUpperCase();"
                + "    if(host){const img=document.createElement('img');img.src='https://www.google.com/s2/favicons?domain='+encodeURIComponent(host)+'&sz=128';"
                + "      img.onerror=()=>{ico.textContent=letter;};ico.appendChild(img);}else{ico.textContent=letter;}"
                + "    const lbl=document.createElement('div');lbl.className='tile-lbl';lbl.textContent=s.title||host||s.url;"
                + "    a.appendChild(ico);a.appendChild(lbl);"
                + "    let pt=null;a.addEventListener('touchstart',()=>{pt=setTimeout(()=>{pt=null;openModal(idx);},520);},{passive:true});"
                + "    a.addEventListener('touchend',()=>{if(pt)clearTimeout(pt);});"
                + "    a.addEventListener('touchmove',()=>{if(pt)clearTimeout(pt);});"
                + "    a.addEventListener('contextmenu',e=>{e.preventDefault();openModal(idx);});"
                + "    g.appendChild(a);"
                + "  });"
                + "}"
                + "function openModal(idx){"
                + "  EDIT_IDX=idx;const tr=T[STATE.lang]||T.en;"
                + "  document.getElementById('mTitle').textContent=idx>=0?tr.edit:tr.add;"
                + "  document.getElementById('inName').placeholder=tr.name;"
                + "  document.getElementById('inUrl').placeholder=tr.url;"
                + "  document.getElementById('mCancel').textContent=tr.cancel;"
                + "  document.getElementById('mDel').textContent=tr.del;"
                + "  document.getElementById('mSave').textContent=tr.save;"
                + "  if(idx>=0){const s=STATE.shortcuts[idx];document.getElementById('inName').value=s.title||'';document.getElementById('inUrl').value=s.url||'';document.getElementById('mDel').style.display='block';}"
                + "  else{document.getElementById('inName').value='';document.getElementById('inUrl').value='';document.getElementById('mDel').style.display='none';}"
                + "  document.getElementById('modalBg').style.display='flex';"
                + "}"
                + "function closeModal(){document.getElementById('modalBg').style.display='none';}"
                + "async function persistShortcuts(){"
                + "  await fetch('/api/shortcuts',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify(STATE.shortcuts)});"
                + "  renderShortcuts();"
                + "}"
                + "document.getElementById('btnAdd').onclick=()=>openModal(-1);"
                + "document.getElementById('btnCfg').onclick=()=>fetch('/api/open-settings');"
                + "document.getElementById('mCancel').onclick=closeModal;"
                + "document.getElementById('modalBg').onclick=e=>{if(e.target.id==='modalBg')closeModal();};"
                + "document.getElementById('mDel').onclick=async()=>{if(EDIT_IDX>=0){STATE.shortcuts.splice(EDIT_IDX,1);closeModal();await persistShortcuts();}};"
                + "document.getElementById('mSave').onclick=async()=>{"
                + "  let u=document.getElementById('inUrl').value.trim();let n=document.getElementById('inName').value.trim();"
                + "  if(!u)return;if(!/^https?:\\/\\//i.test(u))u='https://'+u;if(!n)n=getHost(u)||u;"
                + "  if(EDIT_IDX>=0)STATE.shortcuts[EDIT_IDX]={title:n,url:u};else STATE.shortcuts.push({title:n,url:u});"
                + "  closeModal();await persistShortcuts();"
                + "};"
                + "async function loadAll(){"
                + "  try{"
                + "    const r=await fetch('/api/state');STATE=await r.json();"
                + "    const bg=document.getElementById('bg');const dim=document.getElementById('dim');"
                + "    if(STATE.hasWallpaper&&STATE.wallpaperMode!=='amoled'){"
                + "      const wpUrl='url(/api/wallpaper?v='+(STATE.wallpaperVer||1)+')';bg.style.backgroundImage=wpUrl;document.documentElement.style.backgroundImage=wpUrl;"
                + "      dim.style.opacity=((STATE.wallpaperDim||0)/100).toFixed(2);"
                + "    }else{bg.style.backgroundImage='none';document.documentElement.style.backgroundImage='none';dim.style.opacity='0';}"
                + "    renderShortcuts();"
                + "    if(STATE.weatherEnabled){"
                + "      const wr=await fetch('/api/weather');const w=await wr.json();"
                + "      if(w&&w.enabled){"
                + "        const tr=T[STATE.lang]||T.en;"
                + "        document.getElementById('wxIco').innerHTML=wxIcon(w.code,w.isDay);"
                + "        document.getElementById('wxTemp').textContent=w.temp+w.unit;"
                + "        document.getElementById('wxCity').textContent=w.city||'';"
                + "        let sub=tr.feels+' '+w.feels+w.unit;"
                + "        if(w.hi!==undefined&&w.lo!==undefined)sub+=' • '+w.lo+'° / '+w.hi+'°';"
                + "        document.getElementById('wxSub').textContent=sub;"
                + "        document.getElementById('weather').style.display='flex';"
                + "      }"
                + "    }"
                + "  }catch(e){}"
                + "}"
                + "loadAll();"
                + "</script></body></html>";
    }
}
