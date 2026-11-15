/*
 * Copyright 2026 xboyrex contributors
 * https://github.com/xboyrex/xboyrex
 */
package app.morphe.extension.suite.instagram.download;

/**
 * How long Hold to download's fingers stay down before it saves, counted from when the last of them lands.
 * {@link #ONE_SECOND} is the default.
 */
public enum HoldTime {
    HALF_SECOND(500),
    ONE_SECOND(1000),
    ONE_AND_A_HALF_SECONDS(1500);

    public final long millis;

    HoldTime(long millis) {
        this.millis = millis;
    }
}
