/*
 * Copyright 2026 xboyrex contributors
 * https://github.com/xboyrex/xboyrex
 */
package app.morphe.extension.suite.instagram.reels;

/**
 * Which bars Full screen Reels and Home hide (#231): both, which is all there was before the
 * choice, or only the status bar, or only the navigation bar ({@link FullScreenBars}).
 */
public enum HiddenBars {
    BOTH,
    STATUS_BAR,
    NAVIGATION_BAR;

    /** Whether the status bar at the top hides. */
    boolean status() {
        return this != NAVIGATION_BAR;
    }

    /** Whether the navigation bar at the bottom hides. */
    boolean navigation() {
        return this != STATUS_BAR;
    }
}
