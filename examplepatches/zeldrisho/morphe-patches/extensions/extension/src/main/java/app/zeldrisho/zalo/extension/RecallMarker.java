package app.zeldrisho.zalo.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.view.View;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Map;

/** Recall metadata only: no message text, attachment copies, or account tokens. */
public final class RecallMarker {
  private static final String PREFS = "zeldris_recall_markers";
  private static final int MAX_MARKERS = 4096;
  private static final Object LOCK = new Object();

  private RecallMarker() {}

  private static Context context() throws ReflectiveOperationException {
    return (Context) Class.forName("com.zing.zalo.MainApplication")
        .getMethod("getAppContext").invoke(null);
  }

  /** Native MessageId equality accepts either client ID (a) or server ID (b), scoped to owner (c). */
  private static String[] keys(Object id) throws ReflectiveOperationException {
    if (id == null) return new String[0];
    Class<?> cls = id.getClass();
    String owner = (String) cls.getField("c").get(id);
    if (owner == null || owner.isEmpty()) return new String[0];
    ArrayList<String> keys = new ArrayList<>();
    for (String name : new String[] {"a", "b"}) {
      String value = (String) cls.getField(name).get(id);
      if (value != null && !value.isEmpty()) keys.add(digest(owner, name, value));
    }
    return keys.toArray(new String[0]);
  }

  private static String digest(String owner, String kind, String id) {
    try {
      MessageDigest digest = MessageDigest.getInstance("SHA-256");
      // Length-prefix components so delimiter-like characters cannot collide.
      for (String value : new String[] {owner, kind, id}) {
        byte[] bytes = value.getBytes(StandardCharsets.UTF_8);
        digest.update(new byte[] {(byte) (bytes.length >>> 24), (byte) (bytes.length >>> 16),
            (byte) (bytes.length >>> 8), (byte) bytes.length});
        digest.update(bytes);
      }
      StringBuilder result = new StringBuilder(64);
      for (byte value : digest.digest()) {
        result.append(Character.forDigit((value >>> 4) & 15, 16));
        result.append(Character.forDigit(value & 15, 16));
      }
      return result.toString();
    } catch (NoSuchAlgorithmException exception) {
      throw new IllegalStateException(exception);
    }
  }

  /**
   * Returns whether to retain recalled content. When enabled, attempts to record recall metadata;
   * metadata failures do not change the true result. False preserves the native recall path.
   */
  public static boolean retain(Object id) {
    if (!ZeldrisSettings.keepRecalledMessages()) return false;
    record(id);
    return true;
  }

  /** Called before the host queues or executes a remote recall, including not-yet-loaded messages. */
  private static void record(Object id) {
    try {
      Context context = context();
      String[] keys = keys(id);
      if (context == null || keys.length == 0) return;
      synchronized (LOCK) {
        SharedPreferences preferences = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        SharedPreferences.Editor editor = preferences.edit();
        Map<String, ?> snapshot = preferences.getAll();
        int additions = 0;
        for (String key : keys) if (!snapshot.containsKey(key)) additions++;
        int excess = snapshot.size() + additions - MAX_MARKERS;
        if (excess > 0) {
          ArrayList<Map.Entry<String, ?>> oldest = new ArrayList<>(snapshot.entrySet());
          oldest.sort(Comparator.comparingLong(entry -> entry.getValue() instanceof Long
              ? (Long) entry.getValue() : 0L));
          for (Map.Entry<String, ?> entry : oldest) {
            boolean current = false;
            for (String key : keys) if (key.equals(entry.getKey())) current = true;
            if (!current) {
              editor.remove(entry.getKey());
              if (--excess <= 0) break;
            }
          }
        }
        long now = System.currentTimeMillis();
        for (String key : keys) editor.putLong(key, now);
        editor.apply();
      }
    } catch (ReflectiveOperationException | RuntimeException ignored) {
      // Metadata failures must not crash messaging or modify the original payload.
    }
  }

  /**
   * Adds a recalled label to the rendered timestamp when a matching marker exists. Returns the
   * original value if no marker is found or reflection or preference access fails; stored text
   * and media metadata are not changed.
   */
  public static String timeLabel(Object row, String original) {
    try {
      Object message = row.getClass().getField("i").get(row);
      if (message == null) return original;
      Object id = message.getClass().getField("b").get(message);
      Context context = ((View) row).getContext();
      SharedPreferences preferences = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
      for (String key : keys(id)) {
        if (preferences.contains(key)) {
          int label = context.getResources().getIdentifier("recalled_group_msg", "string", context.getPackageName());
          String marker = label == 0 ? "Recalled" : context.getString(label);
          return (original == null || original.isEmpty()) ? marker : original + " · " + marker;
        }
      }
    } catch (ReflectiveOperationException | RuntimeException ignored) {
      // Keep native rendering if the pinned host ABI changes.
    }
    return original;
  }
}
