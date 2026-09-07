package app.morphe.extension.reddit.nsfw;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.List;

/**
 * Pure, Android-free core of the NSFW navigation drawer row: clones one of Reddit's own drawer
 * rows, swapping its title string resource for another.
 *
 * <p>Nothing here assumes a fixed class. The drawer row type is obfuscated and renamed every
 * release, so instead of naming it, this:
 *
 * <ol>
 *   <li>reads the source row's instance fields,</li>
 *   <li>finds a constructor whose parameter count matches the field count and fills it by
 *       matching types,</li>
 *   <li>substitutes the new title for the old one and a fresh id for the row's unique id, and</li>
 *   <li><b>verifies</b> the result by reading the new object back - if the new title did not land
 *       where the old one was, it rebuilds with the two int slots swapped.</li>
 * </ol>
 *
 * <p>That verification is the point: a row class whose ints are declared icon-first, or whose
 * constructor orders them differently from its fields, still clones correctly rather than
 * silently producing a row with the wrong label or a broken icon.
 */
public final class DrawerRowCloner {

    /** Stands in for a null reference field, so null can mean "no field left to consume". */
    private static final Object NULL_REFERENCE = new Object();

    private DrawerRowCloner() {
    }

    /**
     * Clones a drawer row, replacing its title resource and unique id.
     *
     * @param row         The row to clone.
     * @param oldTitleId  The title resource the row currently carries.
     * @param newTitleId  The title resource the clone should carry.
     * @param newUniqueId The adapter id the clone should carry.
     * @return The clone, or null if this row's shape could not be reproduced.
     */
    public static Object cloneWithTitle(Object row, int oldTitleId, int newTitleId,
                                        long newUniqueId) {
        if (row == null || oldTitleId == newTitleId) {
            return null;
        }

        Class<?> type = row.getClass();

        List<Field> fields = instanceFields(type);
        if (fields.isEmpty()) {
            return null;
        }

        for (Constructor<?> constructor : type.getDeclaredConstructors()) {
            Class<?>[] parameters = constructor.getParameterTypes();
            if (parameters.length != fields.size()) {
                continue;
            }

            try {
                constructor.setAccessible(true);
            } catch (Throwable ignored) {
                // May still be callable.
            }

            int intParameters = 0;
            for (Class<?> parameter : parameters) {
                if (parameter == int.class) {
                    intParameters++;
                }
            }

            // Try the title in each int slot in turn, and keep whichever verifies.
            for (int titleSlot = 0; titleSlot < intParameters; titleSlot++) {
                Object[] arguments = buildArguments(
                        parameters, fields, row, oldTitleId, newTitleId, newUniqueId, titleSlot);
                if (arguments == null) {
                    continue;
                }

                Object candidate;
                try {
                    candidate = constructor.newInstance(arguments);
                } catch (Throwable ex) {
                    continue;
                }

                if (isFaithfulClone(row, candidate, oldTitleId, newTitleId)) {
                    return candidate;
                }
            }
        }

        return null;
    }

    /**
     * @return Whether an object has an int field holding this value.
     */
    public static boolean hasIntField(Object object, int value) {
        if (object == null) {
            return false;
        }

        try {
            for (Field field : object.getClass().getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || field.getType() != int.class) {
                    continue;
                }
                field.setAccessible(true);
                if (field.getInt(object) == value) {
                    return true;
                }
            }
        } catch (Throwable ignored) {
            // Inaccessible model; treat as no match.
        }

        return false;
    }

    private static List<Field> instanceFields(Class<?> type) {
        List<Field> fields = new ArrayList<>();
        try {
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers())) {
                    continue;
                }
                try {
                    field.setAccessible(true);
                } catch (Throwable ignored) {
                    // May still be readable.
                }
                fields.add(field);
            }
        } catch (Throwable ignored) {
            // Nothing usable.
        }
        return fields;
    }

    private static Object[] buildArguments(Class<?>[] parameters, List<Field> fields, Object row,
                                           int oldTitleId, int newTitleId, long newUniqueId,
                                           int titleSlot) {
        try {
            // Split the int fields up front. The title is the one holding the old title id;
            // every other int slot draws from the rest, in declaration order, so a non-title
            // parameter can never swallow the title's field and strand the real icon.
            Field titleField = null;
            List<Field> otherInts = new ArrayList<>();
            for (Field field : fields) {
                if (field.getType() != int.class) {
                    continue;
                }
                if (titleField == null && field.getInt(row) == oldTitleId) {
                    titleField = field;
                } else {
                    otherInts.add(field);
                }
            }
            if (titleField == null) {
                return null;
            }

            Object[] arguments = new Object[parameters.length];
            boolean[] used = new boolean[fields.size()];
            int intParametersSeen = 0;
            int otherIntsTaken = 0;

            for (int i = 0; i < parameters.length; i++) {
                Class<?> parameter = parameters[i];

                if (parameter == int.class) {
                    if (intParametersSeen++ == titleSlot) {
                        arguments[i] = newTitleId;
                    } else {
                        if (otherIntsTaken >= otherInts.size()) {
                            return null;
                        }
                        arguments[i] = otherInts.get(otherIntsTaken++).getInt(row);
                    }
                    continue;
                }

                if (parameter == long.class) {
                    if (consumeField(fields, used, row, long.class) == null) {
                        return null;
                    }
                    arguments[i] = newUniqueId;
                    continue;
                }

                Object value = consumeField(fields, used, row, parameter);
                if (value == null) {
                    return null;
                }
                arguments[i] = (value == NULL_REFERENCE) ? null : value;
            }

            return arguments;
        } catch (Throwable ex) {
            return null;
        }
    }

    /**
     * Verifies a clone field by field: the title's own field must now hold the new title, and
     * every other int must be untouched.
     *
     * <p>Checking only that the new title appears <em>somewhere</em> is not enough - it passes a
     * clone that put the title in the icon's slot and the icon in the title's.
     */
    private static boolean isFaithfulClone(Object row, Object candidate, int oldTitleId,
                                           int newTitleId) {
        try {
            boolean sawTitle = false;

            for (Field field : instanceFields(row.getClass())) {
                if (field.getType() != int.class) {
                    continue;
                }

                int before = field.getInt(row);
                int after = field.getInt(candidate);

                if (before == oldTitleId && !sawTitle) {
                    sawTitle = true;
                    if (after != newTitleId) {
                        return false;
                    }
                } else if (after != before) {
                    return false;
                }
            }

            return sawTitle;
        } catch (Throwable ex) {
            return false;
        }
    }

    /**
     * Takes the next unused field of a type and returns its value.
     *
     * @return Its value, {@link #NULL_REFERENCE} if that value is null, or null if no unused
     *         field of the type remains.
     */
    private static Object consumeField(List<Field> fields, boolean[] used, Object row,
                                       Class<?> type) throws IllegalAccessException {
        for (int i = 0; i < fields.size(); i++) {
            Field field = fields.get(i);
            if (used[i] || field.getType() != type) {
                continue;
            }
            used[i] = true;
            Object value = field.get(row);
            return value == null ? NULL_REFERENCE : value;
        }
        return null;
    }
}
