/*
 * Copyright 2026 xboyrex contributors
 * https://github.com/xboyrex/xboyrex
 */
package app.morphe.extension.suite.instagram.reels;

/**
 * The tab Instagram opens on when it's started from its icon, and the name Instagram's tab enum
 * gives it. Home is the choice that leaves Instagram's own start alone, so an account Instagram
 * reopens on Reels still opens there. Always Home sends that one start to Home (#55).
 */
public enum StartTab {
    HOME("FEED"),
    ALWAYS_HOME("FEED"),
    SEARCH("SEARCH"),
    MESSAGES("DIRECT"),
    REELS("CLIPS"),
    PROFILE("PROFILE");

    /** The tab's name in Instagram's tab enum. */
    final String tab;

    StartTab(String tab) {
        this.tab = tab;
    }
}
