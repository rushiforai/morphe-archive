/*
 * Zerobun Morphe patches - GPLv3.
 */

package app.zerobun.extension.followertrack;

import java.util.concurrent.ConcurrentHashMap;

/**
 * Values the patch decides at patch time: the tracker URL and token, and the obfuscated
 * member names it resolved for this Instagram build.
 *
 * <p>The patch fills this by injecting {@link #put} calls at the start of the hook,
 * rather than by rewriting string placeholders in the compiled extension. Placeholders
 * are compile-time constants, and the extension's optimiser folds checks on them away -
 * an earlier build lost its whole upload path that way. Values arriving through a
 * public method at runtime cannot be folded.
 */
@SuppressWarnings("unused")
public final class Config {
    private static final ConcurrentHashMap<String, String> VALUES = new ConcurrentHashMap<>();

    private Config() {}

    public static void put(String key, String value) {
        if (key != null && value != null) VALUES.put(key, value);
    }

    public static String get(String key) {
        return VALUES.get(key);
    }

    public static int getInt(String key, int fallback) {
        try {
            String v = VALUES.get(key);
            return v == null ? fallback : Integer.parseInt(v.trim());
        } catch (Exception e) {
            return fallback;
        }
    }
}
