package app.zeldrisho.threads.extension;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/** Filters only explicitly typed suggested-user units from the inspected spool feed path. */
public final class SuggestedUsersFilter {
  private SuggestedUsersFilter() {}

  /**
   * Removes recognized suggested-user units without modifying the input list.
   * Returns the original list for null or empty input, when nothing matches, or when reflection
   * or scanning inside the filter throws a reflective or runtime exception. Otherwise returns a
   * new list of retained items. Errors from checking whether the input is empty propagate.
   */
  public static List<?> filter(List<?> items) {
    if (items == null || items.isEmpty()) return items;
    try {
      ClassLoader loader = SuggestedUsersFilter.class.getClassLoader();
      Class<?> itemClass = loader.loadClass("X.HO7");
      Class<?> metadataClass = loader.loadClass("X.Gf6");
      Class<?> feedItemClass = loader.loadClass("X.9aG");
      Field itemMetadata = itemClass.getField("A00");
      Field itemPayload = itemClass.getField("A05");
      Field metadataMap = metadataClass.getField("A00");
      Method itemType = feedItemClass.getMethod("A03");
      ArrayList<Object> result = null;
      for (int i = 0; i < items.size(); i++) {
        Object item = items.get(i);
        boolean remove = isKickstart(item, feedItemClass, itemType);
        if (!remove && itemClass.isInstance(item)) {
          remove = isKickstart(itemPayload.get(item), feedItemClass, itemType);
          Object metadata = itemMetadata.get(item);
          if (metadataClass.isInstance(metadata)) {
            Object map = metadataMap.get(metadata);
            remove = remove || (map instanceof Map && "SUGGESTED_USERS".equals(((Map<?, ?>) map).get("feedItemType")));
          }
        }
        if (remove) {
          if (result == null) {
            result = new ArrayList<>(items.size());
            result.addAll(items.subList(0, i));
          }
        } else if (result != null) {
          result.add(item);
        }
      }
      return result == null ? items : result;
    } catch (ReflectiveOperationException | RuntimeException ignored) {
      // Unknown host objects or an inaccessible field must not break the feed.
      return items;
    }
  }

  private static boolean isKickstart(Object item, Class<?> itemClass, Method typeMethod)
      throws ReflectiveOperationException {
    if (!itemClass.isInstance(item)) return false;
    Object type = typeMethod.invoke(item);
    return type instanceof Enum && "KICKSTART_FEED_UNIT".equals(((Enum<?>) type).name());
  }
}
