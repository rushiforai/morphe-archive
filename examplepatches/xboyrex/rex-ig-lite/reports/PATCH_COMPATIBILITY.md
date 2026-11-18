# Target Instagram Version & Bytecode Patch Compatibility Report

## 1. Supported Instagram Versions
Verified across all 86 Instagram patches in `patches-list.json`:
- `439.0.0.37.89`
- `444.0.0.47.66`
- `452.1.0.53.64` (Primary POCO Android 17 / SDK 37 target)
- `453.0.0.57.79`
- `454.0.0.54.77`
- `455.0.0.51.72`

## 2. Regression Audit of Previous Crash Signatures (Phase 13)
| Crash Signature | Target Base APK | Root Cause | Fix & Current Status |
|---|---|---|---|
| `java.lang.VerifyError: Verifier rejected class app.morphe.extension.instagram.entity.UserData: getAdditionalUserInfo() bad exception entry: startAddr=2 endAddr=2` | `452.1.0.53.64` (Android 17 / SDK 37) | R8 inlined `Entity.getField` (`try/catch`) into `UserData.getAdditionalUserInfo()`, and `removeInstructions(0, instructions.size)` in `dexlib2` left orphaned `tryBlocks` with `startAddr=2 endAddr=2`. | `UserData.getAdditionalUserInfo()` returns `this.obj` directly in Java with zero `try/catch` blocks, and `UserDataEntity.kt`, `SaveDeletedMessagesPatch.kt`, `ReelModel.kt`, and `SignatureCheckBypassPatch.kt` use `ImmutableMethodImplementation(..., emptyList(), emptyList(), emptyList())` with zero `tryBlocks`. **Status: `PASS`** |
| `java.lang.NoSuchMethodError: No static method storyButtonAction(Ljava/lang/CharSequence;Landroid/content/Context;Ljava/lang/Object;)Z` | `452.1.0.53.64` | `HandleStoryButtonPatch.kt` invoked `StoryButton.storyButtonAction(CharSequence, Context, Object)Z` which was missing. | Restored `public static boolean storyButtonAction(CharSequence, Context, Object)` on `StoryButton.java`. **Status: `PASS`** |
| `java.lang.IllegalArgumentException: y + height must be <= bitmap.height()` in `Bitmap.getPixels` | `452.1.0.53.64` | Out-of-bounds crop height passed to `Bitmap.getPixels` during story/media rendering. | Added `SafeBitmap.getPixels` clamping hook in `SettingsPatch.kt`. **Status: `PASS`** |
| `ButtonPref: Preference button onclick failure — No restart policy declared for setting: rex_rec_flags_enable_all` | `452.1.0.53.64` | `ButtonPref.java` passed bulk action key `"rex_rec_flags_enable_all"` to 3-arg `SettingsRestart.markChanged`. | Replaced with `RecommendedFlags.enableAllBooleanFlagsTransactionally` using explicit 4-arg `SettingsRestart.markChanged(flagKey, RestartPolicy.REQUIRED, prev, next)`. **Status: `PASS`** |
