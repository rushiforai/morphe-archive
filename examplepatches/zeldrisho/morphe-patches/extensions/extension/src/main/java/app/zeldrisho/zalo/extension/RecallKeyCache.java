package app.zeldrisho.zalo.extension;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.function.Supplier;

/** In-memory snapshot of hashed recall keys; preference changes invalidate the snapshot. */
final class RecallKeyCache {
  private Set<String> keys;

  /**
   * Returns an unmodifiable snapshot, loading and copying keys only after creation or invalidation.
   * Loader failures propagate and leave the cache empty so a later call can retry.
   *
   * @param load supplies a non-null key set when a snapshot is needed
   */
  synchronized Set<String> get(Supplier<Set<String>> load) {
    if (keys == null) keys = Collections.unmodifiableSet(new HashSet<>(load.get()));
    return keys;
  }

  /** Discards the cached snapshot; previously returned snapshots remain unchanged. */
  synchronized void invalidate() {
    keys = null;
  }
}
