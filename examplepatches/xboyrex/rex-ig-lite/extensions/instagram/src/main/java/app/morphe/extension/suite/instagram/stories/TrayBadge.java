/*
 * Copyright 2026 xboyrex contributors
 * https://github.com/xboyrex/xboyrex
 */
package app.morphe.extension.suite.instagram.stories;

/**
 * Which stories the row at the top of Home keeps while Filter the Stories tray by verified accounts
 * is on (#340): those from accounts without Instagram's verified badge, or only those with it. It
 * holds no Android type and reads no setting; the name a person reads is the settings screen's.
 */
public enum TrayBadge {
    UNVERIFIED,
    VERIFIED
}
