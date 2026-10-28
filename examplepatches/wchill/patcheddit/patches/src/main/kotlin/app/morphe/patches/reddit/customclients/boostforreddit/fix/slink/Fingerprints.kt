package app.morphe.patches.reddit.customclients.boostforreddit.fix.slink

import app.morphe.patches.reddit.customclients.boostforreddit.bindings.BoostApi

import com.android.tools.smali.dexlib2.AccessFlags

internal val GetOAuthAccessTokenFingerprint = BoostApi.OAuthData.getAccessToken.fingerprint(
    strings = listOf("access_token"),
    accessFlags = listOf(AccessFlags.PUBLIC),
)

internal val HandleNavigationFingerprint = BoostApi.Navigation.handleNavigation.fingerprint(
    strings = listOf(
        "android.intent.action.SEARCH",
        "subscription",
        "sort",
        "period",
        "boostforreddit.com/themes",
    ),
)