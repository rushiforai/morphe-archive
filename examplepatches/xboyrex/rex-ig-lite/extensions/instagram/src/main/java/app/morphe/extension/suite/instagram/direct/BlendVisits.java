/*
 * Copyright 2026 xboyrex contributors
 * https://github.com/xboyrex/xboyrex
 */
package app.morphe.extension.suite.instagram.direct;

import app.morphe.extension.suite.instagram.settings.FamilyNames;
import app.morphe.extension.suite.instagram.settings.Settings;
import app.morphe.extension.suite.shared.Logger;
import app.morphe.extension.suite.shared.Utils;
import app.morphe.extension.suite.shared.diagnostics.HookStatus;
import java.util.function.BooleanSupplier;

/**
 * Helper for the "Don't report Blend visits" patch.
 *
 * <p>Opening a Blend loads its reels from Instagram, and that request carries a flag saying whether
 * to leave the "visited the Blend" message out of the chat the Blend belongs to. Instagram mostly
 * asks for the message. The patch hands that flag to {@link #quiet} first, so while the switch is on
 * the request always asks to leave it out. Opening a Blend also sends the time you opened it, and
 * {@link #skipsVisitTime} lets the patch skip that call while the switch is on.
 *
 * <p>The hook fails open: with the switch off, xboyrex paused, the settings not read yet or
 * anything thrown, the request asks what Instagram asked.
 */
public final class BlendVisits {
    /** The step a failed switch read is reported under. */
    static final String SWITCH = "switch read";

    private static volatile boolean logged;
    private static volatile boolean timeLogged;

    private BlendVisits() {
    }

    /**
     * Asked as a Blend's reels are requested, with the flag Instagram set (non-zero to leave the
     * visit message out). True leaves it out. Instagram's own flag while the switch is off,
     * xboyrex is paused or the settings aren't ready. Never throws.
     */
    public static boolean quiet(int asked) {
        return quiet(asked, BlendVisits::switchedOn);
    }

    static boolean quiet(int asked, BooleanSupplier on) {
        boolean instagram = asked != 0;
        try {
            HookStatus.invoked(FamilyNames.BLEND_VISITS);
            if (!on.getAsBoolean()) return instagram;
            if (!logged) {
                logged = true;
                Logger.printDebug(() -> "Blend: asked to leave the visit message out (Instagram asked "
                        + (instagram ? "the same" : "for it") + ")");
            }
            return true;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.BLEND_VISITS, SWITCH, t);
            return instagram;
        }
    }

    /**
     * Asked as Instagram goes to tell the server when you last opened a Blend
     * (UpdateBlendLastVisitedTime), which is what shows the chat that you looked. True skips
     * sending it. False while the switch is off, xboyrex is paused or the settings aren't
     * ready. Never throws.
     */
    public static boolean skipsVisitTime() {
        return skipsVisitTime(BlendVisits::switchedOn);
    }

    static boolean skipsVisitTime(BooleanSupplier on) {
        try {
            HookStatus.invoked(FamilyNames.BLEND_VISITS);
            if (!on.getAsBoolean()) return false;
            if (!timeLogged) {
                timeLogged = true;
                Logger.printDebug(() -> "Blend: kept the time you opened it to yourself");
            }
            return true;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.BLEND_VISITS, SWITCH, t);
            return false;
        }
    }

    private static boolean switchedOn() {
        return Utils.settingsReady() && Settings.HIDE_BLEND_VISITS.get();
    }
}
