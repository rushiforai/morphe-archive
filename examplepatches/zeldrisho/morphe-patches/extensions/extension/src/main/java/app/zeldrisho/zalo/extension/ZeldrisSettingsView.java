package app.zeldrisho.zalo.extension;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.LinearLayout;

/** The patch changes this placeholder's superclass and O6 descriptor to Zalo's settings ABI. */
public class ZeldrisSettingsView {
  public ZeldrisSettingsView() {}
  public Object[] O6() { return null; }
  public int P6() { return 0; }
  public void R6() {}
  public void V6() {}
  public View T6(LayoutInflater inflater, LinearLayout parent, Bundle state) {
    return ZeldrisSettingsContent.build(parent);
  }
  public void c6() {}
  public String getTrackingKey() { return "ZeldrisPatchesSettings"; }
}
