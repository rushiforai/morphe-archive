/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.twitter.patches.links;

import static app.morphe.extension.shared.StringRef.str;

import app.morphe.extension.twitter.Pref;
import app.morphe.extension.rex.RexUtils;

import app.morphe.extension.twitter.entity.Tweet;

public class ExternalDownloader {

    public static void sendToExternalDownloader(Object tweetObject){
        try {
            String packageName = Pref.getExternalDownloaderPackageName();
            packageName = packageName == null ? "" : packageName.trim();
            if(packageName.isEmpty()){
                RexUtils.toast(str("rex_pref_external_downloader_package_not_set"));
                return;
            }
            if(!RexUtils.isAppInstalledAndEnabled(packageName)){
                RexUtils.toast(str("rex_pref_external_downloader_package_not_found"));
                return;
            }

            Tweet tweet = new Tweet(tweetObject);
            String link = tweet.getTweetLink();
            RexUtils.shareTextToPackageName(link,packageName);

        } catch (java.lang.Exception e) {
            RexUtils.logger(e);
        }
    }
}
