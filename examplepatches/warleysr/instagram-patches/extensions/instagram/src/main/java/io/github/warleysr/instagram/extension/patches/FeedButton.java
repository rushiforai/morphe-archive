package io.github.warleysr.instagram.extension.patches;

import android.util.Log;

import java.lang.reflect.Method;
import java.util.ArrayList;

import io.github.warleysr.instagram.extension.utils.AppContext;

import com.instagram.feed.media.mediaoption.MediaOption$Option;

@SuppressWarnings({"rawtypes", "unchecked"})
public class FeedButton {
    private static final String TAG = "CarouselAutoScroll";

    public static MediaOption$Option carouselAutoScrollOverflowButton() {
        int drawableIconId = AppContext.getIdentifier("drawable", "instagram_slideshow_pano_outline_24");
        return new MediaOption$Option("CAROUSEL_AUTO_SCROLL", 504, drawableIconId);
    }

    public static MediaOption$Option[] appendOptionToArray(MediaOption$Option[] originalArray) {
        if (originalArray == null) {
            try {
                originalArray = MediaOption$Option.$values();
            } catch (Throwable ignored) {
            }
        }
        if (originalArray == null) {
            return new MediaOption$Option[]{MediaOption$Option.CAROUSEL_AUTO_SCROLL};
        }
        for (MediaOption$Option opt : originalArray) {
            if (opt != null && ("CAROUSEL_AUTO_SCROLL".equals(opt.toString()) || opt == MediaOption$Option.CAROUSEL_AUTO_SCROLL)) {
                return originalArray;
            }
        }
        int originalLength = originalArray.length;
        MediaOption$Option[] newButtonArray = new MediaOption$Option[originalLength + 1];
        System.arraycopy(originalArray, 0, newButtonArray, 0, originalLength);
        newButtonArray[originalLength] = MediaOption$Option.CAROUSEL_AUTO_SCROLL;
        return newButtonArray;
    }

    public static MediaOption$Option[] addToMenuOptionArray() {
        return appendOptionToArray(null);
    }

    private static Class<?> getEnumButtonClass() throws Exception {
        return Class.forName("X.6zl");
    }

    private static Object enumNormalButton() throws Exception {
        return getEnumButtonClass().getMethod("valueOf", String.class).invoke(null, "NORMAL");
    }

    private static void addButton(MediaOption$Option overflowButton, String overflowButtonText, Object buttonAdderObject, ArrayList buttonlist) throws Exception {
        Class<?> clazz = buttonAdderObject.getClass();
        Method method = clazz.getDeclaredMethod(
                "A00",
                getEnumButtonClass(),
                MediaOption$Option.class,
                clazz,
                CharSequence.class,
                ArrayList.class,
                boolean.class
        );
        method.setAccessible(true);
        method.invoke(null, enumNormalButton(), overflowButton, buttonAdderObject, overflowButtonText, buttonlist, false);
    }

    public static void addFeedOverflowButton(Object buttonAdderObject, ArrayList buttonlist) {
        try {
            Log.d(TAG, "addFeedOverflowButton called, list size=" + (buttonlist != null ? buttonlist.size() : "null"));
            addButton(MediaOption$Option.CAROUSEL_AUTO_SCROLL, CarouselAutoScrollPatch.menuTitle(), buttonAdderObject, buttonlist);
            Log.d(TAG, "addFeedOverflowButton success");
        } catch (Exception e) {
            Log.e(TAG, "Error in addFeedOverflowButton", e);
        }
    }

    public static boolean onButtonClicked(MediaOption$Option pressedButton) {
        Log.i(TAG, "onButtonClicked called with: " + pressedButton);
        if (pressedButton != null && "CAROUSEL_AUTO_SCROLL".equals(pressedButton.toString())) {
            Log.i(TAG, "Matching button string CAROUSEL_AUTO_SCROLL, calling toggle()");
            CarouselAutoScrollPatch.toggle();
            return true;
        }
        if (MediaOption$Option.CAROUSEL_AUTO_SCROLL.equals(pressedButton)) {
            Log.i(TAG, "Matching button enum CAROUSEL_AUTO_SCROLL, calling toggle()");
            CarouselAutoScrollPatch.toggle();
            return true;
        }
        return false;
    }
}
