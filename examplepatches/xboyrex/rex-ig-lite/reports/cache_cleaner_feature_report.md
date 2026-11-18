# App Cache Cleaner & Auto-Limit Feature Report

- **Repository**: [xboyrex/rex-ig-lite](https://github.com/xboyrex/rex-ig-lite)
- **Implementation**: `extensions/instagram/src/main/java/app/morphe/extension/instagram/settings/feature/AppCacheCleaner.java`

## Capabilities
1. **Live Cache Inspection**: Computes internal cache (`context.getCacheDir()`), external cache (`context.getExternalCacheDir()`), and safe temporary media sub-caches (`image_cache`, `exo_cache`, `video_cache`, `ig_mq_assets_dir`, `rex_temp`) while never touching `shared_prefs`, `databases`, login session tokens, or user downloads.
2. **Manual Cleanup (`Clean Cache Now`)**: Displays current cache usage vs configured limit and frees temporary cache files with an itemized MB/GB summary toast.
3. **Automatic Cache Limit (`Settings.AUTO_CACHE_CLEAN_ENABLED`, `Settings.CACHE_CLEAN_LIMIT_MB`)**:
   - Preset limits: `250 MB`, `500 MB`, `1 GB`, `2 GB`, `3 GB`, `5 GB`, plus `Custom Limit` (`50 MB – 20 GB`).
   - Invoked automatically on app startup from `SettingsEntry.onApplicationCreate(context)` on a background thread when cache size exceeds the configured threshold.
