> **Актуальное обновление после повторного анализа оригинального APK:** см. [SPACEBAR_STAGE_4_2_APK_REANALYSIS.md](SPACEBAR_STAGE_4_2_APK_REANALYSIS.md).
> Этот документ ниже содержит предыдущие заметки; если они расходятся с новым отчётом, приоритет у нового отчёта.
# Stage 4.2 — Deep Bytecode Trace: Free Cursor Long-Press Handoff + Safe `PREVIOUS` Language

> **Статус этапа:** **АУДИТ ВЫПОЛНЕН; КРИТИЧЕСКИЕ БЛОКЕРЫ PART A И PART B ОСТАЮТСЯ `BLOCKED` ИЗ-ЗА ОТСУТСТВИЯ БИНАРНЫХ DEX И STAGE 4.2 `code_item`-ДАМПОВ В КОНТЕЙНЕРЕ.**
>
> **Репозиторий:** `vortexnode/GboardSamsung` (`main`)
> **Целевая версия Gboard:** `18.5.4.993608717-release-arm64-v8a` (`SHA-256: f47f44d33ab21d28aabfaec8292009c1173964ea238441734327a0a15ba32813`)
> **Целевое устройство:** Samsung Galaxy S22 5G (`SM-S901U1`), Android 16 / One UI 8
> **Запрет этапа (п. 14):** Исходный код патчей, runtime, Gradle, зависимости, биндинги, тесты и файлы в `docs/research/gboard-18.5.4/` **не изменялись**; сборки `.mpp`/APK **не запускались**.

---

## 1. Обязательная предварительная проверка доступных артефактов (п. 2)

Перед началом трассировки выполнена полная инвентаризация файловой системы рабочего пространства:

### 1.1. Что доступно в рабочем пространстве
1. **Текстовые экстракты Stage 4.1 в `docs/research/gboard-18.5.4/` (ровно 5 файлов, без новых выгрузок Stage 4.2):**
   - `GBOARD_18.5.4_DEX_REFERENCE_EXTRACT.md` (паспорт APK и SHA-256 всех 4 DEX)
   - `GBOARD_18.5.4_TARGETED_METHOD_INDEX.txt` (`method_ids` по Free Cursor, Scrub, `SoftKeyboardView`, `KeyboardViewHolder`, `Lqga;`, `Lxfe;`)
   - `GBOARD_18.5.4_TARGETED_CODE_ITEM_DUMP.txt` (`2 423` строки: `ScrubMotionEventHandler`, `InlineSuggestionScrubSpaceMotionEventHandler`, `ScrubDeleteMotionEventHandler`, `ScrubMoveMotionEventHandler`, `FreeCursorKeyboard`, `FreeCursorMotionEventHandler`, `TriggerFreeCursorMotionEventHandler`)
   - `GBOARD_18.5.4_LANGUAGE_ENUM_XREF_CODE.txt` (`3 622` строки: `Lhcp;->U`, `Ligz;->ad`, `Lpux;->fM/fN`, `Lqcm;-><clinit>`, `Lqev;-><clinit>`, `Lqfz;-><clinit>`, `Lqga;`, `FreeCursorKeyboard;->e/h`, `Lomy;->a`, `Lomz;`, `Looc;->a`, `Lxfe;`)
   - `README_FOR_AI_STUDIO_RU.md`
2. **Контрольный справочник и исходный код репозитория:**
   - `docs/SPACEBAR_STAGE_4_1_DEEP_BYTECODE_TRACE.md`
   - `docs/GBOARD_18.5.4_BYTECODE_REFERENCE_EXTRACT.md`
   - `patches/src/main/resources/gboard/gboard-version-bindings.json` (проверенные биндинги для `Lphr;`, `Lqin;`, `Lqil;`, `Lqij;`, `KeyboardViewHolder;->dispatchTouchEvent`, `SoftKeyView`)
   - `patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/swipedismiss/GboardSwipeDismissBytecodePatch.kt`
   - `extensions/extension/src/main/java/dev/jason/gboardpatches/extension/swipedismiss/GboardSwipeDismissRuntime.java`
   - `extensions/extension/src/main/java/dev/jason/gboardpatches/extension/longpressquickactions/GboardGlobeDragAdapter.java`

### 1.2. Чего НЕТ в рабочем пространстве (причина статуса `BLOCKED`)
- **Бинарный APK** `Gboard-v18.5.4.993608717-release-arm64-v8a.apk` и **бинарные DEX-файлы** (`classes.dex`, `classes2.dex`, `classes3.dex`, `classes4.dex`) в контейнере **отсутствуют** (политика репозитория запрещает коммитить проприетарные APK/DEX).
- **Новые текстовые `code_item`-дампы для пакетов Stage 4.2** (обработчики `-10000`/`-10011`/`-10197`, интерфейс/реализации `Lpex;`, `Lpux;->b()V`, `Lonl`/`Long`/`Loni`/`Lonk`, `Looe;->a`, xrefs на `Lomw;->a`, `"space_long_press_ime_picker"`, `Lqin;->y()`, `"enable_scrub_move"` / `0x7f14096b`) в репозиторий ещё **не загружены**.
- **Принцип строгой доказательности (п. 2 и п. 12):** ни один отсутствующий `code_item` не домысливался; все неподтверждённые узлы честно классифицированы как `BLOCKED` с указанием точного недостающего дампа.

---

## 2. Повторная проверка корректности Dalvik-декодера на контрольных методах (п. 2.5)

Ошибки кастомного авто-дампера Stage 4.1 (неверная ширина `12x`-инструкций `0xc6`–`0xc9`, `0xce` как 2 code units вместо 1 и некорректный разбор `0x0100` `packed-switch-payload`) повторно проверены побитово на сырых 16-bit code units контрольных методов:

### 2.1. Контрольный метод №1 — `ScrubMotionEventHandler;->o(IFF)Z` (`classes.dex`, `code_item_off=0x521488`, `insns_size=65`)
- **Баг дампера на `+0019..+001b`:** дампер склеил `05c7 6432` в 2-unit `op_c7`, из-за чего `0010` было прочитано как `op_10`.
- **Верифицированное декодирование:**
  - `+0017: 3052 1bbd` → `iget v0, v3, ScrubMotionEventHandler;->k:F` (`field@7101`)
  - `+0019: 05c7` → **`sub-float/2addr v5, v0`** (формат `12x`, **1 code unit**)
  - `+001a: 6432 0010` → **`if-eq v4, v6, +0x10`** (формат `22t`, **2 code units**, `branch_target = +0x001a + 0x10 = +0x002a`, где начинается `invoke-virtual {v3}, ScrubMotionEventHandler;->c()F`)
- **Баг дампера на `+0036..+0039`:** дампер склеил `54c7 106e`, сломав `invoke-virtual` (`+0038: op_a0 3aa0 0003`).
- **Верифицированное декодирование:**
  - `+0034: 3452 1bbd` → `iget v4, v3, ScrubMotionEventHandler;->k:F` (`field@7101`)
  - `+0036: 54c7` → **`sub-float/2addr v4, v5`** (формат `12x`, **1 code unit**)
  - `+0037: 106e 3aa0 0003` → **`invoke-virtual {v3}, ScrubMotionEventHandler;->c()F`** (`method@15008`, формат `35c`, **3 code units**), далее `+003a: 030a` (`move-result v3`), `+003b: 032d 0304` (`cmpl-float`), `+003d: 033a 0003` (`if-ltz v3, +0x0040`), `+0040: 010f` (`return v1`). Сумма: `0x41 = 65 == insns_size`. **PASS.**

### 2.2. Контрольный метод №2 — `Looc;->a(Landroid/view/MotionEvent;)Loof;` (`classes2.dex`, `code_item_off=0x5a2e14`, `insns_size=546`)
- **Устранение ложных ссылок дампера на `+0109..+0111`:**
  - Дампер из-за сдвига после `mul-float/2addr` (`0xc8`) выдал ложные поля `EditorInfo;->inputType` и `AddLanguagePreferenceFragment;->an`.
  - **Верифицированное декодирование:**
    - `+0109: a2c8` → `mul-float/2addr v2, v10` (`12x`, **1 unit**)
    - `+010a: 0a54 8265` → `iget-object v10, v0, Looc;->e:Ljava/util/Collection;` (`22c`, **2 units**)
    - `+010c: 0c62 8268` → `sget-object v12, Lood;->...` (`21c`, **2 units**)
    - `+010e: 2071 cdec 0023` → `invoke-static {v3, v2}, method@0xcdec` (возвращает направление `Lood;`, **3 units**)
    - `+0111: 020c` → `move-result-object v2` (`11x`, **1 unit**)
    - `+0112: 2072 a31f 002a` → `invoke-interface {v10, v2}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z` (`method@41759`), `+0116: 0238 00fe` → `if-eqz v2, +0x0214`.
- **Исправление `0xce` (`div-double/2addr`) на `+0183..+0187`:**
  - `+0183: 68ce` → **`div-double/2addr v8, v6`** (`12x`, **1 unit**)
  - `+0184: 022f 0802` → **`cmpg-double v2, v8, v2`** (`23x`, **2 units**)
  - `+0186: 023a 008e` → **`if-ltz v2, +0x8e`** (`21t`, **2 units**, `branch_target = +0x0186 + 0x8e = +0x0214` — точный адрес `return-object v0`!).
- **Исправление `packed-switch` и `packed-switch-payload` (`+01b4..+0221`):**
  - `+01b4: 0052 8264` → `iget v0, v0, Looc;->d:I` (`field@33380`)
  - `+01b6: 0213 003e` → `const/16 v2, 62` (`KEYCODE_SPACE`); `+01b8: 2032 0012` → `if-eq v0, v2, +0x01ca` (`sget-object v0, Lxfe;->c:Lxfe;` = `FREE_CURSOR_SOURCE_SWIPE_SPACE`)
  - `+01ba: 0213 0043` → `const/16 v2, 67` (`KEYCODE_DEL`); `+01bc: 2032 000b` → `if-eq v0, v2, +0x01c7` (`sget-object v0, Lxfe;->g:Lxfe;` = `FREE_CURSOR_SOURCE_SWIPE_DEL`)
  - `+01be: 002b 0058 0000` → `packed-switch v0, +0x58` → таблица по точному смещению `+0x0216`:
    - `+0216: 0100` (`packed-switch-payload` ident), `+0217: 0004` (`size = 4`), `+0218..+0219: 0013 0000` (`first_key = 19`, коды `19..22` = `DPAD_UP/DOWN/LEFT/RIGHT`), `+021a..+0221`: 4 целевых 32-bit смещения `0x00000006` от `+01be` → все 4 ведут на `+01c4` (`sget-object v0, Lxfe;->d:Lxfe;` = `FREE_CURSOR_SOURCE_SWIPE_DPAD`).
  - Сумма: `0x0222 = 546 == insns_size`. **PASS.**

### 2.3. Контрольные методы №3–№4 — `FreeCursorKeyboard;->P(Lohe;)Z` (`0x59e200`) и `FreeCursorMotionEventHandler;->b(...)` (`0x5a1650`)
- В `FreeCursorKeyboard;->P` (`+006f..+0073`): `73c6` (`add-float/2addr v3, v7`), `0715 4000` (`const/high16 v7, 2.0f`), `73c9` (`div-float/2addr v3, v7`), `0712` (`const/4 v7, 0`). **PASS.**
- В `FreeCursorMotionEventHandler;->b` (`+0055..+00a0`): все 5 вхождений `0xc8`/`0xc6`/`0xc7` (`dcc8`, `fec8`, `cbc6`, `b3c7`, `edc6`, `d3c7`) синхронизируются с последующими `82`/`89` и branch-целями до `insns_size=192`. **PASS.**

> **Требование к внешнему экстрактору для недостающих дампов Stage 4.2:** в таблице ширин Dalvik opcode необходимо зафиксировать ширину **1 code unit (`12x`)** для всего диапазона `0xb0..0xcf` (все `/2addr` инструкции, включая `float`/`double`: `0xc6`–`0xcf`) и корректную обработку псевдо-инструкций `0x0100` (`packed-switch-payload`), `0x0200` (`sparse-switch-payload`), `0x0300` (`fill-array-data-payload`).

---

## 3. PART A — `PREVIOUS` / `NEXT` LANGUAGE (пп. 3–5)

### 3.1. Исследование обработчиков keycodes `-10000`, `-10011`, `-10197` (п. 3)

#### Что `CONFIRMED` на уровне инструкций (из доступных материалов)
1. **Регистрация констант в `classes.dex`, `Lqcm;-><clinit>()V` (`code_item_off=0x33c4a0`, `insns_size=5398`):**
   - `+087f: 0013 d8f0` → `const/16 v0, -10000` (`-0x2710`) → **`SWITCH_LANGUAGE`**
   - `+08b6: 0013 d8e5` → `const/16 v0, -10011` (`-0x271b`) → **`SWITCH_TO_NEXT_LANGUAGE`**
   - `+08c1: 0013 d82b` → `const/16 v0, -10197` (`-0x27d5`) → **`SWITCH_TO_NEXT_LANGUAGE_ALLOWING_OTHER_IMES`** (**запрещён к использованию в проекте**, так как разрешает переключение на внешние IME, включая Samsung Keyboard)
   - `+092f: 0013 d8da` → `const/16 v0, -10022` (`-0x2726`) → **`SHOW_SYSTEM_IME_PICKER`** (запрещён по ТЗ)
   - **`SWITCH_TO_PREVIOUS_LANGUAGE`:** **`NOT FOUND`** во всей таблице `Lqcm.<clinit>()`.
2. **Подтверждённая точка входа диспетчеризации событий в `gboard-version-bindings.json` и `GboardGlobeDragAdapter.java`:**
   - В `patches/src/main/resources/gboard/gboard-version-bindings.json`: `"long_press_quick_actions_input_event"` → `Lphr;->aw(Lohe;)Z` (`confidence=0.99`).
   - В `GboardGlobeDragAdapter.java:10` и `GboardLongPressQuickActionsReflectionHandles.java:226`: `SWITCH_TO_NEXT_LANGUAGE = -0x271b` (`-10011`).
3. **Опровергнутые ложные цели (`CONFIRMED` как телеметрия/трассировка, не диспетчеры):**
   - `Lqga;` (`0x3465b4`), `Lqfz;` (`0x34645c`), `Lqev;` (`0x3431d4`), `Lhcp;->U` (`0x47b404`), `Ligz;->ad` (`0x48dd2c`) — Clearcut-метрики/таймеры (`KeyboardLatency.*`, `Input.switchToNextLanguage.%s`).

#### Что остаётся `BLOCKED` (отсутствуют `code_item` в контейнере)
Поиск по всем файлам `docs/research/gboard-18.5.4/` подтвердил, что **ни один метод-обработчик** (помимо `Lqcm.<clinit>`) для `-10000` (`0xd8f0`), `-10011` (`0xd8e5`), `-10197` (`0xd82b`), а также тело **`Lphr;->aw(Lohe;)Z`**, в текущие текстовые дампы **не включены**. Поэтому остаются **`BLOCKED`**:
1. Точный класс/метод-потребитель `-10000` (`SWITCH_LANGUAGE`) и тип/формат его payload (`Lohe;->b[0].e`: `InputMethodEntry`, `String` locale tag, или иной объект).
2. Точный класс/метод-потребитель `-10011` (`SWITCH_TO_NEXT_LANGUAGE`) и `-10197` (`SWITCH_TO_NEXT_LANGUAGE_ALLOWING_OTHER_IMES`) — доказательство, что `-10011` гарантированно не вызывает `switchToNextInputMethod` / внешний IME.
3. Алгоритм выбора следующего языка (строгий циклический порядок vs MRU / история последних раскладок) и поведение при `N = 2, 3, 4`.

### 3.2. Исследование `Lpex;`, `InputMethodEntry` и `Lpux;` (п. 4)

#### Что `CONFIRMED`
1. **`classes2.dex`, `FreeCursorKeyboard;->e(Landroid/view/inputmethod/EditorInfo;Ljava/lang/Object;)V` (`code_item_off=0x59ebbc`, `insns_size=259`):**
   - `+002a: ce54 2638` → `iget-object v14, v12, FreeCursorKeyboard;->u:Lpex;` (`field@9784`, инициализируется в `<init>` через `Lomo;->ae()Lpex;`)
   - `+002c: 2072 dbd8 000e` → **`invoke-interface {v14, v0}, Lpex;->p(Z)Z`** (`method@56280`, с `v0 = 1` [`true`])
   - `+002f: 0e0a` → `move-result v14`
   - `+0030: 0e38 0005` → `if-eqz v14, +0x0035`
   - `+0032: 0e62 a246` → `sget-object v14, Lxfe;->f:Lxfe;` (`FREE_CURSOR_SOURCE_SPACE_LONG_PRESS_MULTI_KEYBOARD`)
   - `+0035: 0e62 a245` → `sget-object v14, Lxfe;->e:Lxfe;` (`FREE_CURSOR_SOURCE_SPACE_LONG_PRESS_SINGLE_KEYBOARD`)
   - **Доказанный факт:** `Lpex;` — интерфейс, доступный из клавиатуры и знающий о состоянии включённых клавиатур/языков (`p(true)`).
2. **`classes.dex`, `Lpux;->fM(Landroid/content/Context;Lqhb;)V` (`0x32c390`, `insns_size=9`) и `Lpux;->fN()V` (`0x517aa0`, `insns_size=17`):**
   - `fM` выполняет только `Trace.beginSection("...onCreate")` / `Trace.endSection()`.
   - `fN` оборачивает в `Trace` вызов **`Lpux;->b()V`**, тело которого в дампах отсутствует.

#### Что остаётся `BLOCKED`
- Полное определение интерфейса **`Lpex;`** (все его методы и сигнатуры в `classes.dex`/`classes2.dex`).
- Все классы, реализующие **`Lpex;`** (в частности конкретный класс-менеджер `InputMethodEntry`).
- Методы:
  - получения упорядоченного списка включённых `InputMethodEntry`;
  - получения текущего активного `InputMethodEntry`;
  - адресного переключения на конкретный `InputMethodEntry` (исключительно внутри Gboard IME);
  - проверки наличия встроенного поля/стека предыдущего языка;
  - тело **`Lpux;->b()V`**.

### 3.3. Вердикт по PART A (п. 5)
- **NEXT language:** **`PARTIALLY CONFIRMED`** (`-10011` / `SWITCH_TO_NEXT_LANGUAGE` подтверждён в `Lqcm.<clinit>()` и отделён от `-10197` `ALLOWING_OTHER_IMES`, точка входа `Lphr;->aw(Lohe;)Z` подтверждена в `gboard-version-bindings.json`; не декодирован внутренний обработчик `-10011` для доказательства циклического vs MRU порядка и абсолютного запрета выхода во внешний IME).
- **PREVIOUS language:** **`BLOCKED`** — нативного keycode нет (`NOT FOUND`), а операции `getEnabledEntries()` / `getCurrentEntry()` / `switchToEntry(target)` в `Lpex;` и обработчик `-10000` (`SWITCH_LANGUAGE`) не декодированы из-за отсутствия бинарных DEX. Согласно п. 5 («не предлагай реализацию, если не доказаны все необходимые операции»), реализация `PREVIOUS` **заблокирована**.

---

## 4. PART B — FREE CURSOR / SPACE LONG-PRESS (пп. 6–10)

### 4.1. State machine `Lonl`, `Long`, `Loni`, `Lonk` (п. 6)

#### Что `CONFIRMED` на уровне инструкций (внешний каркас в `FreeCursorMotionEventHandler` и `FreeCursorKeyboard`)
1. **`classes2.dex`, `FreeCursorMotionEventHandler`:**
   - `<init>(Context, Lqit)V` (`code_item_off=0x5a18a0`, `insns_size=47`): `+0029: 3070 d4a8 0534` (`invoke-direct Lonl;-><init>(FreeCursorMotionEventHandler, I)V` с `mode = 1`), `+002c: 345b 2641` (`iput-object ... FreeCursorMotionEventHandler;->f:Lonk;`).
   - `gt(MotionEvent)Z` (`code_item_off=0x5a163c`, `insns_size=2`): `+0000: 1012` (`const/4 v0, 1`), `+0001: 000f` (`return v0`) — **всегда возвращает `true`** (объявляет готовность принять переданное касание).
   - `gs(MotionEvent)V` (`code_item_off=0x5a1a64`, `insns_size=14`) и `g(MotionEvent)V` (`code_item_off=0x5a19f0`, `insns_size=17`): обе читают `this.f:Lonk;`, вызывают `+0007: 2072 d4a7 0020` (`invoke-interface Lonk;->a(Landroid/view/MotionEvent;)Lonk;`, `method@54439`), и записывают новое состояние обратно в `this.f:Lonk;` (`+000b: 125b 2641`).
   - `c(ILjava/lang/Long;ILjava/lang/Double;)V` (`code_item_off=0x5a1994`, `insns_size=38`): в цикле `0..count-1` (`+0001..+0024`) создаёт `Lohe;->e(keyCode, null)` (`method@54057`), прикрепляет `Lonp(velocity)` в `Lohe;->l`, вызывает `Lohe;->r()` и отправляет через `+001f: 2072 e42f 0012` (`invoke-interface Lqit;->n(Lohe;)V`, `method@58415`).
   - `o()Lonk;` (`code_item_off=0x5a17e0`, `insns_size=23`):
     - `+0000: 1070 561b 0002` → `invoke-direct FreeCursorMotionEventHandler;->p()V` (отмена корутин `g`, `i` + `VelocityTracker.recycle()`)
     - `+0003: 0013 d819` → `const/16 v0, -10215` (`FREE_CURSOR_LOCK`)
     - `+0005: 0162 8232` → `sget-object v1, Lonu;->a:Lonu;` (`field@33330`)
     - `+0007: 2071 d329 0010` → `invoke-static Lohe;->e(ILjava/lang/Object;)Lohe;` (`method@54057`)
     - `+000d: 2072 e42f 0001` → `invoke-interface Lqit;->n(Lohe;)V` (`method@58415`)
     - `+0013: 3070 d4a8 0120` → возвращает `new Lonl(this, 1)`.
   - `l()V` (`0x5a1a24`, `insns_size=12`): вызывает `p()` и сбрасывает `this.f = new Lonl(this, 1)`.
2. **`classes2.dex`, `FreeCursorKeyboard` (обработка состояний lock и выхода):**
   - `m(Lohe;)Z` (`0x59e478`, `insns_size=266`): принимает `-10215` (`FREE_CURSOR_LOCK`) и передаёт payload (`Lonv;`) в `R(Lonv;)V`.
   - `R(Lonv;)V` (`0x59e954`, `insns_size=278`):
     - `instance-of Lonr` (`+0004..+008f`): показывает обратный отсчёт lock (`w:TextView`, `Lonr;->a:J` через `Lackm;->e(J)J`, `v.setPressed(true)`).
     - `Lons.a` (`+0090..+00ce`): режим locked (показывает `K:View`, скрывает `M`/`L`, вызывает `N()`).
     - `Lont.a` (`+00cf..+0103`): режим unlocked (скрывает `w` и `K`, снимает `v.setPressed(false)`).
     - `Lonu.a` (`+0104..+010f`): **`+010c: 106e 55fa 0009` → `invoke-virtual FreeCursorKeyboard;->F()V`** (`method@22010`).
   - `F()V` (`0x59eb90`, `insns_size=14`):
     - `+0000: 0013 d8ec` → `const/16 v0, -10004` (`SWITCH_KEYBOARD`)
     - `+0002: 0162 8d0b` → `sget-object v1, Lqch;->b:Lqch;` (Prime keyboard)
     - `+0004: 2071 d329 0010` → `Lohe;->e(-10004, Lqch.b)`
     - `+000a: 2072 dd3a 0002` → `invoke-interface Lpkz;->N(Lohe;)V` (`method@56634`) — **выход из Free Cursor**.
   - `h()V` (`0x59edd4`, `insns_size=268`): полная очистка при деактивации клавиатуры (`R(Lont.a)`, закрытие попапов/лупы `Lomc`, отмена корутины `g`, вызов `M()` для отпуска `KEYCODE_SHIFT_LEFT`).

#### Что остаётся `BLOCKED`
В текущих дампах **отсутствуют `code_item` классов `Lonl;`, `Long;`, `Loni;`, `Lonk;`** (известны только сигнатуры их конструкторов из `GBOARD_18.5.4_TARGETED_METHOD_INDEX.txt`: `Lonl.<init>(FreeCursorMotionEventHandler, I)`, `Long.<init>(FreeCursorMotionEventHandler, MotionEvent, F, F, Z, Z, Z, Z)`, `Loni.<init>(FreeCursorMotionEventHandler, I, I)`). Без их декодирования **`BLOCKED`**:
- Точные переходы `Lonk;->a(MotionEvent)` на `ACTION_DOWN`, `ACTION_MOVE`, `ACTION_UP`, `ACTION_CANCEL`.
- Условие запуска таймера обратного отсчёта `Lonr` vs немедленный вызов `FreeCursorMotionEventHandler;->o()` на `ACTION_UP`.
- **Критический вопрос handoff:** может ли `Lonl` (`mode=1`) принять поток, начинающийся с `ACTION_MOVE` (после `gt()=true` + `gs(MotionEvent)`), если перед переключением на `FreeCursorKeyboard` исходный `SoftKeyboardView` получил синтетический `ACTION_CANCEL` от единого touch dispatcher'а.

### 4.2. Исследование `Looe;->a(Landroid/view/MotionEvent;)Loof;` (п. 7)
- **Подтверждённые ссылки:** `Looe.<init>(TriggerFreeCursorMotionEventHandler)` вызывается в `TriggerFreeCursorMotionEventHandler.<init>/d/f/l` (`0x5a38c4`/`0x5a3920`/`0x5a3994`/`0x5a3a0c`) и при сбросе в `Looc;->a` (`0x5a2e14`, `+003f` и `+0211`).
- **Статус `Looe;->a(MotionEvent)Loof;`:** **`BLOCKED`** — тело класса `Looe;` отсутствует в Stage 4.1 дампах. Условия входа на `ACTION_DOWN`, временные/пространственные пороги, проверка `noScrubbing` и зависимость от флагов/состояния клавиатуры не декодированы.

### 4.3. Поиск producer long-press пробела (`Lomw;->a`, `space_long_press_ime_picker`, `Lqin;->y()`) (п. 8)
- **Что `CONFIRMED` на приёмной стороне (`classes2.dex`, `FreeCursorKeyboard;->e`, `code_item_off=0x59ebbc`, `insns_size=259`):**
  - `+0028: 0e39 0012` → `if-nez v14, +0x003a`: если `Object payload == null`, то `+002a..+0036` выбирает `Lxfe.f` (`FREE_CURSOR_SOURCE_SPACE_LONG_PRESS_MULTI_KEYBOARD`) или `Lxfe.e` (`FREE_CURSOR_SOURCE_SPACE_LONG_PRESS_SINGLE_KEYBOARD`) через `this.u.p(true)`.
  - Это доказывает, что **приёмник** ожидает переключение на клавиатуру `Lomw;->a` с `payload == null` (через `SWITCH_KEYBOARD -10004`).
- **Подтверждённые биндинги `Lqin;` (`gboard-version-bindings.json`):**
  - `Lqin;->B(SoftKeyView, F, F, J, I)V` (`pointer_owner`), `Lqin;->s(J)V` (`pointer_cancel`), `Lqin;->r(J, I)V` (`pointer_finish`), `Lqin;->ac()V` (`pointer_pre_reset`), `Lqin;->C()V` (`pointer_reset`), плюс `Lqil;->f(...)` (`gesture_dispatch`) и `Lqij;->o(...)` (`gesture_stock_dispatch`).
- **Что остаётся `BLOCKED`:**
  - Все xrefs на `Lomw;->a` кроме `Looc;->a` (`+01f7`);
  - Обработчик строки `"space_long_press_ime_picker"`;
  - Тело `Lqin;->y()V` и продюсер команды `SWITCH_KEYBOARD (-10004, Lomw.a)` при удержании пробела;
  - Доказательство того, кто передаёт управление от Prime-клавиатуры к `FreeCursorKeyboard` и сохраняет ли тот же физический палец поток `ACTION_MOVE` → `ACTION_UP`.

### 4.4. Исследование `ScrubMove`, `ScrubDelete`, `InlineSuggestionScrubSpace` (п. 9)

#### Что `CONFIRMED` на уровне инструкций (`classes.dex`)
1. **`ScrubMoveMotionEventHandler;-><init>(Context, Lqit)V` (`code_item_off=0x1f12b4`, `insns_size=24`):**
   - Конструирует `Lqix(keyCode=62 [0x3e SPACE], leaveKeyRect=false, mode=1, start=-10061 [0xd8b3], move=-10053 [0xd8bb], end=-10054 [0xd8ba], cancel=-10062 [0xd8b2], typedArray=0x7f0300bb)`.
   - Наследует `ScrubMotionEventHandler;->b(MotionEvent)Z` (`0x521568`, `insns_size=6`) → `p(event, 3)` (двунаправленный свайп).
2. **`ScrubDeleteMotionEventHandler;-><init>(Context, Lqit)V` (`code_item_off=0x1f0fdc`, `insns_size=24`) и `b(MotionEvent)Z` (`code_item_off=0x521458`, `insns_size=16`):**
   - Конструирует `Lqix(keyCode=67 [0x43 DEL], leaveKeyRect=true, mode=2, start=-10050 [0xd8be], move=-10051 [0xd8bd], end=-10052 [0xd8bc], cancel=-10063 [0xd8b1], typedArray=0x7f0300ba)`.
   - `b(MotionEvent)`: `+0002: Lqit;->q()Z` (`method@41743`), при `false` вызывает `+000b: p(event, 3)`.
   - **Доказано:** `ScrubDelete` полностью отделён от пробела по `keyCode=67`, `leaveKeyRect=true`, набору кодов `-10050..-10063` и ресурсу `0x7f0300ba`.
3. **`InlineSuggestionScrubSpaceMotionEventHandler;-><init>(Context, Lqit)V` (`code_item_off=0x1eace0`, `insns_size=44`) и `b(MotionEvent)Z` (`code_item_off=0x4fbc58`, `insns_size=32`):**
   - Конструирует `Lqix(keyCode=62 [0x3e SPACE], leaveKeyRect=false, mode=1, start=-50001 [0xffff3caf], move=-50003 [0xffff3cad], end=-50004 [0xffff3cac], cancel=-50002 [0xffff3cae], typedArray=0x7f0300bb)` + `Resources.getInteger(0x7f0c0063)`.
   - `b(MotionEvent)`:
     - `+0000: sget-object v0, Lpaw;->a:Lqll;` (`field@21893`)
     - `+0002: invoke-static {v0}, Lqlp;->e(Lqll;)Z` (`method@41929`) → `+0006: if-eqz v0, +0x001e` (возвращает `false`, если inline-подсказка НЕ активна!)
     - `+0008: invoke-static Lpem;->d()Lsfc;` → `+0010: Lsfc;->G()Z` (RTL/LTR) выбирает **однонаправленный** `dir = 1` или `dir = 2`, затем `+0017: p(event, dir)`.
   - **Доказано:** `InlineSuggestionScrubSpaceMotionEventHandler` перехватывает пробел **только** когда `Lqlp;->e(Lpaw;->a)Z == true` (активна inline-подсказка), и только в одном направлении (в сторону подсказки по RTL/LTR).
4. **Базовый `ScrubMotionEventHandler` (`classes.dex`):**
   - `g(MotionEvent)` (`0x521634`, `insns_size=254`): проверяет `!TalkBack` (`Lqit.dr().v()`), cooldown `eventTime >= p.c() + c.a`, `SoftKeyView.f(PRESS).b().c == g.a`, отсутствие `Lqae.e`, флаг `Lqhz;->a:Lokc;->g()`, захватывает владение касанием через `Lqit;->m()`.
   - `r(MotionEvent, Z)` (`0x52184c`, `insns_size=219`): проверяет `Lobk;->v(pkg, "noScrubbing", e)` (показывает toast `0x7f1411aa` при запрете).

#### Что остаётся `BLOCKED`
- Xrefs на строку **`"enable_scrub_move"`** и ресурс **`0x7f14096b`** (внутри самих 4 `Scrub*`-классов их нет!).
- Места регистрации и порядок приоритета в списке `MotionEventHandler` для `ScrubMoveMotionEventHandler`, `ScrubDeleteMotionEventHandler`, `InlineSuggestionScrubSpaceMotionEventHandler` и `TriggerFreeCursorMotionEventHandler`.
- Без этих xrefs нельзя доказать, безопасно ли отключать `"enable_scrub_move"` глобально без отключения `ScrubDeleteMotionEventHandler` (хотя **перехват на уровне единого touch dispatcher только при старте на пробеле `keyCode=62` гарантированно НЕ трогает Backspace `keyCode=67`**).

### 4.5. Архитектурный анализ отделения UI от механики Free Cursor (п. 10)
По декодированным инструкциям `FreeCursorKeyboard;->e` (`0x59ebbc`) и `FreeCursorKeyboard;->R` (`0x59e954`) **доказано (`CONFIRMED`)**:
1. Все вспомогательные элементы UI Free Cursor — кнопка lock (`v:View`), счётчик обратного отсчёта (`w:TextView`), панель locked-режима (`K:View`, `L:View`, `M:View`), подсказка (`h:View`) — **null-safe** и полностью отделены от генерации движений курсора (`FreeCursorMotionEventHandler;->c()` → `DPAD 19..22`).
2. При `Loml;->D` (`free_cursor_lock_mode`) == `false` `FreeCursorKeyboard;->e` выставляет `v.setVisibility(GONE)`, а в состоянии `Lont.a` (unlocked) `R()` скрывает `w` и `K`.
3. **Ограничение:** сама `FreeCursorKeyboard` является отдельной клавиатурой (`Lomw;->a`), активируемой через `SWITCH_KEYBOARD (-10004)`. Возможность удерживать её в режиме без Trackpad-кнопок/lock-панели с мгновенным возвратом на Prime (`F()` → `-10004 Lqch.b`) по `ACTION_UP` остаётся **`BLOCKED`** до декодирования `Lonl`/`Long`/`Loni`.

---

## 5. Единый Touch Dispatcher — верификация по реальному коду репозитория (п. 11)

Аудит `GboardSwipeDismissBytecodePatch.kt` и `GboardSwipeDismissRuntime.java` в `vortexnode/GboardSamsung` выявил **подтверждённые на уровне исходного кода факты (`CONFIRMED`)**:

1. **Точка перехвата:** `GboardSwipeDismissBytecodePatch.kt` (строки 23–28, 67–71) хукает **`Lcom/google/android/libraries/inputmethod/keyboard/impl/KeyboardViewHolder;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z`**.
2. **Жёсткий инвариант пролога (`GboardSwipeDismissBytecodePatch.kt:38–44`):**
   ```kotlin
   if (existing > 0) {
       check(existing == 1 && instructions.first().isMethodReference(abi.reference)) {
           "Malformed swipe dismiss touch interceptor in $definingClass->$name"
       }
       return
   }
   ```
   Второй независимый байткод-хук в начало `KeyboardViewHolder.dispatchTouchEvent` **сломает контракт существующего патча**. Требуется единый композитор на месте этого единственного вызова пролога.
3. **Полная пространственная изоляция `Swipe Dismiss` от пробела (`GboardSwipeDismissRuntime.java:20, 33, 136–152`):**
   - `GboardSwipeDismissRuntime.onHeaderTouch(holder, event)` на первой проверке отсекает все `KeyboardViewHolder`, чей resource entry name != `"keyboard_header_view_holder"`.
   - Клавиша пробела находится в `SoftKeyboardView` внутри **`"keyboard_body_view_holder"`** (отдельный экземпляр `KeyboardViewHolder`).
   - Следовательно, единый диспетчер в `KeyboardViewHolder.dispatchTouchEvent` может **детерминированно и взаимоисключающе** маршрутизировать:
     - `keyboard_header_view_holder` → `GboardSwipeDismissRuntime` (100% сохранение Swipe Dismiss);
     - `keyboard_body_view_holder` → `SpacebarGestureDispatcher` (проверка попадания `ACTION_DOWN` в `SoftKeyView` с `keyCode == 62` и `!CANCELLING`, без затрагивания клавиши Backspace `keyCode == 67` / `ScrubDelete` и всех остальных клавиш).
4. **Незакрытый риск синтетического `ACTION_CANCEL` для `OPTION A`:**
   - В `GboardSwipeDismissRuntime.java:92–100` подтверждён шаблон: при распознавании жеста отправляется один синтетический `ACTION_CANCEL` в `holder.dispatchTouchEvent(cancel)` под защитой `ThreadLocal<Boolean> CANCELLING`.
   - Для **свайпа смены языка (`NEXT`/`PREVIOUS`)** и для **`OPTION B` (собственный `InputConnection` DPAD-трекпад)** этот шаблон полностью безопасен: после `ACTION_CANCEL` дочерний `SoftKeyboardView` сбрасывает нажатие пробела (0 случайных пробелов), а дальнейшие `ACTION_MOVE`/`ACTION_UP` поглощаются единым диспетчером.
   - Для **`OPTION A` (передача того же физического касания в `FreeCursorMotionEventHandler`)** влияние синтетического `ACTION_CANCEL` на `SoftKeyboardView` / `MotionEventHandler` pipeline и на автомат `Lonl`/`Long`/`Loni` остаётся **`BLOCKED`** до декодирования `Lonl`/`Long`/`Loni` и продюсера `Lomw;->a`.

Подробная схема единого touch dispatcher'а и матрица маршрутизации 6 потребителей вынесены в [`docs/SPACEBAR_CURSOR_CONTROL_DESIGN.md`](./SPACEBAR_CURSOR_CONTROL_DESIGN.md).

---

## 6. Сводная таблица статусов Stage 4.2 (п. 15)

| Подсистема | Статус | Доказанный механизм | Оставшийся блокер |
|---|---|---|---|
| NEXT language | `PARTIALLY CONFIRMED` | `Lqcm.<clinit>` (`classes.dex`, `0x33c4a0`, `+08b6`): `-10011` (`0xd8e5` `SWITCH_TO_NEXT_LANGUAGE`), отделён от `-10197` (`ALLOWING_OTHER_IMES`); `Lphr;->aw(Lohe;)Z` в биндингах | Нет `code_item` обработчиков `-10011` и `-10197` (не доказан порядок cyclic vs MRU и `if`-гейт запрета внешних IME) |
| PREVIOUS language | `BLOCKED` | Доказано отсутствие нативного keycode (`NOT FOUND` в `Lqcm.<clinit>`); найдены `-10000` (`SWITCH_LANGUAGE`) и наводка `Lpex;->p(Z)Z` (`FreeCursorKeyboard;->e` `+002c`) | Нет `code_item` обработчика `-10000`, интерфейса/реализаций `Lpex;` (список/текущий/переключение `InputMethodEntry`) и `Lpux;->b()V` |
| Free Cursor activation | `PARTIALLY CONFIRMED` | `Looc;->a` (`classes2.dex`, `0x5a2e14`, `+01cc..+020c`): `-10104` + `Lqci(Lomw.a, map)` через `Lqit.n`; `FreeCursorKeyboard;->e` (`0x59ebbc`, `+0028..+0039`): `payload==null` → `Lpex.p(true)` → `Lxfe.e/f` | Нет `code_item` для `Looe;->a(MotionEvent)Loof;` и всех xrefs на `Lomw;->a` кроме `Looc;->a` |
| Long-press producer | `BLOCKED` | Подтверждён только приёмник (`FreeCursorKeyboard;->e` при `payload==null`) и enum `Lxfe.e/f` (`classes3.dex`, `0x1b9d24`) | Нет `code_item` продюсера `-10004 (Lomw.a)`, обработчика `"space_long_press_ime_picker"` и `Lqin;->y()V` |
| MotionEvent handoff | `PARTIALLY CONFIRMED` | `FreeCursorMotionEventHandler;->gt(MotionEvent)` (`0x5a163c`) всегда возвращает `true`; `gs(MotionEvent)` (`0x5a1a64`) передаёт событие в `this.f.a(event)` (`Lonk;`) | Нет `code_item` `Lonl`/`Long`/`Loni` — не доказана сохранность физического касания после переключения клавиатуры и/или синтетического `ACTION_CANCEL` |
| Free Cursor state machine | `PARTIALLY CONFIRMED` | Каркас в `FreeCursorMotionEventHandler` (`c()` DPAD `0x5a1994`, `o()` → `-10215 Lonu.a` `0x5a17e0`, `p()` `0x5a1910`) и `FreeCursorKeyboard` (`m` `0x59e478`, `R` `0x59e954`, `F` → `-10004 Lqch.b` `0x59eb90`, `h` `0x59edd4`) | Нет `code_item` `Lonl;`, `Long;`, `Loni;`, `Lonk;->a(MotionEvent)` (`ACTION_DOWN/MOVE/UP/CANCEL`, lock countdown `Lonr`, вызов `o()`) |
| ScrubMove | `PARTIALLY CONFIRMED` | `ScrubMoveMotionEventHandler.<init>` (`classes.dex`, `0x1f12b4`: `keyCode=62`, `-10061..-10062`, `0x7f0300bb`), `ScrubMotionEventHandler;->g/r/p/o` (`noScrubbing` via `Lobk.v`) | Нет xrefs на `"enable_scrub_move"` / `0x7f14096b` и места регистрации/приоритета `MotionEventHandler` |
| ScrubDelete preservation | `PARTIALLY CONFIRMED` | `ScrubDeleteMotionEventHandler.<init>/b` (`0x1f0fdc`/`0x521458`: `keyCode=67 [DEL]`, `leaveKeyRect=true`, `-10050..-10063`, `0x7f0300ba`, `!Lqit.q()`) — полностью изолирован от пробела `keyCode=62` | Не проверено по xrefs, влияет ли настройка `"enable_scrub_move"` на регистрацию `ScrubDeleteMotionEventHandler` |
| InlineSuggestion scrub | `CONFIRMED` | `InlineSuggestionScrubSpaceMotionEventHandler.<init>/b` (`0x1eace0`/`0x4fbc58`: `keyCode=62`, `-50001..-50004`, активен только при `Lqlp;->e(Lpaw;->a)Z == true`, однонаправленный `dir=1/2` по RTL/LTR `Lsfc;->G()`) | Приоритет регистрации относительно `ScrubMove`/`TriggerFreeCursor` не дамплен (для диспетчера на `KeyboardViewHolder` достаточно проверки `Lqlp.e(Lpaw.a)`) |
| Unified touch dispatcher | `PARTIALLY CONFIRMED` | `GboardSwipeDismissBytecodePatch.kt` (инвариант единственного хука на индексе `0` `KeyboardViewHolder.dispatchTouchEvent`) + `GboardSwipeDismissRuntime.java` (`keyboard_header_view_holder` vs `keyboard_body_view_holder`, `ThreadLocal CANCELLING`) | Не доказана совместимость синтетического `ACTION_CANCEL` с live handoff в `FreeCursorMotionEventHandler` (`OPTION A`); для `NEXT`/`PREVIOUS` и `OPTION B` паттерн готов |

---

## 7. Точная спецификация недостающих выгрузок из бинарных DEX `18.5.4` (для разблокировки Stage 4.2)

Чтобы закрыть все `BLOCKED`-ячейки таблицы выше без повторных итераций, из оригинального APK `Gboard-v18.5.4.993608717-release-arm64-v8a.apk` (`SHA-256: f47f44d33ab21d28aabfaec8292009c1173964ea238441734327a0a15ba32813`) необходимо выгрузить в `docs/research/gboard-18.5.4/` **2 текстовых файла `code_item`** (с исправлением в экстракторе ширины `12x` для `0xb0..0xcf`):

1. **`GBOARD_18.5.4_STAGE_4_2_LANGUAGE_HANDLERS_CODE.txt` (Part A):**
   - Все методы в `classes.dex` и `classes2.dex`, содержащие `const/16` / `const` / `switch` на `-10000` (`0xd8f0`), `-10011` (`0xd8e5`), `-10197` (`0xd82b`) (исключая `Lqcm.<clinit>`).
   - Тело `Lphr;->aw(Lohe;)Z` (`classes.dex`/`classes2.dex`).
   - Все методы интерфейса `Lpex;` и всех классов, реализующих `Lpex;` (особенно методы работы со списком `InputMethodEntry`, текущим `InputMethodEntry` и переключением на `InputMethodEntry`).
   - Тело `Lpux;->b()V` (`classes.dex`).
2. **`GBOARD_18.5.4_STAGE_4_2_FREECURSOR_AND_SCRUB_CODE.txt` (Part B):**
   - Все методы `Lonl;`, `Long;`, `Loni;`, `Lonk;` (`classes2.dex`).
   - Все методы `Looe;` (`classes2.dex`, особенно `a(Landroid/view/MotionEvent;)Loof;`).
   - Все методы в `classes.dex` и `classes2.dex`, содержащие xrefs на `Lomw;->a` (исключая `Looc;->a`), строку `"space_long_press_ime_picker"`, и тело `Lqin;->y()V`.
   - Все методы в `classes.dex` и `classes2.dex`, содержащие xrefs на строку `"enable_scrub_move"`, ресурс `0x7f14096b` (`const 0x7f14096b`), либо ссылки на классы `ScrubMoveMotionEventHandler`, `ScrubDeleteMotionEventHandler`, `InlineSuggestionScrubSpaceMotionEventHandler`, `TriggerFreeCursorMotionEventHandler` (кроме их собственных конструкторов).

> **Итоговый вывод по переходу к реализации:** **НЕТ — переход к проектированию реализации / написанию патчей ЗАБЛОКИРОВАН** до получения и декодирования указанных двух текстовых пакетов Stage 4.2.
