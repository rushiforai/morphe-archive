/*
 * Copyright 2026 xboyrex contributors
 * https://github.com/xboyrex/xboyrex
 */
package app.morphe.extension.suite.instagram.misc;

/**
 * Which tick the glass tab bar plays as its highlight passes a tab. A motor can't be heard about from a
 * description, so there are four to pick between: a short pulse of the motor's own, the phone's own click effect (the
 * default), a light tick that rings a little longer, and
 * the phone's strongest tick.
 */
public enum HapticStyle {
    SHORT,
    SYSTEM,
    SOFT,
    FULL
}
