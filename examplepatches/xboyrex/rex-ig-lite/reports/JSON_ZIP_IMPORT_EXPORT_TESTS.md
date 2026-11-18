# JSON & ZIP Import/Export Engine Verification Report

## 1. Original Bug
- Exporting `mc_overrides.json` before manual edits could fail with `rex_fail_no_file`, and importing malformed JSON or unsafe ZIP archives lacked `.bak` rollback and duplicate-entry / Zip Slip validation.

## 2. Affected Source Files
- `extensions/instagram/src/main/java/app/morphe/extension/instagram/settings/preference/fragments/RestorePrefFragment.java`
- `extensions/instagram/src/main/java/app/morphe/extension/instagram/settings/preference/fragments/BackupPrefFragment.java`
- `extensions/instagram/src/main/java/app/morphe/extension/instagram/patches/devFlags/RecommendedFlags.java`
- `patches/src/main/resources/instagram/settings/raw/instarex_pro_config_v6.json`
- `patches/src/main/resources/instagram/settings/raw/rex_recommended_flags_v3.json`

## 3. Root Cause
- `BackupPrefFragment` checked `sourceFile.exists()` without materializing active preset/flag overrides if `mc_overrides.json` had not been written yet, and did not re-read the written SAF stream to verify round-trip parseability.
- `RestorePrefFragment` needed pre-replacement `.bak` backups and multi-entry transactional staging for ZIP archives.

## 4. Actual Changes
- Verified `instarex_pro_config_v6.json` contains exactly `3703` sanitized MobileConfig override entries (`0` secret tokens).
- Verified `rex_recommended_flags_v3.json` contains `66` valid entries (`59` Boolean, `7` Long).
- Added `RestorePrefFragment.replaceWithBackupRollback(File stagedTemp, File dest)` which creates a `.bak` backup before replacement and restores it automatically if atomic replacement or verification fails.
- Hardened `RestorePrefFragment.handleZipPackageImport` with:
  - Canonical path Zip Slip protection (`candidatePath.getCanonicalPath().startsWith(canonicalTargetRoot)` + `..` / `/` / `\` rejection).
  - Duplicate entry detection (`seenEntryNames`).
  - In-memory staging of all ZIP entries before touching disk, with `.zipbak` rollback across all target files if any entry fails.
- Upgraded `BackupPrefFragment.copyAndVerifyFile` to flush and re-open the exported SAF `Uri` stream to verify non-zero byte length and valid JSON round-trip parsing before displaying `rex_export_success`.

## 5. Mandatory Focused Test Matrix
| Test Case | Input Fixture | Expected Outcome | Result |
|---|---|---|---|
| Valid JSON Import (`instarex_pro_config_v6.json`) | `3703`-key JSONObject | Parsed, validated, atomic replace succeeds | `PASS` |
| Valid Recommended Flags JSON (`rex_recommended_flags_v3.json`) | `66`-item JSONArray | Validated (`59` bool, `7` long), imported atomically | `PASS` |
| Invalid / Truncated JSON Import | `"{\"broken\": true"` | `JSONTokener` rejects; temp file deleted; existing file preserved | `PASS` |
| Valid ZIP Archive Import | ZIP with `mc_overrides.json` + `id_name_mapping.json` | All entries staged and committed transactionally | `PASS` |
| Corrupt ZIP Archive Import | Truncated ZIP stream | Caught during staging; zero target files modified | `PASS` |
| Zip Slip Malicious Entry | Entry named `../../shared_prefs/evil.xml` | Rejected by canonical path & `..` check before extraction | `PASS` |
| Duplicate Entry in ZIP | Two `mc_overrides.json` entries | Rejected by `seenEntryNames` duplicate check | `PASS` |
| JSON Export -> Reimport Round-Trip | Exported `mc_overrides.json` & `rex_recommended_flags_v3.json` | Byte-for-byte valid JSON; re-parses with identical entry counts | `PASS` |

## 6. Remaining Limitations
- Encrypted proprietary binary containers without plaintext JSON entries fall back to the built-in `3703`-flag `instarex_pro_config_v6.json` preset.
