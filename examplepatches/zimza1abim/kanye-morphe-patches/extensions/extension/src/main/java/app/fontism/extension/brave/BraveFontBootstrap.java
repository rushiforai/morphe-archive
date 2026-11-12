package app.fontism.extension.brave;

import android.app.Application;
import android.content.pm.ApplicationInfo;
import android.content.Context;
import android.os.ParcelFileDescriptor;
import android.os.Process;
import android.util.Log;

import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Arrays;

/** Moves the selected font into Chromium before any renderer paints. */
@SuppressWarnings("unused")
public final class BraveFontBootstrap {
    private static final String TAG = "BraveFontNative";
    private static final String SIZE_SWITCH = "fontism-font-size";
    private static final int FONT_DESCRIPTOR_ID = 0x464F4E54; // "FONT"
    private static final int CONFIG_DESCRIPTOR_ID = 0x46434647; // "FCFG"
    private static final ThreadLocal<Long> PENDING_FONT_SIZE = new ThreadLocal<>();
    private static boolean loaded;
    private static boolean childTransportPrepared;

    private BraveFontBootstrap() {}

    public static synchronized void beforeChromiumLoad(ApplicationInfo applicationInfo) {
        if (loaded || applicationInfo == null) return;
        try {
            loadNativeHook();
            if (Process.isIsolated()) {
                // Chromium has not registered the incoming descriptors yet.
                // Their numeric values can change during native registration,
                // so preparation is deliberately deferred.
                Log.i(TAG, "renderer hook loaded; waiting for descriptor registration");
                return;
            } else {
                try (ParcelFileDescriptor descriptor = openSelectedFont()) {
                    if (descriptor == null) return;
                    loaded = nativePrepareFd(descriptor.detachFd());
                }
            }
            Log.i(TAG, loaded ? "runtime font prepared" : "runtime font unavailable; using browser default");
        } catch (Throwable error) {
            loaded = false;
            Log.e(TAG, "native font preparation failed; continuing without hook", error);
        }
    }

    /** Called at the renderer's last Java boundary before native startup. */
    public static void beforeChildNativeStartup(Context context) {
        if (context == null) return;
        Log.i(TAG, "renderer native startup boundary reached");
        beforeChromiumLoad(context.getApplicationInfo());
    }

    /** Adds the generated XML memfd to the same Binder payload as the font. */
    public static synchronized void attachChildConfigDescriptor(Object childArguments) {
        if (childTransportPrepared || childArguments == null) return;
        ParcelFileDescriptor configParcel = null;
        try {
            Object descriptors = null;
            Field descriptorArrayField = null;
            for (Field field : childArguments.getClass().getDeclaredFields()) {
                if (field.getType().isArray() &&
                        field.getType().getComponentType().getName().endsWith("IFileDescriptorInfo")) {
                    field.setAccessible(true);
                    descriptors = field.get(childArguments);
                    descriptorArrayField = field;
                    break;
                }
            }
            if (descriptors == null || descriptorArrayField == null) return;

            Class<?> componentType = descriptors.getClass().getComponentType();
            ParcelFileDescriptor fontDescriptor = null;
            for (int index = 0; index < Array.getLength(descriptors); index++) {
                Object descriptor = Array.get(descriptors, index);
                int id = Integer.MIN_VALUE;
                ParcelFileDescriptor parcel = null;
                for (Field field : componentType.getDeclaredFields()) {
                    field.setAccessible(true);
                    if (field.getType() == int.class) id = field.getInt(descriptor);
                    else if (field.getType() == ParcelFileDescriptor.class) {
                        parcel = (ParcelFileDescriptor) field.get(descriptor);
                    }
                }
                if (id == FONT_DESCRIPTOR_ID && parcel != null) {
                    fontDescriptor = parcel;
                    break;
                }
            }
            if (fontDescriptor == null) return;

            loadNativeHook();
            int configFd = nativePrepareChildTransport(fontDescriptor.getFd());
            if (configFd < 0) throw new IllegalStateException("native config descriptor unavailable");
            configParcel = ParcelFileDescriptor.adoptFd(configFd);

            Object configDescriptor = componentType.getDeclaredConstructor().newInstance();
            boolean fdAssigned = false;
            boolean idAssigned = false;
            for (Field field : componentType.getDeclaredFields()) {
                field.setAccessible(true);
                if (field.getType() == ParcelFileDescriptor.class && !fdAssigned) {
                    field.set(configDescriptor, configParcel);
                    fdAssigned = true;
                } else if (field.getType() == int.class && !idAssigned) {
                    field.setInt(configDescriptor, CONFIG_DESCRIPTOR_ID);
                    idAssigned = true;
                } else if (field.getType() == long.class) {
                    field.setLong(configDescriptor, 0L);
                }
            }
            if (!fdAssigned || !idAssigned) throw new IllegalStateException("descriptor layout changed");

            int length = Array.getLength(descriptors);
            Object expanded = Array.newInstance(componentType, length + 1);
            System.arraycopy(descriptors, 0, expanded, 0, length);
            Array.set(expanded, length, configDescriptor);
            descriptorArrayField.set(childArguments, expanded);
            configParcel = null; // Chromium owns it now.
            childTransportPrepared = true;
            Log.i(TAG, "font and XML descriptors attached to Chromium child payload");
        } catch (Throwable error) {
            Log.e(TAG, "could not attach child font configuration descriptor", error);
        } finally {
            if (configParcel != null) {
                try { configParcel.close(); } catch (Throwable ignored) {}
            }
        }
    }

    /** Runs immediately after Chromium takes native ownership of child FDs. */
    public static synchronized void afterChildDescriptorsRegistered() {
        if (loaded || !Process.isIsolated() || !childTransportPrepared) return;
        try {
            long expectedSize = readCommandLineLong(SIZE_SWITCH);
            loaded = expectedSize > 0 && nativeRebindRegisteredDescriptors(expectedSize);
            if (!loaded) {
                Log.e(TAG, "registered Chromium font/XML descriptors were not found");
                return;
            }
            Log.i(TAG, "runtime font/XML paths rebound after descriptor registration");
            if (!nativeActivate()) {
                loaded = false;
                Log.e(TAG, "post-registration libchrome hook activation returned false");
            }
        } catch (Throwable error) {
            loaded = false;
            Log.e(TAG, "post-registration font preparation failed", error);
        }
    }

    public static synchronized void afterChromiumLoad() {
        if (!loaded) return;
        try {
            if (!nativeActivate()) Log.e(TAG, "libchrome hook activation returned false");
        } catch (Throwable error) {
            Log.e(TAG, "libchrome hook activation failed", error);
        }
    }

    /**
     * Called in the browser process at ChildProcessLauncherHelperImpl.createAndStart().
     * The returned array carries an ordinary provider FD through Chromium's existing
     * Binder child-process protocol, which is allowed even though isolated renderers
     * cannot acquire ContentProviders themselves.
     */
    public static Object augmentChildDescriptors(Object descriptors) {
        PENDING_FONT_SIZE.remove();
        if (descriptors == null || !descriptors.getClass().isArray() || Process.isIsolated()) {
            return descriptors;
        }
        ParcelFileDescriptor font = null;
        try {
            font = openSelectedFont();
            if (font == null) return descriptors;
            long size = font.getStatSize();
            if (size < 12) throw new IllegalStateException("Selected font has no stable size");

            Class<?> componentType = descriptors.getClass().getComponentType();
            Object descriptor = componentType.getDeclaredConstructor().newInstance();
            boolean fdAssigned = false;
            boolean idAssigned = false;
            for (Field field : componentType.getDeclaredFields()) {
                field.setAccessible(true);
                if (field.getType() == ParcelFileDescriptor.class && !fdAssigned) {
                    field.set(descriptor, font);
                    fdAssigned = true;
                } else if (field.getType() == int.class && !idAssigned) {
                    field.setInt(descriptor, FONT_DESCRIPTOR_ID);
                    idAssigned = true;
                } else if (field.getType() == long.class) {
                    field.setLong(descriptor, 0L);
                }
            }
            if (!fdAssigned || !idAssigned) {
                throw new IllegalStateException("Chromium descriptor layout was not recognized");
            }

            int length = Array.getLength(descriptors);
            Object expanded = Array.newInstance(componentType, length + 1);
            System.arraycopy(descriptors, 0, expanded, 0, length);
            Array.set(expanded, length, descriptor);
            PENDING_FONT_SIZE.set(size);
            font = null; // Chromium now owns and closes this descriptor.
            return expanded;
        } catch (Throwable error) {
            Log.e(TAG, "could not attach font FD to Chromium child", error);
            return descriptors;
        } finally {
            if (font != null) {
                try { font.close(); } catch (Throwable ignored) {}
            }
        }
    }

    public static String[] augmentChildArgs(String[] arguments) {
        Long size = PENDING_FONT_SIZE.get();
        PENDING_FONT_SIZE.remove();
        if (size == null || size < 12 || arguments == null) return arguments;
        String[] expanded = Arrays.copyOf(arguments, arguments.length + 1);
        expanded[arguments.length] = "--" + SIZE_SWITCH + "=" + size;
        return expanded;
    }

    private static ParcelFileDescriptor openSelectedFont() throws Exception {
        Application application = currentApplication();
        if (application == null) return null;
        if (!BraveFontStore.SOURCE_INTERNAL.equals(BraveFontStore.source(application))) {
            return null;
        }
        ParcelFileDescriptor internal = BraveFontStore.openInternalFont(application);
        if (internal == null) Log.w(TAG, "selected Brave font unavailable; using browser default");
        return internal;
    }

    private static void loadNativeHook() {
        // libshadowhook is a DT_NEEDED dependency of the Fontism hook. Loading
        // it from Java would invoke ShadowHook's optional JNI_OnLoad, which
        // expects its Java wrapper class and fails in this native-only patch.
        System.loadLibrary("fontism_brave_233");
    }

    /**
     * Chromium now loads its library from Application.attachBaseContext, before
     * ActivityThread publishes the Application, so fall back to a package context.
     */
    private static Context packageContext() throws Exception {
        Application application = currentApplication();
        if (application != null) return application;
        Class<?> activityThread = Class.forName("android.app.ActivityThread");
        Object thread = activityThread.getDeclaredMethod("currentActivityThread").invoke(null);
        String packageName = (String) activityThread.getDeclaredMethod("currentPackageName").invoke(null);
        if (thread == null || packageName == null) return null;
        Context system = (Context) activityThread.getDeclaredMethod("getSystemContext").invoke(thread);
        return system.createPackageContext(packageName, 0);
    }

    private static Application currentApplication() throws Exception {
        Class<?> activityThread = Class.forName("android.app.ActivityThread");
        Method method = activityThread.getDeclaredMethod("currentApplication");
        return (Application) method.invoke(null);
    }

    private static long readCommandLineLong(String switchName) throws Exception {
        Class<?> commandLine = Class.forName("org.chromium.base.CommandLine");
        Object singleton = null;
        for (Field field : commandLine.getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers()) && field.getType() == commandLine) {
                field.setAccessible(true);
                singleton = field.get(null);
                if (singleton != null) break;
            }
        }
        if (singleton == null) return -1;
        for (Method method : commandLine.getDeclaredMethods()) {
            Class<?>[] parameters = method.getParameterTypes();
            if (!Modifier.isStatic(method.getModifiers()) && method.getReturnType() == String.class &&
                    parameters.length == 1 && parameters[0] == String.class) {
                method.setAccessible(true);
                Object value = method.invoke(singleton, switchName);
                if (value instanceof String) return Long.parseLong((String) value);
            }
        }
        return -1;
    }

    private static native boolean nativePrepareFd(int fontFd);
    private static native boolean nativePrepareInherited(long expectedSize);
    private static native int nativePrepareChildTransport(int borrowedFontFd);
    private static native boolean nativeRebindRegisteredDescriptors(long expectedSize);
    private static native boolean nativeActivate();
}
