package app.template.extension.extension;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.content.pm.SigningInfo;
import android.os.IBinder;
import android.util.Log;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.security.MessageDigest;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Map;
import java.util.Set;

/** Process-local Transit compatibility hook, adapted from rushiranpise/morphe-patches. */
public final class TransitHelper {
    private static final String TAG = "TransitHelper";
    private static final String PKG = "com.thetransitapp.droid";
    private static final String CERT_HEX = "3082038130820269a00302010202047a1bd445300d06092a864886f70d01010b05003071310b3009060355040613024341310b30090603550408130251633111300f060355040713084d6f6e747265616c31183016060355040a130f546865205472616e736974204170703110300e060355040b1307556e6b6e6f776e311630140603550403130d53616d75656c2044696f6e6e65301e170d3133303530333232323130345a170d3430303931383232323130345a3071310b3009060355040613024341310b30090603550408130251633111300f060355040713084d6f6e747265616c31183016060355040a130f546865205472616e736974204170703110300e060355040b1307556e6b6e6f776e311630140603550403130d53616d75656c2044696f6e6e6530820122300d06092a864886f70d01010105000382010f003082010a0282010100a3154a31c4e7bcd2eb73679bcea1ccdaadbe6149e2fe879cd2cf890b217ff7ae2600ba789e6f0d8d2f26f007d0ef3071e61039e7ecbac13a55efe4cecf519518cf7b75e0a668a34bee2df523e6fe7f4b0ef8a6609572c90e8d6d857f38bef2257d8ad65a4994a2d0fe0bdb0009fb0c9b6a8046d59e4e479ee30cc7f432c0fd93b076863651e08832828d79c35d747580ce3fe6acdd60f895daff0ce5702008a675a88eb80d27188d656159720ed87f17c69529cfc36caa0314368c4b1c0cfa1b846e00c446278d504dbe160f11cbd8a45cd1c214ea36d208aee3a9e5d8fb7204c531610ade278686b66e4d80b13c3c61bd837f1acd78d5716e0dbdbcffa6d4e70203010001a321301f301d0603551d0e04160414ca6f80b1786e5ba660abf3dc98bc6c42cfc338b3300d06092a864886f70d01010b0500038201010073d17e1fb8b9424d8bd09316a3ef71dbb73d973bbe021000fd7e05226ab16d0bf906f2654c45474997390dded446804d0017444a6a942e8106233031e22f0afb9345987c0194c8834a0ac35c6b4b3485b22a6935ca8c7c46d9ff41c8996b4c1cf8d74669e2dfc7e1b29d8f3248a3ae7a5398135fdf165b97f32abf33997ab59d36ee632fc0fab3bdc8cd78c057a6c4dea84baf547db5e49f0f03c69dd430d136220894d623afa092b34965ec4a369ecdf3d669a600d217e5bc62b09dc92eddf8e94d47785c978220771df853d76b2db5a245a668a240ff12297dc78efe50b58c2c7d119b58e12883a42e38adf28301bce298672a6262fbfac36146f919bb4d0e";
    private static Object installedProxy;
    private static boolean signingWarningLogged;

    public static synchronized void init(Context context, final String mapsApiKey) {
        if (context == null || !PKG.equals(context.getPackageName())) return;
        try {
            org.lsposed.hiddenapibypass.HiddenApiBypass.addHiddenApiExemptions("L");
            if (installedProxy == null) {
                installPackageManagerProxy(mapsApiKey);
            }
            // Application and ContextImpl may already hold an ApplicationPackageManager.
            // Repeat the cache repair at onCreate after the early attachBaseContext hook.
            Set<Context> seen = Collections.newSetFromMap(new IdentityHashMap<Context, Boolean>());
            int repaired = repairContextChain(context, mapsApiKey, seen);
            Context application = context.getApplicationContext();
            if (application != null) repaired += repairContextChain(application, mapsApiKey, seen);
            Log.i(TAG, "Compatibility hook ready; refreshed context caches=" + repaired
                + "; Maps key=" + (hasOverride(mapsApiKey) ? "override" : "original"));
            reportSigningCertificate(context);
        } catch (Throwable error) {
            Log.e(TAG, "Compatibility hook initialization failed", error);
        }
    }

    private static void installPackageManagerProxy(final String mapsApiKey) throws Exception {
        Class<?> activityThread = Class.forName("android.app.ActivityThread");
        Field field = activityThread.getDeclaredField("sPackageManager");
        field.setAccessible(true);
        Object original = field.get(null);
        if (original == null) {
            Method getter = activityThread.getDeclaredMethod("getPackageManager");
            getter.setAccessible(true);
            original = getter.invoke(null);
        }
        if (original == null) throw new IllegalStateException("Package manager is unavailable");
        final Object delegate = original;
        Class<?> api = Class.forName("android.content.pm.IPackageManager");
        final Object proxy = Proxy.newProxyInstance(api.getClassLoader(), new Class<?>[]{api},
            (object, method, args) -> {
                Object result;
                try {
                    result = method.invoke(delegate, args);
                } catch (InvocationTargetException error) {
                    throw error.getTargetException();
                }
                if (args != null && args.length > 0 && PKG.equals(args[0])) {
                    String name = method.getName();
                    if (("getPackageInfo".equals(name) || "getPackageInfoAsUser".equals(name))
                            && result instanceof PackageInfo) {
                        spoofSignature((PackageInfo) result);
                    } else if (("getApplicationInfo".equals(name) || "getApplicationInfoAsUser".equals(name))
                            && result instanceof ApplicationInfo) {
                        applyMapsKey((ApplicationInfo) result, mapsApiKey);
                    }
                }
                return result;
            });
        field.set(null, proxy);
        installedProxy = proxy;
        try {
            Class<?> serviceManager = Class.forName("android.os.ServiceManager");
            Field cacheField = serviceManager.getDeclaredField("sCache");
            cacheField.setAccessible(true);
            @SuppressWarnings("unchecked")
            Map<String, IBinder> cache = (Map<String, IBinder>) cacheField.get(null);
            final IBinder originalBinder = (IBinder) serviceManager.getMethod("getService", String.class)
                .invoke(null, "package");
            if (originalBinder != null) {
                IBinder bridge = (IBinder) Proxy.newProxyInstance(IBinder.class.getClassLoader(),
                    new Class<?>[]{IBinder.class}, (object, method, args) -> {
                        if ("queryLocalInterface".equals(method.getName())) return proxy;
                        try {
                            return method.invoke(originalBinder, args);
                        } catch (InvocationTargetException error) {
                            throw error.getTargetException();
                        }
                    });
                synchronized (cache) { cache.put("package", bridge); }
            }
        } catch (Throwable error) {
            Log.w(TAG, "Package-service cache hook unavailable; using package-manager hooks", error);
        }
    }

    private static int repairContextChain(Context context, String mapsApiKey, Set<Context> seen) {
        int repaired = 0;
        while (context != null && seen.add(context)) {
            try {
                if (PackageManagerCache.replaceDelegate(context.getPackageManager(), installedProxy)) repaired++;
            } catch (Throwable error) {
                Log.w(TAG, "Could not refresh a cached package manager", error);
            }
            try {
                // Context.getApplicationInfo() reads LoadedApk's cached object, not IPackageManager.
                applyMapsKey(context.getApplicationInfo(), mapsApiKey);
            } catch (Throwable error) {
                Log.w(TAG, "Could not refresh cached Maps metadata", error);
            }
            context = context instanceof ContextWrapper ? ((ContextWrapper) context).getBaseContext() : null;
        }
        return repaired;
    }

    // Replaced at patch time with the input APK's certificate when available.
    public static String originalCertificateHex() {
        return CERT_HEX;
    }

    private static void spoofSignature(PackageInfo info) {
        Signature[] signatures = new Signature[]{new Signature(hexToBytes(originalCertificateHex()))};
        info.signatures = signatures;
        try {
            // The SigningDetails class changed package across Android releases. Resolve
            // the actual field type rather than assuming one framework class name.
            Field detailsField = PackageManagerCache.findField(SigningInfo.class, "mSigningDetails");
            detailsField.setAccessible(true);
            Class<?> detailsType = detailsField.getType();
            Object details = buildSigningDetails(detailsType, signatures);
            Constructor<SigningInfo> constructor = SigningInfo.class.getDeclaredConstructor();
            constructor.setAccessible(true);
            SigningInfo signingInfo = constructor.newInstance();
            detailsField.set(signingInfo, details);
            info.signingInfo = signingInfo;
        } catch (Throwable error) {
            if (!signingWarningLogged) {
                signingWarningLogged = true;
                Log.w(TAG, "Modern signing-info hook failed; legacy signatures are still supplied", error);
            }
        }
    }

    private static Object buildSigningDetails(Class<?> type, Signature[] signatures) throws Exception {
        try {
            Class<?> builderType = Class.forName(type.getName() + "$Builder");
            Constructor<?> constructor = builderType.getDeclaredConstructor();
            constructor.setAccessible(true);
            Object builder = constructor.newInstance();
            Method setSignatures = builderType.getDeclaredMethod("setSignatures", Signature[].class);
            setSignatures.setAccessible(true);
            setSignatures.invoke(builder, (Object) signatures);
            Method setScheme = builderType.getDeclaredMethod("setSignatureSchemeVersion", int.class);
            setScheme.setAccessible(true);
            setScheme.invoke(builder, 1);
            Method build = builderType.getDeclaredMethod("build");
            build.setAccessible(true);
            return build.invoke(builder);
        } catch (ReflectiveOperationException builderError) {
            Constructor<?> constructor = type.getDeclaredConstructor(Signature[].class, int.class);
            constructor.setAccessible(true);
            return constructor.newInstance(signatures, 1);
        }
    }

    private static boolean hasOverride(String key) {
        return key != null && !key.trim().isEmpty();
    }

    private static void applyMapsKey(ApplicationInfo info, String key) {
        if (info == null || !hasOverride(key)) return;
        if (info.metaData == null) info.metaData = new android.os.Bundle();
        info.metaData.putString("com.google.android.maps.v2.API_KEY", key);
    }

    @SuppressWarnings("deprecation")
    private static void reportSigningCertificate(Context context) {
        try {
            PackageInfo info = context.getPackageManager().getPackageInfo(PKG,
                PackageManager.GET_SIGNING_CERTIFICATES | PackageManager.GET_SIGNATURES);
            Signature[] signatures = info.signingInfo != null
                ? info.signingInfo.getApkContentsSigners() : info.signatures;
            if (signatures == null || signatures.length == 0) return;
            byte[] digest = MessageDigest.getInstance("SHA-1").digest(signatures[0].toByteArray());
            StringBuilder hex = new StringBuilder();
            for (byte value : digest) {
                if (hex.length() > 0) hex.append(':');
                hex.append(String.format(java.util.Locale.ROOT, "%02X", value & 0xff));
            }
            Log.i(TAG, "App-reported signing SHA-1: " + hex);
        } catch (Throwable error) {
            Log.w(TAG, "Could not read app-reported signing certificate", error);
        }
    }

    private static byte[] hexToBytes(String value) {
        byte[] data = new byte[value.length() / 2];
        for (int i = 0; i < value.length(); i += 2) {
            data[i / 2] = (byte) ((Character.digit(value.charAt(i), 16) << 4)
                + Character.digit(value.charAt(i + 1), 16));
        }
        return data;
    }
}
