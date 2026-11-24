package dev.jason.gboardpatches.extension.spacebargesture;

import android.app.Dialog;
import android.content.Context;
import android.inputmethodservice.InputMethodService;
import android.os.Build;
import android.os.IBinder;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodInfo;
import android.view.inputmethod.InputMethodManager;
import android.view.inputmethod.InputMethodSubtype;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Switches languages strictly within the active Gboard IME using ONE unified ordered list and an
 * IMMS-synchronized, verified Gboard-only switch chain for both directions:
 * <ul>
 *   <li>Reads Gboard's confirmed internal rotation list:
 *       {@code Lpga.F(Context)} -> {@code Lpga.C()} (current {@code Lpev}) ->
 *       {@code Lpga.Y} ({@code Lrek}) -> {@code Lrek.j(current)} (with identity/subtype fallback
 *       scanning on {@code Lrek.b} when {@code Lpev} was re-instantiated across app switches).</li>
 *   <li>If {@code Lpga}/{@code Lrek} is temporarily unavailable or out of date (e.g. during an
 *       app transition), transparently falls back to Gboard's own enabled subtype list from
 *       {@link InputMethodManager#getEnabledInputMethodSubtypeList(InputMethodInfo, boolean)}.</li>
 *   <li>{@code NEXT}: {@code (index + 1) % size}; {@code PREVIOUS}: {@code (index - 1 + size) % size}
 *       on the exact same ordered list, skipping any duplicate-subtype entries.</li>
 *   <li>Verifies that both the active {@link InputMethodInfo} and target {@link InputMethodSubtype}
 *       strictly belong to the active Gboard IME.</li>
 *   <li><strong>Primary switch path (IMMS-synchronized, token-independent on API 28+):</strong>
 *       invokes {@link InputMethodService#switchInputMethod(String, InputMethodSubtype)} first so
 *       Android IMMS and Gboard's {@code Lpga.C()} stay permanently in sync across repeated
 *       switches and app transitions (avoiding {@code Lpga.l} ↔ IMMS drift that stalls subsequent
 *       switches until Globe is pressed).</li>
 *   <li><strong>Desync recovery:</strong> if IMMS already reports {@code verifiedSubtype} as active
 *       while {@code Lpga.C()} still points to another language, invokes {@code Lpga.l} to re-sync
 *       Gboard's internal manager with IMMS.</li>
 *   <li><strong>Verified fallback chain:</strong> {@code Lsex.k(gboardInfo, token, verifiedSubtype)},
 *       then {@code imm.setInputMethodAndSubtype(token, gboardImeId, verifiedSubtype)}, then
 *       in-process {@code Lpga.l} only if all IMMS paths were unavailable.</li>
 *   <li><strong>Rapid consecutive swipe tracking:</strong> tracks in-flight async IMMS switch
 *       requests for a short bounded window ({@value #IN_FLIGHT_SWITCH_WINDOW_MS} ms) so fast
 *       repeated swipes advance from the requested subtype instead of stalling on stale state.</li>
 *   <li>Never calls {@code Lpga.az}, {@code imm.setInputMethod}, or {@code imm.switchToNextInputMethod},
 *       so an external IME (e.g. TalkBack or Samsung Keyboard) can never be selected.</li>
 * </ul>
 */
public final class GboardSpacebarLanguageNavigator {
    private static final String TAG = "GboardPatches";
    private static final String LOG_PREFIX = "[gboard-spacebar-lang] ";
    private static final int MAX_WARN_LOGS = 20;
    static final long IN_FLIGHT_SWITCH_WINDOW_MS = 350L;

    private static final String MANAGER_CLASS = "pga";
    private static final String ENTRY_CLASS = "pev";
    private static final String ROTATION_LIST_CLASS = "rek";
    private static final String SUBTYPE_SWITCHER_CLASS = "sex";

    private static final Map<ClassLoader, WeakReference<LanguageRotationHandles>> HANDLES =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final AtomicInteger WARN_LOG_COUNT = new AtomicInteger();
    private static final InFlightTracker PRODUCTION_IN_FLIGHT_TRACKER = new InFlightTracker();

    private GboardSpacebarLanguageNavigator() {
    }

    /**
     * Computes the cyclic next index in Gboard's ordered language rotation list.
     *
     * @return {@code -1} if switching is impossible ({@code listSize <= 1} or invalid index).
     */
    public static int resolveNextIndex(int currentIndex, int listSize) {
        return resolveTargetIndex(currentIndex, listSize, +1);
    }

    /**
     * Computes the cyclic previous index in Gboard's ordered language rotation list.
     *
     * @return {@code -1} if switching is impossible ({@code listSize <= 1} or invalid index).
     */
    public static int resolvePreviousIndex(int currentIndex, int listSize) {
        return resolveTargetIndex(currentIndex, listSize, -1);
    }

    /**
     * Computes the cyclic target index for a non-zero directional step ({@code +1} for NEXT,
     * {@code -1} for PREVIOUS) in Gboard's ordered language rotation list.
     *
     * @return {@code -1} if switching is impossible ({@code listSize <= 1}, {@code step == 0},
     *     invalid index, or target wraps back to {@code currentIndex}).
     */
    public static int resolveTargetIndex(int currentIndex, int listSize, int step) {
        if (listSize <= 1 || currentIndex < 0 || currentIndex >= listSize || step == 0) {
            return -1;
        }
        int targetIndex = ((currentIndex + step) % listSize + listSize) % listSize;
        return targetIndex == currentIndex ? -1 : targetIndex;
    }

    /**
     * Verifies that a candidate {@link InputMethodInfo} strictly belongs to the active service's
     * package so an external IME can never be selected.
     */
    public static boolean isSameImePackage(String servicePackageName, String imePackageName) {
        return servicePackageName != null
                && !servicePackageName.isEmpty()
                && servicePackageName.equals(imePackageName);
    }

    public static boolean switchNext(InputMethodService service) {
        return switchByStep(service, +1, false);
    }

    public static boolean switchPrevious(InputMethodService service) {
        return switchByStep(service, -1, false);
    }

    public static boolean switchByStep(
            InputMethodService service, int step, boolean useRecentOrder) {
        if (step == 0) {
            return false;
        }
        String label = (step > 0 ? "NEXT" : "PREVIOUS")
                + (useRecentOrder ? "[MRU]" : "[FIXED]");
        return switchByStepInternal(service, step, useRecentOrder, label);
    }

    static void resetInFlightStateForTesting() {
        PRODUCTION_IN_FLIGHT_TRACKER.clear();
    }

    private static boolean switchByStepInternal(
            InputMethodService service, int step, boolean useRecentOrder, String directionLabel) {
        if (service == null) {
            return false;
        }
        InputMethodManager imm = resolveInputMethodManager(service);
        if (imm == null) {
            logWarn(directionLabel + " aborted: missing InputMethodManager", null);
            return false;
        }
        InputMethodInfo gboardInfo = resolveCurrentGboardImeInfo(service, imm);
        if (gboardInfo == null) {
            logWarn(directionLabel + " aborted: unable to verify active Gboard InputMethodInfo",
                    null);
            return false;
        }
        IBinder token = resolveWindowToken(service);

        // Primary: Gboard's own ordered Lpga/Lrek rotation list (preserves exact Globe-key order).
        try {
            LanguageRotationHandles handles = resolveHandles(service.getClass().getClassLoader());
            Context appContext = service.getApplicationContext();
            Object pgaInstance = handles.getManagerMethod.invoke(
                    null, appContext != null ? appContext : service);
            if (pgaInstance != null) {
                Object rotationList = handles.rotationListField.get(pgaInstance);
                if (rotationList != null) {
                    RotationSwitchBackend<Object, InputMethodSubtype> reflectionBackend =
                            new GboardReflectionBackend(
                                    service,
                                    imm,
                                    token,
                                    gboardInfo,
                                    handles,
                                    pgaInstance,
                                    rotationList,
                                    useRecentOrder);
                    if (switchWithBackend(
                            reflectionBackend,
                            step,
                            directionLabel,
                            PRODUCTION_IN_FLIGHT_TRACKER)) {
                        return true;
                    }
                }
            }
        } catch (Throwable throwable) {
            logWarn(directionLabel
                    + " reflection rotation failed; attempting verified IMMS Gboard subtype fallback",
                    throwable);
        }

        // Resilient fallback: strictly Gboard's own enabled IMMS subtype list (covers transient
        // Lpga/Lrek unavailability across app switches without ever touching external IMEs).
        try {
            RotationSwitchBackend<InputMethodSubtype, InputMethodSubtype> immFallbackBackend =
                    new ImmsSubtypeListBackend(service, imm, token, gboardInfo);
            return switchWithBackend(
                    immFallbackBackend,
                    step,
                    directionLabel,
                    PRODUCTION_IN_FLIGHT_TRACKER);
        } catch (Throwable throwable) {
            logWarn(directionLabel + " IMMS fallback failed; staying on current Gboard language",
                    throwable);
            return false;
        }
    }

    static <E, S> boolean switchWithBackend(
            RotationSwitchBackend<E, S> backend, int step, String directionLabel) {
        return switchWithBackend(backend, step, directionLabel, null);
    }

    static <E, S> boolean switchWithBackend(
            RotationSwitchBackend<E, S> backend,
            int step,
            String directionLabel,
            InFlightTracker tracker) {
        if (backend == null || step == 0) {
            return false;
        }
        String servicePackage = backend.getServicePackageName();
        String targetImePackage = backend.getTargetImePackageName();
        String targetImeId = backend.getTargetImeId();
        if (!isSameImePackage(servicePackage, targetImePackage)
                || targetImeId == null
                || targetImeId.isEmpty()) {
            logWarn(directionLabel + " aborted: target IME does not belong to active Gboard", null);
            return false;
        }

        E currentEntry = backend.getCurrentEntry();
        List<E> entries = backend.getRotationEntries();
        if (currentEntry == null || entries == null || entries.size() <= 1) {
            return false;
        }

        int currentIndex = backend.indexOfEntry(currentEntry);
        if (currentIndex < 0 || currentIndex >= entries.size()) {
            logWarn(directionLabel + " aborted: current Lpev index not found (" + currentIndex
                    + " of " + entries.size() + ")", null);
            return false;
        }

        S liveCurrentSubtype = backend.extractSubtype(currentEntry);
        int effectiveIndex = currentIndex;
        E effectiveCurrentEntry = currentEntry;
        S effectiveCurrentSubtype = liveCurrentSubtype;
        long nowMs = backend.nowMs();

        // If a rapid follow-up swipe arrives while the previous async IMMS switch is still in
        // flight (live subtype hasn't changed yet), advance from the requested subtype instead of
        // re-sending the exact same target subtype.
        if (tracker != null && liveCurrentSubtype != null) {
            S pendingRequested = tracker.resolveActiveInFlightTarget(
                    targetImeId, liveCurrentSubtype, nowMs, backend);
            if (pendingRequested != null) {
                int inFlightIndex = findEntryIndexBySubtype(entries, pendingRequested, backend);
                if (inFlightIndex >= 0) {
                    effectiveIndex = inFlightIndex;
                    effectiveCurrentEntry = entries.get(inFlightIndex);
                    effectiveCurrentSubtype = pendingRequested;
                }
            }
        }

        int listSize = entries.size();
        E targetEntry = null;
        S verifiedSubtype = null;
        for (int attempt = 1; attempt < listSize; attempt++) {
            int candidateIndex = resolveTargetIndex(effectiveIndex, listSize, step * attempt);
            if (candidateIndex < 0) {
                break;
            }
            E candidateEntry = entries.get(candidateIndex);
            if (candidateEntry == null
                    || candidateEntry == effectiveCurrentEntry
                    || candidateEntry.equals(effectiveCurrentEntry)) {
                continue;
            }
            S candidateSubtype = backend.extractSubtype(candidateEntry);
            if (candidateSubtype == null) {
                continue;
            }
            S candidateVerified = backend.findEnabledGboardSubtype(candidateSubtype);
            if (candidateVerified == null) {
                continue;
            }
            if (effectiveCurrentSubtype != null
                    && backend.subtypesEqual(effectiveCurrentSubtype, candidateVerified)) {
                continue;
            }
            targetEntry = candidateEntry;
            verifiedSubtype = candidateVerified;
            break;
        }

        if (targetEntry == null || verifiedSubtype == null) {
            logWarn(directionLabel
                    + " aborted: no distinct enabled Gboard subtype found in rotation list", null);
            return false;
        }

        if (!isSameImePackage(backend.getServicePackageName(), backend.getTargetImePackageName())) {
            return false;
        }

        // Detect IMMS <-> Lpga.C() divergence: if IMMS already considers verifiedSubtype active
        // while Lpga.C() is still on another language, calling IMMS switchInputMethod alone would
        // be a system no-op. Resync Gboard's internal manager first.
        S immCurrentSubtype = backend.getCurrentImmSubtype();
        boolean immAlreadyAtTarget = immCurrentSubtype != null
                && backend.subtypesEqual(immCurrentSubtype, verifiedSubtype);

        boolean switched = false;
        if (immAlreadyAtTarget) {
            if (backend.trySwitchInProcess(targetEntry, currentEntry)) {
                switched = true;
            }
        }

        if (!switched) {
            // Primary path (API 28+): official token-independent InputMethodService.switchInputMethod
            // keeps IMMS and Gboard's Lpga.C() strictly synchronized across repeated swipes & apps.
            if (backend.trySwitchViaInputMethodService(targetImeId, verifiedSubtype)) {
                switched = true;
            }
        }

        if (!switched) {
            // Secondary fallback: Gboard's Lsex.k subtype switcher (requires non-null window token).
            if (backend.trySwitchViaGboardHelper(verifiedSubtype)) {
                switched = true;
            }
        }

        if (!switched) {
            // Tertiary fallback: verified IMM.setInputMethodAndSubtype strictly on Gboard ID.
            if (isSameImePackage(backend.getServicePackageName(), backend.getTargetImePackageName())
                    && backend.hasWindowToken()) {
                backend.switchViaInputMethodManager(targetImeId, verifiedSubtype);
                switched = true;
            }
        }

        if (!switched && !immAlreadyAtTarget) {
            // Last-resort fallback (e.g. API 26-27 when dialog token is temporarily null):
            // try Gboard's in-process entry switch.
            if (backend.trySwitchInProcess(targetEntry, currentEntry)) {
                switched = true;
            }
        }

        if (switched && tracker != null && liveCurrentSubtype != null) {
            tracker.record(targetImeId, liveCurrentSubtype, verifiedSubtype, nowMs);
        }
        return switched;
    }

    private static <E, S> int findEntryIndexBySubtype(
            List<E> entries, S targetSubtype, RotationSwitchBackend<E, S> backend) {
        if (entries == null || targetSubtype == null) {
            return -1;
        }
        for (int i = 0; i < entries.size(); i++) {
            E entry = entries.get(i);
            if (entry == null) {
                continue;
            }
            S entrySubtype = backend.extractSubtype(entry);
            if (entrySubtype != null && backend.subtypesEqual(entrySubtype, targetSubtype)) {
                return i;
            }
        }
        return -1;
    }

    static <E> int findEntryIndexByIdentity(
            List<E> entries, E currentEntry, EntryIdentityMatcher<E> matcher) {
        if (entries == null || entries.isEmpty() || currentEntry == null) {
            return -1;
        }
        for (int i = 0; i < entries.size(); i++) {
            E candidate = entries.get(i);
            if (candidate == currentEntry || currentEntry.equals(candidate)) {
                return i;
            }
        }
        if (matcher != null) {
            for (int i = 0; i < entries.size(); i++) {
                E candidate = entries.get(i);
                if (candidate != null && matcher.matches(candidate, currentEntry)) {
                    return i;
                }
            }
        }
        return -1;
    }

    private static boolean trySwitchInProcess(
            LanguageRotationHandles handles,
            Object pgaInstance,
            Object targetEntry,
            Object previousEntry) {
        if (handles.inProcessSwitchMethod == null) {
            return false;
        }
        try {
            if (handles.inProcessSwitchMethod.getParameterCount() == 2) {
                handles.inProcessSwitchMethod.invoke(
                        pgaInstance, targetEntry, handles.inProcessSwitchSourceArg);
            } else {
                handles.inProcessSwitchMethod.invoke(pgaInstance, targetEntry);
            }
            Object afterEntry = handles.currentEntryMethod.invoke(pgaInstance);
            if (afterEntry == null) {
                return false;
            }
            return entriesMatch(handles, afterEntry, targetEntry);
        } catch (Throwable throwable) {
            logWarn("Lpga.l in-process switch failed; falling back to verified subtype switch",
                    throwable);
            return false;
        }
    }

    private static boolean trySwitchViaGboardHelper(
            LanguageRotationHandles handles,
            Object pgaInstance,
            InputMethodInfo gboardInfo,
            IBinder token,
            InputMethodSubtype subtype) {
        if (handles.subtypeSwitchMethod == null || token == null) {
            return false;
        }
        try {
            if (Modifier.isStatic(handles.subtypeSwitchMethod.getModifiers())) {
                Object result = handles.subtypeSwitchMethod.invoke(null, gboardInfo, token, subtype);
                return !(result instanceof Boolean ok) || ok;
            }
            if (handles.subtypeSwitcherFieldOnManager != null) {
                Object switcherInstance = handles.subtypeSwitcherFieldOnManager.get(pgaInstance);
                if (switcherInstance != null) {
                    Object result = handles.subtypeSwitchMethod.invoke(
                            switcherInstance, gboardInfo, token, subtype);
                    return !(result instanceof Boolean ok) || ok;
                }
            }
        } catch (Throwable throwable) {
            logWarn("Lsex.k invocation failed; falling back to verified setInputMethodAndSubtype",
                    throwable);
        }
        return false;
    }

    private static boolean entriesMatch(
            LanguageRotationHandles handles, Object first, Object second) {
        if (first == second) {
            return true;
        }
        if (first == null || second == null) {
            return false;
        }
        if (first.equals(second)) {
            return true;
        }
        InputMethodSubtype firstSub = safeExtractSubtype(handles, first);
        InputMethodSubtype secondSub = safeExtractSubtype(handles, second);
        if (firstSub != null && secondSub != null && subtypesMatch(firstSub, secondSub)) {
            return true;
        }
        Object firstLocale = safeInvokeZeroArg(handles.entryLocaleMethod, first);
        Object secondLocale = safeInvokeZeroArg(handles.entryLocaleMethod, second);
        Object firstId = safeInvokeZeroArg(handles.entryIdMethod, first);
        Object secondId = safeInvokeZeroArg(handles.entryIdMethod, second);
        return firstLocale != null
                && firstId != null
                && firstLocale.equals(secondLocale)
                && firstId.equals(secondId);
    }

    private static InputMethodSubtype safeExtractSubtype(
            LanguageRotationHandles handles, Object entry) {
        Object result = safeInvokeZeroArg(handles.entrySubtypeMethod, entry);
        return result instanceof InputMethodSubtype subtype ? subtype : null;
    }

    private static Object safeInvokeZeroArg(Method method, Object target) {
        if (method == null || target == null) {
            return null;
        }
        try {
            return method.invoke(target);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static boolean subtypesMatch(InputMethodSubtype first, InputMethodSubtype second) {
        if (first == second) {
            return true;
        }
        if (first == null || second == null) {
            return false;
        }
        if (first.equals(second)) {
            return true;
        }
        return first.hashCode() == second.hashCode()
                && equalsNullable(first.getMode(), second.getMode())
                && equalsNullable(first.getExtraValue(), second.getExtraValue());
    }

    private static InputMethodInfo resolveCurrentGboardImeInfo(
            InputMethodService service, InputMethodManager imm) {
        String servicePackage = service.getPackageName();
        String serviceClassName = service.getClass().getName();
        List<InputMethodInfo> enabledImes = imm.getEnabledInputMethodList();
        if (enabledImes == null || enabledImes.isEmpty()) {
            return null;
        }
        InputMethodInfo packageFallback = null;
        for (InputMethodInfo info : enabledImes) {
            if (info == null || !isSameImePackage(servicePackage, info.getPackageName())) {
                continue;
            }
            if (serviceClassName.equals(info.getServiceName())) {
                return info;
            }
            if (packageFallback == null) {
                packageFallback = info;
            }
        }
        return packageFallback;
    }

    private static InputMethodSubtype findEnabledSubtypeForGboard(
            InputMethodManager imm, InputMethodInfo gboardInfo, InputMethodSubtype target) {
        List<InputMethodSubtype> enabledSubtypes =
                imm.getEnabledInputMethodSubtypeList(gboardInfo, true);
        if (enabledSubtypes == null || enabledSubtypes.isEmpty()) {
            return null;
        }
        for (InputMethodSubtype candidate : enabledSubtypes) {
            if (candidate != null && candidate.equals(target)) {
                return candidate;
            }
        }
        for (InputMethodSubtype candidate : enabledSubtypes) {
            if (candidate != null && subtypesMatch(candidate, target)) {
                return candidate;
            }
        }
        return null;
    }

    private static List<InputMethodSubtype> collectUniqueGboardKeyboardSubtypes(
            InputMethodManager imm, InputMethodInfo gboardInfo) {
        List<InputMethodSubtype> raw = imm.getEnabledInputMethodSubtypeList(gboardInfo, true);
        if (raw == null || raw.isEmpty()) {
            return Collections.emptyList();
        }
        List<InputMethodSubtype> keyboardOnly = new ArrayList<>();
        List<InputMethodSubtype> allUnique = new ArrayList<>();
        for (InputMethodSubtype subtype : raw) {
            if (subtype == null) {
                continue;
            }
            if (!containsSubtype(allUnique, subtype)) {
                allUnique.add(subtype);
            }
            if ("keyboard".equalsIgnoreCase(subtype.getMode())
                    && !containsSubtype(keyboardOnly, subtype)) {
                keyboardOnly.add(subtype);
            }
        }
        return keyboardOnly.size() > 1 ? keyboardOnly : allUnique;
    }

    private static boolean containsSubtype(
            List<InputMethodSubtype> list, InputMethodSubtype target) {
        for (InputMethodSubtype existing : list) {
            if (subtypesMatch(existing, target)) {
                return true;
            }
        }
        return false;
    }

    static <E> List<E> resolveOrderedEntries(
            List<E> staticEntries, Object rawOrderArray, boolean useRecentOrder) {
        if (staticEntries == null || staticEntries.isEmpty()) {
            return Collections.emptyList();
        }
        if (!useRecentOrder || !(rawOrderArray instanceof int[] order)) {
            return staticEntries;
        }
        int size = staticEntries.size();
        if (order.length != size) {
            return staticEntries;
        }
        boolean[] seen = new boolean[size];
        List<E> ordered = new ArrayList<>(size);
        for (int idx : order) {
            if (idx < 0 || idx >= size || seen[idx]) {
                return staticEntries;
            }
            seen[idx] = true;
            ordered.add(staticEntries.get(idx));
        }
        return ordered;
    }

    @SuppressWarnings("unchecked")
    private static List<Object> extractEntryList(Object rawEntries) {
        if (rawEntries instanceof List<?> list) {
            return (List<Object>) list;
        }
        if (rawEntries instanceof Object[] array) {
            return Arrays.asList(array);
        }
        return Collections.emptyList();
    }

    private static IBinder resolveWindowToken(InputMethodService service) {
        Dialog dialog = service.getWindow();
        if (dialog == null) {
            return null;
        }
        Window window = dialog.getWindow();
        if (window == null) {
            return null;
        }
        WindowManager.LayoutParams attributes = window.getAttributes();
        if (attributes != null && attributes.token != null) {
            return attributes.token;
        }
        View decorView = window.getDecorView();
        return decorView == null ? null : decorView.getWindowToken();
    }

    private static InputMethodManager resolveInputMethodManager(InputMethodService service) {
        Object manager = service.getSystemService(Context.INPUT_METHOD_SERVICE);
        return manager instanceof InputMethodManager imm ? imm : null;
    }

    private static long currentElapsedRealtimeMs() {
        try {
            return SystemClock.elapsedRealtime();
        } catch (Throwable ignored) {
            return System.nanoTime() / 1_000_000L;
        }
    }

    private static LanguageRotationHandles resolveHandles(ClassLoader classLoader)
            throws Throwable {
        if (classLoader == null) {
            throw new IllegalStateException("Missing ClassLoader for Gboard language manager");
        }
        synchronized (HANDLES) {
            WeakReference<LanguageRotationHandles> reference = HANDLES.get(classLoader);
            LanguageRotationHandles cached = reference == null ? null : reference.get();
            if (cached != null) {
                return cached;
            }
            LanguageRotationHandles created = new LanguageRotationHandles(classLoader);
            HANDLES.put(classLoader, new WeakReference<>(created));
            return created;
        }
    }

    private static boolean equalsNullable(String first, String second) {
        return first == null ? second == null : first.equals(second);
    }

    private static void logWarn(String message, Throwable throwable) {
        try {
            if (WARN_LOG_COUNT.getAndIncrement() < MAX_WARN_LOGS) {
                if (throwable != null) {
                    Log.w(TAG, LOG_PREFIX + message, throwable);
                } else {
                    Log.w(TAG, LOG_PREFIX + message);
                }
            }
        } catch (Throwable ignored) {
            // Diagnostics must never crash IME touch handling.
        }
    }

    interface EntryIdentityMatcher<E> {
        boolean matches(E candidate, E target);
    }

    static final class InFlightTracker {
        private long timestampMs = -1L;
        private String imeId;
        private Object previousSubtype;
        private Object requestedSubtype;

        @SuppressWarnings("unchecked")
        synchronized <E, S> S resolveActiveInFlightTarget(
                String currentImeId,
                S liveCurrentSubtype,
                long nowMs,
                RotationSwitchBackend<E, S> backend) {
            if (timestampMs < 0L || imeId == null || requestedSubtype == null) {
                return null;
            }
            long ageMs = nowMs - timestampMs;
            if (ageMs < 0L || ageMs > IN_FLIGHT_SWITCH_WINDOW_MS || !imeId.equals(currentImeId)) {
                clearLocked();
                return null;
            }
            try {
                S prev = (S) previousSubtype;
                S req = (S) requestedSubtype;
                if (prev != null && backend.subtypesEqual(liveCurrentSubtype, prev)) {
                    return req;
                }
            } catch (ClassCastException ignored) {
                // Different subtype representation; discard stale tracker state.
            }
            clearLocked();
            return null;
        }

        synchronized void record(
                String currentImeId, Object prevSubtype, Object reqSubtype, long nowMs) {
            this.imeId = currentImeId;
            this.previousSubtype = prevSubtype;
            this.requestedSubtype = reqSubtype;
            this.timestampMs = nowMs;
        }

        synchronized void clear() {
            clearLocked();
        }

        private void clearLocked() {
            timestampMs = -1L;
            imeId = null;
            previousSubtype = null;
            requestedSubtype = null;
        }
    }

    interface RotationSwitchBackend<E, S> {
        String getServicePackageName();

        String getTargetImePackageName();

        String getTargetImeId();

        E getCurrentEntry();

        int indexOfEntry(E currentEntry);

        List<E> getRotationEntries();

        S extractSubtype(E entry);

        S findEnabledGboardSubtype(S targetSubtype);

        default S getCurrentImmSubtype() {
            return null;
        }

        default boolean subtypesEqual(S first, S second) {
            if (first == second) {
                return true;
            }
            return first != null && first.equals(second);
        }

        default long nowMs() {
            return currentElapsedRealtimeMs();
        }

        default boolean trySwitchInProcess(E targetEntry, E previousEntry) {
            return false;
        }

        default boolean trySwitchViaInputMethodService(String gboardImeId, S verifiedSubtype) {
            return false;
        }

        boolean trySwitchViaGboardHelper(S verifiedSubtype);

        default boolean hasWindowToken() {
            return true;
        }

        void switchViaInputMethodManager(String gboardImeId, S verifiedSubtype);
    }

    private static final class GboardReflectionBackend
            implements RotationSwitchBackend<Object, InputMethodSubtype> {
        private final InputMethodService service;
        private final InputMethodManager imm;
        private final IBinder token;
        private final InputMethodInfo gboardInfo;
        private final LanguageRotationHandles handles;
        private final Object pgaInstance;
        private final Object rotationList;
        private final boolean useRecentOrder;

        GboardReflectionBackend(
                InputMethodService service,
                InputMethodManager imm,
                IBinder token,
                InputMethodInfo gboardInfo,
                LanguageRotationHandles handles,
                Object pgaInstance,
                Object rotationList,
                boolean useRecentOrder) {
            this.service = service;
            this.imm = imm;
            this.token = token;
            this.gboardInfo = gboardInfo;
            this.handles = handles;
            this.pgaInstance = pgaInstance;
            this.rotationList = rotationList;
            this.useRecentOrder = useRecentOrder;
        }

        @Override
        public String getServicePackageName() {
            return service.getPackageName();
        }

        @Override
        public String getTargetImePackageName() {
            return gboardInfo.getPackageName();
        }

        @Override
        public String getTargetImeId() {
            return gboardInfo.getId();
        }

        @Override
        public Object getCurrentEntry() {
            try {
                return handles.currentEntryMethod.invoke(pgaInstance);
            } catch (Throwable throwable) {
                throw new IllegalStateException("Lpga.C() invocation failed", throwable);
            }
        }

        @Override
        public int indexOfEntry(Object currentEntry) {
            // Always locate currentEntry directly in the exact list returned by
            // getRotationEntries() (static Lrek.b or true MRU Lrek.b[Lrek.c[i]]).
            // Never mix Lrek.j(currentEntry) (which indexes Lrek.c) with Lrek.b.
            List<Object> entries = getRotationEntries();
            return findEntryIndexByIdentity(
                    entries,
                    currentEntry,
                    (candidate, target) -> entriesMatch(handles, candidate, target));
        }

        @Override
        public List<Object> getRotationEntries() {
            try {
                List<Object> staticEntries = extractEntryList(
                        handles.rotationEntriesField.get(rotationList));
                Object rawOrder = handles.rotationOrderField == null
                        ? null
                        : handles.rotationOrderField.get(rotationList);
                return resolveOrderedEntries(staticEntries, rawOrder, useRecentOrder);
            } catch (Throwable throwable) {
                throw new IllegalStateException("Lrek.b/c read failed", throwable);
            }
        }

        @Override
        public InputMethodSubtype extractSubtype(Object entry) {
            try {
                Object subtypeObject = handles.entrySubtypeMethod.invoke(entry);
                return subtypeObject instanceof InputMethodSubtype subtype ? subtype : null;
            } catch (Throwable throwable) {
                throw new IllegalStateException("Lpev.f() invocation failed", throwable);
            }
        }

        @Override
        public InputMethodSubtype findEnabledGboardSubtype(InputMethodSubtype targetSubtype) {
            return findEnabledSubtypeForGboard(imm, gboardInfo, targetSubtype);
        }

        @Override
        public InputMethodSubtype getCurrentImmSubtype() {
            try {
                return imm.getCurrentInputMethodSubtype();
            } catch (Throwable ignored) {
                return null;
            }
        }

        @Override
        public boolean subtypesEqual(InputMethodSubtype first, InputMethodSubtype second) {
            return subtypesMatch(first, second);
        }

        @Override
        public boolean trySwitchInProcess(Object targetEntry, Object previousEntry) {
            return GboardSpacebarLanguageNavigator.trySwitchInProcess(
                    handles, pgaInstance, targetEntry, previousEntry);
        }

        @Override
        public boolean trySwitchViaInputMethodService(
                String gboardImeId, InputMethodSubtype verifiedSubtype) {
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.P) {
                return false;
            }
            try {
                service.switchInputMethod(gboardImeId, verifiedSubtype);
                return true;
            } catch (Throwable throwable) {
                logWarn("InputMethodService.switchInputMethod failed; trying next fallback",
                        throwable);
                return false;
            }
        }

        @Override
        public boolean trySwitchViaGboardHelper(InputMethodSubtype verifiedSubtype) {
            return GboardSpacebarLanguageNavigator.trySwitchViaGboardHelper(
                    handles, pgaInstance, gboardInfo, token, verifiedSubtype);
        }

        @Override
        public boolean hasWindowToken() {
            return token != null;
        }

        @Override
        @SuppressWarnings("deprecation")
        public void switchViaInputMethodManager(
                String gboardImeId, InputMethodSubtype verifiedSubtype) {
            if (token == null) {
                return;
            }
            imm.setInputMethodAndSubtype(token, gboardImeId, verifiedSubtype);
        }
    }

    /**
     * Strictly Gboard-only fallback backend backed directly by
     * {@link InputMethodManager#getEnabledInputMethodSubtypeList(InputMethodInfo, boolean)} when
     * Gboard's internal {@code Lpga}/{@code Lrek} rotation list is temporarily unavailable.
     */
    private static final class ImmsSubtypeListBackend
            implements RotationSwitchBackend<InputMethodSubtype, InputMethodSubtype> {
        private final InputMethodService service;
        private final InputMethodManager imm;
        private final IBinder token;
        private final InputMethodInfo gboardInfo;
        private final List<InputMethodSubtype> subtypes;

        ImmsSubtypeListBackend(
                InputMethodService service,
                InputMethodManager imm,
                IBinder token,
                InputMethodInfo gboardInfo) {
            this.service = service;
            this.imm = imm;
            this.token = token;
            this.gboardInfo = gboardInfo;
            this.subtypes = collectUniqueGboardKeyboardSubtypes(imm, gboardInfo);
        }

        @Override
        public String getServicePackageName() {
            return service.getPackageName();
        }

        @Override
        public String getTargetImePackageName() {
            return gboardInfo.getPackageName();
        }

        @Override
        public String getTargetImeId() {
            return gboardInfo.getId();
        }

        @Override
        public InputMethodSubtype getCurrentEntry() {
            try {
                return imm.getCurrentInputMethodSubtype();
            } catch (Throwable ignored) {
                return null;
            }
        }

        @Override
        public int indexOfEntry(InputMethodSubtype currentEntry) {
            return findEntryIndexByIdentity(
                    subtypes, currentEntry, GboardSpacebarLanguageNavigator::subtypesMatch);
        }

        @Override
        public List<InputMethodSubtype> getRotationEntries() {
            return subtypes;
        }

        @Override
        public InputMethodSubtype extractSubtype(InputMethodSubtype entry) {
            return entry;
        }

        @Override
        public InputMethodSubtype findEnabledGboardSubtype(InputMethodSubtype targetSubtype) {
            return findEnabledSubtypeForGboard(imm, gboardInfo, targetSubtype);
        }

        @Override
        public InputMethodSubtype getCurrentImmSubtype() {
            return getCurrentEntry();
        }

        @Override
        public boolean subtypesEqual(InputMethodSubtype first, InputMethodSubtype second) {
            return subtypesMatch(first, second);
        }

        @Override
        public boolean trySwitchViaInputMethodService(
                String gboardImeId, InputMethodSubtype verifiedSubtype) {
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.P) {
                return false;
            }
            try {
                service.switchInputMethod(gboardImeId, verifiedSubtype);
                return true;
            } catch (Throwable throwable) {
                logWarn("IMMS fallback switchInputMethod failed; trying IMM fallback", throwable);
                return false;
            }
        }

        @Override
        public boolean trySwitchViaGboardHelper(InputMethodSubtype verifiedSubtype) {
            return false;
        }

        @Override
        public boolean hasWindowToken() {
            return token != null;
        }

        @Override
        @SuppressWarnings("deprecation")
        public void switchViaInputMethodManager(
                String gboardImeId, InputMethodSubtype verifiedSubtype) {
            if (token == null) {
                return;
            }
            imm.setInputMethodAndSubtype(token, gboardImeId, verifiedSubtype);
        }
    }

    private static final class LanguageRotationHandles {
        final Method getManagerMethod;
        final Method currentEntryMethod;
        final Field rotationListField;
        final Method indexOfEntryMethod;
        final Field rotationEntriesField;
        final Field rotationOrderField;
        final Method entrySubtypeMethod;
        final Method entryLocaleMethod;
        final Method entryIdMethod;
        final Method inProcessSwitchMethod;
        final Object inProcessSwitchSourceArg;
        final Method subtypeSwitchMethod;
        final Field subtypeSwitcherFieldOnManager;

        LanguageRotationHandles(ClassLoader classLoader) throws Throwable {
            Class<?> managerClass = Class.forName(MANAGER_CLASS, false, classLoader);
            Class<?> entryClass = Class.forName(ENTRY_CLASS, false, classLoader);
            Class<?> rotationListClass = Class.forName(ROTATION_LIST_CLASS, false, classLoader);

            getManagerMethod = managerClass.getDeclaredMethod("F", Context.class);
            if (!Modifier.isStatic(getManagerMethod.getModifiers())) {
                throw new NoSuchMethodException("Lpga.F(Context) must be static");
            }
            currentEntryMethod = managerClass.getDeclaredMethod("C");
            rotationListField = managerClass.getDeclaredField("Y");
            indexOfEntryMethod = rotationListClass.getDeclaredMethod("j", entryClass);
            rotationEntriesField = rotationListClass.getDeclaredField("b");
            rotationOrderField = findOptionalField(rotationListClass, "c");
            entrySubtypeMethod = entryClass.getDeclaredMethod("f");

            getManagerMethod.setAccessible(true);
            currentEntryMethod.setAccessible(true);
            rotationListField.setAccessible(true);
            indexOfEntryMethod.setAccessible(true);
            rotationEntriesField.setAccessible(true);
            entrySubtypeMethod.setAccessible(true);

            entryLocaleMethod = findOptionalZeroArgMethod(entryClass, "i");
            entryIdMethod = findOptionalZeroArgMethod(entryClass, "q");

            Method resolvedInProcessMethod = null;
            Object resolvedSourceArg = null;
            try {
                for (Method candidate : managerClass.getDeclaredMethods()) {
                    if (!"l".equals(candidate.getName())
                            || Modifier.isStatic(candidate.getModifiers())) {
                        continue;
                    }
                    Class<?>[] params = candidate.getParameterTypes();
                    if (params.length == 2 && params[0].isAssignableFrom(entryClass)) {
                        Object source = resolveSwitchSourceConstant(params[1]);
                        if (source != null) {
                            candidate.setAccessible(true);
                            resolvedInProcessMethod = candidate;
                            resolvedSourceArg = source;
                            break;
                        }
                    } else if (params.length == 1
                            && params[0].isAssignableFrom(entryClass)
                            && resolvedInProcessMethod == null) {
                        candidate.setAccessible(true);
                        resolvedInProcessMethod = candidate;
                    }
                }
            } catch (Throwable ignored) {
                // Optional: used only for desync resync or API 26-27 null-token fallback.
            }
            inProcessSwitchMethod = resolvedInProcessMethod;
            inProcessSwitchSourceArg = resolvedSourceArg;

            Method resolvedSwitchMethod = null;
            Field resolvedSwitcherField = null;
            try {
                Class<?> switcherClass = Class.forName(SUBTYPE_SWITCHER_CLASS, false, classLoader);
                resolvedSwitchMethod = switcherClass.getDeclaredMethod(
                        "k", InputMethodInfo.class, IBinder.class, InputMethodSubtype.class);
                resolvedSwitchMethod.setAccessible(true);
                if (!Modifier.isStatic(resolvedSwitchMethod.getModifiers())) {
                    for (Field candidate : managerClass.getDeclaredFields()) {
                        if (switcherClass.isAssignableFrom(candidate.getType())) {
                            candidate.setAccessible(true);
                            resolvedSwitcherField = candidate;
                            break;
                        }
                    }
                }
            } catch (Throwable ignored) {
                // Optional: verified switchInputMethod / imm.setInputMethodAndSubtype handles it.
            }
            subtypeSwitchMethod = resolvedSwitchMethod;
            subtypeSwitcherFieldOnManager = resolvedSwitcherField;
        }

        private static Field findOptionalField(Class<?> owner, String name) {
            try {
                Field field = owner.getDeclaredField(name);
                field.setAccessible(true);
                return field;
            } catch (Throwable ignored) {
                return null;
            }
        }

        private static Method findOptionalZeroArgMethod(Class<?> owner, String name) {
            try {
                Method method = owner.getDeclaredMethod(name);
                method.setAccessible(true);
                return method;
            } catch (Throwable ignored) {
                return null;
            }
        }

        private static Object resolveSwitchSourceConstant(Class<?> sourceClass) {
            if (sourceClass == null || sourceClass.isPrimitive()) {
                return null;
            }
            Object[] enumConstants = sourceClass.getEnumConstants();
            if (enumConstants != null && enumConstants.length > 0) {
                for (Object constant : enumConstants) {
                    if (constant instanceof Enum<?> enumConstant) {
                        String upper = enumConstant.name().toUpperCase(Locale.ROOT);
                        if (upper.contains("GLOBE")
                                || upper.contains("SWITCH")
                                || upper.contains("SPACE")
                                || upper.contains("USER")
                                || upper.contains("KEY")) {
                            return enumConstant;
                        }
                    }
                }
                return enumConstants[0];
            }
            for (Field field : sourceClass.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers())
                        && sourceClass.isAssignableFrom(field.getType())) {
                    try {
                        field.setAccessible(true);
                        Object value = field.get(null);
                        if (value != null) {
                            return value;
                        }
                    } catch (Throwable ignored) {
                        // Continue scanning static constants.
                    }
                }
            }
            return null;
        }
    }
}
