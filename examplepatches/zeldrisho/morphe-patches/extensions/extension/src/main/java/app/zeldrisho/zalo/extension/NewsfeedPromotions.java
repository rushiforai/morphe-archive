package app.zeldrisho.zalo.extension;

import android.view.View;
import android.view.ViewGroup;
import java.util.Map;
import java.util.WeakHashMap;

/** Suppresses only the pinned ad and suggested-video holder types before their bind/load work. */
public final class NewsfeedPromotions {
  private static final Map<View, State> HIDDEN = new WeakHashMap<>();

  private NewsfeedPromotions() {}

  private static final class State {
    final int height;
    final int visibility;

    State(View view, ViewGroup.LayoutParams layout) {
      height = layout.height;
      visibility = view.getVisibility();
    }
  }

  /**
   * Hides a promotional holder's view and returns true so its native bind can be skipped.
   * For a non-promotional holder, restores any previously saved height and visibility and returns
   * false. Missing views, layouts, or reflection/runtime failures also return false.
   * Runs on the RecyclerView binding thread without changing feed data or pagination cursors.
   */
  public static boolean hide(Object holder) {
    if (holder == null) return false;
    try {
      Class<?> cls = holder.getClass();
      // Always active when the patch is included; ignore obsolete switch preferences.
      boolean promotional = cls.getField("E1").get(holder) != null
          || cls.getField("D1").get(holder) != null;
      View view = (View) cls.getField("a").get(holder);
      if (view == null) return false;
      ViewGroup.LayoutParams layout = view.getLayoutParams();
      if (layout == null) return false;
      if (promotional) {
        if (!HIDDEN.containsKey(view)) HIDDEN.put(view, new State(view, layout));
        layout.height = 0;
        view.setLayoutParams(layout);
        view.setVisibility(View.GONE);
        return true;
      }
      State saved = HIDDEN.remove(view);
      if (saved != null) {
        layout.height = saved.height;
        view.setLayoutParams(layout);
        view.setVisibility(saved.visibility);
      }
    } catch (ReflectiveOperationException | RuntimeException ignored) {
      // Unknown host holders retain their normal content and binding.
    }
    return false;
  }
}
