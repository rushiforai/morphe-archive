/*
 * Copyright 2026 xboyrex contributors
 * https://github.com/xboyrex/xboyrex
 */
package app.morphe.extension.suite.instagram.comment;

/** Filled by the patch after every native boundary has been validated. */
public final class CommentMenuNative {
    private CommentMenuNative() {}

    /** Original text of this selected comment; unsupported objects answer null. */
    public static String originalText(Object comment) { return null; }

    /** A native display row using Instagram's Copy label, icon and normal style. */
    public static Object newRow(Object callback) { return null; }

    /** The callback of an owned Copy row, or null for stock and unsupported rows. */
    public static Object callback(Object row) { return null; }
}
