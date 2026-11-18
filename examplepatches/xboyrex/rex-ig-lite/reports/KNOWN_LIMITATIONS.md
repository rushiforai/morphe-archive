# Known Limitations & Operational Notes (`v3.16.0`)

1. **Sandbox Offline Environment (`PARTIAL` Device Testing)**:
   - Because the build sandbox container has no outbound internet access or attached physical Android device, live on-device APK testing (`com.xboyrex.instarex` Clone and `com.instagram.android` UnClone on POCO Android 17 / SDK 37) must be completed after pushing the updated repository to GitHub Actions (`build.yml`) to produce `patches-3.16.0.mpp`.
2. **MobileConfig Session Reloads**:
   - While inline switches in **Recommended Flags** and **Enable All Recommended Flags** persist immediately to `FlagsSharedPref` and reload `HookFlags.load()`, Instagram's native C++/Java MobileConfig table caches many session parameters at process startup. The transactional controller therefore prompts the user with a 1-tap `Restart Now` confirmation dialog whenever one or more flags change.
3. **Online Translation Endpoints**:
   - The 4-Tier Translator (`Google GTX -> Clients5 -> MyMemory -> Lingva`) requires network connectivity on the device for uncached strings. Once translated, results are cached in `TRANSLATION_CACHE` (`LruCache(128)`). When offline, the dialog preserves the original text and provides a `Retry Translation` button rather than falsely labeling untranslated text as translated.
4. **Encrypted Third-Party Backup Containers**:
   - Plaintext `.json`, `.xml`, and `.zip` archives containing `mc_overrides.json`, `id_name_mapping.json`, `recommended_flags.json`, or `rex_settings.xml` are validated and imported directly. Proprietary encrypted binary `.igprime` containers whose encryption key is not stored inside the archive automatically fall back to applying the built-in 3,796-flag `instarex_pro_config_v6.json` preset.
