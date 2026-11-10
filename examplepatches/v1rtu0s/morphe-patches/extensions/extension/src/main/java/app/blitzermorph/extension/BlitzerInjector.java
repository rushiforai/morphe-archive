package app.blitzermorph.extension;

import android.content.Context;
import android.content.Intent;
import android.location.Location;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

/**
 * BlitzerMorph extension.
 * Fetches live speed camera POIs from the Atudo API (Blitzer.de) and injects them
 * into the speed cameras layer of microG/ungoogled Maps.
 */
public final class BlitzerInjector {
    private static final String TAG = "BlitzerMorph";
    private static final String ATUDO_API = "https://cdn2.atudo.net/api/4.0/pois.php";
    private static final String TYPES = "0,1,2,3,4,5,6"; // Mobile speed traps only
    private static final String PREFS_NAME = "blitzermorph_prefs";
    private static final String KEY_ENABLED = "blitzer_de_cameras";
    private static final String KEY_DEBUG = "blitzer_de_debug";
    private static final String KEY_FORCE_FETCH = "blitzer_de_force_fetch";
    private static final String KEY_STATUS = "blitzer_de_status";
    private static final double BOX_PADDING_DEG = 0.675; // ~75 km around the user
    private static final long CACHE_TTL_MS = 5 * 60 * 1000L; // 5 min
    private static final double MIN_MOVE_KM = 0.6; // 600m hysteresis
    private static final long DEBOUNCE_MS = 4000;
    private static final double TILE = 0.25;

    private static final ConcurrentMap<Long, List<AtudoCamera>> FRESH = new ConcurrentHashMap<>();
    private static final ConcurrentMap<Long, Long> FETCHED_AT = new ConcurrentHashMap<>();
    private static final double[] LAST_FETCH_POS = {Double.NaN, Double.NaN};
    private static volatile long LAST_FETCH_TIME = 0;
    private static volatile int LAST_CAMERA_COUNT = 0;

    private static final ScheduledExecutorService SCHEDULER = Executors.newSingleThreadScheduledExecutor(r -> {
        Thread t = new Thread(r, "blitzermorph");
        t.setDaemon(true);
        return t;
    });

    private static volatile boolean ENABLED = true;
    private static volatile boolean DEBUG_ENABLED = false;
    private static volatile Context APP_CONTEXT = null;

    // Called from the patch during SpeedCameras.refresh()
    public static void initialize(Context context) {
        try {
            APP_CONTEXT = context.getApplicationContext();
            android.content.SharedPreferences prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            ENABLED = prefs.getBoolean(KEY_ENABLED, true);
            DEBUG_ENABLED = prefs.getBoolean(KEY_DEBUG, false);
            
            // Register preference change listener for debug/force fetch
            prefs.registerOnSharedPreferenceChangeListener((sharedPrefs, key) -> {
                if (KEY_DEBUG.equals(key)) {
                    DEBUG_ENABLED = sharedPrefs.getBoolean(KEY_DEBUG, false);
                    if (DEBUG_ENABLED) showDebugOverlay(); else hideDebugOverlay();
                } else if (KEY_FORCE_FETCH.equals(key)) {
                    // Force fetch triggered via preference click
                    fetchNow(LAST_FETCH_POS[0], LAST_FETCH_POS[1], null);
                }
            });
            
            updateStatus("Initialized");
        } catch (Throwable t) { Log.w(TAG, "initialize", t); }
    }
    public static boolean isEnabled() { return ENABLED; }

    public static void onLocationChanged(Location location) {
        if (!ENABLED) return;
        if (location == null) return;
        
        double lat = location.getLatitude();
        double lng = location.getLongitude();
        
        Log.i(TAG, String.format(Locale.US, "Loc: %.5f, %.5f", lat, lng));

        // First fix: Immediate fetch - no speed/hysteresis check
        if (Double.isNaN(LAST_FETCH_POS[0])) {
            fetchNow(lat, lng, () -> Log.i(TAG, "First fix fetch complete"));
            return;
        }

        // Hysteresis only after first fetch: 5 min or 600m
        double dist = distance(LAST_FETCH_POS[0], LAST_FETCH_POS[1], lat, lng);
        Log.i(TAG, String.format(Locale.US, "Dist from last fetch: %.3f km", dist));
        if (dist < MIN_MOVE_KM) return;

        fetchNow(lat, lng, () -> Log.i(TAG, "Hysteresis fetch complete"));
    }

    private static double distance(double lat1, double lng1, double lat2, double lng2) {
        double dLat = Math.toRadians(lat2 - lat1);
        double dLng = Math.toRadians(lng2 - lng1);
        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
                   Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) *
                   Math.sin(dLng / 2) * Math.sin(dLng / 2);
        return 6371 * 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    }

    public static void fetchNow(double lat, double lng, Runnable callback) {
        LAST_FETCH_POS[0] = lat;
        LAST_FETCH_POS[1] = lng;
        SCHEDULER.execute(() -> {
            fetchAroundUser(lat, lng);
            if (callback != null) callback.run();
        });
    }

    private static void fetchAroundUser(double lat, double lng) {
        Log.i(TAG, "Fetching Atudo POIs around (" + lat + ", " + lng + ")");
        double latMin = lat - BOX_PADDING_DEG; double latMax = lat + BOX_PADDING_DEG;
        double lngMin = lng - BOX_PADDING_DEG; double lngMax = lng + BOX_PADDING_DEG;
        
        List<AtudoCamera> cams = fetchAtudo(latMin, lngMin, latMax, lngMax);
        if (cams == null) {
            updateStatus("Fetch failed");
            return;
        }

        for (AtudoCamera cam : cams) {
            long tile = tile(cam.lat, cam.lng);
            List<AtudoCamera> list = FRESH.computeIfAbsent(tile, k -> new ArrayList<>());
            synchronized(list) {
                boolean dup = false;
                for (AtudoCamera e : list) if (e.id == cam.id) { dup = true; break; }
                if (!dup) list.add(cam);
            }
        }
        
        LAST_FETCH_TIME = System.currentTimeMillis();
        LAST_CAMERA_COUNT = cams.size();
        updateStatus("Fetched " + cams.size() + " cameras");
        
        Log.i(TAG, "Injecting " + cams.size() + " Blitzer.de cameras into the map");
        notifyAppOfNewData();
    }

    private static void updateStatus(String msg) {
        if (APP_CONTEXT != null) {
            try {
                android.content.SharedPreferences prefs = APP_CONTEXT.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
                String timeStr = LAST_FETCH_TIME > 0 ? 
                    java.text.DateFormat.getTimeInstance().format(new java.util.Date(LAST_FETCH_TIME)) : "never";
                String status = msg + " | Last: " + timeStr + " | Count: " + LAST_CAMERA_COUNT;
                prefs.edit().putString(KEY_STATUS, status).apply();
            } catch (Throwable ignored) {}
        }
    }

    private static void showDebugOverlay() {
        try {
            Class<?> cls = Class.forName("org.ungoogled.ui.MapsActivity");
            Method m = cls.getMethod("showBlitzermorphDebug");
            m.invoke(null);
        } catch (Throwable t) { Log.w(TAG, "showDebugOverlay", t); }
    }

    private static void hideDebugOverlay() {
        try {
            Class<?> cls = Class.forName("org.ungoogled.ui.MapsActivity");
            Method m = cls.getMethod("hideBlitzermorphDebug");
            m.invoke(null);
        } catch (Throwable t) { Log.w(TAG, "hideDebugOverlay", t); }
    }

    private static void notifyAppOfNewData() {
        try { 
            Class<?> cls = Class.forName("org.ungoogled.ui.SpeedCameras");
            Method changed = cls.getDeclaredMethod("changed"); 
            changed.setAccessible(true); 
            changed.invoke(null);
        } catch (Throwable t) { Log.w(TAG, "notifyAppOfNewData", t); }
    }

    // Called from the patch when mapItems() is invoked
    public static List<Object> getBlitzerMapItems() {
        if (!ENABLED) return Collections.emptyList();
        List<Object> result = new ArrayList<>();
        try {
            Class<?> cls = Class.forName("org.ungoogled.ui.SpeedCameras");
            Class<?> camClass = null;
            for (Class<?> inner:cls.getDeclaredClasses()) if (inner.getSimpleName().equals("Camera")) { camClass=inner; break; }
            if (camClass == null) return result;
            
            for (List<AtudoCamera> tileList : FRESH.values()) {
                synchronized(tileList) {
                    for (AtudoCamera cam : tileList) {
                        Object o = createCamera(camClass, cam.id, cam.lat, cam.lng, cam.label);
                        if (o != null) result.add(o);
                    }
                }
            }
        } catch (Throwable t) { Log.w(TAG, "getBlitzerMapItems", t); }
        return result;
    }

    private static Object createCamera(Class<?> camClass, long id, double lat, double lng, String label) {
        try {
            java.lang.reflect.Constructor<?> ctor = camClass.getDeclaredConstructor(long.class, double.class, double.class, int.class, String.class);
            ctor.setAccessible(true);
            return ctor.newInstance(id, lat, lng, 0, label);
        } catch (Throwable t) { Log.w(TAG, "createCamera", t); return null; }
    }

    static List<AtudoCamera> fetchAtudo(double latMin, double lngMin, double latMax, double lngMax) {
        try {
            String box = String.format(Locale.ROOT, "%.6f,%.6f,%.6f,%.6f", latMin, lngMin, latMax, lngMax);
            String urlStr = ATUDO_API + "?z=12&type=" + TYPES + "&box=" + box;
            HttpURLConnection conn = (HttpURLConnection) new URL(urlStr).openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("User-Agent", "BlitzerMorph/1.0");
            conn.setRequestProperty("Accept", "application/json");
            conn.setConnectTimeout(10000); conn.setReadTimeout(15000);
            if (conn.getResponseCode() != 200) return null;
            
            BufferedReader r = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder(); String line; while ((line=r.readLine())!=null) sb.append(line);
            r.close();
            JSONObject root = new JSONObject(sb.toString());
            JSONArray pois = root.optJSONArray("pois");
            if (pois == null) return new ArrayList<>();
            List<AtudoCamera> res = new ArrayList<>();
            for (int i=0; i<pois.length(); i++) {
                JSONObject poi = pois.getJSONObject(i);
                if ("cluster".equals(poi.optString("type"))) continue;
                String idStr = poi.optString("id"); if (idStr.isEmpty()) continue;
                long id = Long.parseLong(idStr);
                double lat = poi.optDouble("lat", Double.NaN);
                double lng = poi.optDouble("lng", Double.NaN);
                if (Double.isNaN(lat)||Double.isNaN(lng)) continue;
                String type = poi.optString("type", "");
                int typeInt = Integer.parseInt(type);
                if (typeInt < 0 || typeInt > 6) continue;
                String vmax = poi.optString("vmax", "");
                String label = "Blitzer.de - Speed cam";
                if (!vmax.isEmpty() && !"/".equals(vmax) && !"?".equals(vmax)) label += " "+vmax+" km/h";
                res.add(new AtudoCamera(id, lat, lng, label));
            }
            return res;
        } catch (Throwable t) { Log.w(TAG, "fetchAtudo", t); return null; }
    }

    static long tile(double lat, double lng) { return ((long)Math.floor((lat+90.0)/TILE)<<32) | ((long)Math.floor((lng+180.0)/TILE)&0xFFFFFFFFL); }

    static final class AtudoCamera {
        final long id; final double lat; final double lng; final String label;
        AtudoCamera(long id, double lat, double lng, String label) { this.id=id; this.lat=lat; this.lng=lng; this.label=label; }
    }
}
