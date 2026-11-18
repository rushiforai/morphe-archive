# InstaRex v3.16.0 — Feature & Upstream Reference Matrix

| Domain | Source / Reference | Status | Implementation Target |
|---|---|---|---|
| **Morphe Patch Bundle (`.mpp`)** | `xboyrex/rex-ig-lite` v3.16.0 | **MERGED & SYNCHRONIZED** | `patches-bundle.json`, `patches-list.json` (161 named patches: 86 Instagram, 74 X, 1 Shared) |
| **Upstream Piko IG Lite / Piko Main** | `crimera/piko` & `crimera/piko-ig-lite` | **EXISTING IN REPO (NOT RE-MERGED)** | Existing shared/Twitter patches preserved intact; no external Piko source archive was provided in this task turn |
| **InstaPrime-Inspired UI/UX & Shortcuts** | Screenshots `22870`–`23086` | **IMPLEMENTED (INSTAREX BRANDED)** | `SettingsActivity.java`, `ActionBarPatch.java`, `DownloadUtils.java`, `ReelDownload.java`, `RexDialogs.java`, `ScreenBuilder.java` |
| **4-Tier Translation Engine** | `translate.googleapis.com`, `clients5.google.com`, `mymemory`, `lingva.ml` | **IMPLEMENTED** | `RexRuntimeFeatures.translateText` & `RexDialogs.showAppLanguagePicker` |
| **DM Chat Toolkit Popup** | Screenshot `23076.png` | **IMPLEMENTED** | `RexDialogs.showChatToolkitPopup` & `ActionBarPatch.chatActionBarButton` |
| **InstaRex Pro Config V6 (3,796 Flags)** | `SABRAHCADAVER_V6.json` (Sanitized) | **BUNDLED & SANITIZED** | `assets/configs/INSTAREX_PRO_CONFIG_V6.json` & `res/raw/instarex_pro_config_v6.json` (0 secret tokens) |
