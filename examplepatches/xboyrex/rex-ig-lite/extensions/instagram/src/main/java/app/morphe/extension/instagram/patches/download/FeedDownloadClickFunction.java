/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.download;

import android.content.Context;

import com.instagram.common.session.UserSession;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;

public final class FeedDownloadClickFunction implements Function1<Object, Object> {
    private final Context context;
    private final UserSession userSession;
    private final Object mediaSource;
    private final boolean optionsMode;

    public FeedDownloadClickFunction(Context context, UserSession userSession, Object mediaSource) {
        this(context, userSession, mediaSource, false);
    }

    public FeedDownloadClickFunction(Context context, UserSession userSession, Object mediaSource, boolean optionsMode) {
        this.context = context;
        this.userSession = userSession;
        this.mediaSource = mediaSource;
        this.optionsMode = optionsMode;
    }

    @Override
    public Object invoke(Object clickEvent) {
        if (optionsMode) {
            DownloadUtils.openPostOptionsFromState(context, userSession, mediaSource);
        } else {
            DownloadUtils.downloadPost(
                    context,
                    userSession,
                    DownloadUtils.extractMedia(mediaSource),
                    DownloadUtils.currentMediaIndex(mediaSource));
        }
        return Unit.INSTANCE;
    }

    public Function1<Object, Boolean> longClick() {
        return event -> {
            if (optionsMode) {
                return DownloadUtils.openFeedQuickSettingsFromState(context);
            }
            return DownloadUtils.onPostDownloadLongClick(context, userSession,
                    DownloadUtils.extractMedia(mediaSource), DownloadUtils.currentMediaIndex(mediaSource));
        };
    }
}
