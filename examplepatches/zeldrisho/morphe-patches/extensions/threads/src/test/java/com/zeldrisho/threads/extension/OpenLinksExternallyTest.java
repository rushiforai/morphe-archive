package com.zeldrisho.threads.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, instrumentedPackages = "com.zeldrisho.threads.extension")
public class OpenLinksExternallyTest {
  /** Verifies that a trimmed web URL launches an external ACTION_VIEW activity. */
  @Test
  public void validWebUrlLaunchesExternalActivity() {
    Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
    Intent query = new Intent(Intent.ACTION_VIEW, Uri.parse("https://example.com/path"));
    Shadows.shadowOf(activity.getPackageManager()).addResolveInfoForIntent(query, browser());

    assertTrue(OpenLinksExternally.open(activity, " https://example.com/path "));
    Intent started = Shadows.shadowOf(activity).getNextStartedActivity();
    assertNotNull(started);
    assertEquals(Intent.ACTION_VIEW, started.getAction());
    assertEquals(Uri.parse("https://example.com/path"), started.getData());
  }

  /** Verifies Unicode domain names pass IDN-aware validation and launch externally. */
  @Test
  public void internationalizedDomainLaunchesExternally() {
    Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
    Uri uri = Uri.parse("https://bücher.de/");
    Shadows.shadowOf(activity.getPackageManager())
        .addResolveInfoForIntent(new Intent(Intent.ACTION_VIEW, uri), browser());

    assertTrue(OpenLinksExternally.open(activity, "https://bücher.de/"));
    Intent started = Shadows.shadowOf(activity).getNextStartedActivity();
    assertNotNull(started);
    assertEquals(Intent.ACTION_VIEW, started.getAction());
    assertEquals(uri, started.getData());
  }

  /**
   * Verifies invalid inputs are rejected and unresolved URLs are still passed to Android to launch.
   */
  @Test
  public void invalidUrlsAndMissingExternalHandlerFallBack() {
    Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
    assertFalse(OpenLinksExternally.open(null, "https://example.com"));
    assertFalse(OpenLinksExternally.open(activity, null));
    assertFalse(OpenLinksExternally.open(activity, "javascript:alert(1)"));
    assertFalse(OpenLinksExternally.open(activity, "https://"));
    assertFalse(OpenLinksExternally.open(activity, "not a URL"));
    assertTrue(OpenLinksExternally.open(activity, "https://example.com"));
    Intent attempted = Shadows.shadowOf(activity).getNextStartedActivity();
    assertNotNull(attempted);
    assertEquals(Intent.ACTION_VIEW, attempted.getAction());
  }

  /** Verifies generated unsupported schemes and malformed authority forms are rejected. */
  @Test
  public void generatedInvalidUrlsAreRejected() {
    Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
    String[] invalidUrls = {
      "javascript:alert(1)",
      "file:///etc/passwd",
      "content://example.com/item",
      "https://",
      "http://",
      "https:///path",
      "https://?query=value",
      "https://#fragment",
      "https://exa mple.com",
      "https://example.com:65536/",
      "https://bücher.de:+80/",
      "  javascript:alert(1)  "
    };

    for (String url : invalidUrls) {
      assertFalse("Expected rejection for: " + url, OpenLinksExternally.open(activity, url));
    }
    assertNull(Shadows.shadowOf(activity).getNextStartedActivity());
  }

  /** Verifies that URLs resolving to the host package retain Threads link handling. */
  @Test
  public void doesNotRecaptureUrlsResolvedToThreadsItself() {
    Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
    Intent query = new Intent(Intent.ACTION_VIEW, Uri.parse("https://example.com"));
    ResolveInfo threads = browser();
    threads.activityInfo.packageName = activity.getPackageName();
    Shadows.shadowOf(activity.getPackageManager()).addResolveInfoForIntent(query, threads);

    assertFalse(OpenLinksExternally.open(activity, "https://example.com"));
    assertNull(Shadows.shadowOf(activity).getNextStartedActivity());
  }

  /** Verifies that launching from an application context sets FLAG_ACTIVITY_NEW_TASK. */
  @Test
  public void applicationContextUsesNewTaskFlag() {
    android.content.Context context = RuntimeEnvironment.getApplication();
    Intent query = new Intent(Intent.ACTION_VIEW, Uri.parse("https://example.com"));
    Shadows.shadowOf(context.getPackageManager()).addResolveInfoForIntent(query, browser());

    assertTrue(OpenLinksExternally.open(context, "https://example.com"));
    Intent started = Shadows.shadowOf(RuntimeEnvironment.getApplication()).getNextStartedActivity();
    assertNotNull(started);
    assertTrue((started.getFlags() & Intent.FLAG_ACTIVITY_NEW_TASK) != 0);
  }

  /** Builds a synthetic resolver result for an activity outside the host package. */
  private static ResolveInfo browser() {
    ResolveInfo info = new ResolveInfo();
    info.activityInfo = new ActivityInfo();
    info.activityInfo.packageName = "test.external.browser";
    info.activityInfo.name = "BrowserActivity";
    return info;
  }
}
