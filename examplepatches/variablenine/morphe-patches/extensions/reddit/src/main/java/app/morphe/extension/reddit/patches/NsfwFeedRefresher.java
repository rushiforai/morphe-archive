package app.morphe.extension.reddit.patches;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Reloads the home feed when NSFW mode is switched, so the mode takes effect where the user
 * switched it rather than on the next pull-to-refresh.
 *
 * <p>The filter runs on the response, so posts already on screen were filtered under the old
 * mode and stay there until the feed loads again. The app's own refresh is the way to make that
 * happen, and the only handle on it is a feed view model - which is why one is captured as it is
 * built.
 *
 * <p>Everything below is found by shape, since only the view model's own class name survives
 * obfuscation:
 * <ul>
 *   <li>a view model is the home feed's when one of its fields holds an enum constant named
 *       {@code HOME} on a type whose class name ends in {@code FeedType};</li>
 *   <li>the pager is the field whose class declares a public method taking exactly one argument
 *       of a type whose class name ends in {@code FeedRefreshType} - that method is the refresh,
 *       and the argument names which kind.</li>
 * </ul>
 * Both of those types are Reddit's own GraphQL/domain enums, which R8 leaves alone.
 */
@SuppressWarnings("unused")
public final class NsfwFeedRefresher {

    private static final String FEED_TYPE_SUFFIX = "FeedType";
    private static final String REFRESH_TYPE_SUFFIX = "FeedRefreshType";
    private static final String HOME = "HOME";

    /** The refresh the user's own pull-down uses, so the feed behaves exactly as it would then. */
    private static final String PULL_TO_REFRESH = "PULL_TO_REFRESH";

    /** Long enough for the drawer to close over the feed being reloaded. */
    private static final long REFRESH_DELAY_MS = 250;

    /**
     * Feed view models seen this app start, held weakly: a screen that has gone away must not be
     * kept alive, and must not be refreshed either.
     */
    private static final Set<Object> viewModels =
            Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap<>()));

    private NsfwFeedRefresher() {
    }

    /**
     * Injection point. Records a feed view model as it is constructed.
     *
     * @param viewModel The view model being built.
     */
    public static void captureFeedViewModel(Object viewModel) {
        try {
            if (viewModel != null) {
                viewModels.add(viewModel);
            }
        } catch (Exception ex) {
            Logger.printException(() -> "captureFeedViewModel failure", ex);
        }
    }

    /**
     * Reloads the home feed, if one has been built and is still alive.
     *
     * <p>Runs on the main thread, since it drives the same code path the pull-to-refresh gesture
     * does. Failure is silent by design: not refreshing costs the user a pull-down, and there is
     * nothing they could do about a message.
     */
    public static void refreshHomeFeed() {
        // Delayed a little so the drawer has closed and the feed is what the user is looking
        // at when it reloads.
        Utils.runOnMainThreadDelayed(() -> {
            try {
                for (Object viewModel : snapshot()) {
                    if (isHomeFeed(viewModel) && refresh(viewModel)) {
                        Logger.printDebug(() -> "NSFW mode: refreshed the home feed");
                        return;
                    }
                }
                Logger.printDebug(() -> "NSFW mode: no home feed to refresh");
            } catch (Exception ex) {
                Logger.printException(() -> "refreshHomeFeed failure", ex);
            }
        }, REFRESH_DELAY_MS);
    }

    private static Object[] snapshot() {
        synchronized (viewModels) {
            return viewModels.toArray();
        }
    }

    /**
     * @return Whether a view model carries a {@code FeedType} field holding {@code HOME}.
     */
    private static boolean isHomeFeed(Object viewModel) {
        for (Field field : declaredFields(viewModel.getClass())) {
            Object value = read(field, viewModel);
            if (value instanceof Enum
                    && simpleName(value.getClass()).endsWith(FEED_TYPE_SUFFIX)
                    && HOME.equals(((Enum<?>) value).name())) {
                return true;
            }
        }
        return false;
    }

    /**
     * Finds the pager among a view model's fields and asks it to refresh.
     *
     * @return Whether a refresh was actually made.
     */
    private static boolean refresh(Object viewModel) {
        for (Field field : declaredFields(viewModel.getClass())) {
            Object candidate = read(field, viewModel);
            if (candidate == null) {
                continue;
            }

            Method refresh = refreshMethod(candidate.getClass());
            if (refresh == null) {
                continue;
            }

            Object pullToRefresh = constant(refresh.getParameterTypes()[0], PULL_TO_REFRESH);
            if (pullToRefresh == null) {
                continue;
            }

            try {
                refresh.invoke(candidate, pullToRefresh);
                return true;
            } catch (Throwable ex) {
                Logger.printException(() -> "NSFW mode: the feed refused to refresh", ex);
            }
        }
        return false;
    }

    /**
     * @return The one-argument method that takes a refresh type, or null if this is not a pager.
     */
    private static Method refreshMethod(Class<?> type) {
        try {
            for (Method method : type.getDeclaredMethods()) {
                Class<?>[] parameters = method.getParameterTypes();
                if (parameters.length == 1
                        && simpleName(parameters[0]).endsWith(REFRESH_TYPE_SUFFIX)) {
                    method.setAccessible(true);
                    return method;
                }
            }
        } catch (Throwable ignored) {
            // Nothing readable.
        }
        return null;
    }

    /**
     * @return The named constant of an enum type, or null if it has no such constant.
     */
    private static Object constant(Class<?> type, String name) {
        Object[] constants = type.getEnumConstants();
        if (constants == null) {
            return null;
        }
        for (Object value : constants) {
            if (value instanceof Enum && name.equals(((Enum<?>) value).name())) {
                return value;
            }
        }
        return null;
    }

    private static Field[] declaredFields(Class<?> type) {
        try {
            Field[] fields = type.getDeclaredFields();
            for (Field field : fields) {
                try {
                    field.setAccessible(true);
                } catch (Throwable ignored) {
                    // Left unreadable; read() returns null for it.
                }
            }
            return fields;
        } catch (Throwable ignored) {
            return new Field[0];
        }
    }

    private static Object read(Field field, Object instance) {
        try {
            return field.get(instance);
        } catch (Throwable ex) {
            return null;
        }
    }

    private static String simpleName(Class<?> type) {
        String name = type.getName();
        int cut = Math.max(name.lastIndexOf('.'), name.lastIndexOf('$'));
        return cut < 0 ? name : name.substring(cut + 1);
    }
}
