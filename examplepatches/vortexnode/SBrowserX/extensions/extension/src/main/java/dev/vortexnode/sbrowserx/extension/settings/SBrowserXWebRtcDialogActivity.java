package dev.vortexnode.sbrowserx.extension.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import android.widget.Toast;

import dev.vortexnode.sbrowserx.extension.SBrowserXHooks;
import dev.vortexnode.sbrowserx.extension.SBrowserXPrefs;
import dev.vortexnode.sbrowserx.extension.SBrowserXStrings;
import dev.vortexnode.sbrowserx.extension.SBrowserXWebRtcManager;

public final class SBrowserXWebRtcDialogActivity extends Activity {
    private static final String[] POLICY_VALUES = new String[] {
            SBrowserXPrefs.WEBRTC_DEFAULT,
            SBrowserXPrefs.WEBRTC_PUBLIC_AND_PRIVATE,
            SBrowserXPrefs.WEBRTC_PUBLIC_ONLY,
            SBrowserXPrefs.WEBRTC_DISABLE_NON_PROXIED_UDP
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        SBrowserXPrefs.init(this);

        boolean night = SBrowserXHooks.isBrowserNightMode(this);
        int theme = night
                ? android.R.style.Theme_DeviceDefault_Dialog_Alert
                : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert;

        String current = SBrowserXPrefs.getWebRtcPolicy(this);
        int checked = 3;
        for (int i = 0; i < POLICY_VALUES.length; i++) {
            if (POLICY_VALUES[i].equals(current)) {
                checked = i;
                break;
            }
        }

        String[] labels = new String[] {
                SBrowserXStrings.get(SBrowserXStrings.WEBRTC_DEFAULT),
                SBrowserXStrings.get(SBrowserXStrings.WEBRTC_PUB_PRIV),
                SBrowserXStrings.get(SBrowserXStrings.WEBRTC_PUB_ONLY),
                SBrowserXStrings.get(SBrowserXStrings.WEBRTC_DISABLE_UDP)
        };

        final int initial = checked;
        new AlertDialog.Builder(this, theme)
                .setTitle(SBrowserXStrings.get(SBrowserXStrings.WEBRTC_TITLE))
                .setSingleChoiceItems(labels, checked, (dialog, which) -> {
                    String selected = POLICY_VALUES[which];
                    SBrowserXPrefs.setWebRtcPolicy(this, selected);
                    SBrowserXWebRtcManager.applyToProfile(this);
                    dialog.dismiss();
                    if (which != initial) {
                        promptRestart(theme);
                    } else {
                        finish();
                    }
                })
                .setNegativeButton(android.R.string.cancel, (d, w) -> finish())
                .setOnCancelListener(d -> finish())
                .show();
    }

    private void promptRestart(int theme) {
        new AlertDialog.Builder(this, theme)
                .setTitle(SBrowserXStrings.get(SBrowserXStrings.RESTART_TITLE))
                .setMessage(SBrowserXStrings.get(SBrowserXStrings.RESTART_REQUIRED))
                .setPositiveButton(SBrowserXStrings.get(SBrowserXStrings.BTN_RESTART), (d, w) -> restartBrowser(this))
                .setNegativeButton(SBrowserXStrings.get(SBrowserXStrings.BTN_LATER), (d, w) -> {
                    Toast.makeText(this, SBrowserXStrings.webrtcLabel(SBrowserXPrefs.getWebRtcPolicy(this)), Toast.LENGTH_SHORT).show();
                    finish();
                })
                .setOnCancelListener(d -> finish())
                .show();
    }

    public static void restartBrowser(Activity activity) {
        Intent launch = activity.getPackageManager().getLaunchIntentForPackage(activity.getPackageName());
        if (launch != null) {
            launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            activity.startActivity(launch);
        }
        activity.finishAffinity();
        Runtime.getRuntime().exit(0);
    }
}
