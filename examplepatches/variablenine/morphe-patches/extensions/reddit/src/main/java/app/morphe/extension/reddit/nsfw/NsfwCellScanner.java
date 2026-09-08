package app.morphe.extension.reddit.nsfw;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Pure, Android-free core for reading a post's NSFW state out of Reddit's GraphQL cell models.
 *
 * <p>The modern home feed is built from GraphQL "cells", not from the {@code Link} domain model,
 * and its feed elements carry only a link id, a unique id, an "is promoted" flag and an
 * identifier - no NSFW anywhere. The flag has to be read off the response instead, where the
 * cells still carry their tags.
 *
 * <p>Everything here is found by shape rather than by name, because every class and field on
 * those fragments is renamed each release:
 * <ul>
 *   <li>the post id is the {@code String} field holding a {@code t3_} fullname, which is
 *       self-validating - no other string on the fragment looks like one;</li>
 *   <li>NSFW is an enum constant named {@code NSFW} on a <em>post indicator</em> enum, which is
 *       recognised by the company its constant keeps: the same type must also declare
 *       {@code ORIGINAL}, {@code QUARANTINED} and {@code SPOILER}. Enum constant names are the
 *       one part of a GraphQL model R8 leaves alone, since they go over the wire, so this needs
 *       no class name at all.</li>
 * </ul>
 *
 * <p>Matching the constant name alone is not enough, and that was a real bug: eleven enums in
 * the app declare an {@code NSFW} constant, among them {@code NSFWState} (a subreddit's or
 * profile's own rating), {@code DisplayTag}, {@code QueryTag} and {@code MediaBlurType}. Any of
 * those reachable from a post's edge marked it 18+, which is how SFW posts kept reaching an 18+
 * feed. Requiring {@code ORIGINAL}, {@code QUARANTINED} and {@code SPOILER} alongside it picks
 * out exactly the two types that tag a post - {@code com.reddit.type.CellIndicatorType} on the
 * response and {@code com.reddit.feeds.model.IndicatorType} on the mapped element - and no
 * others.
 *
 * <p>Depth matters here. An edge reaches its indicators through
 * edge - node - cell group - group fragment - cells - cell - indicators cell - indicators, which
 * is nine hops, so a shallow walk finds the post id and none of its tags: every post then reads
 * as SFW and the feed empties. {@link #MAX_DEPTH} has margin over that path on purpose.
 */
public final class NsfwCellScanner {

    /** Reddit's fullname prefix for a post. */
    private static final String POST_ID_PREFIX = "t3_";

    /** The enum constant Reddit's schema uses for 18+ content. */
    private static final String NSFW_CONSTANT = "NSFW";

    /**
     * The constants a post indicator enum keeps alongside {@code NSFW}. They separate the two
     * types that tag a post from every other enum that happens to spell {@code NSFW}: a
     * subreddit's rating, a search display tag, a blur type, an analytics noun.
     */
    private static final String[] INDICATOR_SIBLINGS = { "ORIGINAL", "QUARANTINED", "SPOILER" };

    /** Whether an enum type tags posts, decided once per type. */
    private static final Map<Class<?>, Boolean> indicatorTypes = new HashMap<>();

    /**
     * How deep to walk a fragment's object graph. The indicators of a home feed post sit nine
     * hops from the edge; the rest is margin for a schema that grows another wrapper.
     */
    private static final int MAX_DEPTH = 12;

    /**
     * Readable instance fields per class. The walk visits the same few dozen fragment classes
     * thousands of times per page, and {@link Class#getDeclaredFields()} allocates a fresh array
     * on every call.
     */
    private static final Map<Class<?>, Field[]> fieldCache = new HashMap<>();

    private NsfwCellScanner() {
    }

    /**
     * Reads a post id and its NSFW state out of a GraphQL cell fragment.
     *
     * @param fragment The fragment to scan.
     * @return The result, or null if this object carries no post id.
     */
    public static Scan scan(Object fragment) {
        return scan(fragment, null);
    }

    /**
     * Reads a post id and its NSFW state out of a GraphQL cell fragment.
     *
     * @param fragment    The fragment to scan.
     * @param enumNamesOut If non-null, every enum constant met on the way is added to it as
     *                     {@code SimpleType.CONSTANT}. Collecting them forces the whole graph to
     *                     be walked, so pass null unless the names are actually wanted.
     * @return The result, or null if this object carries no post id.
     */
    public static Scan scan(Object fragment, Set<String> enumNamesOut) {
        // Only a model object is a fragment. Refusing strings, numbers and collections at the
        // root keeps stray values out of the map, even though the walk would happily find a
        // t3_ id inside one.
        if (fragment == null || !isModel(fragment)) {
            return null;
        }

        Scan scan = new Scan();
        scan.enumNames = enumNamesOut;
        walk(fragment, scan, 0, new IdentityHashMap<>());
        return scan.postId == null ? null : scan;
    }

    /**
     * @return Whether a value is the NSFW marker itself - the {@code NSFW} constant of an enum
     *         that tags posts, rather than of one that merely spells the same word.
     */
    public static boolean isNsfwIndicator(Object value) {
        return value instanceof Enum
                && NSFW_CONSTANT.equals(((Enum<?>) value).name())
                && isPostIndicator(((Enum<?>) value).getDeclaringClass());
    }

    /**
     * @return Whether an enum type is one that tags a post, judged by the constants it declares.
     */
    private static boolean isPostIndicator(Class<?> type) {
        synchronized (indicatorTypes) {
            Boolean cached = indicatorTypes.get(type);
            if (cached != null) {
                return cached;
            }
        }

        boolean isIndicator = declaresAll(type, INDICATOR_SIBLINGS);
        synchronized (indicatorTypes) {
            indicatorTypes.put(type, isIndicator);
        }
        return isIndicator;
    }

    private static boolean declaresAll(Class<?> type, String[] required) {
        Object[] constants = type.getEnumConstants();
        if (constants == null) {
            return false;
        }

        for (String name : required) {
            boolean found = false;
            for (Object constant : constants) {
                if (constant instanceof Enum && name.equals(((Enum<?>) constant).name())) {
                    found = true;
                    break;
                }
            }
            if (!found) {
                return false;
            }
        }
        return true;
    }

    /**
     * @return Whether an object is one of Reddit's own model classes rather than a framework
     *         value or a container.
     */
    private static boolean isModel(Object value) {
        if (value instanceof CharSequence || value instanceof Number
                || value instanceof Boolean || value instanceof Collection
                || value instanceof Enum) {
            return false;
        }
        return !isFrameworkClass(value.getClass().getName());
    }

    private static boolean isFrameworkClass(String className) {
        return className.startsWith("java.") || className.startsWith("kotlin.")
                || className.startsWith("android.") || className.startsWith("androidx.");
    }

    /**
     * @param seen The depth each object was last walked at. A depth-limited walk has to allow a
     *             second visit from a shallower path, or an object first met at the limit is
     *             written off before its own children are ever looked at.
     */
    private static void walk(Object node, Scan scan, int depth, Map<Object, Integer> seen) {
        if (node == null || depth > MAX_DEPTH || scan.done()) {
            return;
        }

        Integer previous = seen.put(node, depth);
        if (previous != null && previous <= depth) {
            return;
        }

        if (node instanceof Enum) {
            String name = ((Enum<?>) node).name();
            if (isNsfwIndicator(node)) {
                scan.nsfw = true;
            }
            if (scan.enumNames != null && !isFrameworkClass(node.getClass().getName())) {
                scan.enumNames.add(simpleName(node.getClass()) + "." + name);
            }
            return;
        }

        if (node instanceof CharSequence) {
            String text = node.toString();
            if (scan.postId == null && text.startsWith(POST_ID_PREFIX)
                    && text.length() > POST_ID_PREFIX.length()) {
                scan.postId = text;
            }
            return;
        }

        if (node instanceof Collection) {
            for (Object item : (Collection<?>) node) {
                walk(item, scan, depth + 1, seen);
            }
            return;
        }

        if (node instanceof Map) {
            for (Object item : ((Map<?, ?>) node).values()) {
                walk(item, scan, depth + 1, seen);
            }
            return;
        }

        if (node instanceof Object[]) {
            for (Object item : (Object[]) node) {
                walk(item, scan, depth + 1, seen);
            }
            return;
        }

        // Only walk Reddit's own models; anything else is framework noise.
        if (node instanceof Number || node instanceof Boolean
                || isFrameworkClass(node.getClass().getName())) {
            return;
        }

        for (Field field : declaredFields(node.getClass())) {
            Object value;
            try {
                value = field.get(node);
            } catch (Throwable ex) {
                continue;
            }
            walk(value, scan, depth + 1, seen);
        }
    }

    private static String simpleName(Class<?> type) {
        String name = type.getName();
        int cut = Math.max(name.lastIndexOf('.'), name.lastIndexOf('$'));
        return cut < 0 ? name : name.substring(cut + 1);
    }

    private static Field[] declaredFields(Class<?> type) {
        synchronized (fieldCache) {
            Field[] cached = fieldCache.get(type);
            if (cached != null) {
                return cached;
            }
        }

        List<Field> fields = new ArrayList<>();
        try {
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers())) {
                    continue;
                }
                if (field.getType().isPrimitive()) {
                    // Nothing to walk into, and reading one boxes an object per post.
                    continue;
                }
                try {
                    field.setAccessible(true);
                } catch (Throwable ignored) {
                    continue;
                }
                fields.add(field);
            }
        } catch (Throwable ignored) {
            // Nothing readable.
        }

        Field[] result = fields.toArray(new Field[0]);
        synchronized (fieldCache) {
            fieldCache.put(type, result);
        }
        return result;
    }

    /**
     * What a scan found on one fragment.
     */
    public static final class Scan {
        /** The post's {@code t3_} fullname, or null if none was present. */
        public String postId;

        /** Whether the fragment carried the NSFW marker. */
        public boolean nsfw;

        /** Where to collect the enum constants met, or null to collect none. */
        Set<String> enumNames;

        /**
         * @return Whether there is nothing left to learn from this fragment. Only true once both
         *         answers are in and no diagnostic is being collected, since a diagnostic wants
         *         the whole graph.
         */
        boolean done() {
            return nsfw && postId != null && enumNames == null;
        }
    }
}
