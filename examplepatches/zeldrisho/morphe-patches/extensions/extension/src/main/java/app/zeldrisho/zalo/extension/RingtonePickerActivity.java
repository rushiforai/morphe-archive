package app.zeldrisho.zalo.extension;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.widget.Toast;

/** Short-lived internal activity that obtains a persistent grant from the system document picker. */
public final class RingtonePickerActivity extends Activity {
  private static final int PICK_AUDIO = 4109;
  private boolean launched;

  @Override public void onCreate(Bundle state) {
    super.onCreate(state);
    launched = state != null && state.getBoolean("launched");
    if (launched) return;
    launched = true;
    try {
      Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
      intent.addCategory(Intent.CATEGORY_OPENABLE);
      intent.setType("audio/*");
      intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION);
      startActivityForResult(intent, PICK_AUDIO);
    } catch (RuntimeException ignored) {
      Toast.makeText(this, "Audio picker unavailable", Toast.LENGTH_SHORT).show();
      finish();
    }
  }

  @Override protected void onSaveInstanceState(Bundle state) {
    state.putBoolean("launched", launched);
    super.onSaveInstanceState(state);
  }

  @Override protected void onActivityResult(int requestCode, int resultCode, Intent data) {
    super.onActivityResult(requestCode, resultCode, data);
    if (requestCode != PICK_AUDIO) return;
    if (resultCode == RESULT_OK && data != null) {
      Uri uri = data.getData();
      try {
        if (uri == null || !"content".equals(uri.getScheme()) ||
            (data.getFlags() & Intent.FLAG_GRANT_READ_URI_PERMISSION) == 0) {
          throw new IllegalArgumentException("Missing readable document");
        }
        android.content.SharedPreferences preferences =
            getSharedPreferences(CustomRingtone.PREFS, MODE_PRIVATE);
        boolean hadGrant = CustomRingtone.hasPersistedReadGrant(this, uri);
        String previous = preferences.getString(CustomRingtone.KEY, null);
        getContentResolver().takePersistableUriPermission(uri, Intent.FLAG_GRANT_READ_URI_PERMISSION);
        boolean saved = preferences.edit().putString(CustomRingtone.KEY, uri.toString()).commit();
        if (!saved) {
          if (previous == null) preferences.edit().remove(CustomRingtone.KEY).commit();
          else preferences.edit().putString(CustomRingtone.KEY, previous).commit();
          if (!hadGrant) CustomRingtone.releaseReadGrant(this, uri);
          throw new IllegalStateException("Could not save selection");
        }
        if (previous != null && !Uri.parse(previous).equals(uri)) {
          CustomRingtone.releaseReadGrant(this, Uri.parse(previous));
        }
        Toast.makeText(this, "Call ringtone selected", Toast.LENGTH_SHORT).show();
      } catch (RuntimeException ignored) {
        Toast.makeText(this, "Could not access selected audio", Toast.LENGTH_SHORT).show();
      }
    }
    finish();
  }
}
