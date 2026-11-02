/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.twitter.settings;

final class SettingsSearchOwnerTracker<T> {
    private T owner;

    T replaceWith(T nextOwner) {
        T previousOwner = owner;
        owner = nextOwner;
        return previousOwner;
    }

    T current() {
        return owner;
    }

    boolean clearIfOwnedBy(T candidate, Runnable cleanup) {
        if (candidate == null || owner != candidate) {
            return false;
        }

        owner = null;
        cleanup.run();
        return true;
    }
}
