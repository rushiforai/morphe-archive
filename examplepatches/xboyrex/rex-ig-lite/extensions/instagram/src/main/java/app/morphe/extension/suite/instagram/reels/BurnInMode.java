/*
 * Copyright 2026 xboyrex contributors
 * https://github.com/xboyrex/xboyrex
 */
package app.morphe.extension.suite.instagram.reels;

/**
 * What Burn-in guard does on the Reels screen ({@link BurnInGuard}, #162): nothing, dims the reel's
 * controls when the screen goes untouched, or dims them and also moves the screen a step now and then.
 */
public enum BurnInMode {
    OFF,
    DIM,
    DIM_AND_SHIFT
}
