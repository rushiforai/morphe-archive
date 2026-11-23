# Этап 4.1 — Глубокая трассировка байткода Free Cursor и двунаправленного переключения языков (`NEXT`/`PREVIOUS`) в Gboard 18.5.4

> **Статус документа:** Обновлённый исследовательский отчёт Этапа 4.1 на основе **независимого декодирования raw 16-bit Dalvik code units** из `code_item` целевого APK Gboard `18.5.4.993608717-release-arm64-v8a`.
>
> **Репозиторий:** `vortexnode/GboardSamsung` (`main`)
> **Целевая версия Gboard:** `18.5.4.993608717-release-arm64-v8a` (`SHA-256: f47f44d33ab21d28aabfaec8292009c1173964ea238441734327a0a15ba32813`)
> **Целевое устройство:** Samsung Galaxy S22 5G (`SM-S901U1`), Android 16 / One UI 8
> **Ограничение этапа:** Исходный код, патчи, runtime, биндинги, тесты, Gradle и файлы в `docs/research/gboard-18.5.4/` **не изменялись**; сборки `.mpp` / APK **не запускались**.

---

## 1. Инвентарь источников и аудит декодирования raw 16-bit Dalvik code units

### 1.1. Использованные артефакты из `docs/research/gboard-18.5.4/`

| Файл | Назначение | Проверено |
|---|---|---|
| `docs/research/gboard-18.5.4/GBOARD_18.5.4_DEX_REFERENCE_EXTRACT.md` | Идентификация APK (`95,577,506` байт) и SHA-256 всех 4 оригинальных DEX-файлов | Да (100%) |
| `docs/research/gboard-18.5.4/GBOARD_18.5.4_TARGETED_METHOD_INDEX.txt` | Индекс `method_ids` по Free Cursor, Scrub, `SoftKeyboardView`, `KeyboardViewHolder`, `Lqga;`, `Lxfe;` | Да (100%) |
| `docs/research/gboard-18.5.4/GBOARD_18.5.4_TARGETED_CODE_ITEM_DUMP.txt` | Raw `code_item` дампы (`2 423` строки): `ScrubMotionEventHandler`, `InlineSuggestionScrubSpaceMotionEventHandler`, `ScrubDeleteMotionEventHandler`, `ScrubMoveMotionEventHandler`, `FreeCursorKeyboard`, `FreeCursorMotionEventHandler`, `TriggerFreeCursorMotionEventHandler` | Да (100%) |
| `docs/research/gboard-18.5.4/GBOARD_18.5.4_LANGUAGE_ENUM_XREF_CODE.txt` | Raw `code_item` дампы (`3 622` строки): `Lhcp;->U`, `Ligz;->ad`, `Lpux;->fM`, `Lpux;->fN`, `Lqcm;-><clinit>`, `Lqev;-><clinit>`, `Lqfz;-><clinit>`, `Lqga;`, `FreeCursorKeyboard;->e/h`, `Lomy;->a`, `Lomz;`, `Looc;->a`, `Lxfe;` | Да (100%) |
| `docs/research/gboard-18.5.4/README_FOR_AI_STUDIO_RU.md` | Паспорт экстракции и ограничения | Да (100%) |

**Контрольные SHA-256 DEX-файлов целевого APK:**
- `classes.dex` (`7,859,484` B): `b403bf2797f56b6bae2ac3f6a10fe10fba3012b201b7c26c120f7370139f606e`
- `classes2.dex` (`8,465,652` B): `2529a75190010707d17b51f0a63cccb9a2b8dae5a6c9c598445edd7588a7959d`
- `classes3.dex` (`3,683,072` B): `53e70ef05fe2515e4675d25d2b08708698095d95aa06dca4201d15c7f7cd8f92`
- `classes4.dex` (`680,452` B): `0b5f0b0e2c28e06b9ac81b063f95848b04ea236f3a49df6bf2649c9fb90d7e17`

Также сверены с исходниками `vortexnode/GboardSamsung` (`SpacebarSwipePatch.kt`, `SpacebarSwipeRuntime.kt`, `SwipeDismissPatch.kt`, `LatinGlobeIgnoreIntervalPatch.kt`, `docs/GBOARD_18.5.4_BYTECODE_REFERENCE_EXTRACT.md`).

### 1.2. КРИТИЧЕСКИЙ аудит багов кастомного дампера (исправлено при независимом декодировании)

При независимой побитовой проверке 16-bit code units (форматы Dalvik Bytecode spec) в обоих файлах дампов выявлены и полностью устранены **две систематические ошибки авто-дизассемблера**:

1. **Ошибочная длина 12x-инструкций `/2addr` для `float`/`double` (`0xc6`–`0xc9`, `0xce`):**
   Дампер верно считал целочисленные `0xb0`–`0xbc` (`add-int/2addr`..`ushr-long/2addr`) шириной **1 code unit**, но ошибочно читал **2 code units** для:
   - `0xc6` (`add-float/2addr vA, vB`) — реальная ширина **1 code unit** (`12x`);
   - `0xc7` (`sub-float/2addr vA, vB`) — реальная ширина **1 code unit** (`12x`);
   - `0xc8` (`mul-float/2addr vA, vB`) — реальная ширина **1 code unit** (`12x`);
   - `0xc9` (`div-float/2addr vA, vB`) — реальная ширина **1 code unit** (`12x`);
   - `0xce` (`div-double/2addr vA, vB`) — реальная ширина **1 code unit** (`12x`).
   Из-за этого после каждой такой инструкции происходил сдвиг потока декодирования на `+1` code unit (до ближайшей синхронизации), что порождало **ложные аннотации дампера**. Все затронутые участки передекодированы вручную с проверкой совпадения с `insns_size` и всеми branch-целями:
   - `ScrubMotionEventHandler;->o(IFF)Z` (`0x521488`):
     - `+0019: 05c7` (`sub-float/2addr v5, v0`) → `+001a: 6432 0010` (`if-eq v4, v6, +0x10` → точная цель `+002a`).
     - `+0036: 54c7` (`sub-float/2addr v4, v5`) → `+0037: 106e 3aa0 0003` (`invoke-virtual {v3}, ScrubMotionEventHandler;->c()F`).
   - `ScrubMotionEventHandler;->g(MotionEvent)V` (`0x521634`):
     - `+0083: 87c7` (`sub-float/2addr v7, v8`) → `+0084: 7787` (`float-to-int v7, v7`).
     - `+008a: 87c6` (`add-float/2addr v7, v8`) → `+008b: 7787` (`float-to-int v7, v7`).
   - `ScrubMotionEventHandler;->r(MotionEvent, Z)V` (`0x52184c`):
     - `+0041: 60c7` (`sub-float/2addr v0, v6`) → `+0042: 0689` (`float-to-long` / конверсия).
     - `+006d: 30c7` (`sub-float/2addr v0, v3`) → `+006e: a352 1bb3` (`iget v3, v10, ScrubMotionEventHandler;->a:I`), `+0072: 30c9` (`div-float/2addr v0, v3`) → `+0073: 02c6` (`add-float/2addr v2, v0`).
   - `FreeCursorKeyboard;->P(Lohe;)Z` (`0x59e200`):
     - `+006f: 73c6` (`add-float/2addr v3, v7`) → `+0070: 0715 4000` (`const/high16 v7, 2.0f`) → `+0072: 73c9` (`div-float/2addr v3, v7`) → `+0073: 0712` (`const/4 v7, 0`).
   - `FreeCursorMotionEventHandler;->b(MotionEvent, Integer, Integer)Lonj;` (`0x5a1650`):
     - `+0055: dcc8` (`mul-float/2addr v12, v13`) → `+0056: 4d82`; `+005f: fec8` (`mul-float/2addr v14, v15`) → `+0060: cbc6` (`add-float/2addr v11, v12`); `+007a: b3c7` → `+007b: 3389`; `+0087: edc6` → `+0088: d389`; `+009f: d3c7` → `+00a0: 3389`.
   - **`Looc;->a(MotionEvent)Loof;` (`0x5a2e14`) — критическое исправление ложных аннотаций:**
     - На `+0109..+0110` из-за сдвига после `mul-float/2addr` дампер выдал **ложные** ссылки на `EditorInfo;->inputType` и `AddLanguagePreferenceFragment;->an`. Реальное декодирование:
       - `+0109: a2c8` (`mul-float/2addr v2, v10`)
       - `+010a: 0a54 8265` (`iget-object v10, v0, Looc;->e:Ljava/util/Collection;`)
       - `+010c: 0c62 8268` (`sget-object v12, Lood;->...`)
       - `+010e: 2071 cdec 0023` (`invoke-static {v3, v2}, method@0xcdec` — вычисление направления `Lood;` по `(dx, dy)`).
     - На `+0183..+0186`: `+0183: 68ce` (`div-double/2addr v8, v6`), `+0184: 022f 0802` (`cmpg-double v2, v8, v2`), `+0186: 023a 008e` (`if-ltz v2, +0x8e` → точная цель `+0214`).
2. **Псевдо-инструкция `packed-switch-payload` (`0x0100`) в `Looc;->a` (`+0216..+0221`):**
   Дампер распечатал хвост `+0216..+0221` как набор инструкций, тогда как на самом деле это корректная таблица `packed-switch-payload` (`ident = 0x0100`, `size = 4`, `first_key = 19` [`0x13`, `KEYCODE_DPAD_UP`], 4 смещения `+0x0006` от `packed-switch` на `+01be` → все 4 кода `19..22` прыгают на `+01c4`, где загружается `Lxfe;->d = FREE_CURSOR_SOURCE_SWIPE_DPAD`). Суммарная длина `0x222 = 546 == insns_size`.

Все дальнейшие выводы в настоящем отчёте опираются исключительно на **перепроверенные** смещения и инструкции.

---

## 2. Направление A — Полная байткод-трассировка Free Cursor и Scrub-обработчиков

### 2.1. Enum `Lxfe;` (`classes3.dex`) — источники активации Free Cursor

- **DEX:** `classes3.dex`
- **Класс:** `Lxfe;`
- **Методы:** `<clinit>()V` (`code_item_off=0x1b9d24`, `insns_size=90`), `<init>(Ljava/lang/String;II)V` (`0x1b9de8`), `values()[Lxfe;` (`0x1b9cc8`), `a()I` (`0x1b9cec`), `toString()Ljava/lang/String;` (`0x1b9d04`).
- **Точные константы из `<clinit>()` (`0x1b9d24`):**

| Поле `Lxfe;` | Имя константы | Числовой ID (`a()`) | Подтверждённое место использования |
|---|---|---|---|
| `Lxfe;->a` | `FREE_CURSOR_SOURCE_UNSPECIFIED` | `0` | Fallback в `Looc;->a` и `FreeCursorKeyboard;->e` |
| `Lxfe;->b` | `FREE_CURSOR_SOURCE_DIRECT_KEYCODE` | `1` | Прямой запуск keycode |
| `Lxfe;->c` | `FREE_CURSOR_SOURCE_SWIPE_SPACE` | `2` | `Looc;->a` (`+01c7`) при `d == 62` (`KEYCODE_SPACE`) |
| `Lxfe;->d` | `FREE_CURSOR_SOURCE_SWIPE_DPAD` | `3` | `Looc;->a` (`+01c4`) при `d in 19..22` (`DPAD`) |
| `Lxfe;->e` | `FREE_CURSOR_SOURCE_SPACE_LONG_PRESS_SINGLE_KEYBOARD` | `4` | `FreeCursorKeyboard;->e` (`+0036`) при `payload == null` и `u.p(true) == false` |
| `Lxfe;->f` | `FREE_CURSOR_SOURCE_SPACE_LONG_PRESS_MULTI_KEYBOARD` | `5` | `FreeCursorKeyboard;->e` (`+0033`) при `payload == null` и `u.p(true) == true` |
| `Lxfe;->g` | `FREE_CURSOR_SOURCE_SWIPE_DEL` | `6` | `Looc;->a` (`+01ca`) при `d == 67` (`KEYCODE_DEL`) |

- **`Lomy;->a(Lxfe;)Z` (`classes2.dex`, `code_item_off=0x59f760`, `insns_size=16`):** возвращает `true` для `Lxfe.e` и `Lxfe.f` (источники space long-press) и `false` для остальных (в т.ч. `SWIPE_SPACE`). Используется для учёта телеметрии/обучения при закрытии (`FreeCursorKeyboard;->h`).

### 2.2. Активация Free Cursor свайпом (`TriggerFreeCursorMotionEventHandler` + `Looc;->a`)

- **DEX:** `classes2.dex`
- **Класс:** `Lcom/google/android/libraries/inputmethod/freecursor/TriggerFreeCursorMotionEventHandler;`
  - `<clinit>()V` (`code_item_off=0x5a380c`, `insns_size=83`): заполняет статический `Set` `a` кодами клавиш **`62` (`SPACE`), `19`, `20`, `21`, `22` (`DPAD_UP/DOWN/LEFT/RIGHT`)** и статический `Set` действий скольжения значениями **`Lqae.c`, `Lqae.d`, `Lqae.e`, `Lqae.f`**.
  - `<init>(Landroid/content/Context;Lqit;)V` (`0x5a38c4`, `insns_size=37`): сохраняет `Context`, `Lqit`, инициализирует состояние `this.g = new Looe(this)` (idle-состояние конечного автомата `Loof;`).
  - `g(Landroid/view/MotionEvent;)V` (`0x5a39d8`, `insns_size=17`): делегирует каждое `MotionEvent` в автомат `this.g = this.g.a(event)`.
  - `d()V` (`0x5a3920`), `f()V` (`0x5a3994`), `l()V` (`0x5a3a0c`), `close()V` (`0x5a3974`), `n(SoftKeyboardView)V` (`0x5a3a2c`): сбрасывают `this.g` обратно в `new Looe(this)` / сохраняют `SoftKeyboardView`.
- **Автомат активного свайпа: `Looc;->a(Landroid/view/MotionEvent;)Loof;` (`classes2.dex`, `code_item_off=0x5a2e14`, `insns_size=546`):**
  1. Проверка `ACTION_UP (1)` / `ACTION_CANCEL (3)` и совпадения `pointerId == this.b` — при завершении или чужом пальце возвращает `new Looe(a)` (сброс в idle).
  2. Сравнение угла смещения с порогом `Loml;->R` (`+00bf..+00ce`).
  3. Проверка минимальной длительности свайпа `(event.eventTime - this.f) >= this.g` (`+00cf..+00e1`).
  4. Вычисление направления `Lood;` по `(dx, dy)` (`+010e`, после исправления бага дампера) и проверка принадлежности допустимому набору `this.e:Collection` (`+010a..+0116`).
  5. Проверка минимальной скорости в dp/сек: `(distPx / density) / dtSec >= Loml;->U` (`+0118..+0187`, включая `div-double/2addr` на `+0183` и переход на `+0214` при недоборе скорости).
  6. Определение `Lxfe;` по исходному `keyCode` (`this.d`):
     - `62` (`SPACE`) → `Lxfe;->c` (`FREE_CURSOR_SOURCE_SWIPE_SPACE`, `+01c7`);
     - `67` (`DEL`) → `Lxfe;->g` (`FREE_CURSOR_SOURCE_SWIPE_DEL`, `+01ca`);
     - `19..22` (`DPAD`, через `packed-switch` на `+01be` и таблицу `+0216..+0221`) → `Lxfe;->d` (`FREE_CURSOR_SOURCE_SWIPE_DPAD`, `+01c4`);
     - иначе → `Lxfe;->a` (`UNSPECIFIED`).
  7. **Точный механизм запуска Free Cursor (`+01cc..+020c`):**
     - Создаётся `Map` из 3 записей:
       - `"activation_source"` → `Lohr;->c`
       - `"free_cursor_activation_source"` → выбранный `Lxfe;`
       - `"free_cursor_activation_swipe_direction"` → `Lood;->g`
     - Создаётся `Lqci(Lomw;->a:Lqch;, map)` (тип клавиатуры Free Cursor + payload-карта).
     - Создаётся `Lqbc(-10104 [0xd888 = SWITCH_KEYBOARD_WITH_PAYLOAD], null, lqci, 0)`.
     - Оборачивается через `Lohe;->d(Lqbc;)Lohe;` и отправляется через **`Lqit;->n(Lohe;)V`**.

### 2.3. Активация Free Cursor долгим нажатием пробела (`FreeCursorKeyboard;->e`)

- **DEX:** `classes2.dex`
- **Метод:** `Lcom/google/android/libraries/inputmethod/freecursor/FreeCursorKeyboard;->e(Landroid/view/inputmethod/EditorInfo;Ljava/lang/Object;)V` (`code_item_off=0x59ebbc`, `insns_size=259`).
- **Подтверждённая логика (`+0000..+00f6`):**
  1. Если переданный `payload` является `Map`, читает ключ `"free_cursor_activation_source"` (экземпляр `Lxfe;`).
  2. **Критическое открытие (`+0028..+0039`):** если **`payload == null`** (то есть клавиатура Free Cursor активирована простым **`SWITCH_KEYBOARD (-10004)` с `Lomw;->a`** без `Map`-payload), сам `FreeCursorKeyboard;->e` вызывает **`this.u.p(true)`** (где `this.u: Lpex;`, полученный в `<init>` через `Lomo;->ae()Lpex;`):
     - если `this.u.p(true) == true` (включено несколько клавиатур/языков) → выставляет `Lxfe;->f` (`FREE_CURSOR_SOURCE_SPACE_LONG_PRESS_MULTI_KEYBOARD`, `+0033`);
     - если `this.u.p(true) == false` (одна клавиатура) → выставляет `Lxfe;->e` (`FREE_CURSOR_SOURCE_SPACE_LONG_PRESS_SINGLE_KEYBOARD`, `+0036`).
  3. **Флаг режима блокировки (`+00de..+00f6`):** читает **`Loml;->D:Lokc;->g()`** (`Boolean`) и выставляет видимость кнопки lock (`this.v`: `View.VISIBLE` или `View.GONE`).
  4. **Вывод:** программный запуск `FreeCursorKeyboard` через событие **`SWITCH_KEYBOARD (-10004)` с `Lomw;->a` и `payload == null`** (либо `SWITCH_KEYBOARD_WITH_PAYLOAD (-10104)` с `Lqci(Lomw.a, map)` и `Lxfe.e/f`) является **нативным контрактом** для пути долгого нажатия пробела. Однако сам **продюсер** (где именно в Gboard при удержании пробела формируется `SWITCH_KEYBOARD (-10004, Lomw.a)` и как он конкурирует со `space_long_press_ime_picker`) отсутствует в текущих дампах (см. раздел 7).

### 2.4. Активный трекпад и выход из Free Cursor (`FreeCursorMotionEventHandler` + `FreeCursorKeyboard`)

#### `FreeCursorMotionEventHandler` (`classes2.dex`)
| Метод | `code_item_off` | `insns_size` | Подтверждённое поведение |
|---|---:|---:|---|
| `<clinit>()V` | `0x5a1820` | `55` | Константы длительностей: `a = 50ms`, `b = 150ms`, `c = Loml;->C` ms |
| `<init>(Context, Lqit)V` | `0x5a18a0` | `47` | Инициализирует `this.f = new Lonl(this, 1)` (начальное состояние `Lonk;`) |
| `gt(MotionEvent)Z` | `0x5a163c` | `2` | **Безусловно возвращает `true`** — принимает live handoff активного касания при переключении на `FreeCursorKeyboard` |
| `gs(MotionEvent)V` | `0x5a1a64` | `14` | Пробрасывает переданный (handoff) `MotionEvent` в `this.f = this.f.a(event)` |
| `g(MotionEvent)V` | `0x5a19f0` | `17` | Пробрасывает обычные `MotionEvent` в `this.f = this.f.a(event)` |
| `b(MotionEvent, Integer, Integer)Lonj;` | `0x5a1650` | `192` | Определяет нахождение пальца в прикраевой зоне (отступ `Lonq.a(Loml.p, ctx)`) и возвращает `DPAD` (`19/20/21/22`) для автопрокрутки у края экрана |
| `c(int, Long, int, Double)V` | `0x5a1994` | `38` | В цикле `count` раз отправляет `Lohe.e(keyCode, null)` с метаданными скорости `Lonp(velocity)` через `Lqit;->n(Lohe;)V` |
| `p()V` | `0x5a1910` | `29` | Отменяет корутины `g`, `i` и вызывает `VelocityTracker.recycle()` |
| `o()Lonk;` | `0x5a17e0` | `23` | Вызывает `p()`, отправляет **`Lohe.e(-10215 [0xd819 = FREE_CURSOR_LOCK], Lonu.a)`** через `Lqit;->n(Lohe;)V`, возвращает `new Lonl(this, 1)` |
| `l()V` / `f()V` / `close()V` | `0x5a1a24` / `0x5a197c` / `0x5a195c` | `12` / `4` / `7` | Сброс состояния `f`, остановка корутин и очистка `VelocityTracker` |

#### `FreeCursorKeyboard` (`classes2.dex`)
| Метод | `code_item_off` | `insns_size` | Подтверждённое поведение |
|---|---:|---:|---|
| `<clinit>()V` | `0x59e700` | `78` | Набор `b` из 4 кодов `DPAD` (`19, 20, 21, 22`) |
| `eR(SoftKeyboardView, KeyboardViewDef)V` | `0x59f0c8` | `212` | Находит views трекпада/подсказки/кнопки lock (`v`) и кнопки выделения, вешает клик-слушатели |
| `m(Lohe;)Z` | `0x59e478` | `266` | Обрабатывает `-10239` (`0xd801 = FREE_CURSOR_MOTION_EVENT` → `P(Lohe)`), подавляет `DPAD_UP/DOWN (19, 20)` при `!m.b()` (однострочное поле), пропускает `DPAD (19..22)` с возвратом `false` (при активном режиме выделения `j` шлёт `FINISH_INLINE_COMPOSING (-10090)` и ставит флаг `h |= 1`, скрывает подсказку `H()` с анимацией `200ms`, даёт троттленный хаптик `Q(9)` через `Loml.ab`), а на `-10215` (`0xd819 = FREE_CURSOR_LOCK`) вызывает **`R(Lonv)`** |
| `P(Lohe;)Z` | `0x59e200` | `285` | Обновляет визуальный указатель/лупу (`Lomc`) по координатам `FREE_CURSOR_MOTION_EVENT` (`-10239`), используя среднее `(a + b) / 2.0f` (`+006f..+0072`) |
| `R(Lonv;)V` | `0x59e954` | `278` | Диспетчер состояний блокировки: `Lonr` (обратный отсчёт lock), `Lons` (заблокирован + панель), `Lont` (разблокирован), **`Lonu` → вызывает `F()`** |
| `F()V` | `0x59eb90` | `14` | **Штатный выход из Free Cursor:** отправляет **`Lohe.e(-10004 [0xd8ec = SWITCH_KEYBOARD], Lqch.b)`** через **`Lpkz;->N(Lohe;)V`** (возврат на Prime-клавиатуру) |
| `K()V` / `M()V` | `0x59f51c` / `0x59f5b8` | `70` / `41` | Режим выделения текста: отправляет `KeyEvent(KEYCODE_SHIFT_LEFT=59, ACTION_DOWN/UP, SOURCE_KEYBOARD=0x101)` через `Lpcn;->D(KeyEvent)` + `FINISH_INLINE_COMPOSING (-10090)` |
| `h()V` | `0x59edd4` | `268` | Полная очистка при закрытии клавиатуры: скрытие view `h`, `R(Lont.a)`, закрытие попапов, разборка лупы `Lomc`, отписка `T`/`U`/`X`, отмена корутины `g`, учёт `Lomy.a`, вызов `M()` (гарантированный отпуск `SHIFT_LEFT`), `super.h()` |

**Что осталось НЕ дамплено по Free Cursor (`BLOCKED` для безопасного выбора `OPTION A`):**
1. Реализации автомата **`Lonl`**, **`Long`**, **`Loni`** (`Lonk;->a(MotionEvent)Lonk;`) — именно в них лежит фактическая обработка `ACTION_DOWN` / `ACTION_MOVE` / `ACTION_UP` / `ACTION_CANCEL`, запуск обратного отсчёта `Lonr` vs немедленный вызов `o()` (выход на `ACTION_UP`), а также поведение после синтетического `ACTION_CANCEL` на Prime-клавиатуре.
2. **`Looe;->a(MotionEvent)Loof;`** — проверка гейтов `ACTION_DOWN` в `TriggerFreeCursorMotionEventHandler` (в т.ч. проверка `noScrubbing`, флага `"free_cursor"`, `enable_scrub_move` и длительности удержания).
3. Продюсер пути **`SWITCH_KEYBOARD (-10004, Lomw.a)`** при долгом нажатии пробела и конкретный обработчик настройки **`space_long_press_ime_picker`** + `Lqin;->y()V`.

### 2.5. Полная трассировка Scrub-обработчиков (`classes.dex`)

Все 4 класса полностью декодированы из `GBOARD_18.5.4_TARGETED_CODE_ITEM_DUMP.txt`:

| Класс | `code_item_off` (`<init>` / `b`) | `keyCode` | `leaveKeyRect` | `mode` | Keycodes (`START` / `MOVE` / `FINISH` / `CANCEL`) | TypedArray res | Направления в `b(MotionEvent)` |
|---|---:|---:|---:|---:|---|---|---|
| `ScrubMoveMotionEventHandler` | `0x1f12b4` / наследует `0x521568` | `62` (`SPACE`) | `false` | `1` | `-10061` / `-10053` / `-10054` / `-10062` | `0x7f0300bb` | Двунаправленно (`p(event, 3)`) |
| `ScrubDeleteMotionEventHandler` | `0x1f0fdc` / `0x521458` | `67` (`DEL`) | `true` | `2` | `-10050` / `-10051` / `-10052` / `-10063` | `0x7f0300ba` | Двунаправленно (`p(event, 3)`), только если `!p.q()` |
| `InlineSuggestionScrubSpaceMotionEventHandler` | `0x1eace0` / `0x4fbc58` | `62` (`SPACE`) | `false` | `1` | `-50001` / `-50003` / `-50004` / `-50002` | `0x7f0300bb` + int `0x7f0c0063` | **Однонаправленно** (`dir = 1` или `2` по RTL/LTR `Lpem.d().G()`), только если активна inline-подсказка `Lqlp;->e(Lpaw;->a)Z` |

**Ключевые детали базового `ScrubMotionEventHandler` (`classes.dex`):**
- `g(MotionEvent)V` (`0x521634`, `insns_size=254`):
  - Пропускает обработку при TalkBack (`Lqit.dr().v()`).
  - Проверяет cooldown после последней клавиши: `event.eventTime >= this.p.c() + this.c.a`.
  - Проверяет, что `SoftKeyView` имеет `PRESS`-действие с `keyCode == this.g.a` (`62` или `67`) и **отсутствует** `Lqae.e` (слайд-действие на этой клавише).
  - Проверяет feature-флаг **`Lqhz;->a:Lokc;->g()`** (`Boolean`).
  - При входе вызывает **`Lqit;->m()`** (захватывает владение потоком касаний и гасит конкурирующие хендлеры клавиатуры).
- `r(MotionEvent, boolean)V` (`0x52184c`, `insns_size=219`):
  - **Доказано на уровне инструкций:** проверяет **`Lobk;->v(pkg, "noScrubbing", this.e)`**; если поле запрещает scrubbing, блокирует скраббинг и показывает toast `0x7f1411aa` (ограниченно).
- **Важное открытие:** внутри самого `ScrubMotionEventHandler` (и его 3 подклассов) **нет чтения `"enable_scrub_move"` / `0x7f14096b`** — этот ключ читается на уровне выше (вероятно, при регистрации `MotionEventHandler` в клавиатуре/модуле). Чтобы доказать, что отключение `"enable_scrub_move"` не затрагивает `ScrubDeleteMotionEventHandler` и `TriggerFreeCursorMotionEventHandler`, нужен дамп xref на `"enable_scrub_move"` / `0x7f14096b`.

### 2.6. Обновлённые ответы на 12 вопросов Направления A

1. **Точный способ программной активации Free Cursor без имитации свайпа:** `CONFIRMED` на стороне приёмника (`FreeCursorKeyboard;->e` при `SWITCH_KEYBOARD (-10004)` с `Lomw.a` и `payload == null` сам выставляет `Lxfe.e/f`, а `Looc;->a` показывает формат `SWITCH_KEYBOARD_WITH_PAYLOAD (-10104)` + `Lqci(Lomw.a, map)` через `Lqit;->n(Lohe)`). Продюсер long-press ещё не дамплен (`PARTIALLY CONFIRMED`).
2. **Путь `FREE_CURSOR_SOURCE_SPACE_LONG_PRESS_SINGLE/MULTI_KEYBOARD`:** `CONFIRMED` (`FreeCursorKeyboard;->e` `+0028..+0039`: `payload == null` → `this.u.p(true)` выбирает `Lxfe.f` или `Lxfe.e`).
3. **Разница с `FREE_CURSOR_SOURCE_SWIPE_SPACE`:** `CONFIRMED` (`Looc;->a` передаёт `Lxfe.c` в `Map` через `-10104`; `Lomy;->a(Lxfe)` возвращает `true` только для `Lxfe.e/f`).
4. **Handoff касания в `FreeCursorMotionEventHandler`:** `PARTIALLY CONFIRMED` (`gt(MotionEvent)` всегда возвращает `true`, `gs(MotionEvent)` отдаёт событие в `this.f.a(event)`), но поведение `Lonl`/`Long`/`Loni` после синтетического `ACTION_CANCEL` на Prime-клавиатуре не дамплено (`BLOCKED`).
5. **Обязательность `free_cursor_lock_mode = false` и выход на `ACTION_UP`:** `PARTIALLY CONFIRMED` (`FreeCursorKeyboard;->e` читает `Loml;->D` для кнопки lock; `FreeCursorMotionEventHandler;->o()` шлёт `-10215` + `Lonu.a`, что вызывает `FreeCursorKeyboard;->F()` → `-10004` + `Lqch.b`). Кто именно вызывает `o()` на `ACTION_UP` (в `Lonl`/`Long`/`Loni`) — не дамплен (`BLOCKED`).
6. **Очистка и отсутствие утечек (`ACTION_UP`/`ACTION_CANCEL`/`onWindowHidden`):** `CONFIRMED` на уровне `FreeCursorKeyboard;->h()` (`0x59edd4`: сбрасывает `R(Lont.a)`, отпускает `SHIFT_LEFT` через `M()`, закрывает лупу `Lomc`, отменяет корутины) и `FreeCursorMotionEventHandler;->p()/l()/close()`.
7. **Связка с `noScrubbing`:** `CONFIRMED` для `ScrubMotionEventHandler;->r()` (`Lobk;->v(pkg, "noScrubbing", e)` + toast `0x7f1411aa`); проверка `noScrubbing` для Free Cursor (`Looe.a` / продюсер long-press) не дамплено (`BLOCKED`).
8. **Влияние `enable_scrub_move` на `ScrubDeleteMotionEventHandler` и `TriggerFreeCursorMotionEventHandler`:** `BLOCKED` (внутри всех 4 `Scrub*` и `TriggerFreeCursor*` ключ `"enable_scrub_move"` / `0x7f14096b` не читается; требуется дамп xref на этот ресурс).
9. **Поведение при `InlineSuggestionScrubSpaceMotionEventHandler`:** `CONFIRMED` (`b(MotionEvent)` на `0x4fbc58` активен только когда `Lqlp;->e(Lpaw;->a)Z == true`, работает однонаправленно `1`/`2` по RTL/LTR, использует отдельные коды `-50001..-50004`).
10. **Сдвиг курсора, composing text и выделение:** `CONFIRMED` для `FreeCursorKeyboard`: отправляет нативные `DPAD (19..22)` через `FreeCursorMotionEventHandler;->c()`, шлёт `FINISH_INLINE_COMPOSING (-10090)` при выделении и управляет `KEYCODE_SHIFT_LEFT (59)` через `Lpcn;->D(KeyEvent)` (`K()`/`M()`).
11. **Подавление `space_long_press_ime_picker`:** `BLOCKED` (обработчик настройки и `Lqin;->y()V` не входят в текущие дампы).
12. **Совместимость с `KeyboardViewHolder.dispatchTouchEvent`:** `CONFIRMED` — `FreeCursorMotionEventHandler` принимает touch через `SoftKeyboardView` → `MotionEventHandler` pipeline ниже `KeyboardViewHolder`; при `OPTION A` важно не сломать handoff своим синтетическим `ACTION_CANCEL` (проверка зависит от `Lonl`/`Long`/`Loni`).

---

## 3. Направление B — Полная байткод-трассировка переключения языков (`NEXT`/`PREVIOUS`)

### 3.1. КРИТИЧЕСКОЕ ОПРОВЕРЖЕНИЕ гипотезы о `Lqga;` / `Lqfz;` / `Lqev;` / `Ligz;->ad` / `Lpux;->fM/fN`

По результатам декодирования `GBOARD_18.5.4_LANGUAGE_ENUM_XREF_CODE.txt` доказано, что ни один из перечисленных классов **НЕ является диспетчером переключения языка**:

| Класс / метод (`classes.dex`) | `code_item_off` | `insns_size` | Реальная роль (доказано по байткоду) |
|---|---:|---:|---|
| `Lqga;` (`<clinit>`, `a`, `b`, `c`, `values`) | `0x3465b4` (`a`: `0x51e7d0`, `b`: `0x51e7f8`, `c`: `0x51e7e4`) | `78` / `2` / `3` / `2` | **Enum метрик задержки (`Lqek;`)**, а не action-диспетчер. Значения: `OPEN_KEYBOARD`, `OPEN_KEYBOARD_COLD`, `OPEN_KEYBOARD_HOT`, `SWITCH_LANGUAGE`, `SWITCH_TO_NEXT_LANGUAGE`, `OPEN_EXTENSION`. `a() = -1`, `b() = ""`, `c() = 1` |
| `Lqfz;-><clinit>()V` | `0x34645c` | `101` | Словарь имён Clearcut-таймеров для `Lqga;`: `"KeyboardLatency.SwitchLanguage"`, `"KeyboardLatency.SwitchToNextLanguage"` и др. |
| `Lqev;-><clinit>()V` | `0x3431d4` | `126` | **Enum телеметрии** (`INPUT_METHOD_PICKER_SHOWN`, `SWITCH_TO_NEXT_LANGUAGE` и др.) |
| `Lhcp;->U(Map, Lohr)V` | `0x47b404` | `61` | Логирование задержек `"KeyboardLatency.OpenExtension.*"` (использует `Lqga.OPEN_EXTENSION`) |
| `Ligz;->ad(String)V` | `0x48dd2c` | `18` | Форматирует `"Input.switchToNextLanguage.%s"` и пишет счётчик через `Lqdy;->c(String)` |
| `Lpux;->fM(Context, Lqhb)V` / `Lpux;->fN()V` | `0x32c390` / `0x517aa0` | `9` / `17` | Обёртки `Trace.beginSection/endSection` для `LanguageSwitcherAccessPointProviderModuleProvider$AccessPointProviderModule.onCreate/onDestroy` (`fN` вызывает `Lpux;->b()V`, тело которого не дамплено) |

### 3.2. Полная верифицированная таблица keycodes Gboard 18.5.4 (`Lqcm;-><clinit>()`)

- **DEX:** `classes.dex`
- **Метод:** `Lqcm;-><clinit>()V` (`code_item_off=0x33c4a0`, `insns_size=5398`)
- Проверены **все** отрицательные keycode-регистрации (`+081c..+1515`).

| Keycode (dec) | Hex (`const/16`) | Имя в `Lqcm.<clinit>()` | Смещение в `Lqcm.<clinit>` | Значение для проекта |
|---:|---|---|---:|---|
| **`-10000`** | `0xd8f0` (`-0x2710`) | **`SWITCH_LANGUAGE`** | `+087f` | **Главный кандидат для адресного переключения на конкретный язык / `PREVIOUS`** (требует дамп обработчика payload!) |
| **`-10011`** | `0xd8e5` (`-0x271b`) | **`SWITCH_TO_NEXT_LANGUAGE`** | `+08b6` | **Текущий путь `NEXT` (внутри Gboard)** — явно отделён от `-10197`! |
| **`-10197`** | `0xd82b` (`-0x27d5`) | **`SWITCH_TO_NEXT_LANGUAGE_ALLOWING_OTHER_IMES`** | `+08c1` | **КЛЮЧЕВОЕ ОТКРЫТИЕ:** отдельный keycode для перехода к внешним IME (Samsung Keyboard и др.) — объясняет, почему `-10011` архитектурно отделён от кросс-IME переключения |
| **`-10022`** | `0xd8da` (`-0x2726`) | `SHOW_SYSTEM_IME_PICKER` | `+092f` | Системный диалог выбора IME (запрещено вызывать по ТЗ) |
| **`-10065`** | `0xd8af` (`-0x2751`) | `UPDATE_CURRENT_IME_LOCALES` | `+0b4a` | Обновление локалей активного IME |
| `-10004` | `0xd8ec` | `SWITCH_KEYBOARD` | `+08a0` | Переключение клавиатуры (выход из Free Cursor `Lqch.b`, запуск Free Cursor `Lomw.a` с `payload == null`) |
| `-10104` | `0xd888` | `SWITCH_KEYBOARD_WITH_PAYLOAD` | `+0c89` | Запуск Free Cursor с `Map`-payload (`Looc;->a`) |
| `-10215` | `0xd819` | `FREE_CURSOR_LOCK` | `+0f99` | Управление блокировкой и выходом (`Lonu.a`) Free Cursor |
| `-10239` | `0xd801` | `FREE_CURSOR_MOTION_EVENT` | `+103e` | Координаты указателя в `FreeCursorKeyboard;->P` |
| `-10090` | `0xd896` | `FINISH_INLINE_COMPOSING` | `+0c10` | Завершение inline composing перед выделением в Free Cursor |
| `-10091` | `0xd895` | `HAPTIC_TEXT_HANDLE` | `+0c1b` | Тактильный отклик курсора |
| `-10061..-10062` (`-10061/-10053/-10054/-10062`) | `0xd8b3` / `0xd8bb` / `0xd8ba` / `0xd8b2` | `SCRUB_MOVE_START / MOVE / FINISH / CANCEL` | проверено | События `ScrubMoveMotionEventHandler` |
| `-10050..-10063` (`-10050/-10051/-10052/-10063`) | `0xd8be` / `0xd8bd` / `0xd8bc` / `0xd8b1` | `SCRUB_DELETE_START / DELETE / FINISH / CANCEL` | проверено | События `ScrubDeleteMotionEventHandler` |
| `-50001..-50004` | `0x3caf` / `0x3cad` / `0x3cac` / `0x3cae` | `INLINE_SCRUB_MOVE_START / MOVE / FINISH / CANCEL` | проверено | События `InlineSuggestionScrubSpaceMotionEventHandler` |

- **Окончательно доказано (`NOT FOUND`):** во всей таблице `Lqcm.<clinit>()` (`5398` code units) **нет** keycode `SWITCH_TO_PREVIOUS_LANGUAGE` (или любого другого отрицательного keycode для предыдущего языка).

### 3.3. Новая подтверждённая байткод-наводка на менеджер языков (`Lpex;`)

В `FreeCursorKeyboard;-><init>` (`0x59e7ac`) и `FreeCursorKeyboard;->e` (`0x59ebbc`, `+002c`) обнаружен прямой вызов:
- `Lomo;->ae()Lpex;` → сохраняется в `FreeCursorKeyboard;->u:Lpex;`;
- `Lpex;->p(Z)Z` вызывается с аргументом `true` для проверки **наличия нескольких включённых клавиатур/языков** (`FREE_CURSOR_SOURCE_SPACE_LONG_PRESS_MULTI_KEYBOARD` vs `SINGLE_KEYBOARD`).

> **Важно (строгая дисциплина доказательств):** `Lpex;` — подтверждённый байткодом **высокоприоритетный кандидат** на интерфейс `InputMethodEntryManager` в Gboard `18.5.4`, но его методы получения списка включённых `InputMethodEntry`, текущего `InputMethodEntry` и переключения на произвольный `InputMethodEntry` **не входят в текущие дампы** и **не считаются подтверждёнными** до получения `code_item` для `Lpex;` и его реализации.

### 3.4. Обновлённые ответы на 10 вопросов Направления B

1. **Есть ли нативный `SWITCH_TO_PREVIOUS_LANGUAGE` keycode?** `NOT FOUND` (доказано полной проверкой `Lqcm.<clinit>()`).
2. **Что такое `Lqga;`?** `CONFIRMED` — enum метрик задержки (`Lqek;`), НЕ диспетчер смены языка.
3. **Точный обработчик `-10011` (`SWITCH_TO_NEXT_LANGUAGE`) за `Lphr;->aw(Lohe;)Z`:** `BLOCKED` (нет в текущих дампах; нужен дамп xref на `-10011` / `-0x271b`).
4. **Гарантия невыхода во внешний IME (Samsung Keyboard):** `PARTIALLY CONFIRMED` — в `Lqcm.<clinit>()` существует чёткое разделение `-10011` (`SWITCH_TO_NEXT_LANGUAGE`) и `-10197` (`SWITCH_TO_NEXT_LANGUAGE_ALLOWING_OTHER_IMES`), но фактический `if`-гейт внутри обработчика `-10011` ещё не дамплен (`BLOCKED`).
5. **Назначение `-10000` (`SWITCH_LANGUAGE`) и формат его payload:** `BLOCKED` (ключевой кандидат для `OPTION B`, но обработчик `-10000` не дамплен).
6. **Порядок переключения (`NEXT` — циклический или MRU):** `BLOCKED` (требуется дамп обработчика `-10011` и `Lpex;` / реализации менеджера `InputMethodEntry`).
7. **Дескрипторы получения списка включённых `InputMethodEntry`, текущего элемента и адресного переключения:** `BLOCKED` (найдена точная наводка `Lpex;` через `FreeCursorKeyboard;->u:Lpex;` + `Lpex;->p(Z)Z`, но методы `Lpex;` и его реализации не дамплены).
8. **Валидность `(N - 1)` вызовов `NEXT` (Вариант C) для `N >= 3`:** `BLOCKED` — опасно без проверки, не является ли `-10011` MRU-порядком и не вызывает ли он N-1 полных циклов смены раскладки/визуальных артефактов.
9. **Поведение при `N == 1` языке:** `PARTIALLY CONFIRMED` — `Lpex;->p(true)` в `FreeCursorKeyboard;->e` подтверждает наличие встроенного детектора `multi-keyboard` vs `single-keyboard`, но список языков (`size() <= 1`) требует дампа `Lpex;`.
10. **Роль `Lpux;` (`LanguageSwitcherAccessPointProvider`):** `PARTIALLY CONFIRMED` (`fM`/`fN` — только `Trace` + `Lpux;->b()V`; сам `b()` и хендлеры кликов не дамплены).

---

## 4. Направление C — Конкурирующие жесты и ограничение единого хука `KeyboardViewHolder.dispatchTouchEvent`

### 4.1. Верифицированная карта конкурирующих обработчиков на пробеле

На основе декодированных `code_item` в `classes.dex` и `classes2.dex`:

1. **Уровень ViewGroup (выше `SoftKeyboardView`):**
   - `KeyboardViewHolder;->dispatchTouchEvent(MotionEvent)Z` (`classes.dex`, method_id `0014660`) — **уже перехвачен существующим хуком `SwipeDismissPatch`** в `vortexnode/GboardSamsung`.
   - **Жёсткое ограничение проекта:** второй независимый хук на `KeyboardViewHolder.dispatchTouchEvent` **запрещён**; любая логика перехвата пробела должна встраиваться через единый композитор/диспетчер вокруг существующего хука.
2. **Уровень `SoftKeyboardView` → `MotionEventHandler` pipeline (ниже `KeyboardViewHolder`):**
   - **`ScrubMoveMotionEventHandler`** (`keyCode=62`, `leaveKeyRect=false`, двунаправленный `p(event, 3)`, гейты: `!TalkBack`, cooldown `p.c() + c.a`, `Lqhz;->a:Lokc`, `noScrubbing` в `r()`, захватывает поток через `Lqit;->m()`).
   - **`InlineSuggestionScrubSpaceMotionEventHandler`** (`keyCode=62`, `leaveKeyRect=false`, **однонаправленный `dir=1/2` по RTL/LTR**, активен **только при `Lqlp;->e(Lpaw;->a)Z == true`** — когда в шапке показана inline-подсказка, шлёт `-50001..-50004`). **Важно:** при активной inline-подсказке свайп по пробелу в направлении подсказки конкурирует со свайпом языка — это нужно учитывать в state machine.
   - **`TriggerFreeCursorMotionEventHandler`** (`keyCode in {62, 19..22}`, через `Looc;->a` шлёт `-10104` `SWITCH_KEYBOARD_WITH_PAYLOAD` с `Lxfe.c = FREE_CURSOR_SOURCE_SWIPE_SPACE` при прохождении порога угла `Loml.R`, длительности `g` и скорости `Loml.U`).
   - **`ScrubDeleteMotionEventHandler`** (`keyCode=67 [DEL]`, `leaveKeyRect=true`, отдельный TypedArray `0x7f0300ba`, коды `-10050..-10063`) — полностью изолирован по `keyCode=67` от пробела (`62`), но неизвестно, влияет ли глобальная настройка `"enable_scrub_move"` на его регистрацию.
   - **`space_long_press_ime_picker` / Space Long-Press → Free Cursor** — точный `MotionEventHandler` / `SoftKey` action-обработчик не дамплен.

### 4.2. Критический риск для `OPTION A` (переиспользование Free Cursor)
Если перехват удержания пробела в `KeyboardViewHolder.dispatchTouchEvent` отправит синтетический `ACTION_CANCEL` в `SoftKeyboardView`, а затем программно переключит клавиатуру на `FreeCursorKeyboard`:
- `FreeCursorMotionEventHandler;->gt(MotionEvent)` возвращает `true` и ждёт live-handoff (`gs(MotionEvent)`), но после `ACTION_CANCEL` в `SoftKeyboardView` цепочка `MotionEventHandler` может сбросить активный pointer, либо `Lonl`/`Long`/`Loni` потребуют реального `ACTION_DOWN` перед `ACTION_MOVE`.
- Без декодирования `Lonl`/`Long`/`Loni` подтвердить корректность handoff **невозможно**.

---

## 5. Обновлённая сравнительная таблица верификации (9 строк)

| # | Механизм / гипотеза | Прежний статус (индекс символов) | Новый статус (raw `code_item`) | Доказательство (DEX / `code_item_off` / смещение) |
|---|---|---|---|---|
| 1 | `FreeCursorKeyboard` lifecycle (`e`, `m`, `R`, `F`, `h`, `K`, `M`, `P`) | `BLOCKED` | **`CONFIRMED`** | `classes2.dex`: `0x59ebbc`, `0x59e478`, `0x59e954`, `0x59eb90`, `0x59edd4`, `0x59f51c`, `0x59f5b8`, `0x59e200` |
| 2 | `Lxfe;` источники (`SWIPE_SPACE`, `SPACE_LONG_PRESS_SINGLE/MULTI`) | `PARTIALLY CONFIRMED` | **`CONFIRMED`** | `classes3.dex` `0x1b9d24` (`a..g`); `classes2.dex` `FreeCursorKeyboard;->e` `0x59ebbc` (`+0028..+0039`), `Looc;->a` `0x5a2e14` (`+01c4..+01ca`) |
| 3 | `TriggerFreeCursorMotionEventHandler` swipe-активация (`-10104`) | `BLOCKED` | **`PARTIALLY CONFIRMED`** | `Looc;->a` `0x5a2e14` (`+01cc..+020c` → `-10104` + `Lqci(Lomw.a, map)` через `Lqit.n`) подтверждён; `Looe;->a` (`ACTION_DOWN` gate) не дамплен |
| 4 | `FreeCursorMotionEventHandler` handoff, движение, `lock_mode`, выход на `ACTION_UP` | `BLOCKED` | **`PARTIALLY CONFIRMED`** | `gt()=true` (`0x5a163c`), `gs`/`g` (`0x5a1a64`/`0x5a19f0`), `c()` DPAD (`0x5a1994`), `o()` → `-10215 Lonu.a` (`0x5a17e0`) подтверждены; автоматы `Lonl`/`Long`/`Loni` не дамплены (`BLOCKED`) |
| 5 | Разделение `ScrubMove`, `ScrubDelete`, `InlineSuggestionScrubSpace` + `noScrubbing` | `PARTIALLY CONFIRMED` | **`CONFIRMED`** | `classes.dex`: `0x1f12b4`, `0x1f0fdc`, `0x1eace0`, `0x4fbc58`, `0x521634`, `0x52184c` (`Lobk.v("noScrubbing")`); xref на `"enable_scrub_move"` всё ещё нужен |
| 6 | Наличие нативного keycode `SWITCH_TO_PREVIOUS_LANGUAGE` | `PARTIALLY CONFIRMED` | **`NOT FOUND`** | `classes.dex` `Lqcm;-><clinit>()` (`0x33c4a0`, `5398` units): проверены все отрицательные keycodes — `SWITCH_TO_PREVIOUS_LANGUAGE` отсутствует |
| 7 | Разделение intra-Gboard vs cross-IME keycodes (`-10011` vs `-10197`, `-10000`) | `BLOCKED` | **`PARTIALLY CONFIRMED`** | `Lqcm.<clinit>` (`0x33c4a0`): `-10000` (`+087f`), `-10011` (`+08b6`), `-10197` (`+08c1`, `ALLOWING_OTHER_IMES`), `-10022` (`+092f`); тела их обработчиков за `Lphr.aw` не дамплены |
| 8 | Роль `Lqga;`, `Lqfz;`, `Lqev;`, `Ligz;->ad`, `Lpux;->fM/fN` | `BLOCKED` | **`CONFIRMED` (не диспетчеры)** | `classes.dex`: `0x3465b4`, `0x34645c`, `0x3431d4`, `0x48dd2c`, `0x32c390`, `0x517aa0` — только телеметрия, Clearcut-таймеры и `Trace` |
| 9 | Менеджер `InputMethodEntry` (список, текущий, адресное переключение для `PREVIOUS`) | `BLOCKED` | **`BLOCKED`** | Обнаружена байткод-наводка `Lpex;` (`Lomo;->ae()Lpex;`, `Lpex;->p(Z)Z` в `FreeCursorKeyboard;->e` `+002c`), но `code_item` для `Lpex;` и обработчиков `-10000`/`-10011` отсутствуют |

---

## 6. Итоговые вердикты Этапа 4.1

### 6.1. Управление курсором (удержание пробела) — **`BLOCKED`** (`OPTION A` частично подтверждён, `OPTION B` готов как fallback)
- **Прогресс:** В отличие от предыдущей итерации (где были только имена методов), теперь на уровне Dalvik-инструкций доказана вся архитектура `FreeCursorKeyboard` (`e`, `m`, `R`, `F`, `h`, `K`, `M`, `P`), `TriggerFreeCursorMotionEventHandler` (`Looc;->a`), `FreeCursorMotionEventHandler` (`gt`, `gs`, `b`, `c`, `o`, `p`) и всех трёх `Scrub*`-обработчиков.
- **Почему `OPTION A` всё ещё `BLOCKED`:** без декодирования `Lonl`/`Long`/`Loni` (`Lonk.a`), `Looe.a`, продюсера space long-press (`-10004` + `Lomw.a` / `space_long_press_ime_picker`) и xref на `"enable_scrub_move"` (`0x7f14096b`) нельзя гарантировать:
  1. корректный live-handoff пальца в `FreeCursorMotionEventHandler` после удержания пробела без отрыва;
  2. немедленный выход на `ACTION_UP` без залипания lock-режима;
  3. отсутствие побочного отключения `ScrubDeleteMotionEventHandler`.
- **Fallback:** `OPTION B` (прямой Samsung-подобный `InputConnection` DPAD-трекпад поверх единого хука `KeyboardViewHolder.dispatchTouchEvent`, с `finishComposingText()`, `KEYCODE_DPAD_LEFT/RIGHT` и проверкой `noScrubbing`) остаётся полностью жизнеспособным и независимым от внутренних состояний `Lonl`/`Long`/`Loni`.

### 6.2. Двунаправленное переключение языков (`NEXT`/`PREVIOUS`) — **`BLOCKED`** (целевой путь — `OPTION B` через `Lpex;` и/или `-10000` `SWITCH_LANGUAGE`)
- **Доказано:**
  - `OPTION A` (нативный keycode `SWITCH_TO_PREVIOUS_LANGUAGE`) окончательно закрыт как **`NOT FOUND`** по полному `Lqcm.<clinit>()`.
  - `Lqga;`, `Lqfz;`, `Lqev;`, `Ligz;->ad`, `Lpux;->fM/fN` — только телеметрия/трассировка.
  - В `Lqcm.<clinit>()` подтверждены ключевые коды **`-10000` (`SWITCH_LANGUAGE`)**, **`-10011` (`SWITCH_TO_NEXT_LANGUAGE`)** и **`-10197` (`SWITCH_TO_NEXT_LANGUAGE_ALLOWING_OTHER_IMES`)**.
  - Обнаружена конкретная байткод-наводка на менеджер раскладок/языков: **`Lpex;`** (`Lomo;->ae()Lpex;`, `Lpex;->p(Z)Z`).
- **Почему `BLOCKED`:** в дампах отсутствуют тела обработчиков `-10000`, `-10011`, `-10197` и методы интерфейса/реализации `Lpex;`. Без них невозможно гарантировать детерминированный `PREVIOUS` при `N >= 3` языках и 100% защиту от перехода в Samsung Keyboard.

---

## 7. Точный список целевых `code_item` для финальной разблокировки (Этап 4.2)

Для закрытия всех оставшихся блокеров и выбора между `OPTION A`/`OPTION B` больше не нужны широкие дампы — достаточно выгрузить **ровно 2 узких пакета `code_item`** из того же APK `18.5.4.993608717-release-arm64-v8a` (с исправлением в дампере ширины `12x` для `0xc6`–`0xc9`, `0xce`):

### Пакет 1 — Закрытие блокера `NEXT`/`PREVIOUS` (высший приоритет)
1. **Все `code_item` методов, содержащих константы `-10000` (`0xd8f0`), `-10011` (`0xd8e5`) и `-10197` (`0xd82b`)** в `classes.dex` и `classes2.dex` (исключая `Lqcm.<clinit>`) — это даст точный диспетчер `SWITCH_LANGUAGE`, `SWITCH_TO_NEXT_LANGUAGE` и `SWITCH_TO_NEXT_LANGUAGE_ALLOWING_OTHER_IMES` за `Lphr;->aw(Lohe;)Z`.
2. **Определение интерфейса `Lpex;` и всех классов, реализующих `Lpex;`** (особенно методы, возвращающие `List` / `InputMethodEntry`, текущий `InputMethodEntry` и методы переключения на переданный `InputMethodEntry` / `Locale`), плюс тело **`Lpux;->b()V`** (`classes.dex`).

### Пакет 2 — Закрытие блокера `OPTION A` (Free Cursor) и `enable_scrub_move`
3. **`classes2.dex`: `Lonl;`, `Long;`, `Loni;`, `Lonk;`** (в частности `a(Landroid/view/MotionEvent;)Lonk;`) — полная логика движения, `ACTION_UP`/`ACTION_CANCEL`, lock countdown и вызова `FreeCursorMotionEventHandler;->o()`.
4. **`classes2.dex`: `Looe;->a(Landroid/view/MotionEvent;)Loof;`** — `ACTION_DOWN`-гейты `TriggerFreeCursorMotionEventHandler`.
5. **Все методы в `classes.dex`/`classes2.dex` с xref на `Lomw;->a`** (исключая `Looc;->a`) и на строку **`"space_long_press_ime_picker"`** / **`Lqin;->y()V`** — точный продюсер долгого нажатия пробела.
6. **Все методы в `classes.dex`/`classes2.dex` с xref на `"enable_scrub_move"` или ресурс `0x7f14096b`** — проверка, безопасно ли отключать `ScrubMoveMotionEventHandler` без влияния на `ScrubDeleteMotionEventHandler` и `TriggerFreeCursorMotionEventHandler`.
