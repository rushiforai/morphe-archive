/*
 * Copyright 2026 xboyrex contributors
 * https://github.com/xboyrex/xboyrex
 */
package app.morphe.extension.suite.instagram.misc;

/** The font Instagram's text draws in ({@link Fonts}). Instagram's own is the one that changes nothing. */
public enum FontChoice {
    /** Instagram's own fonts, untouched. */
    INSTAGRAM,
    /** The phone's own font, the one other apps draw in. */
    SYSTEM,
    /** A font file picked in xboyrex settings and kept in Instagram's own storage. */
    FILE
}
