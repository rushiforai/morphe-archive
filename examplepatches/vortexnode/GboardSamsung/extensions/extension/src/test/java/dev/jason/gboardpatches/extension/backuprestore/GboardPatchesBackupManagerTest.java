package dev.jason.gboardpatches.extension.backuprestore;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.SharedPreferences;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;

import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

@RunWith(RobolectricTestRunner.class)
public final class GboardPatchesBackupManagerTest {
    @Test
    public void roundTripPreservesEverySharedPreferencesTypeAndReplacesStores() {
        Map<String, SharedPreferences> stores = stores();
        SharedPreferences core = stores.get("gboard_patches_settings");
        core.edit()
                .putBoolean("boolean", true)
                .putInt("int", Integer.MIN_VALUE)
                .putLong("long", 9_007_199_254_740_993L)
                .putFloat("negative_zero", Float.intBitsToFloat(0x80000000))
                .putFloat("nan", Float.intBitsToFloat(0x7fc01234))
                .putString("string", "密碼\n\"token\"\\JavaScript")
                .putStringSet("set", Set.of("注音", "emoji"))
                .commit();

        String exported = GboardPatchesBackupManager.exportBackup(stores);
        core.edit().clear().putString("target_only", "remove me").commit();
        GboardPatchesBackupManager.RestoreResult result =
                GboardPatchesBackupManager.restoreBackup(stores, exported);

        assertTrue(result.isSuccess());
        assertEquals(GboardPatchesBackupManager.physicalStoreNames().size(),
                result.getRestoredStoreCount());
        assertEquals(7, result.getRestoredEntryCount());
        assertTrue(core.getBoolean("boolean", false));
        assertEquals(Integer.MIN_VALUE, core.getInt("int", 0));
        assertEquals(9_007_199_254_740_993L, core.getLong("long", 0L));
        assertEquals(0x80000000,
                Float.floatToRawIntBits(core.getFloat("negative_zero", 0f)));
        assertEquals(0x7fc01234, Float.floatToRawIntBits(core.getFloat("nan", 0f)));
        assertEquals("密碼\n\"token\"\\JavaScript", core.getString("string", null));
        assertEquals(Set.of("注音", "emoji"), core.getStringSet("set", Set.of()));
        assertFalse(core.contains("target_only"));
    }

    @Test
    public void selectedModulesCanBeRestoredWithoutTouchingUnselectedStores() {
        Map<String, SharedPreferences> stores = stores();
        SharedPreferences clipboard = stores.get("gboard_clipboard");
        SharedPreferences symbolFooter = stores.get("gboard_symbol_footer_order");
        clipboard.edit().putBoolean("pref_clipboard_show_sensitive_content", true).commit();
        symbolFooter.edit()
                .putString("pref_symbol_footer_order", "emoji,sticker,gif")
                .putInt("pref_symbol_footer_version", 2)
                .commit();
        String exported = GboardPatchesBackupManager.exportBackup(stores);

        clipboard.edit().clear().putString("current", "replace").commit();
        symbolFooter.edit().clear().putString("current", "replace").commit();
        SharedPreferences core = stores.get("gboard_patches_settings");
        core.edit().putString("current", "leave alone").commit();
        GboardPatchesBackupManager.RestoreResult result =
                GboardPatchesBackupManager.restoreBackup(stores, exported, Set.of(
                        "gboard-patches.clipboard",
                        "gboard-patches.symbol-footer"));

        assertTrue(result.isSuccess());
        assertTrue(clipboard.getBoolean("pref_clipboard_show_sensitive_content", false));
        assertEquals("emoji,sticker,gif",
                symbolFooter.getString("pref_symbol_footer_order", null));
        assertEquals(2, symbolFooter.getInt("pref_symbol_footer_version", 0));
        assertEquals(Map.of("current", "leave alone"), core.getAll());
    }

    @Test
    public void restorePreviewReportsAddedChangedRemovedAndUnchangedKeys() {
        Map<String, SharedPreferences> stores = stores();
        SharedPreferences core = stores.get("gboard_patches_settings");
        core.edit()
                .putString("added", "from backup")
                .putString("changed", "backup value")
                .putString("same", "same value")
                .commit();
        String exported = GboardPatchesBackupManager.exportBackup(stores);
        core.edit().clear()
                .putString("changed", "current value")
                .putString("removed", "current only")
                .putString("same", "same value")
                .commit();

        GboardPatchesBackupManager.RestorePreview preview =
                GboardPatchesBackupManager.inspectRestore(stores, exported,
                        Set.of("gboard-patches.core"));
        Map<String, GboardPatchesBackupManager.ChangeStatus> changes = new HashMap<>();
        for (GboardPatchesBackupManager.KeyChange key : preview.getModules().get(0).getKeys()) {
            changes.put(key.getKey(), key.getStatus());
        }

        assertEquals(1, preview.getModules().size());
        assertEquals(GboardPatchesBackupManager.ChangeStatus.ADDED, changes.get("added"));
        assertEquals(GboardPatchesBackupManager.ChangeStatus.CHANGED, changes.get("changed"));
        assertEquals(GboardPatchesBackupManager.ChangeStatus.REMOVED, changes.get("removed"));
        assertEquals(GboardPatchesBackupManager.ChangeStatus.UNCHANGED, changes.get("same"));
        assertEquals(1, preview.getAddedCount());
        assertEquals(1, preview.getChangedCount());
        assertEquals(1, preview.getRemovedCount());
        assertEquals(1, preview.getUnchangedCount());
    }

    @Test
    public void failedCommitRestoresOnlyFailedModuleAndContinues() {
        Map<String, SharedPreferences> stores = stores();
        for (SharedPreferences preferences : stores.values()) {
            preferences.edit().putString("backup", "restore me").commit();
        }
        String exported = GboardPatchesBackupManager.exportBackup(stores);
        for (SharedPreferences preferences : stores.values()) {
            preferences.edit().clear().putString("current", "keep on failure").commit();
        }
        String failingName = GboardPatchesBackupManager.physicalStoreNames().get(2);
        ((MemoryPreferences) stores.get(failingName)).failNextCommit = true;

        GboardPatchesBackupManager.RestoreResult result =
                GboardPatchesBackupManager.restoreBackup(stores, exported);

        assertFalse(result.isSuccess());
        assertTrue(result.isPartialSuccess());
        assertEquals(7, result.getRestoredStoreCount());
        assertEquals(1, result.getFailedModuleCount());
        for (Map.Entry<String, SharedPreferences> entry : stores.entrySet()) {
            assertEquals(entry.getKey().equals(failingName)
                            ? Map.of("current", "keep on failure")
                            : Map.of("backup", "restore me"),
                    entry.getValue().getAll());
        }
        assertEquals(GboardPatchesBackupManager.ModuleStatus.PREVIOUS_VALUES_RESTORED,
                result.getModules().get(2).getStatus());
    }

    @Test
    public void moduleCatalogUsesStableIdsAndEnglishDisplayNames() {
        GboardPatchesBackupManager.BackupPlan plan =
                GboardPatchesBackupManager.inspectBackup(
                        GboardPatchesBackupManager.exportBackup(stores()));
        Set<String> ids = new HashSet<>();

        assertEquals(8, plan.getModules().size());
        for (GboardPatchesBackupManager.ModulePlan module : plan.getModules()) {
            assertTrue(ids.add(module.getModuleId()));
            assertTrue(module.getModuleName().chars().allMatch(character -> character < 128));
        }
    }

    private static Map<String, SharedPreferences> stores() {
        Map<String, SharedPreferences> stores = new LinkedHashMap<>();
        for (String name : GboardPatchesBackupManager.physicalStoreNames()) {
            stores.put(name, new MemoryPreferences());
        }
        return stores;
    }

    private static final class MemoryPreferences implements SharedPreferences {
        private final Map<String, Object> values = new HashMap<>();
        private boolean failNextCommit;

        @Override
        public Map<String, ?> getAll() {
            return new HashMap<>(values);
        }

        @Override
        public String getString(String key, String defaultValue) {
            Object value = values.get(key);
            return value instanceof String stringValue ? stringValue : defaultValue;
        }

        @Override
        @SuppressWarnings("unchecked")
        public Set<String> getStringSet(String key, Set<String> defaultValues) {
            Object value = values.get(key);
            return value instanceof Set<?> ? new HashSet<>((Set<String>) value) : defaultValues;
        }

        @Override
        public int getInt(String key, int defaultValue) {
            Object value = values.get(key);
            return value instanceof Integer intValue ? intValue : defaultValue;
        }

        @Override
        public long getLong(String key, long defaultValue) {
            Object value = values.get(key);
            return value instanceof Long longValue ? longValue : defaultValue;
        }

        @Override
        public float getFloat(String key, float defaultValue) {
            Object value = values.get(key);
            return value instanceof Float floatValue ? floatValue : defaultValue;
        }

        @Override
        public boolean getBoolean(String key, boolean defaultValue) {
            Object value = values.get(key);
            return value instanceof Boolean booleanValue ? booleanValue : defaultValue;
        }

        @Override
        public boolean contains(String key) {
            return values.containsKey(key);
        }

        @Override
        public Editor edit() {
            return new MemoryEditor();
        }

        @Override
        public void registerOnSharedPreferenceChangeListener(
                OnSharedPreferenceChangeListener listener) {
        }

        @Override
        public void unregisterOnSharedPreferenceChangeListener(
                OnSharedPreferenceChangeListener listener) {
        }

        private final class MemoryEditor implements Editor {
            private final Map<String, Object> pending = new HashMap<>();
            private final Set<String> removals = new HashSet<>();
            private boolean clear;

            @Override
            public Editor putString(String key, String value) {
                pending.put(key, value);
                return this;
            }

            @Override
            public Editor putStringSet(String key, Set<String> value) {
                pending.put(key, new HashSet<>(value));
                return this;
            }

            @Override
            public Editor putInt(String key, int value) {
                pending.put(key, value);
                return this;
            }

            @Override
            public Editor putLong(String key, long value) {
                pending.put(key, value);
                return this;
            }

            @Override
            public Editor putFloat(String key, float value) {
                pending.put(key, value);
                return this;
            }

            @Override
            public Editor putBoolean(String key, boolean value) {
                pending.put(key, value);
                return this;
            }

            @Override
            public Editor remove(String key) {
                removals.add(key);
                return this;
            }

            @Override
            public Editor clear() {
                clear = true;
                return this;
            }

            @Override
            public boolean commit() {
                if (failNextCommit) {
                    failNextCommit = false;
                    return false;
                }
                applyChanges();
                return true;
            }

            @Override
            public void apply() {
                applyChanges();
            }

            private void applyChanges() {
                if (clear) {
                    values.clear();
                }
                for (String key : removals) {
                    values.remove(key);
                }
                values.putAll(pending);
            }
        }
    }
}
