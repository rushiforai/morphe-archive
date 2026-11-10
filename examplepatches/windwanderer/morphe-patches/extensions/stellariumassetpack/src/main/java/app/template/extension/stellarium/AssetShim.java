package app.template.extension.stellarium;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.ClipData;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcelable;
import android.os.Process;
import android.util.Log;
import android.widget.Toast;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.ArrayDeque;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/**
 * The local half of the extended catalog patch.
 *
 * <p>Stellarium receives its extended catalog from a Play Asset Delivery pack. A
 * sideloaded install cannot download that pack, so this class lets the user drop
 * a ZIP into the app instead:
 *
 * <ul>
 *   <li>{@link #handleIntent(Activity)} and
 *       {@link #handleIntent(Activity, Intent)} are called from the launcher's
 *       {@code onCreate} and Qt's {@code onNewIntent}. They only act on a ZIP
 *       that was opened or shared with Stellarium.</li>
 *   <li>{@link #rememberPackName(String)} and {@link #getPackLocation(String)}
 *       are the two halves of the Play Core hook. The first records which pack
 *       Play Core is asking about; the second answers with the imported pack when
 *       the name is {@code asset_pack_extended}.</li>
 * </ul>
 *
 * <p>Nothing is downloaded and nothing is requested at launch. When there is no
 * imported pack the Play Core hook returns {@code null}, so the app follows its
 * normal path.
 */
@SuppressWarnings({"deprecation", "unused"})
public final class AssetShim {

    private static final String TAG = "StellariumAssetPack";

    /** The pack name the native code uses for the extended catalogs. */
    private static final String PACK_NAME = "asset_pack_extended";

    /** The marker every extended catalog pack has at its root. */
    private static final String SENTINEL = "dso/index.data";

    /** Marks an intent as already handled, so a recreated activity does not import twice. */
    private static final String HANDLED_EXTRA = "app.template.stellarium.EXTENDED_CATALOG_HANDLED";

    /**
     * The storage method the app's AssetPackLocation implementation uses for a
     * pack it can read from a local path. The native code accepts values up to 1.
     */
    private static final int STORAGE_METHOD = 1;

    /** How long the success toast stays up before the process is ended. */
    private static final long RESTART_DELAY_MS = 2000L;

    private static final AtomicBoolean IMPORTING = new AtomicBoolean(false);

    /**
     * The pack name Play Core asked about on this thread. It has to be captured
     * at method entry: the register that holds it at the start of
     * getPackLocation(String) is reused for other values long before any return.
     */
    private static final ThreadLocal<ArrayDeque<String>> PACK_NAMES =
            new ThreadLocal<ArrayDeque<String>>() {
                @Override
                protected ArrayDeque<String> initialValue() {
                    return new ArrayDeque<String>();
                }
            };

    private static volatile Context appContext;

    // The concrete AssetPackLocation constructor is looked up once. It lives in
    // the app's dex, so the extension's class loader can see it.
    private static volatile Constructor<?> locationConstructor;
    private static volatile String locationConstructorClass;

    private AssetShim() {
    }

    /** Called from StellariumFree.onCreate(): pick up a ZIP that started the app. */
    public static void handleIntent(Activity activity) {
        if (activity == null) {
            return;
        }
        rememberContext(activity);
        handle(activity, activity.getIntent());
    }

    /** Called from QtActivityBase.onNewIntent(): pick up a ZIP shared with a running app. */
    public static void handleIntent(Activity activity, Intent intent) {
        if (activity == null) {
            return;
        }
        rememberContext(activity);
        handle(activity, intent);
    }

    /** Records the pack name at the start of getPackLocation(String). */
    public static void rememberPackName(String packName) {
        if (packName != null) {
            PACK_NAMES.get().push(packName);
        }
    }

    /**
     * Answers Play Core's getPackLocation(String) with the imported pack.
     *
     * @param className the concrete AssetPackLocation class the app normally
     *                  creates for a downloaded pack, as a binary class name.
     * @return the local pack location, or null when there is no imported pack or
     *         the class could not be created, in which case the caller returns
     *         the original result.
     */
    public static Object getPackLocation(String className) {
        String packName = popPackName();
        try {
            if (!PACK_NAME.equals(packName)) {
                return null;
            }

            Context context = appContext != null ? appContext : currentApplication();
            if (context == null) {
                Log.w(TAG, "No application context to look up the local pack");
                return null;
            }

            File files = context.getFilesDir();
            if (files == null) {
                Log.w(TAG, "The app has no files directory");
                return null;
            }
            File directory = new File(files, PACK_NAME);
            if (!new File(directory, SENTINEL).isFile()) {
                return null;
            }

            Constructor<?> constructor = locationConstructor;
            if (constructor == null || !className.equals(locationConstructorClass)) {
                ClassLoader loader = AssetShim.class.getClassLoader();
                if (loader == null) {
                    loader = context.getClassLoader();
                }
                Class<?> type = Class.forName(className, true, loader);
                try {
                    constructor = type.getConstructor(int.class, String.class, String.class);
                } catch (NoSuchMethodException notPublic) {
                    constructor = type.getDeclaredConstructor(
                            int.class, String.class, String.class);
                    constructor.setAccessible(true);
                }
                locationConstructor = constructor;
                locationConstructorClass = className;
            }

            String path = directory.getAbsolutePath();
            return constructor.newInstance(STORAGE_METHOD, path, path);
        } catch (Throwable error) {
            Log.e(TAG, "Could not create a pack location for " + className, error);
            return null;
        }
    }

    private static void rememberContext(Activity activity) {
        Context context = activity.getApplicationContext();
        if (context != null) {
            appContext = context;
        }
    }

    private static void handle(final Activity activity, Intent intent) {
        if (intent == null || intent.getBooleanExtra(HANDLED_EXTRA, false)) {
            return;
        }

        final Uri uri = zipUri(intent);
        if (uri == null || !looksLikeZip(intent, uri)) {
            return;
        }

        // The activity may be recreated with the same intent. Mark it before the
        // dialog is posted so the second onCreate does not start another import.
        intent.putExtra(HANDLED_EXTRA, true);

        try {
            activity.getWindow().getDecorView().post(new Runnable() {
                @Override
                public void run() {
                    startImport(activity, uri);
                }
            });
        } catch (Throwable error) {
            Log.w(TAG, "Could not schedule the import", error);
        }
    }

    /**
     * The URI that was opened or shared, or null for a normal launch.
     *
     * <p>ACTION_SEND normally carries the URI in EXTRA_STREAM; the ClipData
     * fallback covers senders that only fill in the clip data.
     */
    private static Uri zipUri(Intent intent) {
        Uri uri = null;
        String action = intent.getAction();
        if (Intent.ACTION_VIEW.equals(action)) {
            uri = intent.getData();
        } else if (Intent.ACTION_SEND.equals(action)) {
            Parcelable stream = intent.getParcelableExtra(Intent.EXTRA_STREAM);
            if (stream instanceof Uri) {
                uri = (Uri) stream;
            }
        }

        if (uri == null) {
            ClipData clip = intent.getClipData();
            if (clip != null && clip.getItemCount() > 0) {
                uri = clip.getItemAt(0).getUri();
            }
        }
        return uri;
    }

    /**
     * Whether the intent looks like a ZIP. The manifest only adds ZIP filters,
     * but the activity is also the normal launcher and may receive unrelated
     * VIEW intents from other apps.
     */
    private static boolean looksLikeZip(Intent intent, Uri uri) {
        String type = intent.getType();
        if (type == null || type.length() == 0) {
            return true;
        }
        String lower = type.toLowerCase(Locale.US);
        if (lower.contains("zip")) {
            return true;
        }
        if (!lower.equals("application/octet-stream")) {
            return false;
        }
        String name = uri.getLastPathSegment();
        return name == null || name.toLowerCase(Locale.US).endsWith(".zip");
    }

    private static void startImport(final Activity activity, final Uri uri) {
        if (activity.isFinishing() || activity.isDestroyed()) {
            return;
        }
        if (!IMPORTING.compareAndSet(false, true)) {
            Toast.makeText(activity, "已有扩展星表导入任务正在进行", Toast.LENGTH_SHORT).show();
            return;
        }

        final ProgressDialog dialog = new ProgressDialog(activity);
        dialog.setTitle("扩展星表");
        dialog.setMessage("正在导入扩展星表…");
        dialog.setIndeterminate(true);
        dialog.setCancelable(false);
        try {
            dialog.show();
        } catch (Throwable error) {
            Log.w(TAG, "Could not show the import dialog", error);
        }

        new Thread(new Runnable() {
            @Override
            public void run() {
                boolean succeeded = false;
                try {
                    File target = importZip(activity.getApplicationContext(), uri);
                    Log.i(TAG, "Imported the extended catalog into " + target);
                    succeeded = true;
                    postSuccess(activity, dialog);
                } catch (Throwable error) {
                    Log.e(TAG, "Could not import the extended catalog", error);
                    postFailure(activity, dialog, error);
                } finally {
                    if (!succeeded) {
                        IMPORTING.set(false);
                    }
                }
            }
        }, "stellarium-pack-import").start();
    }

    /**
     * Extracts the ZIP into a temporary directory, finds the pack root and swaps
     * it into place. The previous pack is kept until the new one is in place, so
     * a failure leaves the app with the pack it had before.
     */
    private static File importZip(Context context, Uri uri) throws IOException {
        if (context == null) {
            throw new IOException("无法获取应用上下文");
        }
        File files = context.getFilesDir();
        if (files == null) {
            throw new IOException("无法获取应用存储目录");
        }

        // A fresh directory per import: a leftover from an interrupted import
        // must never be mistaken for the pack the new ZIP contains.
        File[] leftovers = files.listFiles(new java.io.FilenameFilter() {
            @Override
            public boolean accept(File directory, String name) {
                return name.startsWith(PACK_NAME + ".import");
            }
        });
        if (leftovers != null) {
            for (File leftover : leftovers) {
                deleteRecursively(leftover);
            }
        }

        File temporary = new File(files, PACK_NAME + ".import." + System.nanoTime());
        if (!temporary.mkdirs() && !temporary.isDirectory()) {
            throw new IOException("无法创建临时目录");
        }

        try {
            unzip(context, uri, temporary);
            File root = findPackRoot(temporary);
            if (root == null) {
                throw new IOException("ZIP 中没有 " + SENTINEL);
            }

            File target = new File(files, PACK_NAME);
            File backup = new File(files, PACK_NAME + ".old");
            deleteRecursively(backup);

            boolean hadTarget = target.exists();
            if (hadTarget && !target.renameTo(backup)) {
                throw new IOException("无法替换旧的扩展星表");
            }
            if (!root.renameTo(target)) {
                if (hadTarget && !backup.renameTo(target)) {
                    Log.e(TAG, "Could not restore the previous pack at " + target);
                }
                throw new IOException("无法安装扩展星表");
            }

            deleteRecursively(backup);
            deleteRecursively(temporary);
            return target;
        } catch (IOException error) {
            deleteRecursively(temporary);
            throw error;
        }
    }

    /** Extracts every entry, refusing names that would leave the destination. */
    private static void unzip(Context context, Uri uri, File destination) throws IOException {
        InputStream raw = null;
        ZipInputStream zip = null;
        try {
            try {
                raw = context.getContentResolver().openInputStream(uri);
            } catch (SecurityException error) {
                throw new IOException("没有读取 ZIP 的权限", error);
            }
            if (raw == null) {
                throw new IOException("无法读取 ZIP");
            }

            zip = new ZipInputStream(new BufferedInputStream(raw));
            byte[] buffer = new byte[64 * 1024];
            String destinationPath = destination.getCanonicalPath();
            ZipEntry entry;
            while ((entry = zip.getNextEntry()) != null) {
                String name = entry.getName();
                if (name == null || name.length() == 0) {
                    zip.closeEntry();
                    continue;
                }

                File output = new File(destination, name);
                String outputPath = output.getCanonicalPath();
                if (!outputPath.equals(destinationPath) &&
                        !outputPath.startsWith(destinationPath + File.separator)) {
                    throw new IOException("ZIP 包含非法路径: " + name);
                }

                if (entry.isDirectory()) {
                    if (!output.isDirectory() && !output.mkdirs() && !output.isDirectory()) {
                        throw new IOException("无法创建目录: " + name);
                    }
                } else {
                    File parent = output.getParentFile();
                    if (parent != null && !parent.isDirectory() &&
                            !parent.mkdirs() && !parent.isDirectory()) {
                        throw new IOException("无法创建目录: " + name);
                    }
                    FileOutputStream stream = null;
                    try {
                        stream = new FileOutputStream(output);
                        int count;
                        while ((count = zip.read(buffer)) != -1) {
                            stream.write(buffer, 0, count);
                        }
                    } finally {
                        if (stream != null) {
                            try {
                                stream.close();
                            } catch (IOException ignored) {
                                // Nothing useful to do; the import reports the real error.
                            }
                        }
                    }
                }
                zip.closeEntry();
            }
        } finally {
            if (zip != null) {
                try {
                    zip.close();
                } catch (IOException ignored) {
                    // The stream is being discarded.
                }
            } else if (raw != null) {
                try {
                    raw.close();
                } catch (IOException ignored) {
                    // The stream is being discarded.
                }
            }
        }
    }

    /** The extracted directory that holds dso/index.data, through a few wrapper folders. */
    private static File findPackRoot(File temporary) {
        return findPackRoot(temporary, 3);
    }

    private static File findPackRoot(File directory, int remainingDepth) {
        if (new File(directory, SENTINEL).isFile()) {
            return directory;
        }
        if (remainingDepth <= 0) {
            return null;
        }
        File[] children = directory.listFiles();
        if (children != null) {
            for (File child : children) {
                if (!child.isDirectory()) {
                    continue;
                }
                File found = findPackRoot(child, remainingDepth - 1);
                if (found != null) {
                    return found;
                }
            }
        }
        return null;
    }

    private static void deleteRecursively(File file) {
        if (file == null || !file.exists()) {
            return;
        }
        if (file.isDirectory()) {
            File[] children = file.listFiles();
            if (children != null) {
                for (File child : children) {
                    deleteRecursively(child);
                }
            }
        }
        if (!file.delete()) {
            Log.w(TAG, "Could not delete " + file);
        }
    }

    private static void postSuccess(final Activity activity, final ProgressDialog dialog) {
        runOnUi(activity, new Runnable() {
            @Override
            public void run() {
                dismiss(dialog);
                Context context = appContext != null ? appContext : activity.getApplicationContext();
                Toast.makeText(context, "扩展星表已导入，请重新打开 Stellarium", Toast.LENGTH_LONG).show();
                new Handler(Looper.getMainLooper()).postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        Log.i(TAG, "Ending the process to load the extended catalog");
                        Process.killProcess(Process.myPid());
                    }
                }, RESTART_DELAY_MS);
            }
        });
    }

    private static void postFailure(
            final Activity activity, final ProgressDialog dialog, final Throwable error) {
        runOnUi(activity, new Runnable() {
            @Override
            public void run() {
                dismiss(dialog);
                Context context = appContext != null ? appContext : activity.getApplicationContext();
                String detail = error.getMessage();
                if (detail == null || detail.length() == 0) {
                    detail = error.getClass().getSimpleName();
                }
                Toast.makeText(context, "导入失败：" + detail, Toast.LENGTH_LONG).show();
            }
        });
    }

    private static void runOnUi(Activity activity, Runnable action) {
        try {
            activity.runOnUiThread(action);
        } catch (Throwable error) {
            Log.w(TAG, "Could not post the result to the activity", error);
            new Handler(Looper.getMainLooper()).post(action);
        }
    }

    private static void dismiss(ProgressDialog dialog) {
        if (dialog == null) {
            return;
        }
        try {
            if (dialog.isShowing()) {
                dialog.dismiss();
            }
        } catch (Throwable error) {
            Log.w(TAG, "Could not dismiss the import dialog", error);
        }
    }

    private static String popPackName() {
        ArrayDeque<String> names = PACK_NAMES.get();
        return names.isEmpty() ? null : names.pop();
    }

    /** The application, when the Play Core hook runs before the launcher's hook. */
    private static Context currentApplication() {
        try {
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Method method = activityThread.getDeclaredMethod("currentApplication");
            method.setAccessible(true);
            Object application = method.invoke(null);
            if (application instanceof Context) {
                return (Context) application;
            }
        } catch (Throwable ignored) {
            // Hidden API restrictions; try the older entry point.
        }

        try {
            Class<?> appGlobals = Class.forName("android.app.AppGlobals");
            Method method = appGlobals.getDeclaredMethod("getInitialApplication");
            method.setAccessible(true);
            Object application = method.invoke(null);
            if (application instanceof Context) {
                return (Context) application;
            }
        } catch (Throwable ignored) {
            // Neither entry point is available; the caller falls back to the
            // original result.
        }
        return null;
    }
}
