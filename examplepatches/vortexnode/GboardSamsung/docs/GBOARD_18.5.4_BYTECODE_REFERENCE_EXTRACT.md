# Gboard 18.5.4 — DEX bytecode reference extract

**Source APK:** `Gboard-v18.5.4.993608717-release-arm64-v8a.apk`  
**APK SHA-256:** `f47f44d33ab21d28aabfaec8292009c1173964ea238441734327a0a15ba32813`  
**APK size:** 95,577,506 bytes  
**ZIP integrity:** PASS  
**Archive entries:** 9,259  
**DEX files:** 4

| DEX | Size | SHA-256 |
|---|---:|---|
| classes.dex | 7,859,484 | `b403bf2797f56b6bae2ac3f6a10fe10fba3012b201b7c26c120f7370139f606e` |
| classes2.dex | 8,465,652 | `2529a75190010707d17b51f0a63cccb9a2b8dae5a6c9c598445edd7588a7959d` |
| classes3.dex | 3,683,072 | `53e70ef05fe2515e4675d25d2b08708698095d95aa06dca4201d15c7f7cd8f92` |
| classes4.dex | 680,452 | `0b5f0b0e2c28e06b9ac81b063f95848b04ea236f3a49df6bf2649c9fb90d7e17` |

> **Scope and limitation:** The APK was inspected directly. This document records DEX class/method descriptors, string references, and method references extracted from bytecode instruction streams. It is **not** a JADX Java decompilation or a complete Smali disassembly. It does not reconstruct full control flow, branch conditions, resource values, or runtime configuration. Treat the findings below as bytecode-level references, not a complete behavioral proof.

## 1. High-value findings

### 1.1. Gboard already contains a dedicated Free Cursor implementation

**Confirmed DEX types:**
- `com.google.android.libraries.inputmethod.freecursor.FreeCursorKeyboard`
- `com.google.android.libraries.inputmethod.freecursor.FreeCursorMotionEventHandler`
- `com.google.android.libraries.inputmethod.freecursor.TriggerFreeCursorMotionEventHandler`

The `FreeCursorKeyboard` implementation has methods including:
- `e(EditorInfo, Object)` — references the strings `free_cursor_activation_source` and `free_cursor_activation_swipe_direction`, and constructs an object using the Free Cursor source enum.
- `eR(SoftKeyboardView, KeyboardViewDef)` — resolves multiple views from the keyboard view and attaches click listeners.
- `m(Lohe)` — handles internal keyboard events and calls Free Cursor state/visibility-related methods.
- `h()` — changes view visibility and emits internal events.
- `P(Lohe)` — reads editor text/selection-related state and processes internal events.

This is significant: a cursor-control subsystem already exists in the target Gboard APK. A custom cursor implementation should **not** be assumed necessary until the existing Free Cursor path has been traced and tested.

### 1.2. The Free Cursor source enum explicitly includes long-press on the spacebar

In `classes3.dex`, enum class `Lxfe;` contains these exact string constants:

- `FREE_CURSOR_SOURCE_DIRECT_KEYCODE`
- `FREE_CURSOR_SOURCE_SPACE_LONG_PRESS_MULTI_KEYBOARD`
- `FREE_CURSOR_SOURCE_SPACE_LONG_PRESS_SINGLE_KEYBOARD`
- `FREE_CURSOR_SOURCE_SWIPE_DEL`
- `FREE_CURSOR_SOURCE_SWIPE_DPAD`
- `FREE_CURSOR_SOURCE_SWIPE_SPACE`
- `FREE_CURSOR_SOURCE_UNSPECIFIED`

This directly proves that this Gboard build has named Free Cursor activation sources for long-press on the spacebar (single-keyboard and multi-keyboard variants), as well as a swipe-on-space source.

**Important limitation:** The enum constants alone do not prove which source is enabled by default, what gesture threshold activates it, or whether it is selected in the target layout/configuration. Those details require control-flow and resource/configuration inspection.

### 1.3. Gboard has an existing spacebar scrub-move handler

**Confirmed DEX classes:**
- `com.google.android.libraries.inputmethod.motioneventhandler.scrubmove.ScrubMotionEventHandler`
- `com.google.android.libraries.inputmethod.motioneventhandler.scrubmove.ScrubMoveMotionEventHandler`
- `com.google.android.libraries.inputmethod.motioneventhandler.scrubmove.ScrubDeleteMotionEventHandler`

Relevant method references in `ScrubMotionEventHandler`:

- `g(MotionEvent)` references:
  - `MotionEvent.getActionMasked()`, `getActionIndex()`, `getPointerId()`, `getX()`, and `getEventTime()`;
  - `SoftKeyboardView.A(MotionEvent, int)` to resolve the view under a pointer;
  - `SoftKeyView.f(qae)` and `ActionDef.b()` to inspect the action associated with a key;
  - `b(MotionEvent)`, `r(MotionEvent, boolean)`, and `t(MotionEvent)` on the same handler.
- `p(MotionEvent, int)` reads motion history using `getHistorySize()`, `getHistoricalX()`, and `getHistoricalY()`, then calls `o(int, float, float)`.
- `o(int, float, float)` uses `Rect.contains()`, `Math.abs()`, and a handler threshold accessor `c()`.
- `r(MotionEvent, boolean)` references the `noScrubbing` editor option and reads pointer coordinates.

The constructor obtains integer and dimension resources and constructs a configuration object. This indicates that scrub behavior is resource/configuration-driven; exact values were not decoded in this pass.

### 1.4. The normal keyboard touch pipeline is present in the APK

- `KeyboardViewHolder.dispatchTouchEvent(MotionEvent)` is present in `classes.dex`. Its method references include coordinate adjustment/transform operations and ultimately `View.dispatchTouchEvent(MotionEvent)`.
- `SoftKeyboardView.dispatchTouchEvent(MotionEvent)` is also present. It references `AdditionalPaddingFrameLayout.dispatchTouchEvent(MotionEvent)`, pointer/action handling, and event recycling/copying.
- `SoftKeyboardView.A(MotionEvent, int)` resolves a child view under a pointer using pointer ID/coordinates and view bounds.

These findings support examining the existing keyboard-view dispatch chain before adding any new hook. They do not, by themselves, establish the safest hook location for the new feature.

### 1.5. Spacebar gestures already have multiple competing feature paths

DEX strings include:
- `FREE_CURSOR_SOURCE_SPACE_LONG_PRESS_SINGLE_KEYBOARD`
- `FREE_CURSOR_SOURCE_SPACE_LONG_PRESS_MULTI_KEYBOARD`
- `FREE_CURSOR_SOURCE_SWIPE_SPACE`
- `INLINE_SUGGESTION_SELECT_BY_SWIPE_ON_SPACEBAR`
- `space_long_press_ime_picker`
- `SWIPE_ON_SPACEBAR`
- `noScrubbing`

This is a major design constraint. Long-press and swipe on the spacebar are already associated with multiple Gboard features. The new Samsung-style language swipe must be arbitrated against these existing handlers rather than layered on top as an independent gesture recognizer.

## 2. Language switching evidence

### Confirmed

- The DEX string tables contain `SWITCH_TO_NEXT_LANGUAGE`.
- Enum class `Lqga;` contains `SWITCH_LANGUAGE` and `SWITCH_TO_NEXT_LANGUAGE` alongside keyboard/extension actions.
- Other DEX strings include `Input.switchToNextLanguage.%s`, `LanguageSwitcherAccessPointProvider`, `PREF_SHOW_LANGUAGE_SWITCH_KEY`, and language-switch event/log identifiers.
- Gboard includes `InputMethodManagerWrapper.hasOtherSwitchableImes` and code paths with language/IME switch terminology.

### Not confirmed

- No exact DEX string/enum label `SWITCH_TO_PREVIOUS_LANGUAGE` was found in the four DEX string tables during this pass.
- This does **not** prove that reverse language switching is impossible. It may be implemented through an index/list operation, an obfuscated method, or another API without that literal identifier.
- The `PREVIOUS` and `moveToPrevious` strings elsewhere in the APK are generic and are not evidence of a previous-language command.

Do not implement previous-language switching by guessing a negative keycode or by opening the language picker after every swipe. The next research step is to trace the language-switch dispatcher and its ordered language list, then determine whether it exposes a reverse operation.

## 3. InputConnection evidence

The DEX contains direct references to:
- `InputConnection.setSelection(int, int)` in `Lpdd.i(InputConnection, int, int)`;
- `InputConnection.finishComposingText()` in `Lphr.dF(...)`;
- `InputConnection.sendKeyEvent(KeyEvent)` in a separate code path.

These references prove that the APK uses these APIs, but this pass has **not** established that the calls above are the implementation used by `FreeCursorKeyboard`. Do not connect unrelated InputConnection call sites to Free Cursor without tracing the call graph.

## 4. Implications for GboardSamsung architecture

1. **Investigate/reuse Free Cursor first.** The target APK already includes a Free Cursor keyboard and explicit activation-source constants for long-press on space. The first implementation option should be to activate/adapt this existing subsystem if it can be safely reached.
2. **Do not add a custom cursor runtime yet.** First establish what `FreeCursorKeyboard`, `FreeCursorMotionEventHandler`, and `TriggerFreeCursorMotionEventHandler` do in full control flow and how they are selected.
3. **Treat spacebar as a contested gesture surface.** Free Cursor long-press, Free Cursor swipe-space, Scrub Move, inline suggestion swipe-selection, and long-press IME picker all appear in the same APK. A single arbitration policy is required.
4. **Preserve the existing dispatch/composer architecture.** The APK has both `KeyboardViewHolder.dispatchTouchEvent` and `SoftKeyboardView.dispatchTouchEvent`. The repository already hooks the former for Swipe Dismiss. Do not add a second independent hook to the same method.
5. **Keep language direction separate from cursor movement.** `SWITCH_TO_NEXT_LANGUAGE` is visible, but a previous-language operation has not yet been identified.

## 5. Required next investigation

Use JADX/Baksmali on this exact APK when available, and inspect full method bodies for:

1. `FreeCursorKeyboard.e(EditorInfo, Object)`, `eR(SoftKeyboardView, KeyboardViewDef)`, `m(Lohe)`, `P(Lohe)`, `h()`, and constructor.
2. `FreeCursorMotionEventHandler` and `TriggerFreeCursorMotionEventHandler` full touch/state logic.
3. `ScrubMotionEventHandler.g/r/p/o` and `ScrubMoveMotionEventHandler` integration/configuration.
4. The code that maps `FREE_CURSOR_SOURCE_SPACE_LONG_PRESS_SINGLE_KEYBOARD` and `...MULTI_KEYBOARD` to the activation event.
5. The code that maps `SWITCH_TO_NEXT_LANGUAGE` and the active language list to a language change, then look for a reverse/index-decrement path.
6. Resource values for the Free Cursor thresholds, long-press timing, movement acceleration, and spacebar gesture configuration.

## 6. Reproducibility and artifact policy

- The original APK and extracted DEX files were inspected locally.
- APK and DEX binaries were **not** added to the GitHub repository.
- The extracted evidence is limited to class/method/string references; no source code, bindings, Gradle files, workflows, or patch implementation were changed.
