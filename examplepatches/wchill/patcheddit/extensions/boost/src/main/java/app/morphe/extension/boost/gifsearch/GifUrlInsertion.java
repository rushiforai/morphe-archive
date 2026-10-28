/*
 * Copyright 2026 brealorg.
 * Adapted from https://github.com/brealorg/breal-morphe-patches (82d70f7).
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

package app.morphe.extension.boost.gifsearch;

import android.app.AlertDialog;
import android.content.Context;
import android.text.InputType;
import android.util.Log;
import android.view.View;
import android.widget.EditText;

import app.morphe.extension.boost.media.MediaNativeBindings;

public final class GifUrlInsertion {
    private static final String LOG_TAG = "MorpheGifInsertion";
    private static final int ATTACH_CAMERA_ID = 0x7f0a00f4;
    private static final int ATTACH_GALLERY_ID = 0x7f0a00f5;
    private static final int INSERT_GIF_URL_ID = 0x7f0a0273;

    private GifUrlInsertion() {
    }

    public static void handleImageMenuOption(Object formattingBar, Object menuOption) {
        int id = readMenuOptionId(menuOption);

        if (id == INSERT_GIF_URL_ID) {
            open(formattingBar);
            return;
        }

        if (id == ATTACH_CAMERA_ID) {
            callOriginalImageListener(formattingBar, true);
            return;
        }

        if (id == ATTACH_GALLERY_ID) {
            callOriginalImageListener(formattingBar, false);
        }
    }

    private static int readMenuOptionId(Object menuOption) {
        try {
            return MediaNativeBindings.imageMenuOptionId(menuOption);
        } catch (Throwable throwable) {
            Log.w(LOG_TAG, "Unable to read image menu option", throwable);
            return -1;
        }
    }

    private static void callOriginalImageListener(Object formattingBar, boolean camera) {
        try {
            if (camera) {
                MediaNativeBindings.attachCamera(formattingBar);
            } else {
                MediaNativeBindings.attachGallery(formattingBar);
            }
        } catch (Throwable throwable) {
            Log.w(LOG_TAG, "Unable to attach image", throwable);
        }
    }

    public static void open(Object formattingBar) {
        if (!(formattingBar instanceof View)) {
            return;
        }

        Context context = ((View) formattingBar).getContext();
        if (context == null) {
            return;
        }

        EditText input = new EditText(context);
        input.setSingleLine(true);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_URI);
        input.setHint("https://media.giphy.com/media/.../giphy.gif");

        new AlertDialog.Builder(context)
                .setTitle("Insert GIF URL")
                .setView(input)
                .setPositiveButton(android.R.string.ok, (dialog, which) -> {
                    String url = input.getText() == null ? "" : input.getText().toString().trim();
                    if (!url.isEmpty()) {
                        insertRawUrl(formattingBar, url);
                    }
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    private static void insertRawUrl(Object formattingBar, String url) {
        try {
            MediaNativeBindings.insertRawUrl(formattingBar, url);
        } catch (Throwable throwable) {
            Log.w(LOG_TAG, "Unable to insert GIF URL", throwable);
        }
    }
}
