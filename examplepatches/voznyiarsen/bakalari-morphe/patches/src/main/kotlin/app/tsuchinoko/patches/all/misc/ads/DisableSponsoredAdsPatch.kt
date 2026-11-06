/*
 * Copyright (C) 2026 tsuchinoko <https://github.com/voznyiarsen/bakalari-morphe>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.tsuchinoko.patches.all.misc.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.tsuchinoko.patches.all.misc.ads.Constants.COMPATIBILITY_BAKALARI

/**
 * Disables sponsored ad pop-ups by blocking ad-serving CDN URLs at the WebView level.
 *
 * The Flutter app uses webview_flutter which includes multiple WebViewClient
 * implementations (va/e0, ra/h, ra/i, va/X). Every WebView navigation goes through
 * [shouldOverrideUrlLoading], where the URL can be extracted from the
 * [WebResourceRequest] parameter and checked against ad domains. On match, the patch
 * returns `true` (handled, not loaded), preventing the ad from being displayed.
 *
 * The patch targets the CDN URLs directly, making it app-version agnostic:
 * these are stable backend infrastructure endpoints that do not change between
 * app releases.
 *
 * Blocked domains:
 * - campaign.bakalari.cz, campaign-dev.bakalari.cz (sponsored ad banners)
 * - netglade.cz (ad network)
 */
@Suppress("unused")
val disableSponsoredAdsPatchVaE0 =
    bytecodePatch(
        name = "Disable sponsored ads",
        description = "Blocks sponsored ad pop-ups by targeting ad CDN URLs at the WebView level (campaign.bakalari.cz, campaign-dev.bakalari.cz, netglade.cz). Version-agnostic."
    ) {
        dependsOn()
        compatibleWith(COMPATIBILITY_BAKALARI)

        execute {
            val method = VaE0Fingerprint.method

            // Insert at method entry: p2 holds the WebResourceRequest.
            // Extract the URL via getUrl().toString() and check against blocked domains.
            // Return true (blocked) for ad domains, fall through to original logic otherwise.
            method.addInstructions(
                0,
                """
invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;
move-result-object v0
invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;
move-result-object v0

# --- Block campaign.bakalari.cz ---
const-string v1, "campaign.bakalari.cz"
invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
move-result v1
if-eqz v1, :skip_campaign_bakalari_cz
const/4 p1, 0x1
return p1
:skip_campaign_bakalari_cz

# --- Block campaign-dev.bakalari.cz ---
const-string v1, "campaign-dev.bakalari.cz"
invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
move-result v1
if-eqz v1, :skip_campaign_dev_bakalari_cz
const/4 p1, 0x1
return p1
:skip_campaign_dev_bakalari_cz

# --- Block netglade.cz ---
const-string v1, "netglade.cz"
invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
move-result v1
if-eqz v1, :skip_netglade_cz
const/4 p1, 0x1
return p1
:skip_netglade_cz

# Fall through to original shouldOverrideUrlLoading logic
""".trimIndent()
            )
        }
    }

@Suppress("unused")
val disableSponsoredAdsPatchRh =
    bytecodePatch(
        name = "Disable sponsored ads (WebViewActivity)",
        description = "Blocks sponsored ad pop-ups by targeting ad CDN URLs at the WebViewActivity level (campaign.bakalari.cz, campaign-dev.bakalari.cz, netglade.cz). Version-agnostic."
    ) {
        dependsOn()
        compatibleWith(COMPATIBILITY_BAKALARI)

        execute {
            val method = RhFingerprint.method

            method.addInstructions(
                0,
                """
invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;
move-result-object v0
invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;
move-result-object v0

# --- Block campaign.bakalari.cz ---
const-string v1, "campaign.bakalari.cz"
invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
move-result v1
if-eqz v1, :skip_campaign_bakalari_cz
const/4 p1, 0x1
return p1
:skip_campaign_bakalari_cz

# --- Block campaign-dev.bakalari.cz ---
const-string v1, "campaign-dev.bakalari.cz"
invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
move-result v1
if-eqz v1, :skip_campaign_dev_bakalari_cz
const/4 p1, 0x1
return p1
:skip_campaign_dev_bakalari_cz

# --- Block netglade.cz ---
const-string v1, "netglade.cz"
invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
move-result v1
if-eqz v1, :skip_netglade_cz
const/4 p1, 0x1
return p1
:skip_netglade_cz

# Fall through to original shouldOverrideUrlLoading logic
""".trimIndent()
            )
        }
    }

@Suppress("unused")
val disableSponsoredAdsPatchRi =
    bytecodePatch(
        name = "Disable sponsored ads (WebViewActivity delegate)",
        description = "Blocks sponsored ad pop-ups by targeting ad CDN URLs at the WebViewActivity delegate level (campaign.bakalari.cz, campaign-dev.bakalari.cz, netglade.cz). Version-agnostic."
    ) {
        dependsOn()
        compatibleWith(COMPATIBILITY_BAKALARI)

        execute {
            val method = RiFingerprint.method

            method.addInstructions(
                0,
                """
invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;
move-result-object v0
invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;
move-result-object v0

# --- Block campaign.bakalari.cz ---
const-string v1, "campaign.bakalari.cz"
invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
move-result v1
if-eqz v1, :skip_campaign_bakalari_cz
const/4 p1, 0x1
return p1
:skip_campaign_bakalari_cz

# --- Block campaign-dev.bakalari.cz ---
const-string v1, "campaign-dev.bakalari.cz"
invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
move-result v1
if-eqz v1, :skip_campaign_dev_bakalari_cz
const/4 p1, 0x1
return p1
:skip_campaign_dev_bakalari_cz

# --- Block netglade.cz ---
const-string v1, "netglade.cz"
invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
move-result v1
if-eqz v1, :skip_netglade_cz
const/4 p1, 0x1
return p1
:skip_netglade_cz

# Fall through to original shouldOverrideUrlLoading logic
""".trimIndent()
            )
        }
    }

@Suppress("unused")
val disableSponsoredAdsPatchVaX =
    bytecodePatch(
        name = "Disable sponsored ads (delegate WebViewClient)",
        description = "Blocks sponsored ad pop-ups by targeting ad CDN URLs at the delegate WebViewClient level (campaign.bakalari.cz, campaign-dev.bakalari.cz, netglade.cz). Version-agnostic."
    ) {
        dependsOn()
        compatibleWith(COMPATIBILITY_BAKALARI)

        execute {
            val method = VaXFingerprint.method

            method.addInstructions(
                0,
                """
invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;
move-result-object v0
invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;
move-result-object v0

# --- Block campaign.bakalari.cz ---
const-string v1, "campaign.bakalari.cz"
invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
move-result v1
if-eqz v1, :skip_campaign_bakalari_cz
const/4 p1, 0x1
return p1
:skip_campaign_bakalari_cz

# --- Block campaign-dev.bakalari.cz ---
const-string v1, "campaign-dev.bakalari.cz"
invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
move-result v1
if-eqz v1, :skip_campaign_dev_bakalari_cz
const/4 p1, 0x1
return p1
:skip_campaign_dev_bakalari_cz

# --- Block netglade.cz ---
const-string v1, "netglade.cz"
invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
move-result v1
if-eqz v1, :skip_netglade_cz
const/4 p1, 0x1
return p1
:skip_netglade_cz

# Fall through to original shouldOverrideUrlLoading logic
""".trimIndent()
            )
        }
    }
