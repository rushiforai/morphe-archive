/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */
package app.morphe.extension.instagram.patches.ghost;

import app.morphe.extension.instagram.utils.Pref;

@SuppressWarnings("unused")
public final class GhostInstants {
    private GhostInstants() {
    }

    public static boolean hideInstantViews() {
        return Pref.ghostInstants();
    }
}
