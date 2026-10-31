/*
 * Copyright 2026 wchill.
 * https://github.com/wchill/patcheddit
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.morphe.extension.boost.utils;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;

import java.util.List;

import com.rubenmayayo.reddit.ui.customviews.menu.MenuOption;

import app.morphe.extension.shared.ResourceUtils;

/**
 * @noinspection unused
 */
public class SettingsUtils {
    public static void openArchiveLink(Context context, String url, String archivePrefix) {
        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(archivePrefix + url));
        if (!(context instanceof Activity)) {
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        }
        context.startActivity(intent);
    }

    public static void addMenuOptions(List<MenuOption> options) {
        MenuOption divider = new MenuOption();
        divider.divider = true;
        options.add(divider);

        int drawableId = ResourceUtils.getDrawableIdentifier("ic_library_24dp");
        MenuOption wayback = new MenuOption();
        wayback.id = 101;
        wayback.title = "Open with Wayback Machine";
        wayback.iconResource = drawableId;
        options.add(wayback);

        MenuOption archive = new MenuOption();
        archive.id = 102;
        archive.title = "Open with Archive.is";
        archive.iconResource = drawableId;
        options.add(archive);
    }
}
