# Wispr Flow 2.8.7 — what moved since 2.6.2

The patches were re-derived against **2.8.7** (versionCode 186, targetSdk 37). This note records
only the delta: what changed in the code the hooks touch, and why each hook still holds where it
does. The wider analysis of the app stays in [`wispr-flow-2.6.2.md`](wispr-flow-2.6.2.md) — its
findings about the dictation chain, the backend and the licensing design are unchanged.

**Artefact**: base APK of the 2.8.7 XAPK, SHA-256 `9707f18a43762c90f6837d79d9f986db32db009c8c897fbe1c6487028ba04653`
**Signing certificate**: `0f0f93d294c479ccd0ddce1bad232af5640c1faaa468612869c2208d7714c432` — unchanged.

---

## 1. The quota gate renames its argument

`WordLimitPolicy.computeState` now takes a `WeeklyWordLimits` object instead of a bare word count:

| 2.6.2 | 2.8.7 |
|---|---|
| `computeState(Z I J)` | `computeState(Z I Lcom/wispr/payment/wordlimit/WeeklyWordLimits; J)` |

`weeklyLimits.getHard()`, `getSoft()` and `getWarningThreshold()` are read inside, so the
thresholds are no longer inlined constants: they are per-account values from the backend. The
states and the branch order are otherwise identical, `HardCapped` → `Exhausted` → `Warning` →
`None`.

**The hook is unchanged in effect.** Returning `WordLimitState$None` as the first instruction still
short-circuits everything, and `computeGate` still maps `None` to `DictationGate$Allow`
(`WordLimitPolicy.smali`, `:cond_7` → `:cond_9`), so `DictationStartGate` still decides `Start`.
The anchor moved from `if-nez p1, :cond_0` to the `getClass()` null check that now opens the body.

`WordLimitEngine.resolveLimited(J)` is untouched and keeps its anchor.

## 2. The installer reads multiply and disappear from named classes

The PairIP gate is the same (`LicenseClient.performLocalInstallerCheck`, same
`getInstallingPackageName` comparison), but two things make per-class targeting untenable:

* **`FirebaseCommonRegistrar` no longer reads the installer at all.** Its former hook target, a
  synthetic lambda, is gone.
* **New readers appear in obfuscated classes.** `io/sentry/android/core/ContextUtils` is now
  `io/sentry/android/core/n0`, and the app grew `com/wispr/flowapp/analytics/InstallSourceTelemetry`,
  which normalises the installer into a `play`/`other` analytics property and reads
  `getPackageSource()` next to it. Two further readers sit in `ln0` and `j65`, classes whose names
  carry nothing.

Naming a class per site would mean re-deriving names that change every release. All ten call sites
were instead verified to query **this** package (`getPackageName()` or
`PackageInfo.packageName`), which makes a tree-wide answer safe.

| Signature | Sites | 2.6.2 location |
|---|---|---|
| `PackageManager.getInstallerPackageName` | 4 | `AFg1zSDK`, `ln0`, `j65`, Sentry `n0` |
| `InstallSourceInfo.getInstallingPackageName` | 4 | `LicenseClient`, `PlayStoreInAppReviewKt`, `InstallSourceTelemetry`, `AFg1zSDK` |
| `InstallSourceInfo.getInitiatingPackageName` | 1 | `AFg1zSDK` |
| `InstallSourceInfo.getPackageSource` | 1 | `InstallSourceTelemetry` |

`getPackageSource` returns an `int` and needs `const/4 …, 0x2`
(`PACKAGE_INSTALLER_PACKAGE_SOURCE_STORE`), which is what
`InstallSourceTelemetry.packageSourceValue` translates to `store`.

## 3. What this costs

The count is the guard: a release that adds or drops a site fails both patches instead of
answering half of them. A release that adds a site reading *another* package would be masked —
that is the trade for surviving obfuscation, and it is written down here so the next reader knows
to check it.

## 4. The theme is hard-coded light

There is no theme setting, and the app does not follow the system: with Android in dark mode it
stays light. The reason is in `com/wispr/design/ThemeKt`:

* `FlowAppTheme(Z Z Function2 Lyo0; I I)` takes the dark flag first. `MainActivity` calls it with
  `dark = false` and the `dynamic` default, so the explicit path is light regardless of the
  device;
* the fallback path calls `isSystemInDarkTheme()`, which only runs when a caller leaves the first
  argument at its default.

Both dark palettes exist in the same class (`DarkColorScheme`, `dynamicDarkColorScheme`), so the
scheme is implemented and merely never selected.

Two hooks are therefore needed, not one: overwriting the parameter covers explicit callers,
answering `isSystemInDarkTheme()` with `true` covers the screens that omit it. The second is
located by the body (`Configuration.uiMode` and the `0x20` night bit) because R8 renames its class
and method on every release.

**Neither is enough, and the truth is worse than "the theme is unused".** The interface does not
paint from `MaterialTheme` at all: it reads 60 fixed constants from `com/wispr/design/ColorKt`,
always through a per-constant getter, and `res/values-night/` holds only AppCompat styles. Forcing
the scheme changed nothing visible, exactly as the vendor's missing setting suggests.

### What was tried and withdrawn

A patch that repainted the palette was derived and shipped as a pre-release: 38 getters of
`ColorKt` returned dark values, with surfaces raised and the neutral ramp inverted so text stayed
readable. It compiled and passed every offline check — the built dex did return the new colours —
and **the app crashed on launch**. No root cause was established; the plausible explanation is that
a getter whose body is not the plain `sget-wide`/`return-wide` shape took a `const-wide` where
something else was expected, which yields a class that fails verification.

The patch was removed rather than debugged further, by decision of the person testing it. The
conclusion that survives: this app has no dark theme to switch on, only a palette that would have
to be rewritten, and any attempt has to be validated on a device before it is published.
