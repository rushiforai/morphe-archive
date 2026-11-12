package app.font.extension.anytype;

import java.lang.reflect.Proxy;

/** No hard-coded Compose/Kotlin implementation names in the extension. */
public final class FontUi {
    private FontUi() {}
    private static final ThreadLocal<String> ROW = new ThreadLocal<>();
    private static final java.util.Map<Class<?>, Object> LISTENERS = new java.util.HashMap<>();
    public static synchronized void enter(String label, Object callback) {
        ROW.set(LISTENERS.containsValue(callback) ? label : null);
    }
    public static void leave() { ROW.remove(); }
    public static String rowLabel() { return ROW.get(); }
    public static boolean isApplication(String text, int resource) {
        return CustomFontManager.context() != null && CustomFontManager.context().getString(resource).equals(text);
    }
    public static boolean isFont(String text) { return "Font".equals(text); }
    public static synchronized Object listener(Class<?> callbackType, Object unit) {
        Object cached = LISTENERS.get(callbackType);
        if (cached != null) return cached;
        Object result = Proxy.newProxyInstance(callbackType.getClassLoader(), new Class<?>[]{callbackType}, (proxy, method, args) -> {
            if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
            if (method.getName().equals("equals")) return proxy == args[0];
            if (method.getName().equals("toString")) return "AnytypeFontClick";
            FontPickerActivity.showSettings();
            return unit;
        });
        LISTENERS.put(callbackType, result);
        return result;
    }
}
