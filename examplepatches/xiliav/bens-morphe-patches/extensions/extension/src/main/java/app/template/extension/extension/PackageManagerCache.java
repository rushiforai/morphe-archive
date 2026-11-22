package app.template.extension.extension;

import java.lang.reflect.Field;

/** Repair an ApplicationPackageManager that was created before the static hook. */
final class PackageManagerCache {
    private PackageManagerCache() { }

    static boolean replaceDelegate(Object manager, Object delegate) throws ReflectiveOperationException {
        if (manager == null) return false;
        Field field = findField(manager.getClass(), "mPM");
        field.setAccessible(true);
        field.set(manager, delegate);
        return field.get(manager) == delegate;
    }

    static Field findField(Class<?> type, String name) throws NoSuchFieldException {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            try {
                return current.getDeclaredField(name);
            } catch (NoSuchFieldException ignored) { }
        }
        throw new NoSuchFieldException(type.getName() + "." + name);
    }
}
