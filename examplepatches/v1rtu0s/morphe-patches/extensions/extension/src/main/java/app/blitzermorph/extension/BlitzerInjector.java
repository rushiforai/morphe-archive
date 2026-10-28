package app.blitzermorph.extension;

import android.location.Location;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

/**
 * BlitzerMorph extension.
 *
 * Fetches live speed camera POIs from the Blitzer.de (Atudo) API and injects
 * them into the existing "speed cameras" layer (org.ungoogled.ui.SpeedCameras)
 * of the app via reflection. The app's own rendering pipeline then displays
 * them automatically, including alerting during navigation.
 *
 * Camera labels get the "Blitzer.de - " prefix so the data source is
 * clearly distinguishable in the UI (debug signifier).
 */
public final class BlitzerInjector {

    private static final String TAG = "BlitzerMorph";

    private static final String ATUDO_API = "https://cdn2.atudo.net/api/4.0/pois.php";
    private static final String TYPES = "0,1,2,3,4,5,6,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115";

    private static final double BOX_PADDING_DEG = 0.13;   // ~14 km around the user
    private static final long CACHE_TTL_MS = 10 * 60 * 1000L;
    private static final long MIN_MOVE_M = 100L;
    private static final long DEBOUNCE_MS = 4000;

    /** 0.25 degree tile size, same as the app uses. */
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

    /**
     * Hooked into SpeedCameras.moved(Location) by the patch.
     * Debounced; runs the Atudo fetch on a background thread.
     */
    public static void onLocationChanged(Location location) {
        try {
            if (location == null) {
                return;
            }
            long newLat = Math.round(location.getLatitude() * 1e7);
            long newLng = Math.round(location.getLongitude() * 1e7);
            long prevLat = USER[0];
            long prevLng = USER[1];
            USER[0] = newLat;
            USER[1] = newLng;
            USER_SET_AT = System.currentTimeMillis();

            Location tmp = new Location("blitzermorph");
            tmp.setLatitude(newLat / 1e7);
            tmp.setLongitude(newLng / 1e7);
            Location prev = new Location("blitzermorph");
            prev.setLatitude(prevLat / 1e7);
            prev.setLongitude(prevLng / 1e7);
            if (tmp.distanceTo(prev) < MIN_MOVE_M) {
                return;
            }

            ScheduledFuture<?> f = SCHEDULER.schedule(
                    BlitzerInjector::fetchAroundUser,
                    DEBOUNCE_MS,
                    TimeUnit.MILLISECONDS);
            PENDING = f;
        } catch (Throwable t) {
            Log.w(TAG, "onLocationChanged", t);
        }
    }

    private static void fetchAroundUser() {
        long lat = USER[0];
        long lng = USER[1];
        if (System.currentTimeMillis() - USER_SET_AT > 10 * 60 * 1000L) {
            return; // stale position
        }
        double cLat = lat / 1e7;
        double cLng = lng / 1e7;
        double latMin = cLat - BOX_PADDING_DEG;
        double latMax = cLat + BOX_PADDING_DEG;
        double lngMin = cLng - BOX_PADDING_DEG;
        double lngMax = cLng + BOX_PADDING_DEG;

        // Only fetch tiles not cached yet
        List<Long> tiles = new ArrayList<>();
        long tLatMin = (long) Math.floor((latMin + 90.0) / TILE);
        long tLatMax = (long) Math.floor((latMax + 90.0) / TILE);
        long tLngMin = (long) Math.floor((lngMin + 180.0) / TILE);
        long tLngMax = (long) Math.floor((lngMax + 180.0) / TILE);
        long now = System.currentTimeMillis();
        for (long tLat = tLatMin; tLat <= tLatMax; tLat++) {
            for (long tLng = tLngMin; tLng <= tLngMax; tLng++) {
                long tile = (tLat << 32) | (tLng & 0xFFFFFFFFL);
                Long fetchedAt = FETCHED_AT.get(tile);
                if (fetchedAt != null && now - fetchedAt < CACHE_TTL_MS) {
                    continue;
                }
                tiles.add(tile);
            }
        }
        if (tiles.isEmpty()) {
            return;
        }

        Log.i(TAG, "Fetching Atudo POIs for " + tiles.size() + " tiles around ("
                + cLat + ", " + cLng + ")");

        List<AtudoCamera> cameras = fetchAtudo(latMin, lngMin, latMax, lngMax);
        if (cameras == null) {
            return; // network failure, retry next location update
        }

        boolean injected = false;
        for (AtudoCamera c : cameras) {
            long tile = tile(c.lat, c.lng);
            if (tileLat(tile) >= tLatMin && tileLat(tile) <= tLatMax
                    && tileLng(tile) >= tLngMin && tileLng(tile) <= tLngMax) {
                List<AtudoCamera> list = FRESH.get(tile);
                if (list != null) {
                    boolean dup = false;
                    synchronized (list) {
                        for (AtudoCamera e : list) {
                            if (e.id == c.id) {
                                dup = true;
                                break;
                            }
                        }
                        if (!dup) {
                            list.add(c);
                        }
                    }
                }
            }
            // mark tile fetched regardless
        }
        for (Long tile : tiles) {
            FETCHED_AT.put(tile, System.currentTimeMillis());
        }
        injected = !cameras.isEmpty();

        if (injected) {
            Log.i(TAG, "Injecting " + cameras.size() + " Blitzer.de cameras into the map");
            notifyAppOfNewData();
        }
    }

    /**
     * Tells the app there is new data: calls SpeedCameras.changed() via
     * reflection (package-private static void changed()) to trigger
     * SavedOnMap.refresh() and re-render the map.
     */
    private static void notifyAppOfNewData() {
        try {
            Class<?> cls = Class.forName("org.ungoogled.ui.SpeedCameras");
            Method changed = cls.getDeclaredMethod("changed");
            changed.setAccessible(true);
            changed.invoke(null);
        } catch (Throwable t) {
            Log.w(TAG, "notifyAppOfNewData", t);
        }
    }

    /**
     * Inject a camera into the app's "speed cameras" layer tile cache.
     *
     * The app stores cameras per tile in the CAMERAS layer as
     * Map&lt;Long, List&lt;Camera&gt;&gt; (fields: tiles, fresh). We reflect
     * the Camera constructor and add our cameras to those lists.
     */
    static void injectCamera(double lat, double lng, long id, String limit) {
        try {
            long tile = tile(lat, lng);
            List<AtudoCamera> fresh = FRESH.get(tile);
            if (fresh != null) {
                synchronized (fresh) {
                    for (AtudoCamera e : fresh) {
                        if (e.id == id) {
                            return; // already present
                        }
                    }
                    fresh.add(new AtudoCamera(id, lat, lng, limit));
                }
            }

            Class<?> cls = Class.forName("org.ungoogled.ui.SpeedCameras");
            Field camerasField = cls.getDeclaredField("CAMERAS");
            camerasField.setAccessible(true);
            Object layer = camerasField.get(null);
            if (layer == null) {
                return;
            }

            Class<?> layerClass = layer.getClass();
            Field tilesField = layerClass.getDeclaredField("tiles");
            tilesField.setAccessible(true);
            @SuppressWarnings("unchecked")
            Map<Long, List<Object>> tiles = (Map<Long, List<Object>>) tilesField.get(layer);

            Field freshField = layerClass.getDeclaredField("fresh");
            freshField.setAccessible(true);
            @SuppressWarnings("unchecked")
            Set<Long> freshSet = (Set<Long>) freshField.get(layer);

            Class<?> cameraClass = null;
            for (List<Object> list : tiles.values()) {
                if (!list.isEmpty()) {
                    cameraClass = list.get(0).getClass();
                    break;
                }
            }
            if (cameraClass == null) {
                // No existing cameras yet - create the Camera class instance via constructor
                java.lang.reflect.Constructor<?> ctor = cameraClass != null
                        ? cameraClass.getDeclaredConstructor(long.class, double.class, double.class, int.class, String.class)
                        : null;
                if (ctor == null) {
                    // Try to find Camera class
                    for (Class<?> inner : cls.getDeclaredClasses()) {
                        if (inner.getSimpleName().equals("Camera")) {
                            cameraClass = inner;
                            ctor = inner.getDeclaredConstructor(long.class, double.class, double.class, int.class, String.class);
                            break;
                        }
                    }
                }
                if (cameraClass == null || ctor == null) {
                    return;
                }
            }

            List<Object> tileList = tiles.get(tile);
            if (tileList == null) {
                // The app uses unmodifiable lists; we need to replace the entry
                // with a new mutable list containing the new camera.
                List<Object> newList = new ArrayList<>();
                // kind 0 = speed camera (red "Speed camera" label)
                Object camera = createCamera(cameraClass, id, lat, lng, limit);
                if (camera != null) {
                    newList.add(camera);
                }
                tiles.put(tile, newList);
            } else {
                try {
                    // Try to add directly; the list may be unmodifiable
                    @SuppressWarnings("unchecked")
                    List<Object> mutable = (List<Object>) tileList;
                    Object camera = createCamera(cameraClass, id, lat, lng, limit);
                    if (camera != null) {
                        mutable.add(camera);
                    }
                } catch (UnsupportedOperationException e) {
                    // Replace with a new list
                    List<Object> newList = new ArrayList<>(tileList);
                    Object camera = createCamera(cameraClass, id, lat, lng, limit);
                    if (camera != null) {
                        newList.add(camera);
                    }
                    tiles.put(tile, newList);
                }
            }

            // Mark tile as fresh so the app re-renders it
            if (freshSet != null) {
                freshSet.add(tile);
            }
        } catch (Throwable t) {
            Log.w(TAG, "injectCamera", t);
        }
    }

    private static Object createCamera(Class<?> cameraClass, long id, double lat, double lng, String limit) {
        try {
            java.lang.reflect.Constructor<?> ctor = cameraClass.getDeclaredConstructor(
                    long.class, double.class, double.class, int.class, String.class);
            ctor.setAccessible(true);
            return ctor.newInstance(id, lat, lng, 0, limit); // kind 0 = speed camera
        } catch (Throwable t) {
            Log.w(TAG, "createCamera", t);
            return null;
        }
    }

    static List<AtudoCamera> fetchAtudo(double latMin, double lngMin, double latMax, double lngMax) {
        try {
            String box = String.format(java.util.Locale.ROOT, "%.6f,%.6f,%.6f,%.6f",
                    latMin, lngMin, latMax, lngMax);
            String urlStr = ATUDO_API + "?z=12&type=" + TYPES + "&box=" + box;
            URL url = new URL(urlStr);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("User-Agent", "BlitzerMorph/1.0");
            conn.setRequestProperty("Accept", "application/json");
            conn.setConnectTimeout(10000);
            conn.setReadTimeout(15000);

            int code = conn.getResponseCode();
            if (code != 200) {
                Log.w(TAG, "Atudo API returned HTTP " + code);
                return null;
            }

            BufferedReader reader = new BufferedReader(
                    new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
            reader.close();

            JSONObject root = new JSONObject(sb.toString());
            JSONArray pois = root.optJSONArray("pois");
            if (pois == null) {
                return new ArrayList<>();
            }

            List<AtudoCamera> result = new ArrayList<>();
            for (int i = 0; i < pois.length(); i++) {
                JSONObject poi = pois.getJSONObject(i);
                if ("cluster".equals(poi.optString("type"))) {
                    continue; // skip cluster markers
                }
                String idStr = poi.optString("id");
                if (idStr.isEmpty()) {
                    continue;
                }
                long id;
                try {
                    id = Long.parseLong(idStr);
                } catch (NumberFormatException e) {
                    continue;
                }
                double lat = poi.optDouble("lat", Double.NaN);
                double lng = poi.optDouble("lng", Double.NaN);
                if (Double.isNaN(lat) || Double.isNaN(lng)) {
                    continue;
                }
                String type = poi.optString("type", "");
                String vmax = poi.optString("vmax", "");

                // Determine camera kind based on Atudo type code
                int kind;
                if ("110".equals(type) || "101".equals(type)) {
                    kind = 1; // red light camera
                } else if ("113".equals(type) || "114".equals(type)) {
                    kind = 2; // average speed camera
                } else {
                    kind = 0; // speed camera (mobile, fixed, etc.)
                }

                String label = "Blitzer.de - ";
                if (kind == 1) {
                    label += "Red light";
                } else if (kind == 2) {
                    label += "Avg speed";
                } else {
                    label += "Speed cam";
                }
                if (!vmax.isEmpty() && !"/".equals(vmax) && !"?".equals(vmax)) {
                    label += " " + vmax + " km/h";
                }

                result.add(new AtudoCamera(id, lat, lng, label));
            }
            return result;
        } catch (Throwable t) {
            Log.w(TAG, "fetchAtudo", t);
            return null;
        }
    }

    static long tile(double lat, double lng) {
        return ((long) Math.floor((lat + 90.0) / TILE) << 32)
                | ((long) Math.floor((lng + 180.0) / TILE) & 0xFFFFFFFFL);
    }

    static long tileLat(long tile) {
        return tile >> 32;
    }

    static long tileLng(long tile) {
        return tile & 0xFFFFFFFFL;
    }

    /**
     * Internal camera representation for caching before injection.
     */
    static final class AtudoCamera {
        final long id;
        final double lat;
        final double lng;
        final String label;

        AtudoCamera(long id, double lat, double lng, String label) {
            this.id = id;
            this.lat = lat;
            this.lng = lng;
            this.label = label;
        }
    }
}
