/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.settings.preference.widgets;

import static app.morphe.extension.instagram.utils.IgStr.str;

import android.app.AlertDialog;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.OvershootInterpolator;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.morphe.extension.instagram.patches.feed.ChangeLikeAnimationPatch;
import app.morphe.extension.instagram.settings.Settings;
import app.morphe.extension.instagram.settings.preference.Helper;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

public final class LikeAnimationPreference extends ListPref {
    private int selectedIndex;
    private ImageView preview;
    private TextView previewStyleBadge;
    private TextView unavailablePreview;
    private Drawable animation;
    private AnimatorSet defaultAnimation;
    private final Runnable playPreview = this::playPreview;

    private static final int[] RING_PALETTE = {
            0xFFFF3040, 0xFF23C6D8, 0xFF35CDBB, 0xFFFFB800,
            0xFFA855F7, 0xFFEC4899, 0xFF3B82F6, 0xFF10B981
    };

    public LikeAnimationPreference(Context context) {
        super(context);
        Helper helper = new Helper(context);
        setOnPreferenceChangeListener(helper::setValue);
    }

    @Override
    protected void onPrepareDialogBuilder(AlertDialog.Builder builder) {
        selectedIndex = findIndexOfValue(getValue());
        if (selectedIndex < 0) selectedIndex = 0;

        Context context = getContext();
        int padding = InstagramPreferenceStyle.dp(context, 18);
        LinearLayout header = new LinearLayout(context);
        header.setOrientation(LinearLayout.VERTICAL);
        header.setPadding(padding, padding, padding, InstagramPreferenceStyle.dp(context, 8));

        TextView title = new TextView(context);
        title.setText(getDialogTitle());
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 19.5f);
        title.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        title.setTextColor(InstagramPreferenceStyle.primaryTextColor());
        header.addView(title);

        FrameLayout stageCard = new FrameLayout(context);
        GradientDrawable stageBg = new GradientDrawable();
        stageBg.setColor(InstagramPreferenceStyle.elevatedSurfaceColor());
        stageBg.setCornerRadius(InstagramPreferenceStyle.dp(context, 18));
        stageBg.setStroke(Math.max(1, InstagramPreferenceStyle.dp(context, 1)), InstagramPreferenceStyle.borderStrokeColor());
        stageCard.setBackground(stageBg);

        preview = new ImageView(context);
        preview.setScaleType(ImageView.ScaleType.FIT_CENTER);
        preview.setContentDescription(str("rex_like_animation_preview"));
        int stagePad = InstagramPreferenceStyle.dp(context, 14);
        preview.setPadding(stagePad, stagePad, stagePad, InstagramPreferenceStyle.dp(context, 28));
        stageCard.addView(preview, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, InstagramPreferenceStyle.dp(context, 112), Gravity.CENTER));

        previewStyleBadge = new TextView(context);
        previewStyleBadge.setTextColor(InstagramPreferenceStyle.accentColor());
        previewStyleBadge.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
        previewStyleBadge.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        previewStyleBadge.setGravity(Gravity.CENTER);
        FrameLayout.LayoutParams badgeLp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL);
        badgeLp.bottomMargin = InstagramPreferenceStyle.dp(context, 8);
        stageCard.addView(previewStyleBadge, badgeLp);

        unavailablePreview = new TextView(context);
        unavailablePreview.setText(str("rex_like_animation_preview_unavailable"));
        unavailablePreview.setTextColor(InstagramPreferenceStyle.secondaryTextColor());
        unavailablePreview.setGravity(Gravity.CENTER);
        unavailablePreview.setVisibility(View.GONE);
        stageCard.addView(unavailablePreview, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, InstagramPreferenceStyle.dp(context, 112)));

        LinearLayout.LayoutParams stageLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        stageLp.topMargin = InstagramPreferenceStyle.dp(context, 10);
        header.addView(stageCard, stageLp);

        builder.setCustomTitle(header);
        builder.setSingleChoiceItems(getEntries(), selectedIndex, (dialog, index) -> {
            selectedIndex = index;
            playPreview();
        });
        builder.setPositiveButton(android.R.string.ok, this);
        builder.setNegativeButton(android.R.string.cancel, this);
    }

    @Override
    protected void showDialog(Bundle state) {
        super.showDialog(state);
        selectedIndex = ((AlertDialog) getDialog()).getListView().getCheckedItemPosition();
        if (selectedIndex < 0) selectedIndex = 0;
        preview.post(playPreview);
    }

    private void playPreview() {
        if (preview == null) return;
        stopPreview();
        preview.setContentDescription(str("rex_like_animation_preview"));
        CharSequence[] entries = getEntries();
        CharSequence[] entryValues = getEntryValues();
        if (entryValues == null || selectedIndex < 0 || selectedIndex >= entryValues.length) return;

        String selection = entryValues[selectedIndex].toString();
        String label = (entries != null && selectedIndex < entries.length)
                ? entries[selectedIndex].toString() : selection;
        if (previewStyleBadge != null) {
            previewStyleBadge.setText("Preview: " + label);
        }

        try {
            String name = ChangeLikeAnimationPatch.previewAnimation(selection);
            if (Settings.CHANGE_LIKE_ANIMATION.defaultValue.equals(name)) {
                playDefaultPreview(selection);
                return;
            }
            animation = ChangeLikeAnimationPatch.previewDrawable(getContext(), name);
            if (animation != null) {
                preview.setImageDrawable(animation);
                ChangeLikeAnimationPatch.startPreview(animation);
                return;
            }
            playStylizedFallbackPreview(name);
        } catch (Exception | LinkageError exception) {
            playStylizedFallbackPreview(selection);
            Logger.printException(() -> "Could not preview native like animation", exception);
        }
    }

    private void playDefaultPreview(String selection) {
        Context instagramContext = Utils.getActivity();
        Drawable heart = instagramContext == null ? null
                : ChangeLikeAnimationPatch.defaultPreviewDrawable(instagramContext);
        if (heart == null) {
            playStylizedFallbackPreview(selection);
            return;
        }
        preview.setImageDrawable(heart);
        runSpringHeartAnimation();
    }

    private void playStylizedFallbackPreview(String styleKey) {
        Context ctx = getContext();
        int idx = Math.abs(styleKey == null ? 0 : styleKey.hashCode()) % RING_PALETTE.length;
        int ringColor = Settings.CHANGE_LIKE_ANIMATION.defaultValue.equals(styleKey)
                ? 0xFFFF3040 : RING_PALETTE[idx];

        GradientDrawable halo = new GradientDrawable();
        halo.setShape(GradientDrawable.OVAL);
        halo.setColor(Color.argb(42, Color.red(ringColor), Color.green(ringColor), Color.blue(ringColor)));
        halo.setStroke(InstagramPreferenceStyle.dp(ctx, 2), ringColor);
        int size = InstagramPreferenceStyle.dp(ctx, 64);
        halo.setSize(size, size);

        Drawable heart = RexIcon.getDrawable(ctx, "heart-spark", ringColor, 36, true);
        if (heart == null) {
            heart = RexIcon.getDrawable(ctx, "heart", ringColor, 36, true);
        }
        if (heart != null) {
            int inset = InstagramPreferenceStyle.dp(ctx, 14);
            LayerDrawable layered = new LayerDrawable(new Drawable[]{halo, heart});
            layered.setLayerInset(1, inset, inset, inset, inset);
            preview.setImageDrawable(layered);
        } else {
            preview.setImageDrawable(halo);
        }
        runSpringHeartAnimation();
    }

    private void runSpringHeartAnimation() {
        AnimatorSet appear = new AnimatorSet();
        appear.playTogether(
                ObjectAnimator.ofFloat(preview, View.SCALE_X, 0.25f, 1.12f, 1.0f),
                ObjectAnimator.ofFloat(preview, View.SCALE_Y, 0.25f, 1.12f, 1.0f),
                ObjectAnimator.ofFloat(preview, View.ROTATION, -10f, 6f, 0f),
                ObjectAnimator.ofFloat(preview, View.ALPHA, 0f, 1f));
        appear.setDuration(420);
        appear.setInterpolator(new OvershootInterpolator(1.8f));
        defaultAnimation = appear;
        defaultAnimation.start();
    }

    private void stopPreview() {
        if (defaultAnimation != null) {
            defaultAnimation.cancel();
            defaultAnimation = null;
        }
        if (animation != null) {
            try {
                ChangeLikeAnimationPatch.stopPreview(animation);
                animation.setVisible(false, false);
            } catch (Exception | LinkageError exception) {
                Logger.printException(() -> "Could not stop like animation preview", exception);
            }
            animation = null;
        }
        if (preview != null) {
            preview.setVisibility(View.VISIBLE);
            if (unavailablePreview != null) unavailablePreview.setVisibility(View.GONE);
            preview.removeCallbacks(playPreview);
            preview.setImageDrawable(null);
            preview.clearColorFilter();
            preview.setAlpha(1f);
            preview.setScaleX(1f);
            preview.setScaleY(1f);
            preview.setRotation(0f);
        }
    }

    private void showUnavailablePreview() {
        playStylizedFallbackPreview("DEFAULT");
    }

    @Override
    protected void onDialogClosed(boolean positiveResult) {
        super.onDialogClosed(false);
        stopPreview();
        preview = null;
        previewStyleBadge = null;
        unavailablePreview = null;
        if (positiveResult) {
            String value = getEntryValues()[selectedIndex].toString();
            if (callChangeListener(value)) {
                setValue(value);
                ChangeLikeAnimationPatch.onSelectionChanged(value);
            }
        }
    }
}
