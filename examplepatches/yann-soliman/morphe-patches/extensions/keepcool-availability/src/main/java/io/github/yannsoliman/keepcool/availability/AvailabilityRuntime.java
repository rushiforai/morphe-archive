package io.github.yannsoliman.keepcool.availability;

import android.graphics.Color;
import android.graphics.PorterDuff;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.ImageView;

import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Runtime side of the Keepcool availability-dot patch.
 *
 * This class deliberately has no compile-time dependency on Keepcool classes.
 * The patch passes the application's own repository/filter/date-model objects
 * and this runtime performs narrowly-scoped reflection against Keepcool 1.8.21.
 */
@SuppressWarnings({"unused", "rawtypes", "unchecked"})
public final class AvailabilityRuntime {
    private static final Object LOCK = new Object();
    private static final int MAX_IN_FLIGHT = 3;
    private static final int MAX_CACHE_ENTRIES = 64;
    private static final long SUCCESS_TTL_MS = 60_000L;
    private static final long ERROR_RETRY_MS = 5_000L;
    private static final int GREEN = Color.rgb(46, 125, 50);
    private static final Pattern ISO_DATE =
        Pattern.compile("(\\d{4}-\\d{2}-\\d{2})");

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService NETWORK =
        Executors.newFixedThreadPool(MAX_IN_FLIGHT);
    private static final ThreadLocal<Object> PENDING_DATE_MODEL =
        new ThreadLocal<>();

    private static final WeakHashMap<View, Binding> BINDINGS =
        new WeakHashMap<>();
    private static final LinkedHashSet<CacheKey> QUEUE =
        new LinkedHashSet<>();
    private static final LinkedHashMap<CacheKey, CacheEntry> CACHE =
        new LinkedHashMap<CacheKey, CacheEntry>(16, 0.75f, true) {
            @Override
            protected boolean removeEldestEntry(Map.Entry<CacheKey, CacheEntry> eldest) {
                return size() > MAX_CACHE_ENTRIES;
            }
        };

    private static WeakReference<Object> repositoryRef =
        new WeakReference<>(null);
    private static FilterKey currentFilter;
    private static long generation;
    private static int inFlight;
    private static Set<String> bookedDates = Collections.emptySet();

    private AvailabilityRuntime() {}

    public static void captureContext(
        Object repository,
        List<?> clubs,
        List<?> categories,
        boolean ignoredSearchFreePlace,
        List<?> timeBlocks
    ) {
        if (repository == null) return;

        ContextSnapshot snapshot = ContextSnapshot.create(
            repository, clubs, categories, timeBlocks
        );

        boolean changed;
        synchronized (LOCK) {
            repositoryRef = new WeakReference<>(repository);
            latestContext = snapshot;
            changed = !snapshot.filter.equals(currentFilter);
            if (changed) {
                currentFilter = snapshot.filter;
                generation++;
                CACHE.clear();
                QUEUE.clear();
                for (Binding binding : BINDINGS.values()) {
                    binding.generation = generation;
                }
            }
        }

        // Even when only the repository instance changed, pending/visible cells
        // may now be requestable.
        reevaluateAllBindings();
    }

    public static void rememberDateModel(Object dateModel) {
        PENDING_DATE_MODEL.set(dateModel);
    }

    public static void bindRemembered(Object cellObject, boolean booked) {
        Object dateModel = PENDING_DATE_MODEL.get();
        PENDING_DATE_MODEL.remove();

        if (!(cellObject instanceof View)) return;
        View cell = (View) cellObject;
        String date = dateModel == null ? null : requestDate(dateModel);
        if (date == null) {
            synchronized (LOCK) {
                BINDINGS.remove(cell);
            }
            return;
        }

        Binding binding;
        synchronized (LOCK) {
            boolean effectiveBooked =
                booked || bookedDates.contains(date);
            binding = new Binding(date, effectiveBooked, generation);
            BINDINGS.put(cell, binding);
        }

        evaluate(cell, binding);
    }

    public static void onBookedDatesChanged(List<?> dates) {
        Set<String> next = normalizeDates(dates);
        Set<String> changedDates = new HashSet<>();
        List<Map.Entry<View, Binding>> visible;

        synchronized (LOCK) {
            if (!bookedDates.isEmpty()) {
                changedDates.addAll(bookedDates);
                changedDates.addAll(next);
                Set<String> intersection = new HashSet<>(bookedDates);
                intersection.retainAll(next);
                changedDates.removeAll(intersection);
            }

            bookedDates = next;

            for (Map.Entry<View, Binding> entry : BINDINGS.entrySet()) {
                Binding binding = entry.getValue();
                binding.booked = next.contains(binding.date);
            }

            if (!changedDates.isEmpty() && currentFilter != null) {
                Iterator<Map.Entry<CacheKey, CacheEntry>> iterator =
                    CACHE.entrySet().iterator();
                while (iterator.hasNext()) {
                    CacheKey key = iterator.next().getKey();
                    if (key.filter.equals(currentFilter)
                        && changedDates.contains(key.date)) {
                        iterator.remove();
                    }
                }
                Iterator<CacheKey> queued = QUEUE.iterator();
                while (queued.hasNext()) {
                    CacheKey key = queued.next();
                    if (key.filter.equals(currentFilter)
                        && changedDates.contains(key.date)) {
                        queued.remove();
                    }
                }
            }

            visible = snapshotBindingsLocked();
        }

        for (Map.Entry<View, Binding> entry : visible) {
            Binding binding = entry.getValue();
            if (changedDates.isEmpty() || changedDates.contains(binding.date)) {
                evaluate(entry.getKey(), binding);
            } else {
                postRender(entry.getKey(), binding, cachedState(binding));
            }
        }
    }

    private static void reevaluateAllBindings() {
        List<Map.Entry<View, Binding>> visible;
        synchronized (LOCK) {
            visible = snapshotBindingsLocked();
        }
        for (Map.Entry<View, Binding> entry : visible) {
            evaluate(entry.getKey(), entry.getValue());
        }
    }

    private static List<Map.Entry<View, Binding>> snapshotBindingsLocked() {
        List<Map.Entry<View, Binding>> result = new ArrayList<>();
        for (Map.Entry<View, Binding> entry : BINDINGS.entrySet()) {
            View view = entry.getKey();
            Binding binding = entry.getValue();
            if (view != null && binding != null) {
                result.add(new java.util.AbstractMap.SimpleImmutableEntry<>(
                    view, binding.copy()
                ));
            }
        }
        return result;
    }

    private static void evaluate(View cell, Binding binding) {
        State state;
        boolean shouldDrain = false;

        synchronized (LOCK) {
            Binding live = BINDINGS.get(cell);
            if (live == null || !live.sameIdentity(binding)) return;

            state = cachedStateLocked(live);
            if (state == State.UNKNOWN
                && currentFilter != null
                && repositoryRef.get() != null) {
                CacheKey key = new CacheKey(currentFilter, live.date);
                if (QUEUE.add(key)) {
                    CACHE.put(key, new CacheEntry(State.LOADING, now()));
                    state = State.LOADING;
                    shouldDrain = true;
                }
            }
        }

        postRender(cell, binding, state);
        if (shouldDrain) drainQueue();
    }

    private static State cachedState(Binding binding) {
        synchronized (LOCK) {
            return cachedStateLocked(binding);
        }
    }

    private static State cachedStateLocked(Binding binding) {
        if (currentFilter == null) return State.UNKNOWN;
        CacheKey key = new CacheKey(currentFilter, binding.date);
        CacheEntry entry = CACHE.get(key);
        if (entry == null) return State.UNKNOWN;

        long age = now() - entry.timestamp;
        long ttl = entry.state == State.ERROR
            ? ERROR_RETRY_MS
            : SUCCESS_TTL_MS;

        if ((entry.state == State.AVAILABLE
                || entry.state == State.UNAVAILABLE
                || entry.state == State.ERROR)
            && age >= ttl) {
            CACHE.remove(key);
            return State.UNKNOWN;
        }

        return entry.state;
    }

    private static void drainQueue() {
        List<Request> launch = new ArrayList<>();

        synchronized (LOCK) {
            while (inFlight < MAX_IN_FLIGHT && !QUEUE.isEmpty()) {
                Iterator<CacheKey> iterator = QUEUE.iterator();
                CacheKey key = iterator.next();
                iterator.remove();

                Object repository = repositoryRef.get();
                if (repository == null
                    || currentFilter == null
                    || !key.filter.equals(currentFilter)) {
                    CACHE.remove(key);
                    continue;
                }

                ContextSnapshot context = latestContext;
                if (context == null || !context.filter.equals(key.filter)) {
                    CACHE.remove(key);
                    continue;
                }
                Request request = new Request(
                    key,
                    generation,
                    repository,
                    context
                );
                inFlight++;
                launch.add(request);
            }
        }

        for (Request request : launch) {
            NETWORK.execute(() -> performRequest(request));
        }
    }

    private static void performRequest(Request request) {
        try {
            invokeCountForDay(request, state ->
                finishRequest(request, state));
        } catch (Throwable ignored) {
            finishRequest(request, State.ERROR);
        }
    }

    private static void finishRequest(Request request, State state) {
        List<Map.Entry<View, Binding>> affected = new ArrayList<>();

        synchronized (LOCK) {
            inFlight = Math.max(0, inFlight - 1);

            if (request.generation == generation
                && currentFilter != null
                && request.key.filter.equals(currentFilter)) {
                CACHE.put(request.key, new CacheEntry(state, now()));
                for (Map.Entry<View, Binding> entry : BINDINGS.entrySet()) {
                    View view = entry.getKey();
                    Binding binding = entry.getValue();
                    if (view != null
                        && binding != null
                        && binding.generation == request.generation
                        && binding.date.equals(request.key.date)) {
                        affected.add(
                            new java.util.AbstractMap.SimpleImmutableEntry<>(
                                view, binding.copy()
                            )
                        );
                    }
                }
            }
        }

        for (Map.Entry<View, Binding> entry : affected) {
            postRender(entry.getKey(), entry.getValue(), state);
        }

        drainQueue();
    }

    private interface StateCallback {
        void complete(State state);
    }

    private static void invokeCountForDay(
        Request request,
        StateCallback callback
    ) throws Exception {
        Object repository = request.repository;
        ClassLoader loader = repository.getClass().getClassLoader();

        Object api = findUserApi(repository);
        Class<?> requestClass = Class.forName(
            "models.request.booking.BookingSlotRequestData",
            false,
            loader
        );

        Constructor<?> constructor = findRequestConstructor(requestClass);
        Object requestData = constructor.newInstance(
            request.context.clubs,
            request.context.categories,
            true,
            request.context.timeBlocks,
            request.key.date
        );

        Method apiMethod = findCountMethod(api.getClass(), requestClass);
        Class<?> continuationType = apiMethod.getParameterTypes()[1];
        AtomicBoolean completed = new AtomicBoolean(false);

        Object continuation = Proxy.newProxyInstance(
            continuationType.getClassLoader(),
            new Class<?>[]{continuationType},
            new ContinuationHandler(callback, completed)
        );

        Object immediate;
        try {
            immediate = apiMethod.invoke(api, requestData, continuation);
        } catch (InvocationTargetException exception) {
            Throwable cause = exception.getCause();
            if (cause != null) throw new RuntimeException(cause);
            throw exception;
        }

        if (isNetworkResponse(immediate)
            && completed.compareAndSet(false, true)) {
            callback.complete(stateFromNetworkResponse(immediate));
        }
    }

    private static Object findUserApi(Object repository) throws Exception {
        List<Field> matches = new ArrayList<>();
        for (Class<?> type = repository.getClass();
             type != null;
             type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if ("apis.service.UserAPI".equals(field.getType().getName())) {
                    matches.add(field);
                }
            }
        }
        if (matches.size() != 1) {
            throw new IllegalStateException(
                "Expected exactly one UserAPI field, found " + matches.size()
            );
        }
        Field field = matches.get(0);
        field.setAccessible(true);
        Object api = field.get(repository);
        if (api == null) throw new IllegalStateException("UserAPI is null");
        return api;
    }

    private static Constructor<?> findRequestConstructor(Class<?> type) {
        List<Constructor<?>> matches = new ArrayList<>();
        for (Constructor<?> constructor : type.getDeclaredConstructors()) {
            Class<?>[] p = constructor.getParameterTypes();
            if (p.length == 5
                && List.class.isAssignableFrom(p[0])
                && List.class.isAssignableFrom(p[1])
                && p[2] == boolean.class
                && List.class.isAssignableFrom(p[3])
                && p[4] == String.class) {
                matches.add(constructor);
            }
        }
        if (matches.size() != 1) {
            throw new IllegalStateException(
                "Expected principal BookingSlotRequestData constructor"
            );
        }
        Constructor<?> constructor = matches.get(0);
        constructor.setAccessible(true);
        return constructor;
    }

    private static Method findCountMethod(
        Class<?> apiType,
        Class<?> requestType
    ) {
        List<Method> matches = new ArrayList<>();
        for (Method method : apiType.getMethods()) {
            Class<?>[] p = method.getParameterTypes();
            if ("countSessionForDay".equals(method.getName())
                && p.length == 2
                && p[0] == requestType
                && p[1].isInterface()) {
                matches.add(method);
            }
        }
        if (matches.size() != 1) {
            throw new IllegalStateException(
                "Expected exactly one UserAPI.countSessionForDay method"
            );
        }
        Method method = matches.get(0);
        method.setAccessible(true);
        return method;
    }

    private static final class ContinuationHandler
        implements InvocationHandler {

        private final StateCallback callback;
        private final AtomicBoolean completed;

        ContinuationHandler(
            StateCallback callback,
            AtomicBoolean completed
        ) {
            this.callback = callback;
            this.completed = completed;
        }

        @Override
        public Object invoke(
            Object proxy,
            Method method,
            Object[] args
        ) {
            String name = method.getName();

            if ("resumeWith".equals(name)) {
                if (completed.compareAndSet(false, true)) {
                    Object result =
                        args == null || args.length == 0 ? null : args[0];
                    callback.complete(stateFromContinuationResult(result));
                }
                return null;
            }

            if ("getContext".equals(name)) {
                return emptyCoroutineContext(method.getReturnType());
            }

            if ("toString".equals(name)) {
                return "KeepcoolAvailabilityContinuation";
            }
            if ("hashCode".equals(name)) {
                return System.identityHashCode(proxy);
            }
            if ("equals".equals(name)) {
                return args != null
                    && args.length == 1
                    && proxy == args[0];
            }

            return defaultValue(method.getReturnType());
        }
    }

    private static Object emptyCoroutineContext(Class<?> contextType) {
        if (!contextType.isInterface()) return null;

        return Proxy.newProxyInstance(
            contextType.getClassLoader(),
            new Class<?>[]{contextType},
            (proxy, method, args) -> {
                String name = method.getName();
                if ("fold".equals(name)) {
                    return args == null || args.length == 0 ? null : args[0];
                }
                if ("get".equals(name)) return null;
                if ("minusKey".equals(name)) return proxy;
                if ("plus".equals(name)) {
                    return args == null || args.length == 0
                        ? proxy
                        : args[0];
                }
                if ("toString".equals(name)) return "EmptyCoroutineContext";
                if ("hashCode".equals(name)) return 0;
                if ("equals".equals(name)) {
                    return args != null
                        && args.length == 1
                        && proxy == args[0];
                }
                return defaultValue(method.getReturnType());
            }
        );
    }

    private static State stateFromContinuationResult(Object result) {
        if (result == null) return State.ERROR;
        if (containsThrowable(result)) return State.ERROR;
        if (!isNetworkResponse(result)) return State.ERROR;
        return stateFromNetworkResponse(result);
    }

    private static boolean containsThrowable(Object value) {
        for (Class<?> type = value.getClass();
             type != null;
             type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (Throwable.class.isAssignableFrom(field.getType())) {
                    try {
                        field.setAccessible(true);
                        if (field.get(value) != null) return true;
                    } catch (Throwable ignored) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    private static boolean isNetworkResponse(Object value) {
        return value != null
            && value.getClass().getName().startsWith("apis.NetworkResponse$");
    }

    private static State stateFromNetworkResponse(Object response) {
        try {
            if (!response.getClass().getName().endsWith("$Success")) {
                return State.ERROR;
            }
            Object body = invokeNoArg(response, "getBody");
            if (body == null) return State.ERROR;
            Object data = invokeNoArg(body, "getData");
            if (!(data instanceof Integer)) return State.ERROR;
            return ((Integer) data) > 0
                ? State.AVAILABLE
                : State.UNAVAILABLE;
        } catch (Throwable ignored) {
            return State.ERROR;
        }
    }

    private static Object invokeNoArg(
        Object target,
        String methodName
    ) throws Exception {
        Method method = target.getClass().getMethod(methodName);
        method.setAccessible(true);
        return method.invoke(target);
    }

    private static void postRender(
        View cell,
        Binding binding,
        State state
    ) {
        MAIN.post(() -> {
            Binding live;
            synchronized (LOCK) {
                live = BINDINGS.get(cell);
                if (live == null || !live.sameIdentity(binding)) return;
            }
            render(cell, live.booked, state);
        });
    }

    private static void render(
        View cell,
        boolean booked,
        State state
    ) {
        ImageView dot = findDot(cell);
        if (dot == null) return;

        // The original Keepcool render has already run before this posted task.
        // Clear only the color filter introduced by this extension.
        dot.clearColorFilter();

        if (booked) {
            // Preserve Keepcool's orange drawable/visibility.
            dot.setVisibility(View.VISIBLE);
            return;
        }

        if (state == State.AVAILABLE) {
            dot.setColorFilter(GREEN, PorterDuff.Mode.SRC_IN);
            dot.setVisibility(View.VISIBLE);
        } else {
            dot.setVisibility(View.GONE);
        }
    }

    private static ImageView findDot(View cell) {
        try {
            int id = cell.getResources().getIdentifier(
                "img_dot",
                "id",
                cell.getContext().getPackageName()
            );
            if (id == 0) return null;
            View view = cell.findViewById(id);
            return view instanceof ImageView ? (ImageView) view : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String requestDate(Object model) {
        // Keepcool 1.8.21 stores requestDate in Z6/c.b; Z6/c.a is only
        // the one-letter day label.
        try {
            Field field = model.getClass().getDeclaredField("b");
            if (field.getType() != String.class) return null;
            field.setAccessible(true);
            return normalizeDate(field.get(model));
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Set<String> normalizeDates(List<?> values) {
        if (values == null || values.isEmpty()) {
            return Collections.emptySet();
        }
        Set<String> result = new HashSet<>();
        for (Object value : values) {
            String date = normalizeDate(value);
            if (date != null) result.add(date);
        }
        return Collections.unmodifiableSet(result);
    }

    private static String normalizeDate(Object value) {
        if (!(value instanceof String)) return null;
        String raw = (String) value;
        Matcher matcher = ISO_DATE.matcher(raw);
        if (matcher.find()) return matcher.group(1);

        SimpleDateFormat source =
            new SimpleDateFormat("yyyy/MMMM/dd", Locale.FRANCE);
        source.setLenient(false);
        ParsePosition position = new ParsePosition(0);
        Date parsed = source.parse(raw, position);
        if (parsed == null || position.getIndex() != raw.length()) return null;

        SimpleDateFormat target =
            new SimpleDateFormat("yyyy-MM-dd", Locale.ROOT);
        target.setLenient(false);
        return target.format(parsed);
    }

    private static long now() {
        return System.currentTimeMillis();
    }

    private static Object defaultValue(Class<?> type) {
        if (!type.isPrimitive()) return null;
        if (type == boolean.class) return false;
        if (type == byte.class) return (byte) 0;
        if (type == short.class) return (short) 0;
        if (type == int.class) return 0;
        if (type == long.class) return 0L;
        if (type == float.class) return 0f;
        if (type == double.class) return 0d;
        if (type == char.class) return '\0';
        return null;
    }

    private enum State {
        UNKNOWN,
        LOADING,
        AVAILABLE,
        UNAVAILABLE,
        ERROR
    }

    private static final class Binding {
        final String date;
        boolean booked;
        long generation;

        Binding(String date, boolean booked, long generation) {
            this.date = date;
            this.booked = booked;
            this.generation = generation;
        }

        Binding copy() {
            return new Binding(date, booked, generation);
        }

        boolean sameIdentity(Binding other) {
            return other != null
                && generation == other.generation
                && date.equals(other.date);
        }
    }

    private static final class CacheEntry {
        final State state;
        final long timestamp;

        CacheEntry(State state, long timestamp) {
            this.state = state;
            this.timestamp = timestamp;
        }
    }

    private static final class CacheKey {
        final FilterKey filter;
        final String date;

        CacheKey(FilterKey filter, String date) {
            this.filter = filter;
            this.date = date;
        }

        @Override
        public boolean equals(Object other) {
            if (!(other instanceof CacheKey)) return false;
            CacheKey that = (CacheKey) other;
            return filter.equals(that.filter) && date.equals(that.date);
        }

        @Override
        public int hashCode() {
            return 31 * filter.hashCode() + date.hashCode();
        }
    }

    private static final class FilterKey {
        final List<String> clubs;
        final List<String> categories;
        final List<String> timeBlocks;

        FilterKey(
            List<String> clubs,
            List<String> categories,
            List<String> timeBlocks
        ) {
            this.clubs = clubs;
            this.categories = categories;
            this.timeBlocks = timeBlocks;
        }

        static FilterKey create(
            List<?> clubs,
            List<?> categories,
            List<?> timeBlocks
        ) {
            return new FilterKey(
                canonicalValues(clubs),
                canonicalValues(categories),
                canonicalTimeBlocks(timeBlocks)
            );
        }

        @Override
        public boolean equals(Object other) {
            if (!(other instanceof FilterKey)) return false;
            FilterKey that = (FilterKey) other;
            return clubs.equals(that.clubs)
                && categories.equals(that.categories)
                && timeBlocks.equals(that.timeBlocks);
        }

        @Override
        public int hashCode() {
            return Objects.hash(clubs, categories, timeBlocks);
        }
    }

    private static final class ContextSnapshot {
        final FilterKey filter;
        final List<?> clubs;
        final List<?> categories;
        final List<?> timeBlocks;

        ContextSnapshot(
            FilterKey filter,
            List<?> clubs,
            List<?> categories,
            List<?> timeBlocks
        ) {
            this.filter = filter;
            this.clubs = clubs;
            this.categories = categories;
            this.timeBlocks = timeBlocks;
        }

        static ContextSnapshot create(
            Object repository,
            List<?> clubs,
            List<?> categories,
            List<?> timeBlocks
        ) {
            List<?> clubCopy = immutableCopy(clubs);
            List<?> categoryCopy = immutableCopy(categories);
            List<?> timeBlockCopy = immutableCopy(timeBlocks);
            return new ContextSnapshot(
                FilterKey.create(clubCopy, categoryCopy, timeBlockCopy),
                clubCopy,
                categoryCopy,
                timeBlockCopy
            );
        }
    }

    private static ContextSnapshot latestContext;

    private static final class Request {
        final CacheKey key;
        final long generation;
        final Object repository;
        final ContextSnapshot context;

        Request(
            CacheKey key,
            long generation,
            Object repository,
            ContextSnapshot context
        ) {
            this.key = key;
            this.generation = generation;
            this.repository = repository;
            this.context = context;
        }
    }

    private static List<?> immutableCopy(List<?> source) {
        if (source == null || source.isEmpty()) {
            return Collections.emptyList();
        }
        return Collections.unmodifiableList(new ArrayList<>(source));
    }

    private static List<String> canonicalValues(List<?> source) {
        List<String> values = new ArrayList<>();
        if (source != null) {
            for (Object value : source) {
                if (value != null) values.add(String.valueOf(value));
            }
        }
        Collections.sort(values);
        return Collections.unmodifiableList(values);
    }

    private static List<String> canonicalTimeBlocks(List<?> source) {
        List<String> values = new ArrayList<>();
        if (source != null) {
            for (Object block : source) {
                if (block == null) continue;
                values.add(timeBlockKey(block));
            }
        }
        Collections.sort(values);
        return Collections.unmodifiableList(values);
    }

    private static String timeBlockKey(Object block) {
        try {
            Object start = invokeNoArg(block, "getStartAt");
            Object end = invokeNoArg(block, "getEndAt");
            return String.valueOf(start) + ":" + String.valueOf(end);
        } catch (Throwable ignored) {
            List<Integer> ints = new ArrayList<>();
            for (Field field : block.getClass().getDeclaredFields()) {
                if (field.getType() == int.class
                    || field.getType() == Integer.class) {
                    try {
                        field.setAccessible(true);
                        Object value = field.get(block);
                        if (value instanceof Integer) {
                            ints.add((Integer) value);
                        }
                    } catch (Throwable ignoredField) {
                        // Fall through to a fail-closed key below.
                    }
                }
            }
            if (ints.size() == 2) {
                return ints.get(0) + ":" + ints.get(1);
            }
            throw new IllegalStateException(
                "Unable to canonicalize Keepcool TimeBlock"
            );
        }
    }
}
