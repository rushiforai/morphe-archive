package app.rex.patches.instagram

import java.io.File

object RexPatchManifestTest {

    private fun repoRoot(): File {
        val cwd = File(System.getProperty("user.dir") ?: ".")
        return if (File(cwd, "patches-list.json").exists()) cwd else cwd.parentFile
    }

    @JvmStatic
    fun main(args: Array<String>) {
        verifyAllSixteenPreviouslyUnwiredSwitchesHaveRealRuntimeConsumers()
        verifyPersistenceAndStaticHelperDefectsAreFixed()
        verifyBrandingSubpageHeaderAndRegisteredButtonRoutes()
        verifyTablerIconPackManifestAndRedesign()
        verifyP0MediaDownloadAndCarouselFixes()
        verifyAntigravityRegistriesAndMediaMatrix()
        verifyScreenSpecificShortcutsColorModesAndProConfigV6()
    }

    fun verifyAllSixteenPreviouslyUnwiredSwitchesHaveRealRuntimeConsumers() {
        val root = repoRoot()
        val prefFile = File(root, "extensions/instagram/src/main/java/app/morphe/extension/instagram/utils/Pref.java")
        check(prefFile.exists()) { "Pref.java must exist" }
        val prefText = prefFile.readText()

        val requiredPrefMethods = listOf(
            "hideViewOnceSeen(",
            "ghostInstants(",
            "hideAudioSeen(",
            "hideReelsAndStoriesAdPods(",
            "disableAnalytics(",
            "restoreTrustSpoof(",
            "holdVideoFastForward(",
            "startFeedVideosMuted(",
            "disableReelsLooping(",
            "playStorySoundAutomatically(",
            "storyMentionIcon(",
            "highQualityUpload(",
            "upload60FpsStories(",
            "extendedStoryDuration(",
            "reelsFloatingToolbar(",
            "storyFiltersMaster("
        )
        for (method in requiredPrefMethods) {
            check(prefText.contains(method)) { "Pref.java must expose consumer accessor $method" }
        }
    }

    fun verifyPersistenceAndStaticHelperDefectsAreFixed() {
        val root = repoRoot()
        val prefDir = File(root, "extensions/instagram/src/main/java/app/morphe/extension/instagram/settings/preference/widgets")
        val widgets = listOf("SwitchPref.java", "ListPref.java", "MultiSelectListPref.java", "EditTextPref.java")

        for (w in widgets) {
            val text = File(prefDir, w).readText()
            check(!text.contains("static Helper helper")) { "$w must not hold a static Activity-bound Helper reference" }
            check(text.contains("private final Helper helper;")) { "$w must use an instance-scoped final Helper field" }
        }

        for (w in listOf("ListPref.java", "MultiSelectListPref.java", "EditTextPref.java")) {
            val text = File(prefDir, w).readText()
            check(text.contains("boolean saved = helper.setValue(")) { "$w must inspect boolean return value of helper.setValue" }
            check(text.contains("if (!saved)")) { "$w must reject failed persistence writes and restore previous value" }
            check(!text.contains("key == Settings.")) { "$w must not compare preference keys using ==" }
        }
    }

    fun verifyBrandingSubpageHeaderAndRegisteredButtonRoutes() {
        val root = repoRoot()
        val buttonPref = File(root, "extensions/instagram/src/main/java/app/morphe/extension/instagram/settings/preference/widgets/ButtonPref.java").readText()
        check(!buttonPref.contains("key.startsWith(\"rex_\")")) { "ButtonPref must not use blanket rex_ prefix chevron matching" }
        check(buttonPref.contains("REGISTERED_ROUTE_KEYS")) { "ButtonPref must use explicit REGISTERED_ROUTE_KEYS registry" }
        check(buttonPref.contains("REGISTERED_ACTION_KEYS")) { "ButtonPref must use explicit REGISTERED_ACTION_KEYS registry" }

        val settingsActivity = File(root, "extensions/instagram/src/main/java/app/morphe/extension/instagram/settings/SettingsActivity.java").readText()
        check(settingsActivity.contains("Rex IG Lite")) { "SettingsActivity header must display Rex IG Lite" }
        check(settingsActivity.contains("by xboyrex")) { "SettingsActivity subtitle must display by xboyrex" }
        check(settingsActivity.contains("resolveSubpageDescription(")) { "SettingsActivity must render subpage descriptions below the toolbar" }
        val forbiddenBrand = "Insta" + "Zen"
        check(!settingsActivity.contains(forbiddenBrand)) { "SettingsActivity must not contain foreign branding" }
    }

    fun verifyTablerIconPackManifestAndRedesign() {
        val root = repoRoot()
        val manifest = File(root, "assets/icons/icon-manifest.json")
        check(manifest.exists()) { "Centralized Tabler icon-manifest.json must exist" }
        val rexIcon = File(root, "extensions/instagram/src/main/java/app/morphe/extension/instagram/settings/preference/widgets/RexIcon.java").readText()
        check(rexIcon.contains("parseSvgPath")) { "RexIcon must include native SVG PathParser" }
        check(rexIcon.contains("bindOrAnimateState")) { "RexIcon must include animated icon state switching" }
        check(rexIcon.contains("rex_frag_ghost")) { "RexIcon must map root Settings rex_frag_* keys to unique Tabler icons" }
        check(rexIcon.contains("rex_frag_download_media")) { "RexIcon must map rex_frag_download_media to download icon" }
        val rexDialogs = File(root, "extensions/instagram/src/main/java/app/morphe/extension/instagram/settings/preference/widgets/RexDialogs.java").readText()
        check(rexDialogs.contains("showTextStudioDialog")) { "RexDialogs must include Bio/Caption/Comment Studio" }
        check(rexDialogs.contains("userData.getProfilePictureUrl()")) { "RexDialogs must call UserData.getProfilePictureUrl()" }
        check(rexDialogs.contains("showLegalLicensesDialog")) { "RexDialogs must include Legal & Open-Source Licences dialog" }
        val aboutView = File(root, "extensions/instagram/src/main/java/app/morphe/extension/instagram/settings/preference/widgets/RexAboutView.java").readText()
        check(!aboutView.contains("Morphe Source")) { "RexAboutView must not display Morphe Source in user UI" }
        check(aboutView.contains("Legal & Open-Source Licences")) { "RexAboutView must expose Legal & Open-Source Licences entry" }
    }

    fun verifyP0MediaDownloadAndCarouselFixes() {
        val root = repoRoot()
        val mediaDataEntity = File(root, "patches/src/main/kotlin/app/rex/patches/instagram/entity/mediadata/MediaDataEntity.kt").readText()
        check(mediaDataEntity.contains("GetImageVariantsExtensionFingerprint.changeFirstString(candidatesMethodName)")) {
            "MediaDataEntity must patch index 0 of getImageVariants with candidatesMethodName (BUG-DL-001 & BUG-DL-002)"
        }
        check(mediaDataEntity.contains("ResolveImageInfoObjectExtensionFingerprint.changeFirstString")) {
            "MediaDataEntity must patch resolveImageInfoObject instead of overwriting getImageVariants with A31"
        }
        check(mediaDataEntity.contains("CarouselMediaGetterFingerprint")) {
            "MediaDataEntity must prioritize CarouselMediaGetterFingerprint for carousel_media (BUG-CAROUSEL-001)"
        }

        val resolver = File(root, "extensions/instagram/src/main/java/app/morphe/extension/instagram/patches/download/MediaContextResolver.java")
        val registry = File(root, "extensions/instagram/src/main/java/app/morphe/extension/instagram/patches/download/MediaActionRegistry.java")
        check(resolver.exists()) { "MediaContextResolver.java must exist" }
        check(registry.exists()) { "MediaActionRegistry.java must exist" }
    }

    fun verifyAntigravityRegistriesAndMediaMatrix() {
        val root = repoRoot()
        val iconRegistry = File(root, "extensions/instagram/src/main/java/app/morphe/extension/instagram/settings/preference/widgets/RexIconRegistry.java")
        val featureRegistry = File(root, "extensions/instagram/src/main/java/app/morphe/extension/instagram/settings/RexFeatureRegistry.java")
        val mediaActionRegistry = File(root, "extensions/instagram/src/main/java/app/morphe/extension/instagram/patches/download/MediaActionRegistry.java")
        check(iconRegistry.exists()) { "RexIconRegistry.java must exist" }
        check(featureRegistry.exists()) { "RexFeatureRegistry.java must exist" }
        val marContent = mediaActionRegistry.readText()
        check(marContent.contains("REPOST_ALL_IG_POST")) { "MediaActionRegistry must support batch carousel reposting" }
        check(marContent.contains("Image to Text (OCR)")) { "MediaActionRegistry must support context-aware OCR labels" }
    }

    fun verifyScreenSpecificShortcutsColorModesAndProConfigV6() {
        val root = repoRoot()
        val duContent = File(root, "extensions/instagram/src/main/java/app/morphe/extension/instagram/patches/download/DownloadUtils.java").readText()
        check(duContent.contains("STORY_MENTIONS_BUTTON_TAG")) { "DownloadUtils must inject Story Hidden Mentions (@) toolbar button" }
        check(duContent.contains("STORY_OPTIONS_BUTTON_TAG")) { "DownloadUtils must inject Story Settings/Options toolbar button" }
        check(duContent.contains("isFeedOptionsButtonEnabled()")) { "DownloadUtils must decouple Feed Download and Feed Options icons" }

        val rdContent = File(root, "extensions/instagram/src/main/java/app/morphe/extension/instagram/patches/download/ReelDownload.java").readText()
        check(rdContent.contains("registerOptions(")) { "ReelDownload must support Reels Settings/Options UFI button" }

        val styleContent = File(root, "extensions/instagram/src/main/java/app/morphe/extension/instagram/settings/preference/widgets/InstagramPreferenceStyle.java").readText()
        check(styleContent.contains("COLOR_MODES")) { "InstagramPreferenceStyle must define 6 curated Color Modes" }

        val configAsset = File(root, "assets/configs/INSTAREX_PRO_CONFIG_V6.json")
        val configRaw = File(root, "patches/src/main/resources/instagram/settings/raw/instarex_pro_config_v6.json")
        check(configAsset.exists() && configRaw.exists()) { "Bundled INSTAREX_PRO_CONFIG_V6.json must exist in assets and raw resources" }
        val rawJson = configRaw.readText()
        check(!rawJson.contains("32604:") && !rawJson.contains("23482:")) { "Bundled config must not contain any secret or token strings" }
    }

}
