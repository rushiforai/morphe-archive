# Stage 5 — отчёт о реализации Samsung-подобных жестов пробела

**Целевой APK:** `Gboard-v18.5.4.993608717-release-arm64-v8a.apk`  
**Источник спецификации:** `docs/SPACEBAR_STAGE_4_2_APK_REANALYSIS.md`, `docs/SPACEBAR_STAGE_5_IMPLEMENTATION_TASK.md`  
**Статус сборки `.mpp`:** сборка `.mpp` и Gradle-задачи **не запускались** (по требованию Stage 5 — сначала проверка diff).

---

## 1. Изменённые и созданные файлы

### Runtime-расширение (`extensions/extension/src/main/java/...`)
1. `extensions/extension/src/main/java/dev/jason/gboardpatches/extension/spacebargesture/GboardSpacebarGestureState.java` — чистая JVM state machine (`IDLE`, `SPACE_TRACKING`, `LANGUAGE_SWIPE_CONSUMED`, `CURSOR_MODE`), логика порогов свайпа, 300 мс long-press, горизонтального аккумулятора и умеренного ускорения с ограничением (`MAX_DPAD_STEPS_PER_MOVE = 6`).
2. `extensions/extension/src/main/java/dev/jason/gboardpatches/extension/spacebargesture/GboardSpacebarLanguageNavigator.java` — безопасное переключение `NEXT` и `PREVIOUS` строго внутри активной Gboard IME, без TalkBack fallback и без внешних IME.
3. `extensions/extension/src/main/java/dev/jason/gboardpatches/extension/spacebargesture/GboardSpacebarCursorSender.java` — однократный вызов `finishComposingText()` и сбалансированная отправка пар `KeyEvent(ACTION_DOWN/ACTION_UP)` строго для `KEYCODE_DPAD_LEFT`/`KEYCODE_DPAD_RIGHT` через `InputConnection.sendKeyEvent()`.
4. `extensions/extension/src/main/java/dev/jason/gboardpatches/extension/spacebargesture/GboardSpacebarKeyHitTester.java` — поиск `SoftKeyView` под текущими координатами касания в `KeyboardViewHolder` и проверка реального keycode `PRESS == 62` (`KeyEvent.KEYCODE_SPACE`) через кэшированные reflection handles `SoftKeyView.e -> SoftKeyDef.g(qae.PRESS) -> ActionDef.f -> qbc.c` (без привязки к layout-зависимому resource ID).
5. `extensions/extension/src/main/java/dev/jason/gboardpatches/extension/spacebargesture/GboardSpacebarGestureRuntime.java` — координатор касаний для non-header `KeyboardViewHolder`, main-thread `Handler` таймер `300 мс` (ленивая инициализация), reentrancy guard (`ThreadLocal<Boolean> CANCELLING`), однократная доставка синтетического `ACTION_CANCEL`, отслеживание смены `EditorInfo` и `null InputConnection`.
6. `extensions/extension/src/main/java/dev/jason/gboardpatches/extension/swipedismiss/GboardSwipeDismissRuntime.java` *(изменён)* — интеграция `GboardSpacebarGestureRuntime` в **уже существующий единый hook** `KeyboardViewHolder.dispatchTouchEvent` (`onHeaderTouch`):
   - проверяется reentrancy guard обоих runtime (`CANCELLING` и `GboardSpacebarGestureRuntime.isCancelling()`);
   - для `isHeaderHolder(holder)` сохранена прежняя логика `SwipeDismiss` (включая Direct Boot);
   - для остальных `KeyboardViewHolder` (тело клавиатуры) управление делегируется в `GboardSpacebarGestureRuntime.onHolderTouch(holder, event)`;
   - `reset()` сбрасывает оба runtime.

### Ресурсный патч и подключение (`patches/src/main/kotlin/...`)
7. `patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/swipedismiss/GboardSpacebarGestureResourcePatch.kt` — внутренний ресурсный патч, удаляющий только конфликтующие нативные spacebar long-press actions и регистрации `ScrubMoveMotionEventHandler` / `TriggerFreeCursorMotionEventHandler`.
8. `patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/GboardPatchRegistry.kt` *(изменён)* — подключение `gboardSpacebarGestureResourcePatch` в `dependsOn(...)` существующего `gboardSwipeDismissPatch` (без добавления второго `dispatchTouchEvent`-хука, без новых настроек/переключателей, без изменения каталога патчей, Gradle, зависимостей и `gboard-version-bindings.json`).

### Unit-тесты
9. `extensions/extension/src/test/java/dev/jason/gboardpatches/extension/spacebargesture/GboardSpacebarGestureStateTest.java`
10. `extensions/extension/src/test/java/dev/jason/gboardpatches/extension/spacebargesture/GboardSpacebarLanguageNavigatorTest.java`
11. `patches/src/test/kotlin/dev/jason/gboardpatches/patches/gboard/features/swipedismiss/GboardSpacebarGestureResourcePatchTest.kt`

### Документация
12. `docs/SPACEBAR_STAGE_5_IMPLEMENTATION_REPORT.md` *(этот файл)*.

---

## 2. Описание State Machine (`GboardSpacebarGestureState`)

Явные состояния:
- `IDLE` — нет активного жеста пробела; все события проходят в исходный Gboard без вмешательства.
- `SPACE_TRACKING` — `ACTION_DOWN` пришёлся на реальный `SoftKeyView` с `PRESS` keycode `62` (`SPACE`). Запущен таймер `300 мс`, отслеживается единственный активный `pointerId`; исходное `ACTION_DOWN` не потребляется.
- `LANGUAGE_SWIPE_CONSUMED` — до истечения `300 мс` зафиксировано преимущественно горизонтальное смещение (`|dx| >= max(touchSlop, 16dp)` и `|dx| >= |dy| * 1.25`). Однократно отправляется `ACTION_CANCEL` дочернему `SoftKeyboardView`, выполняется однократное переключение языка (`dx > 0` → `NEXT`, `dx < 0` → `PREVIOUS`), таймер long-press отменяется, а остаток текущего touch stream поглощается до `ACTION_UP`/`ACTION_CANCEL`.
- `CURSOR_MODE` — истёк таймер `300 мс`, пока палец оставался в `SPACE_TRACKING` (свайп языка не распознан). Однократно отправляется синтетический `ACTION_CANCEL` дочернему `SoftKeyboardView`, однократно вызывается `InputConnection.finishComposingText()`, после чего горизонтальные дельты переводятся в `DPAD_LEFT`/`DPAD_RIGHT`, а остаток touch stream поглощается до завершения жеста.

Ключевые переходы и защита от краевых случаев:
- **Короткое нажатие (Tap):** `ACTION_UP` в состоянии `SPACE_TRACKING` отменяет таймер, возвращает `consumed = false` и сбрасывает состояние в `IDLE` → Gboard получает исходные `DOWN`/`UP` и вставляет ровно один обычный пробел.
- **Удержание без движения:** при `ACTION_UP` в `CURSOR_MODE` возвращается `consumed = true` (плюс `ACTION_CANCEL` уже был доставлен дочерней view при входе в режим) → пробел не вставляется.
- **Исключение конфликта swipe ↔ cursor:** переход в `LANGUAGE_SWIPE_CONSUMED` отменяет runnable таймера и игнорирует `onLongPressTimeout()`; вход в `CURSOR_MODE` никогда не генерирует `LanguageDirection`.
- **Мультитач (`ACTION_POINTER_DOWN`):** немедленный сброс в `IDLE`, отмена таймера и возврат `false`, отдавая управление исходному Gboard.
- **Преимущественно вертикальный свайп до порога:** при `|dy| >= swipeThreshold && |dy| >= |dx| * 1.5` в `SPACE_TRACKING` происходит сброс в `IDLE` без перехвата.
- **Reentrancy guard для `ACTION_CANCEL`:** `GboardSpacebarGestureRuntime.CANCELLING` (`ThreadLocal<Boolean>`) проверяется в начале `GboardSwipeDismissRuntime.onHeaderTouch()` и `GboardSpacebarGestureRuntime.onHolderTouch()`, поэтому синтетический `ACTION_CANCEL` уходит напрямую в исходный `KeyboardViewHolder.dispatchTouchEvent` без зацикливания и отправляется строго один раз на жест.

---

## 3. Точный механизм переключения языков (`NEXT` / `PREVIOUS`)

### `NEXT` (свайп слева направо)
- Выполняется в `GboardSpacebarLanguageNavigator.switchNext(InputMethodService)`.
- Получает `IBinder token` из `service.getWindow().getWindow().getAttributes().token` (эквивалентно `Lpha.a()`) и `InputMethodManager`.
- Вызывает **напрямую** `imm.switchToNextInputMethod(token, true)`.
- Не вызывает `Lpga.az(boolean)`, не отправляет `-10011` и не отправляет `-10197`.
- Если `token` или `InputMethodManager` недоступны — безопасный no-op с ограниченным предупреждением в лог.

### `PREVIOUS` (свайп справа налево)
- Выполняется в `GboardSpacebarLanguageNavigator.switchPrevious(InputMethodService)` строго по внутреннему порядку Gboard 18.5.4:
  1. `Lpga.F(Context)` → экземпляр менеджера `Lpga`.
  2. `Lpga.C()` → текущая запись `Lpev`.
  3. Поле `Lpga.Y` → динамический rotation list `Lrek`.
  4. `Lrek.j(current)` → индекс текущей записи.
  5. Поле `Lrek.b` (`List<?>` или `Object[]`) → список записей в том же порядке, который использует `Lrek.k` для `NEXT`.
  6. Вычисление предыдущего индекса `resolvePreviousIndex(currentIndex, size)`: `index - 1`, а при `index == 0` циклический переход к `size - 1`. При `size <= 1` или невалидном индексе — no-op.
  7. `previous.f()` → целевой `InputMethodSubtype`.
  8. Поиск `InputMethodInfo` **только** для текущей Gboard IME из `imm.getEnabledInputMethodList()` со строгой проверкой `service.getPackageName().equals(info.getPackageName())` (с приоритетом совпадения `service.getClass().getName()`).
  9. Проверка, что целевой `InputMethodSubtype` присутствует среди разрешённых subtype именно этой `InputMethodInfo` (`imm.getEnabledInputMethodSubtypeList(gboardInfo, true)`).
  10. Переключение через `Lsex.k(InputMethodInfo, IBinder, InputMethodSubtype)` (если метод разрешён и доступен как static или через поле экземпляра в `Lpga`), либо напрямую через `imm.setInputMethodAndSubtype(token, gboardInfo.getId(), verifiedSubtype)`.
  11. После `setInputMethodAndSubtype` система доставляет `InputMethodService.onCurrentInputMethodSubtypeChanged(InputMethodSubtype)`, что в `Lphr` вызывает `Lpeo.a(subtype)` и синхронизирует внутреннее состояние Gboard.

---

## 4. Гарантия отсутствия переключения на внешнюю IME

1. **Запрет TalkBack fallback:** для `NEXT` не используется `Lpga.az()` и `-10011`, поэтому TalkBack fallback (`com.google.android.marvin.talkback`) физически не вызывается.
2. **Запрет `onlyCurrentIme = false` и `-10197`:** в коде отсутствует вызов `switchToNextInputMethod(token, false)` и отсутствует отправка `-10197`.
3. **Запрет `setInputMethod()`:** метод `InputMethodManager.setInputMethod(token, id)` не вызывается нигде.
4. **Двойная проверка `packageName` и списка subtype для `PREVIOUS`:** `isSameImePackage(service.getPackageName(), info.getPackageName())` и проверка принадлежности subtype списку `imm.getEnabledInputMethodSubtypeList(gboardInfo, true)` гарантируют, что ID и subtype всегда относятся только к текущей Gboard IME.
5. **Fail-safe no-op:** любая ошибка reflection, пустой список, 1 язык, отсутствие `token`, `InputMethodInfo` или subtype завершаются безопасным no-op без выхода из Gboard.

---

## 5. Отправка DPAD-событий курсора (`GboardSpacebarCursorSender`)

- При входе в `CURSOR_MODE` (по таймеру `300 мс`) однократно вызывается `InputConnection.finishComposingText()`.
- В `CURSOR_MODE` каждое `ACTION_MOVE` передаёт только горизонтальную дельту `dx` (вертикальная дельта `dy` полностью игнорируется; `KEYCODE_DPAD_UP`/`DOWN` не генерируются никогда).
- Шаг курсора в базовом режиме: `CURSOR_STEP_DP = 10dp`.
- Умеренное ускорение от скорости (`computeAccelerationMultiplier`):
  - до `0.35 dp/ms` → `1.0x` (точное посимвольное позиционирование);
  - линейное нарастание до `1.50 dp/ms` → максимум `2.25x`.
- Защита от флуда: на один `ACTION_MOVE` выдаётся не более `MAX_DPAD_STEPS_PER_MOVE = 6` шагов; при смене направления остаточный аккумулятор обнуляется для мгновенного отклика.
- Каждый шаг отправляется сбалансированной парой `KeyEvent(ACTION_DOWN)` + `KeyEvent(ACTION_UP)` с `KeyCharacterMap.VIRTUAL_KEYBOARD` и `InputDevice.SOURCE_KEYBOARD` через `InputConnection.sendKeyEvent()` с `finally`-гарантией отправки `ACTION_UP` при сбое (по образцу `GboardGlobeDragRuntime`).
- При `InputConnection == null`, смене `EditorInfo` (`fieldId`, `inputType`, `packageName`), скрытии view (`!holder.isShown()`), появлении второго pointer или `ACTION_UP`/`ACTION_CANCEL` режим `CURSOR_MODE` немедленно сбрасывается.

---

## 6. Ресурсные изменения (`GboardSpacebarGestureResourcePatch`)

Патч декодирует `res/xml*/*.xml` (и проверяет прямые пути `res/IEX.xml`, `res/nB0.xml`, `res/bsB.xml`, `res/tER.xml`, `res/kgx.xml` при наличии), предварительно фильтруя файлы read-only, чтобы не пересобирать несвязанные XML.

### Удалённые конфликтующие элементы
- `<action type="LONG_PRESS" keycode="SWITCH_KEYBOARD" data="free_cursor" />` (также поддерживается числовой код `-10004`) — из spacebar softkey XML (`res/IEX.xml`, `res/nB0.xml`).
- `<action type="LONG_PRESS" keycode="SHOW_SYSTEM_IME_PICKER" data="space" />` (также числовой код `-10022`) — из `res/IEX.xml`, чтобы при удержании пробела не открывался системный выбор IME.
- `<motion_event_handler class="...ScrubMoveMotionEventHandler" ... />` — из `res/bsB.xml`.
- `<motion_event_handler class="...TriggerFreeCursorMotionEventHandler" ... />` — из `res/bsB.xml`, `res/tER.xml`, `res/kgx.xml`.

### Сохранено без изменений
- Все регистрации `ScrubDeleteMotionEventHandler` (preference `0x7f14096a`) — полностью сохранены.
- `noScrubbing` — **не используется и не затрагивается** (чтобы не сломать `ScrubDelete`).
- `InlineSuggestionScrubSpaceMotionEventHandler` — сохранён; новый spacebar runtime имеет приоритет на самом пробеле.
- Обычный `<action type="PRESS" keycode="SPACE" ... />` и `<action type="LONG_PRESS" keycode="SHOW_SYSTEM_IME_PICKER" data="globe" />` (Globe key) — сохранены.
- `FreeCursorKeyboard` не добавляется в обычную клавиатуру; обычная клавиатура остаётся видимой.
- `SwipeDismiss`, `Globe Drag`, `Glide Typing`, автокоррекция, подсказки, голос, буфер обмена, emoji/GIF — не затронуты.

---

## 7. Тесты

### Добавленные unit-тесты (написаны; запуск отложен до проверки diff)
> **Важно:** по условиям Stage 5 сборка `.mpp` и Gradle-задачи на данном шаге **не запускались**, поэтому статус исполнения ниже — *написаны, ожидают запуска после проверки diff*.

- `GboardSpacebarGestureStateTest` (10 тестов): короткий tap, L→R `NEXT` (однократное срабатывание, блокировка cursor mode, поглощение хвоста), R→L `PREVIOUS`, 300 мс long-press без движения (пробел не вставляется), горизонтальный DPAD + clamping до 6 + игнорирование вертикальной дельты, сброс аккумулятора при смене направления, монотонность и границы ускорения, сброс при втором pointer, вертикальный abort, чужой `pointerId`.
- `GboardSpacebarLanguageNavigatorTest` (4 теста): 0/1 язык (no-op), полный циклический `PREVIOUS` с wrap-around для 2, 3 и 4 языков, защита от невалидных индексов, строгая проверка `isSameImePackage` (отклонение TalkBack / Samsung Keyboard / пустых значений).
- `GboardSpacebarGestureResourcePatchTest` (3 теста): удаление `SWITCH_KEYBOARD/free_cursor` и `SHOW_SYSTEM_IME_PICKER/space` при сохранении `SPACE/PRESS` и Globe `SHOW_SYSTEM_IME_PICKER`, удаление `ScrubMove`/`TriggerFreeCursor` при сохранении `ScrubDeleteMotionEventHandler` и `InlineSuggestionScrubSpaceMotionEventHandler`, отсутствие модификации файлов без конфликтующих узлов.

### Обязательный ручной checklist (после одобрения diff и сборки `.mpp`)
- [ ] Короткий tap по пробелу: вставляется ровно один обычный пробел.
- [ ] Свайп L→R по пробелу: `NEXT` язык строго внутри Gboard.
- [ ] Свайп R→L по пробелу: `PREVIOUS` язык строго внутри Gboard.
- [ ] 2, 3 и 4 языка: полный цикл вперёд и назад, wrap-around через границы, повторные жесты, возврат в исходную раскладку.
- [ ] Gboard всегда остаётся активной IME (отсутствие переключения на TalkBack, Samsung Keyboard или другую внешнюю IME).
- [ ] Удержание пробела (~300 мс) без движения: пробел не вставляется, системный IME picker и `FreeCursorKeyboard` не появляются.
- [ ] Удержание пробела + движение влево/вправо: курсор плавно перемещается, обычная клавиатура остаётся видимой.
- [ ] Composing text корректно завершается (`finishComposingText()`) перед первым смещением курсора.
- [ ] Проверка типов полей: plain text, password, number, multiline, RTL и WebView.
- [ ] Краевые случаи: `ACTION_CANCEL`, быстрый tap, медленный swipe, второй pointer (мультитач), быстрая смена поля ввода, `null InputConnection`.
- [ ] `ScrubDelete` (свайп от Backspace) продолжает работать.
- [ ] `Glide Typing`, автокоррекция, подсказки, голосовой ввод, буфер обмена, emoji/GIF, `Globe Drag` и `SwipeDismiss` не регрессируют.
- [ ] Проверка inline suggestion scrub: задокументировать фактический приоритет при активной inline-подсказке (ожидается приоритет свайпа пробела на самом пробеле).

---

## 8. Оставшиеся риски

1. **Runtime-проверка reflection-цепочки `PREVIOUS` на живом Gboard 18.5.4:** сигнатуры `Lpga.F(Context)`, `Lpga.C()`, `Lpga.Y`, `Lrek.j(Lpev)`, `Lrek.b`, `Lpev.f()`, `Lsex.k(...)` подтверждены статическим анализом DEX 18.5.4, но фактический runtime-тип `Lrek.b` (список/массив) и поведение `onCurrentInputMethodSubtypeChanged` требуют подтверждения на устройстве (SM-S901U1, Android 16 / One UI 8) для 2/3/4 языков. При любой нестыковке код безопасно уходит в no-op без переключения на внешнюю IME.
2. **Порядок `NEXT` (`InputMethodManager.switchToNextInputMethod(token, true)`) vs внутренний порядок `Lrek.b`:** если Android IMM использует порядок enabled subtypes, отличный от динамического MRU-порядка `Lrek.b`, направление `NEXT` и `PREVIOUS` при 3–4 языках стоит проверить на устройстве; при расхождении в будущем можно выровнять `NEXT` по `Lrek.b[index + 1]` через тот же `setInputMethodAndSubtype`.
3. **Зависимость `gboardSpacebarGestureResourcePatch` от `gboardSwipeDismissPatch`:** в текущей конфигурации ресурсная очистка и единый `KeyboardViewHolder.dispatchTouchEvent` hook активируются при включённом `Swipe Down to Dismiss Keyboard` (который включён по умолчанию `default = true`). Если пользователь вручную отключит патч `Swipe Down to Dismiss Keyboard` при сборке `.mpp`, оба механизма будут отключены вместе (при этом отключение тумблера Swipe Dismiss в настройках Gboard *не* отключает жесты пробела, поскольку ветка `!isHeaderHolder(holder)` выполняется до проверки настроек Swipe Dismiss).
4. **InlineSuggestionScrubSpaceMotionEventHandler:** сохранён по ТЗ; на устройстве нужно проверить сценарий свайпа по пробелу при активной inline-подсказке.
5. **WebView / нестандартные `InputConnection`:** некоторые WebView и password/number поля могут по-разному реагировать на `KEYCODE_DPAD_LEFT`/`RIGHT` и `finishComposingText()`; требуется проверка по ручному checklist.
6. **Commit в Git:** в текущей контейнерной среде отсутствует каталог `.git`, поэтому коммит в `main` не мог быть создан напрямую из среды и должен быть выполнен после проверки изменений.
