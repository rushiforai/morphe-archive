/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.devFlags;

public enum FlagType {
    BOOL,
    LONG;

    @Override
    public String toString() {
        return name().toLowerCase();
    }
}
