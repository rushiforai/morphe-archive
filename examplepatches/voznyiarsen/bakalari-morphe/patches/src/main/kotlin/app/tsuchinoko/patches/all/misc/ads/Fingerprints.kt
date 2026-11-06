/*
 * Copyright (C) 2026 tsuchinoko <https://github.com/voznyiarsen/bakalari-morphe>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.tsuchinoko.patches.all.misc.ads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Fingerprint for va/e0.shouldOverrideUrlLoading - webview_flutter's WebViewClient
 * used by the main Flutter WebView.
 */
internal object VaE0Fingerprint : Fingerprint(
    definingClass = "Lva/e0;",
    name = "shouldOverrideUrlLoading",
    returnType = "Z",
    parameters = listOf(
        "Landroid/webkit/WebView;",
        "Landroid/webkit/WebResourceRequest;"
    ),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

/**
 * Fingerprint for ra/h.shouldOverrideUrlLoading - WebViewActivity's WebViewClient.
 */
internal object RhFingerprint : Fingerprint(
    definingClass = "Lra/h;",
    name = "shouldOverrideUrlLoading",
    returnType = "Z",
    parameters = listOf(
        "Landroid/webkit/WebView;",
        "Landroid/webkit/WebResourceRequest;"
    ),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

/**
 * Fingerprint for ra/i.shouldOverrideUrlLoading - WebViewActivity's delegate WebViewClient.
 */
internal object RiFingerprint : Fingerprint(
    definingClass = "Lra/i;",
    name = "shouldOverrideUrlLoading",
    returnType = "Z",
    parameters = listOf(
        "Landroid/webkit/WebView;",
        "Landroid/webkit/WebResourceRequest;"
    ),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

/**
 * Fingerprint for va/X.shouldOverrideUrlLoading - delegate WebViewClient.
 */
internal object VaXFingerprint : Fingerprint(
    definingClass = "Lva/X;",
    name = "shouldOverrideUrlLoading",
    returnType = "Z",
    parameters = listOf(
        "Landroid/webkit/WebView;",
        "Landroid/webkit/WebResourceRequest;"
    ),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)
