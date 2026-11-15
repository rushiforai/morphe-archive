/*
 * Copyright 2026 xboyrex contributors
 * https://github.com/xboyrex/xboyrex
 */
package app.morphe.extension.suite.instagram.direct;

/**
 * What {@link MessagesLock} asks when the messages are locked. The phone's lock is what the lock
 * did before there was a choice, so no one's lock changes until they pick.
 */
public enum UnlockWith {
    PHONE_LOCK,
    PIN,
    /**
     * The phone's fingerprint or face with no PIN, pattern or password beside it, on Android 11 and
     * up (rex #2215). While the phone has none to ask, the phone's lock asks as usual.
     */
    BIOMETRICS
}
