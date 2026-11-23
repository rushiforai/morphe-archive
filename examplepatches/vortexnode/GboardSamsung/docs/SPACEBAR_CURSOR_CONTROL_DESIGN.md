> **Актуальное обновление после повторного анализа оригинального APK:** см. [SPACEBAR_STAGE_4_2_APK_REANALYSIS.md](SPACEBAR_STAGE_4_2_APK_REANALYSIS.md).
> Этот документ ниже содержит предыдущие заметки; если они расходятся с новым отчётом, приоритет у нового отчёта.
# Архитектура управления курсором с пробела и единого Touch Dispatcher (Gboard 18.5.4)

> **Статус документа:** Архитектурная спецификация Stage 4.2 для `vortexnode/GboardSamsung` (`main`) под целевую версию Gboard `18.5.4.993608717-release-arm64-v8a` (Samsung Galaxy S22 5G `SM-S901U1`, Android 16 / One UI 8).
> **Доказательная база:** [`docs/SPACEBAR_STAGE_4_1_DEEP_BYTECODE_TRACE.md`](./SPACEBAR_STAGE_4_1_DEEP_BYTECODE_TRACE.md) и [`docs/SPACEBAR_STAGE_4_2_BYTECODE_TRACE.md`](./SPACEBAR_STAGE_4_2_BYTECODE_TRACE.md).
> **Статус реализации:** **`BLOCKED`** — код патчей и runtime не изменяются до закрытия блокеров Stage 4.2 (`Lonl`/`Long`/`Loni`, `Looe.a`, producer `Lomw.a`, xrefs `enable_scrub_move`, а также `PREVIOUS` language в [`SPACEBAR_LANGUAGE_SWITCH_DESIGN.md`](./SPACEBAR_LANGUAGE_SWITCH_DESIGN.md)).

---

## 1. Целевое пользовательское поведение и жёсткие ограничения (Samsung Keyboard UX)

### 1.1. Обязательная модель взаимодействия с пробелом
1. **Короткое нажатие пробела** — обычная вставка пробела (без задержки при быстром наборе).
2. **Свайп слева направо (L→R)** — `NEXT` language (строго внутри Gboard, без системного диалога и внешних IME).
3. **Свайп справа налево (R→L)** — `PREVIOUS` language (строго внутри Gboard, циклически для `N = 2, 3, 4`).
4. **Удержание пробела + перемещение пальца** — непрерывное управление текстовым курсором без отрыва пальца; завершение режима на `ACTION_UP` без вставки пробела и без открытия `space_long_press_ime_picker`.

### 1.2. Категорические запреты на UI и настройки
- **Отдельный Trackpad UI НЕ нужен.**
- **Запрещено добавлять:**
  - Trackpad-кнопку;
  - отдельный ручной Trackpad-режим;
  - дополнительные переключатели, пользовательские настройки или кнопки управления.
- Внутренние классы и state machine Gboard Free Cursor допускается использовать **только** при условии, что они обеспечивают мгновенный переход «удержание пробела → движение курсора → отпускание = выход» **без** показа пользователю лишних элементов управления (lock-кнопки, locked-панели, отдельных кнопок Trackpad).

---

## 2. Доказанная карта внутренних механизмов Gboard 18.5.4 (`CONFIRMED` vs `BLOCKED`)

### 2.1. Внутренняя архитектура Free Cursor (`classes2.dex`, `classes3.dex`)

| Компонент | Дескриптор / `code_item_off` | Подтверждённая роль | Статус |
|---|---|---|---|
| Источники активации | `classes3.dex` `Lxfe;<clinit>` (`0x1b9d24`) | 7 констант: `a=UNSPECIFIED`, `b=DIRECT_KEYCODE`, `c=SWIPE_SPACE`, `d=SWIPE_DPAD`, `e=SPACE_LONG_PRESS_SINGLE_KEYBOARD`, `f=SPACE_LONG_PRESS_MULTI_KEYBOARD`, `g=SWIPE_DEL` | `CONFIRMED` |
| Вход в `FreeCursorKeyboard` | `classes2.dex` `FreeCursorKeyboard;->e` (`0x59ebbc`) | При `payload == null` (`+0028..+0039`) вызывает `this.u.p(true)` (`Lpex;->p(Z)Z`) и сам выставляет `Lxfe.f` / `Lxfe.e`; видимость lock-кнопки `this.v` управляется флагом `Loml;->D:Lokc;->g()` (`+00de..+00f6`) | `CONFIRMED` |
| Активация свайпом | `classes2.dex` `Looc;->a` (`0x5a2e14`) | Отправляет `-10104` (`SWITCH_KEYBOARD_WITH_PAYLOAD`) с `Lqci(Lomw.a, map)` (`Lxfe.c` при `d==62`) через `Lqit;->n(Lohe;)V` (`+01cc..+020c`) | `CONFIRMED` |
| Handoff и генерация DPAD | `classes2.dex` `FreeCursorMotionEventHandler` (`0x5a163c`, `0x5a1a64`, `0x5a19f0`, `0x5a1994`, `0x5a17e0`) | `gt()` всегда возвращает `true`; `gs()`/`g()` делегируют в `Lonk;->a(MotionEvent)`; `c()` шлёт `DPAD (19..22)` через `Lqit;->n`; `o()` отменяет корутины (`p()`) и шлёт `-10215` (`FREE_CURSOR_LOCK`) с `Lonu.a` | `CONFIRMED` |
| Lock-состояния и выход | `classes2.dex` `FreeCursorKeyboard;->R/F/h/K/M` (`0x59e954`, `0x59eb90`, `0x59edd4`, `0x59f51c`, `0x59f5b8`) | `R(Lonu.a)` вызывает `F()` → `-10004` (`SWITCH_KEYBOARD`, `Lqch.b` = Prime); все UI-элементы `v`, `w`, `K`, `L`, `M`, `h` null-safe и отделены от отправки DPAD; `h()` гарантированно отпускает `SHIFT_LEFT (59)` через `M()` | `CONFIRMED` |
| State machine касаний Free Cursor | `classes2.dex` `Lonl;`, `Long;`, `Loni;`, `Lonk;->a` | Переходы `ACTION_DOWN`/`MOVE`/`UP`/`CANCEL`, обратный отсчёт `Lonr`, вызов `o()` на `ACTION_UP`, переносимость synthetic `ACTION_CANCEL` | **`BLOCKED`** |
| `ACTION_DOWN`-гейт свайпа | `classes2.dex` `Looe;->a(MotionEvent)Loof;` | Условия старта `TriggerFreeCursorMotionEventHandler` | **`BLOCKED`** |
| Продюсер space long-press | xrefs на `Lomw;->a`, `"space_long_press_ime_picker"`, `Lqin;->y()` | Кто формирует `-10004 (Lomw.a)` при удержании пробела и передаёт живой палец в `FreeCursorMotionEventHandler` | **`BLOCKED`** |

### 2.2. Отделение механики Free Cursor от лишнего UI (п. 10)
На основании декодирования `FreeCursorKeyboard;->e` (`0x59ebbc`) и `FreeCursorKeyboard;->R` (`0x59e954`):
- **Что уже доказано:** lock-кнопка (`v`), countdown-метка (`w`), панель locked-режима (`K`, `L`, `M`) и подсказка (`h`) не участвуют в генерации `DPAD`-событий (`FreeCursorMotionEventHandler;->c()`). При `Loml;->D == false` (`free_cursor_lock_mode = false`) кнопка `v` скрыта (`GONE`), а при отсутствии входа в состояние `Lons.a` панель `K` остаётся скрытой (`GONE`).
- **Что не доказано (`BLOCKED`):**
  1. Не запускается ли `Lonr` (lock countdown) в `Lonl`/`Long`/`Loni` даже при `Loml;->D == false`.
  2. Можно ли активировать `FreeCursorKeyboard` без показа полноэкранного Trackpad-полотна или с мгновенным прозрачным возвратом на `ACTION_UP` после синтетического `ACTION_CANCEL`.

### 2.3. Конкурирующие Scrub-обработчики на пробеле и сохранение `ScrubDelete` (`classes.dex`)

| Обработчик | Ключевые параметры (доказано) | Конфликт с пробелом | Решение по изоляции |
|---|---|---|---|
| `ScrubMoveMotionEventHandler` | `0x1f12b4`: `keyCode=62 (SPACE)`, `-10061..-10062`, двунаправленный `p(event, 3)`, `noScrubbing` via `Lobk.v` | **Прямой конфликт** со свайпом языка по пробелу | Перехватывать жест на `keyboard_body_view_holder` выше `SoftKeyboardView` до срабатывания `ScrubMove` (или отключать `ScrubMove` только после проверки xrefs `"enable_scrub_move"` / `0x7f14096b` — сейчас **`BLOCKED`**) |
| `ScrubDeleteMotionEventHandler` | `0x1f0fdc`/`0x521458`: `keyCode=67 (DEL)`, `leaveKeyRect=true`, `-10050..-10063`, `0x7f0300ba`, `!Lqit.q()` | **Нет конфликта по клавише** (`67 != 62`) | **Обязательно сохранить 100% работоспособность:** единый диспетчер активируется только при `ACTION_DOWN` внутри `SoftKeyView` с `keyCode == 62`, полностью пропуская `keyCode == 67`; глобальный флаг `"enable_scrub_move"` НЕ трогать до проверки его xrefs |
| `InlineSuggestionScrubSpaceMotionEventHandler` | `0x1eace0`/`0x4fbc58`: `keyCode=62 (SPACE)`, `-50001..-50004`, активен **только** при `Lqlp;->e(Lpaw;->a)Z == true`, **однонаправленный** (`dir=1/2` по RTL/LTR `Lsfc;->G()`) | **Условный конфликт** при активной inline-подсказке | При `Lqlp;->e(Lpaw;->a)Z == true` либо уступать свайп в направлении подсказки (`dir`) штатному `InlineSuggestionScrubSpace`, либо чётко документировать приоритет (проверяется в Stage 4.2 после дампа приоритета регистрации) |

---

## 3. Архитектура единого Touch Dispatcher (совместимость с `SwipeDismissPatch`)

### 3.1. Доказанное ограничение текущего репозитория (`CONFIRMED`)
- `patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/swipedismiss/GboardSwipeDismissBytecodePatch.kt` вставляет перехват в индекс `0` метода `Lcom/google/android/libraries/inputmethod/keyboard/impl/KeyboardViewHolder;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z` и проверяет инвариант:
  `check(existing == 1 && instructions.first().isMethodReference(abi.reference))`.
- `GboardSwipeDismissRuntime.java` (строки 20, 33, 136–152) обслуживает **исключительно** `KeyboardViewHolder` с именем ресурса `"keyboard_header_view_holder"`, а для отмены дочернего дерева при распознавании свайпа использует `ThreadLocal<Boolean> CANCELLING` + один синтетический `MotionEvent.ACTION_CANCEL` (строки 92–100).

### 3.2. Целевая топология единого диспетчера (один хук на `KeyboardViewHolder.dispatchTouchEvent`)

Вместо добавления второго хука в `KeyboardViewHolder.dispatchTouchEvent` единственный пролог на индексе `0` делегирует вызов единому композитору `GboardTouchDispatchRuntime.onHolderTouch(View holder, MotionEvent event)`:

```text
KeyboardViewHolder.dispatchTouchEvent(event)   [ЕДИНСТВЕННЫЙ хук на индексе 0]
  │
  ├─ if (CANCELLING.get()) ──────────────────► вернуть false (пропустить синтетический ACTION_CANCEL в super)
  │
  ├─ if (holder == "keyboard_header_view_holder")
  │    └─► GboardSwipeDismissRuntime.onHeaderTouch(holder, event)   [5. Swipe Dismiss — без изменений]
  │
  └─ if (holder == "keyboard_body_view_holder")
       └─► SpacebarGestureCoordinator.onBodyTouch(holder, event)
             ├─ ACTION_DOWN НЕ на SoftKeyView(keyCode == 62):
             │    └─► вернуть false ─────────► [1. Обычный ввод / Glide Typing]
             │                                  [4. ScrubDelete (keyCode == 67)]
             │
             ├─ ACTION_DOWN на SoftKeyView(keyCode == 62):
             │    ├─ Если активна inline-подсказка (Lqlp.e(Lpaw.a)) и свайп в её направлении:
             │    │    └─► вернуть false ────► [6. InlineSuggestion scrub]
             │    ├─ Горизонтальный свайп до истечения hold-таймера:
             │    │    └─► отменить hold-таймер, послать 1x ACTION_CANCEL под CANCELLING,
             │    │        вызвать NEXT (L→R) / PREVIOUS (R→L) [2. NEXT/PREVIOUS language],
             │    │        поглощать хвост жеста до ACTION_UP (0 случайных пробелов)
             │    ├─ Удержание >= holdTimeout без выхода за touchSlop:
             │    │    └─► [3. Cursor Control — OPTION A или OPTION B]
             │    └─ Короткий тап (ACTION_UP до holdTimeout и без свайпа):
             │         └─► вернуть false ────► штатная вставка пробела [1. Обычный ввод]
```

### 3.3. Сравнение двух вариантов реализации курсора внутри единого диспетчера

| Критерий | `OPTION A` — Внутренний Free Cursor Gboard | `OPTION B` — Прямой `InputConnection` DPAD-трекпад |
|---|---|---|
| **Зависимость от `Lonl`/`Long`/`Loni` и `Lomw.a` producer** | **Критическая (`BLOCKED`)** — требуется доказать live handoff после удержания пробела, отсутствие залипания lock и поведение после `ACTION_CANCEL` | **Не зависит от внутренней state machine Free Cursor**, но корректность собственной доставки MOVE/UP и DPAD ещё не проверена |
| **Поведение synthetic `ACTION_CANCEL`** | **`BLOCKED`** — риск, что `ACTION_CANCEL` на `SoftKeyboardView` оборвёт pointer в `MotionEventHandler` до `FreeCursorMotionEventHandler.gs()` | **Потенциально контролируемо, но НЕ ДОКАЗАНО** — собственный диспетчер мог бы получать MOVE/UP после отмены дочернего касания, однако фактическая доставка событий и поведение `KeyboardViewHolder`/`SoftKeyboardView` должны быть проверены на байткоде и runtime |
| **Лишний Trackpad UI / кнопки** | Требует доказать отсутствие lock-панели/кнопок (`Loml.D=false` скрывает `v`, но сама `FreeCursorKeyboard` подменяет раскладку на Trackpad-поверхность) | **0 лишнего UI** — клавиатура остаётся на месте (как в Samsung Keyboard), никаких кнопок/переключателей |
| **Поддержка composing / выделения / `noScrubbing`** | Встроена в `FreeCursorKeyboard` (`FINISH_INLINE_COMPOSING -10090`, `DPAD 19..22`), но проверка `noScrubbing` в `Looe.a` не дамплено (`BLOCKED`) | `InputConnection.finishComposingText()` перед первым шагом + сбалансированные пары `KeyEvent(ACTION_DOWN/UP, KEYCODE_DPAD_LEFT/RIGHT, SOURCE_KEYBOARD)` + явная проверка `EditorInfo.privateImeOptions` (`noScrubbing`) |
| **Текущий статус выбора** | **`BLOCKED`** до декодирования Пакета 2 Stage 4.2 | **НЕ ПРОВЕРЕН (`UNVALIDATED FALLBACK`)** — это только архитектурная гипотеза. До реализации требуется доказать совместимость `InputConnection`/DPAD с composing, selection, password/number fields, RTL, hardware keyboard, редакторами разных приложений и единым touch dispatcher; требуется runtime-тестирование. Сам факт наличия API `InputConnection.sendKeyEvent()` в DEX не доказывает пригодность этого варианта. |

---

## 4. Критерии разблокировки перед началом реализации

Реализация управления курсором и единого touch dispatcher **не начинается** до выполнения всех 4 условий:
1. Декодированы `Lonl;`, `Long;`, `Loni;`, `Lonk;->a(MotionEvent)` и `Looe;->a(MotionEvent)` (`classes2.dex`) — принято окончательное доказанное решение **`OPTION A` vs `OPTION B`**.
2. Декодированы xrefs на `Lomw;->a`, `"space_long_press_ime_picker"` и `Lqin;->y()V` — подтверждено гарантированное подавление системного IME-пикера при удержании пробела.
3. Декодированы xrefs на `"enable_scrub_move"` / `0x7f14096b` и регистрацию `Scrub*`-обработчиков — доказано 100% сохранение `ScrubDeleteMotionEventHandler`.
4. Закрыт блокер `PREVIOUS language` (обработчики `-10000`/`-10011`/`-10197` и `Lpex;`) в [`SPACEBAR_LANGUAGE_SWITCH_DESIGN.md`](./SPACEBAR_LANGUAGE_SWITCH_DESIGN.md).
