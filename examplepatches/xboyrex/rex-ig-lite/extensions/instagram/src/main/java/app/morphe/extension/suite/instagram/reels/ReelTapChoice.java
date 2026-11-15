/*
 * Copyright 2026 xboyrex contributors
 * https://github.com/xboyrex/xboyrex
 */
package app.morphe.extension.suite.instagram.reels;

/**
 * What a single tap on a reel does ({@link ReelTapAndVolume}). Instagram's default leaves the tap
 * alone, pause is what Instagram 450's own tap does spelled out, mute turns the sound off or on
 * and leaves the reel playing, and keep playing leaves a playing reel as it is (#554).
 */
public enum ReelTapChoice {
    DEFAULT,
    PAUSE,
    MUTE,
    KEEP_PLAYING
}
