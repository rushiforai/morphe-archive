/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.focusLock;

import static app.morphe.extension.instagram.utils.IgStr.str;

import android.app.AlertDialog;
import android.content.Context;
import android.preference.Preference;

import app.morphe.extension.rex.RexUtils;
import app.morphe.extension.instagram.settings.preference.widgets.InstagramPreferenceStyle;
import app.morphe.extension.shared.Utils;

/** Confirmation flows behind the Focus Lock button. */
public class FocusLockDialogs {

    public static void onActionPressed(Context context, Preference button) {
        if (!FocusLock.isActive()) {
            confirmLock(context);
        } else if (FocusLock.canUnlockNow()) {
            confirmUnlock(context);
        } else if (FocusLock.isUnlockPending()) {
            FocusLock.cancelUnlockRequest();
            refresh(button);
        } else {
            confirmRequestUnlock(context, button);
        }
    }

    private static void refresh(Preference button) {
        button.setTitle(FocusLock.buttonTitle());
        button.setSummary(FocusLock.statusSummary());
    }

    private static void confirmLock(Context context) {
        if (!FocusLock.hasSelection()) {
            RexUtils.toast(str("rex_focus_lock_nothing_selected"));
            return;
        }
        String message = String.format(
                str("rex_focus_lock_confirm_lock_desc"),
                FocusLockDuration.summary(),
                FocusLock.COOLING_OFF_MS / (60 * 60 * 1000)
        );
        new AlertDialog.Builder(InstagramPreferenceStyle.dialogContext(context))
                .setTitle(str("rex_focus_lock_confirm_lock"))
                .setMessage(message)
                .setNegativeButton(str("rex_cancel"), null)
                .setPositiveButton(str("rex_ok"), (d, w) -> {
                    if (FocusLock.lock()) {
                        RexUtils.toast(str("rex_focus_lock_locked_toast"));
                        // Some hooks read preferences once at class-load time, so restart.
                        Utils.restartApp(Utils.getContext());
                    }
                })
                .show();
    }

    private static void confirmRequestUnlock(Context context, Preference button) {
        String message = String.format(
                str("rex_focus_lock_confirm_request_unlock_desc"),
                FocusLock.COOLING_OFF_MS / (60 * 60 * 1000)
        );
        new AlertDialog.Builder(InstagramPreferenceStyle.dialogContext(context))
                .setTitle(str("rex_focus_lock_confirm_request_unlock"))
                .setMessage(message)
                .setNegativeButton(str("rex_cancel"), null)
                .setPositiveButton(str("rex_ok"), (d, w) -> {
                    FocusLock.requestUnlock();
                    refresh(button);
                })
                .show();
    }

    private static void confirmUnlock(Context context) {
        new AlertDialog.Builder(InstagramPreferenceStyle.dialogContext(context))
                .setTitle(str("rex_focus_lock_confirm_unlock"))
                .setMessage(str("rex_focus_lock_confirm_unlock_desc"))
                .setNegativeButton(str("rex_cancel"), null)
                .setPositiveButton(str("rex_ok"), (d, w) -> {
                    if (FocusLock.unlock()) {
                        Utils.restartApp(Utils.getContext());
                    }
                })
                .show();
    }
}
