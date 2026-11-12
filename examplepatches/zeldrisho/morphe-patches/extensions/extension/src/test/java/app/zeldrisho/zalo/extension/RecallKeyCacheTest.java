package app.zeldrisho.zalo.extension;

import static org.junit.jupiter.api.Assertions.*;

import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;
import org.junit.jupiter.api.Test;

class RecallKeyCacheTest {
  @Test void loadsOnceAndCopiesTheSnapshot() {
    RecallKeyCache cache = new RecallKeyCache();
    Set<String> source = new HashSet<>(Set.of("hashed-a"));
    AtomicInteger loads = new AtomicInteger();
    Set<String> cached = cache.get(() -> { loads.incrementAndGet(); return source; });
    source.add("hashed-b");
    assertEquals(Set.of("hashed-a"), cache.get(() -> { loads.incrementAndGet(); return source; }));
    assertEquals(1, loads.get());
    assertThrows(UnsupportedOperationException.class, () -> cached.add("hashed-c"));
  }

  @Test void invalidationReloadsNewAndEvictedKeys() {
    RecallKeyCache cache = new RecallKeyCache();
    assertEquals(Set.of("old"), cache.get(() -> Set.of("old")));
    cache.invalidate();
    assertEquals(Set.of("new"), cache.get(() -> Set.of("new")));
    cache.invalidate();
    assertTrue(cache.get(Set::of).isEmpty());
  }

  @Test void failedLoadCanBeRetried() {
    RecallKeyCache cache = new RecallKeyCache();
    assertThrows(IllegalStateException.class, () -> cache.get(() -> { throw new IllegalStateException(); }));
    assertEquals(Set.of("hashed"), cache.get(() -> Set.of("hashed")));
  }
}
