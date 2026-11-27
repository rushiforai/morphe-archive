package dev.vortexnode.sbrowserx.extension.settings;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

public final class SBrowserXExtensionsBridgeActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        startActivity(new Intent(this, SBrowserXExtensionsActivity.class));
        finish();
    }
}
