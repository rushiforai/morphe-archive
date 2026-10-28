/*
 * Copyright 2026 wchill.
 * https://github.com/wchill/patcheddit
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.morphe.extension.boost.utils;

import com.rubenmayayo.androidsnudown.Snudown;

public class MarkdownRenderer {
    public static String render(String text) {
        return Snudown.markdown(text.replace("<", "&amp;lt;")) + "&nbsp;";
    }
}
