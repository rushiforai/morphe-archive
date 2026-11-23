# Samsung Keyboard 5.9.50.10 — DEX bytecode reference extract

**Source APK:** `Клавиатура_Samsung_v5.9.50.10_c87b(1).apk`  
**Package:** `com.samsung.android.honeyboard`  
**APK SHA-256:** `c87bfd9ae4bb9e17f527a53aaccd955cbc203083dabe9fc9673134d4adbbfb8e`  
**DEX files:** `classes.dex`, `classes2.dex`, `classes3.dex`

> **Scope and limitation:** This is a method-reference and string-reference extraction from the actual DEX `code_item` bytecode. It is not a JADX Java decompilation and not a complete Smali disassembly. Class and method names may be obfuscated. The call lists are useful cross-reference evidence, but do not by themselves prove every branch or runtime condition.

## Confirmed bytecode-level leads

1. The exact identifiers `space_lang_change_next` and `space_lang_change_prev` both occur in the language gesture path. Both are referenced by `Lrd0/m.r(Lnd0/a;)Lfd0/b;`.
2. `Li90/b.e()Lk90/a;` references `space_lang_change_prev` and constructs/returns the enum-like `k90/a` key/bubble result. Its invocation references include `Ll90/h.e()`, `Ll90/f.e()`, `Ll90/g.b()`, `Lk90/a.<init>(...)`, and key-view/key-code accessors.
3. `Lrd0/m.r(...)` also loads the log string `sendLanguageChangeToAction: inputText = `. Its call references include `Li90/b.e()`, `Lqf/f.d(...)`, `Lqb0/j.d(...)`, and `Lag/a.m(...)`. This is strong evidence that the next/previous identifiers are translated into a language-change action.
4. The actual view class `com.samsung.android.honeyboard.textboard.keyboard.view.SpaceCursorControlLayout` has `onTouchEvent(MotionEvent)`. That method calls `Lvd0/a.f()`, `Lvd0/j.h()`, and `Lvd0/a.e(Lqf/h;)`, tying the dedicated space cursor layout into the cursor-control path.
5. `Lvd0/a.d(I)V` references `InputConnection.getTextAfterCursor(...)` and `getTextBeforeCursor(...)`, and invokes `Lyd0/j.a(III)` repeatedly.
6. `Lyd0/j.a(III)V` constructs an Android `KeyEvent`, calls `setSource(I)`, and invokes `InputConnection.sendKeyEvent(KeyEvent)`. This confirms the cursor path uses editor key events, rather than only drawing a cursor overlay.
7. `Lvd0/i.onTouch(View, MotionEvent)` is a large touch handler. Its code references `cursor_control_move`, `MotionEvent.getAction/getActionMasked/getPointerCount/getX/getY/getHistorySize/getHistoricalX/getHistoricalY`, direction/gesture helpers, and `InputConnection.getTextBeforeCursor/getTextAfterCursor`.
8. `Lx80/b.onAppPrivateCommand(String, Bundle)` references the exact identifier `Func_LanguageChange`. This is an input-method private-command path; its exact semantics still require full instruction-level review.

## Relevant methods and their call references

### Bidirectional spacebar language switching

**DEX:** `classes2.dex`

- `Li90/b.e()Lk90/a;` — 298 code units; string reference: `space_lang_change_prev`. Invocation references include:
  - `Ll90/h.e()`
  - `Ll90/f.e()`
  - `Ll90/g.b()`
  - `Lk90/a.<init>(...)`
  - `R90 key/bubble view and key-code accessors` (obfuscated classes: `Lr90/b`, `Lr90/e`, `Lr90/g`)
- `Lrd0/m.r(Lnd0/a;)Lfd0/b;` — 178 code units; string references:
  - `touchInfo`
  - `no match pointer id`
  - `sendLanguageChangeToAction: inputText = `
  - `space_lang_change_next`
  - `space_lang_change_prev`
  
  Invocation references:
  - `Li90/b.e()`
  - `Lb90/c.c(CharSequence)`
  - `Lb70/a.a(Lc70/b)`
  - `Lqf/f.d(Lqf/h, J)`
  - `Lqb0/j.d(Lod0/a)`
  - `Lag/a.m(I, I, ...)`
- `Ln50/b.d()Ljava/lang/String;` references `ChangeLanguageGestureA`.
- `Lx80/b.onAppPrivateCommand(String, Bundle)` references `Func_LanguageChange`.

### Cursor movement through the spacebar

**DEX:** `classes2.dex`

- `SpaceCursorControlLayout.onTouchEvent(MotionEvent)` — 34 code units. Calls:
  - `Lvd0/a.f()`
  - `Lvd0/j.h()`
  - `Lvd0/a.e(Lqf/h;)`
- `Lvd0/a.d(I)V` — 206 code units. Calls:
  - `InputConnection.getTextAfterCursor(II)`
  - `InputConnection.getTextBeforeCursor(II)`
  - `Lyd0/j.a(III)` (multiple invocations)
  - `Lyd0/j.b()`
  - `Lvd0/a.c()`
- `Lyd0/j.a(III)V` — 34 code units. Calls:
  - `SystemClock.elapsedRealtime()`
  - `KeyEvent.<init>(JJIIIIIII)`
  - `KeyEvent.setSource(I)`
  - `InputConnection.sendKeyEvent(KeyEvent)`
- `Lvd0/a.b(F)V` — 51 code units. Calls `Handler.hasMessages`, `sendEmptyMessageDelayed`, and `removeMessages`; timing/repeat behavior needs branch-level inspection.
- `Lvd0/i.onTouch(View, MotionEvent)` — 2,167 code units. Contains `cursor_control_move` and detailed pointer/motion handling. It also calls `InputConnection.getTextBeforeCursor` and `getTextAfterCursor`.
- `Lk50/a.d()Ljava/lang/String;` references `CursorControlA`.
- `Lvd0/a.c()` references `CursorControlActionListener`.
- `Lh90/f.<clinit>()V` references enum-like identifiers `CURSOR_UP`, `CURSOR_DOWN`, `CURSOR_LEFT`, `CURSOR_RIGHT`, plus text-edit actions.

## What is not yet proven

- Exact swipe thresholds, touch timing, pointer ownership rules, and cancellation behavior.
- Exact integer key codes associated with each cursor direction.
- Whether the language gesture's next/previous identifiers are consumed by a single shared gesture state machine or separate handlers.
- Exact relationship between `ChangeLanguageGestureA`, `CursorControlA`, and the runtime gesture dispatcher.
- Full branch/control-flow behavior of the obfuscated methods.

## Next required technical step

Run JADX or Baksmali on this exact APK/DEX set and inspect the full method bodies for:

1. `Li90/b.e()` and `Lrd0/m.r(...)` — establish how next/previous are selected and dispatched.
2. `SpaceCursorControlLayout.onTouchEvent(...)`, `Lvd0/a.d(I)`, `Lvd0/i.onTouch(...)`, and `Lyd0/j.a(III)` — establish long-press activation, cursor movement, repeat/acceleration, and event codes.
3. `Lx80/b.onAppPrivateCommand(...)` — establish the role of `Func_LanguageChange`.
4. `Ln50/b` and `Lk50/a` — trace the gesture adapter identifiers to the actual dispatcher.

**Do not treat the identifiers or call lists as a substitute for full control-flow analysis.** No GboardSamsung source code, Gradle configuration, workflows, or patch implementation is changed by this report.
