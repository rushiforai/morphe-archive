/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */
package app.morphe.extension.instagram.patches.theme;

import app.morphe.extension.instagram.theme.MaterialYouTheme;

public final class AmoledMessages {
    private static final long BLUE_GREY_BLACK = 0xFF0C1014L;
    private static final long PURE_BLACK = 0xFF000000L << 32;

    private AmoledMessages() {
    }

    public static long composeBlack(long color) {
        try {
            if ((color >>> 32) != BLUE_GREY_BLACK || !MaterialYouTheme.isAmoledEnabled()) {
                return color;
            }
            return PURE_BLACK;
        } catch (Throwable ignored) {
            return color;
        }
    }
}
