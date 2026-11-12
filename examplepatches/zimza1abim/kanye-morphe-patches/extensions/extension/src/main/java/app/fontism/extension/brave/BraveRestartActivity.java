package app.fontism.extension.brave;

import android.app.Activity;
import android.app.ActivityManager;
import android.content.ComponentName;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;

import java.util.List;

public final class BraveRestartActivity extends Activity {
    private static final long RESTART_DELAY_MS = 700L;

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        terminateOtherBraveProcesses();
        new Handler(Looper.getMainLooper()).postDelayed(this::launchBrave, RESTART_DELAY_MS);
    }

    private void terminateOtherBraveProcesses() {
        int ownPid = Process.myPid();
        int ownUid = Process.myUid();
        String packageName = getPackageName();
        ActivityManager manager = (ActivityManager) getSystemService(ACTIVITY_SERVICE);
        if (manager == null) return;
        List<ActivityManager.RunningAppProcessInfo> processes = manager.getRunningAppProcesses();
        if (processes == null) return;
        for (ActivityManager.RunningAppProcessInfo process : processes) {
            if (process.pid == ownPid || process.uid != ownUid || process.processName == null) continue;
            if (process.processName.equals(packageName) ||
                    process.processName.startsWith(packageName + ":")) {
                Process.killProcess(process.pid);
            }
        }
    }

    private void launchBrave() {
        Intent launch = getPackageManager().getLaunchIntentForPackage(getPackageName());
        if (launch != null) {
            ComponentName component = launch.getComponent();
            if (component != null) {
                launch = Intent.makeRestartActivityTask(component);
            } else {
                launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            }
            startActivity(launch);
        }
        finish();
        new Handler(Looper.getMainLooper()).postDelayed(
                () -> Process.killProcess(Process.myPid()), 300L);
    }
}
