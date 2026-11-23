# Gboard 18.5.4 — DEX bytecode reference extract

**Source APK:** `Gboard-v18.5.4.993608717-release-arm64-v8a.apk`  
**APK size:** 95,577,506 bytes  
**APK SHA-256:** `f47f44d33ab21d28aabfaec8292009c1173964ea238441734327a0a15ba32813`  
**DEX set:** `classes.dex`, `classes2.dex`, `classes3.dex`, `classes4.dex`

## Scope and limitations

This report is generated from the exact APK above. The four original DEX files were extracted byte-for-byte and ZIP integrity passed. Their SHA-256 values:

| DEX | Size | SHA-256 |
|---|---:|---|
| classes.dex | 7,859,484 | `b403bf2797f56b6bae2ac3f6a10fe10fba3012b201b7c26c120f7370139f606e` |
| classes2.dex | 8,465,652 | `2529a75190010707d17b51f0a63cccb9a2b8dae5a6c9c598445edd7588a7959d` |
| classes3.dex | 3,683,072 | `53e70ef05fe2515e4675d25d2b08708698095d95aa06dca4201d15c7f7cd8f92` |
| classes4.dex | 680,452 | `0b5f0b0e2c28e06b9ac81b063f95848b04ea236f3a49df6bf2649c9fb90d7e17` |

**Important:** this is a DEX structure / symbol / method-reference extract, not a JADX Java decompilation, not a complete Smali disassembly, and not a CFG. The method index lists method identifiers/descriptors, not method bodies. Presence of a symbol or method ID does not prove invocation, control flow, event ownership, timing, or runtime behavior. No instruction offsets are claimed here.

## Confirmed class and method references

### Free Cursor
- `classes2.dex`: `Lcom/google/android/libraries/inputmethod/freecursor/FreeCursorKeyboard;`
- `classes2.dex`: `Lcom/google/android/libraries/inputmethod/freecursor/FreeCursorMotionEventHandler;`
- `classes2.dex`: `Lcom/google/android/libraries/inputmethod/freecursor/TriggerFreeCursorMotionEventHandler;`
- `FreeCursorKeyboard` has constructor `<init>(Context, ... KeyboardDef, ImeDef, ...)`, lifecycle-like methods `F()V`, `H()V`, `I()V`, `J()V`, `K()V`, `M()V`, `N()V`, `P(Lohe;)Z`, `m(Lohe;)Z`, `O()Z`, `o()Lomn;` and others. These names alone do not establish their semantics.
- `FreeCursorMotionEventHandler` exposes methods accepting `MotionEvent`, including `b(MotionEvent,Integer,Integer)`, `g(MotionEvent)`, `gs(MotionEvent)`, `gt(MotionEvent)`, plus `close()`, `f()`, `l()`, `p()`.
- `TriggerFreeCursorMotionEventHandler` exposes `g(MotionEvent)`, lifecycle methods `b()`, `d()`, `f()`, `l()`, `close()`.

### Existing touch dispatch and competing handlers
- `classes.dex`: `Lcom/google/android/libraries/inputmethod/keyboard/impl/KeyboardViewHolder;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z`
- `classes.dex`: `Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z`
- `classes.dex`: `SoftKeyboardView.onTouchEvent(MotionEvent)`
- `classes.dex`: `InlineSuggestionScrubSpaceMotionEventHandler.b(MotionEvent)`
- `classes.dex`: `ScrubDeleteMotionEventHandler.b(MotionEvent)`
- `classes.dex`: `ScrubMotionEventHandler` has multiple MotionEvent methods, including `b(MotionEvent)`, `g(MotionEvent)`, `p(MotionEvent,int)`, `r(MotionEvent,boolean)`, `t(MotionEvent)`.
- `classes.dex`: `ScrubMoveMotionEventHandler` class and constructor.
- `classes2.dex`: additional constructors for inline-suggestion and scrub handlers.

### Language and source enums
- `classes.dex` contains enum-like `Lqga;` with `values()`, `a()`, `b()`, `c()`.
- `classes3.dex` contains enum-like `Lxfe;` with `values()`, `a()`, `toString()`.
- Existing extracted string references include `SWITCH_TO_NEXT_LANGUAGE`, `SWITCH_LANGUAGE`, `FREE_CURSOR_SOURCE_SPACE_LONG_PRESS_SINGLE_KEYBOARD`, `FREE_CURSOR_SOURCE_SPACE_LONG_PRESS_MULTI_KEYBOARD`, `FREE_CURSOR_SOURCE_SWIPE_SPACE`, `SWIPE_DEL`, `SWIPE_DPAD`, `space_long_press_ime_picker`, `SWIPE_ON_SPACEBAR`, and `INLINE_SUGGESTION_SELECT_BY_SWIPE_ON_SPACEBAR`.
- The exact string `SWITCH_TO_PREVIOUS_LANGUAGE` was not found in the four DEX string tables during the initial scan. This does **not** prove that PREVIOUS is impossible; inspect enum values, action mapping, and actual instruction paths before deciding.

## Existing GboardSamsung integration constraint

The current project already hooks `KeyboardViewHolder.dispatchTouchEvent(MotionEvent)` for Swipe Dismiss. Do not add a second independent hook to the same method. Any new spacebar dispatch must be designed around the existing hook/composer and verified against the actual current source.

## Required next bytecode work

1. Decode actual `code_item` instructions for `FreeCursorKeyboard`, `FreeCursorMotionEventHandler`, and `TriggerFreeCursorMotionEventHandler`. Trace activation, long-press timing, ACTION_MOVE, ACTION_UP, ACTION_CANCEL, pointer IDs, ownership, and cleanup.
2. Decode the `Lxfe;` enum values and every relevant call site. Determine whether `FREE_CURSOR_SOURCE_SPACE_LONG_PRESS_SINGLE_KEYBOARD` / `...MULTI_KEYBOARD` are triggered by the intended long-press route, and how `FREE_CURSOR_SOURCE_SWIPE_SPACE` differs.
3. Trace `Lqga;` and all language-switch action mapping. Establish a safe PREVIOUS mechanism and how it is constrained to the active IME's enabled language list.
4. Trace competing scrub, scrub-delete, inline-suggestion, and spacebar handlers through the real dispatch chain.
5. Account for the existing `KeyboardViewHolder.dispatchTouchEvent` hook; do not create a duplicate hook.
6. Report exact DEX, class descriptor, method descriptor, code_item offset, instruction offsets, branches, and relevant invoke instructions. If code_item decoding is unavailable, mark the item BLOCKED; do not infer control flow from method IDs or strings.

## Source files

- `GBOARD_18.5.4_TARGETED_METHOD_INDEX.txt` — filtered method-ID references from all four DEX files.
- `README_FOR_AI_STUDIO_RU.md` — source APK identity, DEX inventory, extraction details, and limitations.
