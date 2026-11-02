package app.blitzermorph.extension;

import android.content.Context;
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
import java.util.List;
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
    private static final double BOX_PADDING_DEG = 0.675; // ~75 km around the user
    private static final long CACHE_TTL_MS = 10 * 60 * 1000L;
    private static final long MIN_MOVE_M = 100L;
    private static final long DEBOUNCE_MS = 4000;
    private static final double TILE = 0.25;

    private static final ConcurrentMap<Long, List<AtudoCamera>> FRESH = new ConcurrentHashMap<>();
    private static final ConcurrentMap<Long, Long> FETCHED_AT = new ConcurrentHashMap<>();
    private static final long[] USER = new long[2]; // lat, lng
    private static volatile long USER_SET_AT;

    private static final ScheduledExecutorService SCHEDULER = Executors.newSingleThreadScheduledExecutor(r -> {
        Thread t = new Thread(r, "blitzermorph");
        t.setDaemon(true);
        return t;
    });
    private static volatile ScheduledFuture<?> PENDING;

    private static volatile String LAST_STATUS = "idle";
    private static volatile String LAST_ERROR = "";
    private static volatile boolean DEBUG_ENABLED = false;
    private static volatile boolean ENABLED = true;

    public static void toggleDebug() {
        DEBUG_ENABLED = !DEBUG_ENABLED;
        if (DEBUG_ENABLED) showDebugOverlay(); else hideDebugOverlay();
    }

    public static void forceFetch() {
        LAST_STATUS = "fetching...";
        SCHEDULER.execute(() -> {
            try { fetchAroundUser(); LAST_STATUS = "done"; }
            catch (Throwable t) { LAST_ERROR = t.toString(); LAST_STATUS = "error"; }
        });
    }

    private static void showDebugOverlay() {
        try { Class<?> cls = Class.forName("org.ungoogled.ui.MapsActivity");
            Method m = cls.getMethod("showBlitzermorphDebug"); m.invoke(null);
        } catch (Throwable t) { Log.w(TAG, "showDebugOverlay", t); }
    }
    private static void hideDebugOverlay() {
        try { Class<?> cls = Class.forName("org.ungoogled.ui.MapsActivity");
            Method m = cls.getMethod("hideBlitzermorphDebug"); m.invoke(null);
        } catch (Throwable t) { Log.w(TAG, "hideDebugOverlay", t); }
    }

    // Called from the patch during SpeedCameras.refresh()
        public static void initialize(Context context) {
            try {
                android.content.Intent intent = new android.content.Intent();
                // No-op; just ensure the extension is loaded.
            } catch (Throwable t) { Log.w(TAG, "initialize", t); }
        }
        public static boolean isEnabled() { return ENABLED; }

    public static void onLocationChanged(Location location) {
        if (!ENABLED) return;
        try {
            if (location == null) return;
            long newLat = Math.round(location.getLatitude() * 1e7);
            long newLng = Math.round(location.getLongitude() * 1e7);
            long prevLat = USER[0]; long prevLng = USER[1];
            USER[0] = newLat; USER[1] = newLng; USER_SET_AT = System.currentTimeMillis();
            Location tmp = new Location("blitzermorph");
            tmp.setLatitude(newLat / 1e7); tmp.setLongitude(newLng / 1e7);
            Location prev = new Location("blitzermorph");
            prev.setLatitude(prevLat / 1e7); prev.setLongitude(prevLng / 1e7);
            if (tmp.distanceTo(prev) < MIN_MOVE_M) return;
            ScheduledFuture<?> f = SCHEDULER.schedule(BlitzerInjector::fetchAroundUser, DEBOUNCE_MS, TimeUnit.MILLISECONDS);
            PENDING = f;
        } catch (Throwable t) { Log.w(TAG, "onLocationChanged", t); }
    }

    private static void fetchAroundUser() {
        if (!ENABLED) return;
        long lat = USER[0]; long lng = USER[1];
        if (System.currentTimeMillis() - USER_SET_AT > 10 * 60 * 1000L) return;
        double cLat = lat / 1e7; double cLng = lng / 1e7;
        double latMin = cLat - BOX_PADDING_DEG; double latMax = cLat + BOX_PADDING_DEG;
        double lngMin = cLng - BOX_PADDING_DEG; double lngMax = cLng + BOX_PADDING_DEG;
        List<Long> tiles = new ArrayList<>();
        long tLatMin = (long)Math.floor((latMin + 90.0)/TILE);
        long tLatMax = (long)Math.floor((latMax + 90.0)/TILE);
        long tLngMin = (long)Math.floor((lngMin + 180.0)/TILE);
        long tLngMax = (long)Math.floor((lngMax + 180.0)/TILE);
        long now = System.currentTimeMillis();
        for (long tLat = tLatMin; tLat <= tLatMax; tLat++)
            for (long tLng = tLngMin; tLng <= tLngMax; tLng++) {
                long tile = (tLat<<32)|(tLng & 0xFFFFFFFFL);
                Long fetched = FETCHED_AT.get(tile);
                if (fetched!=null && now-fetched < CACHE_TTL_MS) continue;
                tiles.add(tile);
            }
        if (tiles.isEmpty()) return;
        Log.i(TAG, "Fetching Atudo POIs for "+tiles.size()+" tiles around ("+cLat+", "+cLng+")");
        List<AtudoCamera> cams = fetchAtudo(latMin,lngMin,latMax,lngMax);
        if (cams==null) return;
        for (AtudoCamera cam : cams) {
            long tile = tile(cam.lat, cam.lng);
            if (tileLat(tile)>=tLatMin && tileLat(tile)<=tLatMax && tileLng(tile)>=tLngMin && tileLng(tile)<=tLngMax) {
                List<AtudoCamera> list = FRESH.get(tile);
                if (list!=null) {
                    synchronized(list) {
                        boolean dup=false; for (AtudoCamera e:list) if (e.id==cam.id){dup=true;break;}
                        if (!dup) list.add(cam);
                    }
                }
            }
        }
        for (Long tile:tiles) FETCHED_AT.put(tile, System.currentTimeMillis());
        if (!cams.isEmpty()) { Log.i(TAG, "Injecting "+cams.size()+" Blitzer.de cameras into the map"); notifyAppOfNewData(); }
    }

    private static void notifyAppOfNewData() {
        try { Class<?> cls = Class.forName("org.ungoogled.ui.SpeedCameras");
            Method m = cls.getDeclaredMethod("changed"); m.setAccessible(true); m.invoke(null);
        } catch (Throwable t) { Log.w(TAG, "notifyAppOfNewData", t); }
    }

    // Called from the patch when mapItems() is invoked
    public static java.util.List<Object> getBlitzerMapItems() {
        if (!ENABLED) return java.util.Collections.emptyList();
        List<Object> result = new java.util.ArrayList<>();
        try {
            Class<?> cls = Class.forName("org.ungoogled.ui.SpeedCameras");
            Class<?> camClass = null;
            for (Class<?> inner:cls.getDeclaredClasses()) if (inner.getSimpleName().equals("Camera")) { camClass=inner; break; }
            if (camClass==null) return result;
            for (List<AtudoCamera> tileList : FRESH.values())
                for (AtudoCamera cam : tileList) {
                    Object o = createCamera(camClass, cam.id, cam.lat, cam.lng, cam.label);
                    if (o!=null) result.add(o);
                }
        } catch (Throwable t) { Log.w(TAG, "getBlitzerMapItems", t); }
        return result;
    }

    static void injectCamera(double lat, double lng, long id, String limit) {
        try {
            long tile = tile(lat,lng);
            List<AtudoCamera> fresh = FRESH.get(tile);
            if (fresh!=null) {
                synchronized(fresh) { for (AtudoCamera e:fresh) if (e.id==id) return; fresh.add(new AtudoCamera(id,lat,lng,limit)); }
            }
            Class<?> cls = Class.forName("org.ungoogled.ui.SpeedCameras");
            Field camField = cls.getDeclaredField("CAMERAS"); camField.setAccessible(true);
            Object layer = camField.get(null); if (layer==null) return;
            Class<?> layerCls = layer.getClass();
            Field tilesField = layerCls.getDeclaredField("tiles"); tilesField.setAccessible(true);
            @SuppressWarnings("unchecked") Map<Long,List<Object>> tiles = (Map<Long,List<Object>>)tilesField.get(layer);
            Field freshField = layerCls.getDeclaredField("fresh"); freshField.setAccessible(true);
            @SuppressWarnings("unchecked") Set<Long> freshSet = (Set<Long>)freshField.get(layer);
            Class<?> camClass = null;
            for (List<Object> lst:tiles.values()) if (!lst.isEmpty()) { camClass = lst.get(0).getClass(); break; }
            if (camClass==null) {
                for (Class<?> inner:cls.getDeclaredClasses()) if (inner.getSimpleName().equals("Camera")) { camClass=inner; break; }
                if (camClass==null) return;
            }
            List<Object> tileList = tiles.get(tile);
            if (tileList==null) {
                List<Object> newList = new ArrayList<>();
                Object cam = createCamera(camClass, id, lat, lng, limit);
                if (cam!=null) newList.add(cam);
                tiles.put(tile, newList);
            } else {
                try {
                    @SuppressWarnings("unchecked") List<Object> mutable = (List<Object>)tileList;
                    Object cam = createCamera(camClass, id, lat, lng, limit);
                    if (cam!=null) mutable.add(cam);
                } catch (UnsupportedOperationException e) {
                    List<Object> newList = new ArrayList<>(tileList);
                    Object cam = createCamera(camClass, id, lat, lng, limit);
                    if (cam!=null) newList.add(cam);
                    tiles.put(tile, newList);
                }
            }
            if (freshSet!=null) freshSet.add(tile);
        } catch (Throwable t) { Log.w(TAG, "injectCamera", t); }
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
            String box = String.format(java.util.Locale.ROOT, "%.6f,%.6f,%.6f,%.6f", latMin, lngMin, latMax, lngMax);
            String urlStr = ATUDO_API + "?z=12&type=" + TYPES + "&box=" + box;
            URL url = new URL(urlStr);
            HttpURLConnection conn = (HttpURLConnection)url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("User-Agent", "BlitzerMorph/1.0");
            conn.setRequestProperty("Accept", "application/json");
            conn.setConnectTimeout(10000); conn.setReadTimeout(15000);
            int code = conn.getResponseCode();
            if (code!=200) { Log.w(TAG, "Atudo API returned HTTP "+code); return null; }
            BufferedReader r = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder(); String line; while ((line=r.readLine())!=null) sb.append(line);
            r.close();
            JSONObject root = new JSONObject(sb.toString());
            JSONArray pois = root.optJSONArray("pois");
            if (pois==null) return new ArrayList<>();
            List<AtudoCamera> res = new ArrayList<>();
            for (int i=0;i<pois.length();i++) {
                JSONObject poi = pois.getJSONObject(i);
                if ("cluster".equals(poi.optString("type"))) continue;
                String idStr = poi.optString("id"); if (idStr.isEmpty()) continue;
                long id; try { id = Long.parseLong(idStr); } catch (NumberFormatException e) { continue; }
                double lat = poi.optDouble("lat", Double.NaN);
                double lng = poi.optDouble("lng", Double.NaN);
                if (Double.isNaN(lat)||Double.isNaN(lng)) continue;
                String type = poi.optString("type", "");
                int typeInt; try { typeInt = Integer.parseInt(type); } catch (NumberFormatException e) { continue; }
                if (typeInt<0||typeInt>6) continue;
                String vmax = poi.optString("vmax", "");
                String label = "Blitzer.de - Speed cam";
                if (!vmax.isEmpty() && !"/".equals(vmax) && !"?".equals(vmax)) label += " "+vmax+" km/h";
                res.add(new AtudoCamera(id, lat, lng, label));
            }
            return res;
        } catch (Throwable t) { Log.w(TAG, "fetchAtudo", t); return null; }
    }

    static long tile(double lat, double lng) { return ((long)Math.floor((lat+90.0)/TILE)<<32) | ((long)Math.floor((lng+180.0)/TILE)&0xFFFFFFFFL); }
    static long tileLat(long tile) { return tile>>32; }
    static long tileLng(long tile) { return tile & 0xFFFFFFFFL; }

    static final class AtudoCamera {
        final long id; final double lat; final double lng; final String label;
        AtudoCamera(long id, double lat, double lng, String label) { this.id=id; this.lat=lat; this.lng=lng; this.label=label; }
    }
}
