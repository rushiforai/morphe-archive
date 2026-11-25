package dev.jason.gboardpatches.extension.clipboard;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * Injects a native-styled "Clear all unpinned" trash button into Gboard's Clipboard header.
 * Deletes strictly unpinned items (item_type = 0), preserving all pinned items (item_type = 1).
 */
final class GboardClipboardClearAllButton {
    static final String BUTTON_TAG = "gboard_patches_clipboard_clear_all_btn";
    private static final int BUTTON_SIZE_DP = 40;
    private static final int ICON_PADDING_DP = 9;

    private GboardClipboardClearAllButton() {
    }

    static void sync(
            View recycler,
            Context context,
            boolean enabled,
            GboardClipboardRuntimeSupport support) {
        if (recycler == null || context == null || support == null) {
            return;
        }
        try {
            ViewGroup root = findClipboardRoot(recycler);
            if (root == null) {
                return;
            }
            View existing = findTaggedView(root, BUTTON_TAG);
            if (!enabled) {
                if (existing != null && existing.getParent() instanceof ViewGroup parent) {
                    parent.removeView(existing);
                }
                return;
            }
            ViewGroup headerContainer = findHeaderButtonContainer(root, recycler);
            if (headerContainer == null) {
                return;
            }
            int iconColor = resolveHeaderIconColor(headerContainer, context);
            if (existing instanceof ImageButton button) {
                if (button.getDrawable() instanceof TrashIconDrawable icon) {
                    icon.setColor(iconColor);
                    button.invalidate();
                }
                if (button.getParent() != headerContainer) {
                    if (button.getParent() instanceof ViewGroup oldParent) {
                        oldParent.removeView(button);
                    }
                    attachButton(headerContainer, button);
                }
                button.setOnClickListener(v -> clearUnpinnedItems(context, recycler, support));
                return;
            }
            ImageButton button = createButton(context, iconColor,
                    () -> clearUnpinnedItems(context, recycler, support));
            attachButton(headerContainer, button);
        } catch (Throwable ignored) {
            // Never disrupt Gboard's stock clipboard layout.
        }
    }

    static void clearUnpinnedItems(
            Context context,
            View recycler,
            GboardClipboardRuntimeSupport support) {
        if (context == null || support == null) {
            return;
        }
        support.runSafely("clear unpinned clipboard items", () -> {
            ClassLoader classLoader = recycler != null
                    ? recycler.getClass().getClassLoader()
                    : context.getClassLoader();
            GboardClipboardRuntimeSupport.ReflectionHandles handles =
                    support.reflectionHandles(classLoader);
            Uri clipboardUri = support.createClipboardUri(handles, context);
            if (clipboardUri == null) {
                return;
            }
            List<Long> unpinnedIds = queryUnpinnedIds(context, clipboardUri, support);
            if (unpinnedIds.isEmpty()) {
                showToast(context, isRussian(context)
                        ? "Нет незакреплённых записей"
                        : "No unpinned items to clear");
                return;
            }
            handles.deleteClipsMethod.invoke(null, context, unpinnedIds);
            refreshRecyclerAdapter(recycler, handles);
            int count = unpinnedIds.size();
            showToast(context, isRussian(context)
                    ? "Очищено записей: " + count
                    : "Cleared " + count + " unpinned item" + (count == 1 ? "" : "s"));
        });
    }

    static List<Long> queryUnpinnedIds(
            Context context,
            Uri clipboardUri,
            GboardClipboardRuntimeSupport support) {
        List<Long> ids = new ArrayList<>();
        Cursor cursor = null;
        try {
            cursor = support.queryCursor(
                    context,
                    clipboardUri,
                    new String[] { "_id" },
                    "item_type = ?",
                    new String[] { "0" },
                    null);
            if (cursor != null && !cursor.isClosed()) {
                int idColumn = cursor.getColumnIndex("_id");
                if (idColumn >= 0 && cursor.moveToFirst()) {
                    do {
                        ids.add(cursor.getLong(idColumn));
                    } while (cursor.moveToNext());
                }
            }
        } finally {
            support.closeQuietly(cursor);
        }
        return ids;
    }

    private static void refreshRecyclerAdapter(
            View recycler,
            GboardClipboardRuntimeSupport.ReflectionHandles handles) {
        if (recycler == null || handles == null) {
            return;
        }
        try {
            Method getAdapter = recycler.getClass().getMethod("getAdapter");
            Object adapter = getAdapter.invoke(recycler);
            if (adapter != null && handles.adapterRefreshMethod.getDeclaringClass().isInstance(adapter)) {
                handles.adapterRefreshMethod.invoke(adapter);
            }
        } catch (Throwable ignored) {
            // Best-effort immediate UI refresh; ContentObserver also updates stock list.
        }
    }

    private static ImageButton createButton(Context context, int iconColor, Runnable onClick) {
        ImageButton button = new ImageButton(context);
        button.setTag(BUTTON_TAG);
        button.setContentDescription(isRussian(context)
                ? "Очистить незакреплённые записи"
                : "Clear unpinned clipboard items");
        button.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        int padPx = dpToPx(context, ICON_PADDING_DP);
        button.setPadding(padPx, padPx, padPx, padPx);

        TypedValue outValue = new TypedValue();
        if (context.getTheme() != null && context.getTheme().resolveAttribute(
                android.R.attr.selectableItemBackgroundBorderless, outValue, true)) {
            button.setBackgroundResource(outValue.resourceId);
        } else {
            button.setBackgroundColor(Color.TRANSPARENT);
        }

        button.setImageDrawable(new TrashIconDrawable(iconColor));
        button.setOnClickListener(v -> onClick.run());
        return button;
    }

    private static void attachButton(ViewGroup headerContainer, ImageButton button) {
        int sizePx = dpToPx(headerContainer.getContext(), BUTTON_SIZE_DP);
        ViewGroup.LayoutParams params;
        if (headerContainer instanceof LinearLayout) {
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(sizePx, sizePx);
            lp.gravity = Gravity.CENTER_VERTICAL;
            params = lp;
        } else {
            params = new ViewGroup.LayoutParams(sizePx, sizePx);
        }
        int insertIndex = Math.max(0, headerContainer.getChildCount() - 1);
        headerContainer.addView(button, insertIndex, params);
    }

    private static ViewGroup findClipboardRoot(View recycler) {
        View current = recycler;
        ViewGroup topCandidate = null;
        for (int depth = 0; depth < 8 && current != null; depth++) {
            if (current.getParent() instanceof ViewGroup parent) {
                topCandidate = parent;
                Object tag = parent.getTag();
                if (tag instanceof String s && s.contains("keyboard-base-area")) {
                    return parent;
                }
                current = parent;
            } else {
                break;
            }
        }
        return topCandidate;
    }

    private static ViewGroup findHeaderButtonContainer(ViewGroup root, View recycler) {
        View named = findViewByResourceNameHint(root, "clipboard_header", "header_buttons", "edit_button");
        if (named instanceof ViewGroup vg && !containsView(vg, recycler)) {
            return vg;
        }
        if (named != null && named.getParent() instanceof ViewGroup parent && !containsView(parent, recycler)) {
            return parent;
        }
        return findHorizontalHeaderGroup(root, recycler);
    }

    private static View findViewByResourceNameHint(View view, String... hints) {
        if (view == null) {
            return null;
        }
        int id = view.getId();
        if (id != View.NO_ID && id != 0) {
            try {
                String entryName = view.getResources().getResourceEntryName(id);
                if (entryName != null) {
                    String lower = entryName.toLowerCase(Locale.US);
                    for (String hint : hints) {
                        if (lower.contains(hint)) {
                            return view;
                        }
                    }
                }
            } catch (Resources.NotFoundException ignored) {
                // Ignore dynamic IDs.
            }
        }
        if (view instanceof ViewGroup group) {
            for (int i = 0; i < group.getChildCount(); i++) {
                View match = findViewByResourceNameHint(group.getChildAt(i), hints);
                if (match != null) {
                    return match;
                }
            }
        }
        return null;
    }

    private static ViewGroup findHorizontalHeaderGroup(View view, View recycler) {
        if (!(view instanceof ViewGroup group) || containsView(group, recycler)) {
            if (view instanceof ViewGroup parent) {
                for (int i = 0; i < parent.getChildCount(); i++) {
                    ViewGroup match = findHorizontalHeaderGroup(parent.getChildAt(i), recycler);
                    if (match != null) {
                        return match;
                    }
                }
            }
            return null;
        }
        if (group instanceof LinearLayout linear
                && linear.getOrientation() == LinearLayout.HORIZONTAL
                && linear.getChildCount() >= 2
                && linear.getVisibility() == View.VISIBLE) {
            int clickableChildren = 0;
            for (int i = 0; i < linear.getChildCount(); i++) {
                View child = linear.getChildAt(i);
                if (child.getVisibility() == View.VISIBLE && child.isClickable()) {
                    clickableChildren++;
                }
            }
            if (clickableChildren >= 2) {
                return linear;
            }
        }
        for (int i = 0; i < group.getChildCount(); i++) {
            ViewGroup match = findHorizontalHeaderGroup(group.getChildAt(i), recycler);
            if (match != null) {
                return match;
            }
        }
        return null;
    }

    private static boolean containsView(ViewGroup container, View target) {
        if (container == null || target == null) {
            return false;
        }
        View current = target;
        while (current != null) {
            if (current == container) {
                return true;
            }
            if (current.getParent() instanceof View parent) {
                current = parent;
            } else {
                break;
            }
        }
        return false;
    }

    private static View findTaggedView(View view, String tag) {
        if (view == null) {
            return null;
        }
        if (tag.equals(view.getTag())) {
            return view;
        }
        if (view instanceof ViewGroup group) {
            for (int i = 0; i < group.getChildCount(); i++) {
                View match = findTaggedView(group.getChildAt(i), tag);
                if (match != null) {
                    return match;
                }
            }
        }
        return null;
    }

    private static int resolveHeaderIconColor(ViewGroup headerContainer, Context context) {
        for (int i = 0; i < headerContainer.getChildCount(); i++) {
            View child = headerContainer.getChildAt(i);
            if (BUTTON_TAG.equals(child.getTag())) {
                continue;
            }
            if (child instanceof ImageView imageView) {
                ColorStateList tint = imageView.getImageTintList();
                if (tint != null) {
                    return tint.getDefaultColor();
                }
            }
            if (child instanceof TextView textView) {
                return textView.getCurrentTextColor();
            }
        }
        int uiMode = context.getResources().getConfiguration().uiMode
                & android.content.res.Configuration.UI_MODE_NIGHT_MASK;
        return uiMode == android.content.res.Configuration.UI_MODE_NIGHT_YES
                ? 0xFFE3E3E3
                : 0xFF444746;
    }

    private static int dpToPx(Context context, int dp) {
        float density = context.getResources().getDisplayMetrics().density;
        return Math.max(1, Math.round(dp * density));
    }

    private static boolean isRussian(Context context) {
        Locale locale = context.getResources().getConfiguration().getLocales().isEmpty()
                ? Locale.getDefault()
                : context.getResources().getConfiguration().getLocales().get(0);
        return locale != null && "ru".equalsIgnoreCase(locale.getLanguage());
    }

    private static void showToast(Context context, String message) {
        try {
            Toast.makeText(context.getApplicationContext(), message, Toast.LENGTH_SHORT).show();
        } catch (Throwable ignored) {
            // Toast is best-effort feedback.
        }
    }

    static final class TrashIconDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path lidPath = new Path();
        private final Path bodyPath = new Path();

        TrashIconDrawable(int color) {
            paint.setColor(color);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
        }

        void setColor(int color) {
            paint.setColor(color);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.isEmpty()) {
                return;
            }
            float w = b.width();
            float h = b.height();
            float s = Math.min(w, h);
            float ox = b.left + (w - s) * 0.5f;
            float oy = b.top + (h - s) * 0.5f;
            paint.setStrokeWidth(Math.max(1.5f, s * 0.085f));

            lidPath.reset();
            lidPath.moveTo(ox + s * 0.18f, oy + s * 0.25f);
            lidPath.lineTo(ox + s * 0.82f, oy + s * 0.25f);
            lidPath.moveTo(ox + s * 0.37f, oy + s * 0.25f);
            lidPath.lineTo(ox + s * 0.41f, oy + s * 0.14f);
            lidPath.lineTo(ox + s * 0.59f, oy + s * 0.14f);
            lidPath.lineTo(ox + s * 0.63f, oy + s * 0.25f);
            canvas.drawPath(lidPath, paint);

            bodyPath.reset();
            bodyPath.moveTo(ox + s * 0.26f, oy + s * 0.25f);
            bodyPath.lineTo(ox + s * 0.31f, oy + s * 0.84f);
            bodyPath.lineTo(ox + s * 0.69f, oy + s * 0.84f);
            bodyPath.lineTo(ox + s * 0.74f, oy + s * 0.25f);
            canvas.drawPath(bodyPath, paint);

            canvas.drawLine(ox + s * 0.43f, oy + s * 0.40f, ox + s * 0.44f, oy + s * 0.70f, paint);
            canvas.drawLine(ox + s * 0.57f, oy + s * 0.40f, ox + s * 0.56f, oy + s * 0.70f, paint);
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
        }

        @Override
        @SuppressWarnings("deprecation")
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
