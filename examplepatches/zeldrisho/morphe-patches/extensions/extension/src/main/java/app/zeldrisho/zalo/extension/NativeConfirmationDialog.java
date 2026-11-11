package app.zeldrisho.zalo.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.ContextWrapper;
import java.lang.reflect.Proxy;
import java.util.concurrent.atomic.AtomicBoolean;

/** Zalo 26.10.02's MaterialZaloDialog builder, with a platform fallback if the host ABI is unavailable. */
public final class NativeConfirmationDialog {
  private NativeConfirmationDialog() {}

  /**
   * Shows a confirmation dialog and runs {@code confirmed} at most once on acceptance.
   * Uses a platform dialog on reflection or runtime failure in native setup. If native setup
   * reaches a finishing or destroyed activity, it returns without showing a dialog. Failures
   * creating the platform dialog propagate.
   */
  public static void show(Context context, String title, String message, String positive,
      String negative, Runnable confirmed) {
    AtomicBoolean accepted = new AtomicBoolean();
    Runnable acceptOnce = () -> {
      if (accepted.compareAndSet(false, true)) confirmed.run();
    };
    try {
      Class<?> builderClass = Class.forName("w70.e0");
      Class<?> listenerClass = Class.forName("k92.g");
      // Native dialogs can choose an overlay window for non-Activity contexts.
      // Unwrap the settings row's themed context to keep this attached to the host activity.
      Context activity = context;
      for (int i = 0; i < 16 && !(activity instanceof Activity) && activity instanceof ContextWrapper; i++) {
        Context base = ((ContextWrapper) activity).getBaseContext();
        if (base == activity) break;
        activity = base;
      }
      if (!(activity instanceof Activity)) throw new IllegalStateException("No dialog activity");
      if (((Activity) activity).isFinishing() || ((Activity) activity).isDestroyed()) return;
      Object builder = builderClass.getConstructor(Context.class).newInstance(activity);
      builderClass.getMethod("I", CharSequence.class).invoke(builder, title);
      builderClass.getMethod("y", CharSequence.class).invoke(builder, message);
      Object listener = Proxy.newProxyInstance(listenerClass.getClassLoader(),
          new Class<?>[] {listenerClass}, (proxy, method, args) -> {
            if (method.getDeclaringClass() == Object.class) {
              switch (method.getName()) {
                case "hashCode": return System.identityHashCode(proxy);
                case "equals": return args != null && args.length == 1 && proxy == args[0];
                case "toString": return "ZeldrisConfirmationListener";
                default: return null;
              }
            }
            if ("n3".equals(method.getName()) && args != null && args.length == 2
                && Integer.valueOf(-1).equals(args[0])) acceptOnce.run();
            return null;
          });
      builderClass.getMethod("G", CharSequence.class, listenerClass).invoke(builder, positive, listener);
      builderClass.getMethod("C", CharSequence.class, listenerClass).invoke(builder, negative, null);
      Object dialog = builderClass.getMethod("j").invoke(builder);
      dialog.getClass().getMethod("C").invoke(dialog);
      return;
    } catch (ReflectiveOperationException | RuntimeException ignored) {
      // A drifted native dialog must not silently enable recall retention.
    }
    new AlertDialog.Builder(context)
        .setTitle(title)
        .setMessage(message)
        .setNegativeButton(negative, null)
        .setPositiveButton(positive, (dialog, which) -> acceptOnce.run())
        .show();
  }
}
