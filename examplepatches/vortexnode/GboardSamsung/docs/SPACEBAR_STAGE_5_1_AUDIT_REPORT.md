# Stage 5.1 — аудит реализации и исправление замечаний

**Базовый коммит Stage 5:** `3094ea857a326d9f4001ed71b01254c23240ab0a`  
**Базовый отчёт:** `docs/SPACEBAR_STAGE_5_IMPLEMENTATION_REPORT.md`  
**Целевой APK:** `Gboard-v18.5.4.993608717-release-arm64-v8a.apk`  
**Сборка `.mpp` / APK / Gradle:** **не запускались** (по требованию Stage 5.1).

---

## 1. Найденные проблемы

По результатам аудита выявлены **3 доказанные ошибки** и **1 защитное усиление**:

1. **Проблема №1 (критическая — XML-декодирование в Morphe Patcher 2.1.0, `GboardSpacebarGestureResourcePatch.kt`):**
   - В Stage 5 вызывалось только `decode("res/xml*/*.xml")`, при этом `collectCandidateXmlFiles` дополнительно искал файлы `IEX.xml`, `nB0.xml`, `bsB.xml`, `tER.xml`, `kgx.xml` непосредственно в корне `res/`.
   - В Morphe Patcher 2.x ресурсы декодируются **лениво по явному запросу `decode(...)`** (`GboardPackageRenameResourcePatch.kt:84`, документация `MorpheApp/morphe-patcher`). Если какой-либо из пяти AAPT2-укороченных файлов остаётся по буквальному пути `res/<name>.xml` (не перемапливаясь ARSCLib в `res/xml/APKTOOL_RENAMED_0x7f17xxxx.xml`), вызов `decode("res/xml*/*.xml")` **не извлёк бы его на диск**, и патч молча пропустил бы его.
2. **Проблема №2 (ошибка балансировки DPAD KeyEvent, `GboardSpacebarCursorSender.java`):**
   - В `sendBalancedKeyEvent()` флаг `downAttempted = true` выставлялся *до* проверки результата `sendKeyEvent(ACTION_DOWN)`, а `finally` проверял `if (downAttempted && !upCompleted)`:
     - если `ACTION_DOWN` возвращал `false` (не был доставлен), `finally` всё равно отправлял **осиротевший `ACTION_UP`**;
     - если `ACTION_DOWN` возвращал `true`, а `ACTION_UP` возвращал `false`, `finally` отправлял **повторный дублирующий `ACTION_UP`**.
3. **Проблема №3 (обработка возврата `Lsex.k` и дублей `Lpev`, `GboardSpacebarLanguageNavigator.java`):**
   - `trySwitchViaGboardHelper()` игнорировал возможное возвращаемое значение `Boolean.FALSE` из `Lsex.k(InputMethodInfo, IBinder, InputMethodSubtype)` и безусловно возвращал `true`, блокируя переход к верифицированному `imm.setInputMethodAndSubtype(token, gboardInfo.getId(), verifiedSubtype)`.
   - Сравнение `previousEntry == currentEntry` проверяло только ссылочное равенство без `previousEntry.equals(currentEntry)`.
4. **Защитное усиление (`GboardSpacebarKeyHitTester.java`):**
   - Проверка типа `SoftKeyView` сравнивала только точный `getClass().getName()` вместо цепочки суперклассов; усилено до `isSoftKeyViewInstance(View)` (поддерживает и прямой `SoftKeyView`, и возможные подклассы `SoftKeyView` без ложных срабатываний на чужие классы).

---

## 2. Исправленные и добавленные файлы

1. `patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/swipedismiss/GboardSpacebarGestureResourcePatch.kt` — добавлено явное декодирование всех 5 прямых путей (`res/IEX.xml`, `res/nB0.xml`, `res/bsB.xml`, `res/tER.xml`, `res/kgx.xml`) в дополнение к `res/xml*/*.xml`; выделена тестируемая функция `cleanupSpacebarGestureResources(...)`.
2. `patches/src/test/kotlin/dev/jason/gboardpatches/patches/gboard/features/swipedismiss/GboardSpacebarGestureResourcePatchTest.kt` — добавлены 2 end-to-end теста ленивого декодирования (для прямых путей `res/IEX.xml`..`res/kgx.xml` и для ARSC-перемапленных `res/xml/APKTOOL_RENAMED_*.xml`).
3. `extensions/extension/src/main/java/dev/jason/gboardpatches/extension/spacebargesture/GboardSpacebarCursorSender.java` — исправлена логика балансировки `ACTION_DOWN`/`ACTION_UP` (`downSucceeded` + `upAttempted`), добавлен пакетный интерфейс `KeyActionEmitter` для юнит-тестирования без Android stub.
4. `extensions/extension/src/test/java/dev/jason/gboardpatches/extension/spacebargesture/GboardSpacebarCursorSenderTest.java` *(новый)* — 6 unit-тестов на баланс `DOWN`/`UP`, запрет вертикальных `DPAD_UP`/`DPAD_DOWN`, clamping до 6 и отсутствие осиротевших/дублирующих `ACTION_UP`.
5. `extensions/extension/src/main/java/dev/jason/gboardpatches/extension/spacebargesture/GboardSpacebarLanguageNavigator.java` — учёт `Boolean.FALSE` из `Lsex.k(...)` и проверка `previousEntry.equals(currentEntry)`.
6. `extensions/extension/src/main/java/dev/jason/gboardpatches/extension/spacebargesture/GboardSpacebarKeyHitTester.java` — проверка `SoftKeyView` по цепочке суперклассов (`isSoftKeyViewInstance`).
7. `docs/SPACEBAR_STAGE_5_1_AUDIT_REPORT.md` *(этот файл)*.

---

## 3. Способ декодирования каждого XML-ресурса (Morphe Patcher 2.1.0 + Gboard 18.5.4)

### Фактическая структура Gboard 18.5.4 и поведение Morphe Patcher 2.1.0
- Gboard 18.5.4 собран с AAPT2 `--shorten-resource-paths`: в сыром ZIP-архиве APK бинарные XML-ресурсы лежат в корне `res/` под короткими именами (`res/IEX.xml`, `res/nB0.xml`, `res/bsB.xml`, `res/tER.xml`, `res/kgx.xml`), а их реальный тип (`xml`, `0x7f17xxxx`) задан в `resources.arsc`.
- Morphe Patcher `2.1.0` (`gradle/libs.versions.toml`) использует ARSCLib с **ленивым декодированием** (`ResourcePatchContext.decode(pattern)`):
  - Для ресурсов, сопоставленных в `resources.arsc` как `xml`, ARSCLib декодирует их в `res/xml/<name>.xml` (например, `res/xml/APKTOOL_RENAMED_0x7f17xxxx.xml` или `res/xml/settings.xml`, что подтверждается `GboardPatchesSettingsPatch.kt`, `GboardAboutPageResourcePatch.kt` и `patches/src/test/resources/gboard/18.5.3/packagerename/retained-resource-literals.xml`).
  - Однако, если какой-либо из пяти файлов экспонируется Patcher 2.x по своему буквальному пути в корне `res/`, один лишь шаблон `decode("res/xml*/*.xml")` **не гарантировал его декодирование**.

### Реализованная схема декодирования в `GboardSpacebarGestureResourcePatch.kt`
Перед чтением и модификацией `cleanupSpacebarGestureResources(...)` последовательно выполняет:

| Целевой ресурс Gboard 18.5.4 | Назначение очистки | Явные вызовы `decode(...)` |
|---|---|---|
| `res/IEX.xml` | Удаление `LONG_PRESS` `SWITCH_KEYBOARD/free_cursor` и `SHOW_SYSTEM_IME_PICKER/space` (с сохранением `SPACE/PRESS` и Globe) | `decode("res/xml*/*.xml")` **и** `runCatching { decode("res/IEX.xml") }` |
| `res/nB0.xml` | Удаление `LONG_PRESS` `SWITCH_KEYBOARD/free_cursor` | `decode("res/xml*/*.xml")` **и** `runCatching { decode("res/nB0.xml") }` |
| `res/bsB.xml` | Удаление `ScrubMoveMotionEventHandler` и `TriggerFreeCursorMotionEventHandler` (с сохранением `ScrubDeleteMotionEventHandler`) | `decode("res/xml*/*.xml")` **и** `runCatching { decode("res/bsB.xml") }` |
| `res/tER.xml` | Удаление `TriggerFreeCursorMotionEventHandler` | `decode("res/xml*/*.xml")` **и** `runCatching { decode("res/tER.xml") }` |
| `res/kgx.xml` | Удаление `TriggerFreeCursorMotionEventHandler` (с сохранением `InlineSuggestionScrubSpaceMotionEventHandler`) | `decode("res/xml*/*.xml")` **и** `runCatching { decode("res/kgx.xml") }` |

- `runCatching` вокруг каждого `decode(...)` гарантирует отсутствие падения, если в конкретной сборке ARSCLib уже перемапил `res/IEX.xml` → `res/xml/APKTOOL_RENAMED_0x7f17xxxx.xml` (тогда сработает `decode("res/xml*/*.xml")`), и одновременно гарантирует декодирование всех 5 файлов при буквальном расположении в `res/`.
- Read-only предпроверка (`CANDIDATE_TEXT_MARKERS` + `hasConflictingSpacebarNodes`) выполняется **до** вызова `document(relativePath).use { ... }`, поэтому несвязанные XML (например, Globe-only `SHOW_SYSTEM_IME_PICKER data="globe"`) не открываются на запись и не пересобираются.
- Узлы `<if>` и `<else>` не удаляются (удаляются только дочерние `<action>` / `<motion_event_handler>`), чтобы не нарушать парность `<if>/<else>` в парсере Gboard.

---

## 4. Результат проверки зависимости от `SwipeDismiss`

### Текущее состояние
- `gboardSwipeDismissBytecodePatch` внедряет единственный пролог в `KeyboardViewHolder.dispatchTouchEvent(MotionEvent)Z` с вызовом `GboardSwipeDismissRuntime.onHeaderTouch(p0, p1)`.
- `gboardSpacebarGestureResourcePatch` подключён в `dependsOn(...)` публичного патча `gboardSwipeDismissPatch` (`default = true`).
- При отключении пользователем тумблера **Swipe Down to Dismiss** *внутри настроек Gboard* жесты пробела **продолжают работать** (так как ветка `!isHeaderHolder(holder)` в `GboardSwipeDismissRuntime.onHeaderTouch()` выполняется до проверки настроек Swipe Dismiss).
- Однако, если пользователь **снимет галочку с патча `Swipe Down to Dismiss Keyboard` при сборке `.mpp`**, ни `gboardSwipeDismissBytecodePatch`, ни `gboardSpacebarGestureResourcePatch` не будут применены.

### Можно ли сделать активацию жестов пробела независимой без второго hook?
**Да, технически это возможно** без добавления второго hook на `KeyboardViewHolder.dispatchTouchEvent`, поскольку `gboardSwipeDismissBytecodePatch` уже идемпотентен (`existing == 1 && instructions.first().isMethodReference(abi.reference)`) и является singleton-патчем, который Morphe Patcher дедуплицирует при общем `dependsOn(...)`.

Однако **оба** архитектурных пути требуют существенных изменений, поэтому в Stage 5.1 они **не внедрялись без отдельного согласования**:

| Вариант | Суть решения | Последствия и риски |
|---|---|---|
| **Вариант A (рекомендуемый при отдельной задаче):** новый публичный патч `Samsung Spacebar Gestures` (`default = true`) | Вынести отдельный публичный `resourcePatch`, который (как и `gboardSwipeDismissPatch`) имеет `dependsOn(gboardSwipeDismissBytecodePatch, gboardSpacebarGestureResourcePatch)` + отдельные manifest feature markers для SwipeDismiss и Spacebar в `GboardSwipeDismissRuntime`. Второй hook не добавляется. | Требует обновления `gboard-port-product-catalog.json`, пересчёта `gboard-port-product-catalog.sha256`, добавления записи в `GboardPublishedPatchCatalog.morpheRegistrations` (45 → 46), обновления `patches-list.json` / `patches-bundle.json` и адаптации контрактных тестов (`GboardPortProductCatalogContractTest`, `GboardPublishedPatchCatalogContractTest`, `GboardCapabilityWiringVerifier`). |
| **Вариант B (не рекомендуется):** перенести `gboardSwipeDismissBytecodePatch` и `gboardSpacebarGestureResourcePatch` в базовый `gboardPatchesSettingsPatch` | `gboardPatchesSettingsPatch` подключается большинством патчей (41 из 45), не меняет число публичных патчей. | Скрыто заставляет *каждый* несвязанный патч (`Inline Suggestions`, `Clipboard` и т. д.) патчить `KeyboardViewHolder.dispatchTouchEvent` и 5 XML-файлов; нарушает модель владения `swipe_dismiss_header_dispatch` в `gboard-port-product-catalog.json`; всё равно не покрывает сборки, где выбраны только `Package Rename` / `Signature Bypass`; без проверки feature marker для SwipeDismiss старые SharedPreferences могли бы оставлять SwipeDismiss активным при снятой галочке. |

**Решение Stage 5.1:** сохранить текущую безопасную схему без модификации `gboard-port-product-catalog.json` и контрактных тестов до явного утверждения Варианта A.

---

## 5. Анализ порядка `NEXT` / `PREVIOUS` (2, 3 и 4 языка)

- **Направления:**
  - `L→R` (`dx > 0`) → `LanguageDirection.NEXT` → `GboardSpacebarLanguageNavigator.switchNext(service)` → `imm.switchToNextInputMethod(token, true)`.
  - `R→L` (`dx < 0`) → `LanguageDirection.PREVIOUS` → `GboardSpacebarLanguageNavigator.switchPrevious(service)` → `Lpga.F(Context)` → `Lpga.C()` → `Lpga.Y` (`Lrek`) → `Lrek.j(current)` → `Lrek.b[index - 1]` (с wrap-around) → `Lpev.f()` → `Lsex.k` / верифицированный `imm.setInputMethodAndSubtype(token, gboardInfo.getId(), verifiedSubtype)`.
- **Безопасность (отсутствие внешних IME):**
  - В коде отсутствуют вызовы `switchToNextInputMethod(token, false)`, `setInputMethod(...)`, `Lpga.az(...)` и отправка `-10197`.
  - Для `PREVIOUS` дважды проверяется `isSameImePackage(service.getPackageName(), gboardInfo.getPackageName())` и принадлежность subtype списку `imm.getEnabledInputMethodSubtypeList(gboardInfo, true)`. Переключение на Samsung Keyboard, TalkBack или любую внешнюю IME исключено.
- **Честный вывод о совпадении порядка для 2, 3 и 4 языков:**
  - **2 языка (A, B):** порядок симметричен (`A ↔ B`); оба направления гарантированно переключают на второй язык (при условии, что оба subtype активны в `IMM` и `Lrek.b`).
  - **3 и 4 языка (A, B, C[, D]): статически ГАРАНТИРОВАТЬ идентичность порядка `InputMethodManager.switchToNextInputMethod(token, true)` и `Lpga.Y / Lrek.b` НЕВОЗМОЖНО.**
    - Причина 1: системный `InputMethodManagerService` в Android использует `InputMethodSubtypeSwitchingController` с динамическим MRU/recency-переупорядочиванием списка subtype (особенно после пауз и ввода текста).
    - Причина 2: `Lpga.Y` (`Lrek`) внутри Gboard поддерживает собственный rotation list `Lrek.b`, обновление которого при прямом вызове `IMM.switchToNextInputMethod(token, true)` (минуя `Lpga.t`) зависит от того, как `Lphr.onCurrentInputMethodSubtypeChanged` → `Lpeo.a(subtype)` обновляет `Lrek.b` на живом Android 16 / One UI 8.
    - Причина 3: в Stage 5 `NEXT` специально зафиксирован на прямом `imm.switchToNextInputMethod(token, true)`, а `PREVIOUS` — на `Lrek.b[index - 1]`. Если на реальном устройстве для 3–4 языков обнаружится расхождение между порядком `NEXT` и `PREVIOUS`, симметричным исправлением будет перевод `NEXT` на `Lrek.b[(index + 1) % size]` через тот же верифицированный Gboard-only `setInputMethodAndSubtype` (с полным сохранением запрета на внешние IME).

---

## 6. Результаты построчного аудита Runtime

| Критерий | Статус | Подтверждение по коду |
|---|---|---|
| Короткое нажатие вставляет ровно один пробел | **PASS** | `ACTION_DOWN` возвращает `false`; `ACTION_UP` в `SPACE_TRACKING` отменяет таймер, сбрасывает в `IDLE` и возвращает `false`. |
| Свайп языка не активирует курсор | **PASS** | В `onMove()` при переходе в `LANGUAGE_SWIPE_CONSUMED` вызывается `cancelPendingLongPress(session)`, а `onLongPressTimeout()` проверяет `state == SPACE_TRACKING`. |
| Удержание без движения не вставляет пробел | **PASS** | В `onLongPressTimeout()` отправляется `ACTION_CANCEL` дочерней view; при `ACTION_UP` в `CURSOR_MODE` возвращается `consumed = true` (и даже при `connection == null` дочерняя view уже получила `ACTION_CANCEL`). |
| Синтетический `ACTION_CANCEL` отправляется один раз | **PASS** | `MoveResult.sendCancel == true` только на единственном переходе `SPACE_TRACKING → LANGUAGE_SWIPE_CONSUMED`; `LongPressResult.sendCancel == true` только на единственном переходе `SPACE_TRACKING → CURSOR_MODE`; `ThreadLocal<Boolean> CANCELLING` предотвращает рекурсию. |
| Второй pointer не оставляет зависшее состояние | **PASS** | `ACTION_POINTER_DOWN` отменяет таймер, очищает `activeEditor`, сбрасывает state в `IDLE` и возвращает `false`; при `event.getPointerCount() != 1` в `ACTION_MOVE` выполняется `resetSession(session)`. |
| Отмена и завершение touch stream корректны | **PASS** | `ACTION_UP` и `ACTION_CANCEL` отменяют таймер, очищают `activeEditor`, сбрасывают state в `IDLE` и потребляют событие только если поток был перехвачен (`LANGUAGE_SWIPE_CONSUMED` / `CURSOR_MODE`). |
| Смена редактора и `null InputConnection` безопасны | **PASS** | При входе в `CURSOR_MODE` фиксируются `EditorInfo` (`ref`, `fieldId`, `inputType`, `packageName`); на каждом `ACTION_MOVE` проверяются `connection == null` и `hasEditorChanged(...)` с немедленным `resetSession(session)`. |
| DPAD-события всегда сбалансированы | **FIXED & PASS** | Исправлена ошибка №2 в `GboardSpacebarCursorSender.java`: 0 принятых `ACTION_DOWN` → 0 `ACTION_UP`; 1 принятый `ACTION_DOWN` → ровно 1 попытка `ACTION_UP`; вертикальные DPAD запрещены явно. |
| `ScrubDelete` не отключён | **PASS** | `noScrubbing` не используется; `GboardSpacebarGestureResourcePatch` удаляет только `ScrubMoveMotionEventHandler` и `TriggerFreeCursorMotionEventHandler`, оставляя `ScrubDeleteMotionEventHandler` (`0x7f14096a`) нетронутым. |
| `Glide Typing`, `SwipeDismiss`, `Globe Drag` не затронуты | **PASS** | Перехват запускается только при попадании `ACTION_DOWN` в `SoftKeyView` с `PRESS keycode == 62` (`SPACE`) на non-header holder; header `SwipeDismiss`, `Globe Drag` и остальные клавиши проходят без изменений. |

---

## 7. Результаты статических проверок и unit-тестов

### Выполненные проверки (без Gradle, без сборки `.mpp` и APK)
1. **Компиляция Java runtime и тестов (`javac --release 17` против `android-36/android.jar` + `junit-4.13.2.jar` во временный `/tmp` с последующей очисткой):**
   - Скомпилированы без ошибок: `GboardSwipeDismissRuntime.java`, все 5 классов `spacebargesture/*.java`, все 3 тестовых класса `spacebargesture/*Test.java` и `GboardSwipeDismissGestureTest.java`.
2. **Прямой запуск JUnit 4 (`java org.junit.runner.JUnitCore`):**
   - `GboardSpacebarGestureStateTest` — **10/10 PASSED**
   - `GboardSpacebarLanguageNavigatorTest` — **4/4 PASSED**
   - `GboardSpacebarCursorSenderTest` — **6/6 PASSED**
   - `GboardSwipeDismissGestureTest` — **11/11 PASSED**
   - **Итого:** **`OK (31 tests)` за `0.041 s`**.
3. **Статическая проверка безопасности и форматирования (`grep`):**
   - Отсутствуют `switchToNextInputMethod(..., false)`, `setInputMethod(`, `-10197`, `noScrubbing`, лишние пробелы в конце строк; упоминания `DPAD_UP`/`DPAD_DOWN` и `talkback` присутствуют исключительно в негативных проверках unit-тестов.

### Тесты, которые невозможно выполнить без Gradle
- **`GboardSpacebarGestureResourcePatchTest.kt`** (5 unit-тестов, включая 2 новых теста ленивого декодирования всех пяти XML-файлов `res/IEX.xml`, `res/nB0.xml`, `res/bsB.xml`, `res/tER.xml`, `res/kgx.xml` и ARSC-перемапленных `res/xml/APKTOOL_RENAMED_*.xml`):
  - **Не запускались**, так как `GboardSpacebarGestureResourcePatch.kt` импортирует `app.morphe.patcher.patch.ResourcePatchContext` и `resourcePatch`, а артефакт `app.morphe:morphe-patcher:2.1.0` отсутствует в локальном кэше контейнера и требует резолвинга через Gradle (запуск Gradle запрещён на этом этапе).
- **Robolectric-тесты (`GboardSwipeDismissDirectBootTest`) и контрактные тесты `patches`** также требуют Gradle-зависимостей и не запускались.

---

## 8. Оставшиеся ограничения

1. **Проверка на реальном Gboard APK 18.5.4 и устройстве (SM-S901U1, Android 16 / One UI 8):**
   - Фактические пути декодирования 5 XML-файлов под Morphe Patcher 2.1.0 (маппинг в `res/xml/APKTOOL_RENAMED_*.xml` vs буквальные `res/*.xml`) будут окончательно подтверждены при сборке `.mpp` и патчинге APK; код теперь покрывает оба варианта.
   - Совпадение порядка `NEXT` (`IMM.switchToNextInputMethod(token, true)`) и `PREVIOUS` (`Lrek.b[index - 1]`) для 3 и 4 языков требует живого теста на устройстве.
   - Runtime-типы `Lrek.b` и возвращаемый тип `Lsex.k` требуют подтверждения на устройстве (код безопасно обрабатывает `List`/`Object[]` и `void`/`boolean` с fallback на верифицированный `setInputMethodAndSubtype`).
2. **Независимость от выбора патча `Swipe Down to Dismiss Keyboard`:** остаётся привязанной к `gboardSwipeDismissPatch` (`default = true`) до отдельного согласования Варианта A (обновление каталога и контрактных тестов).
3. **Сохранение в GitHub / SHA коммита:** в текущей контейнерной среде отсутствует каталог `.git` (`ls: cannot access '.git': No such file or directory`), поэтому выполнить `git commit` и `git push` напрямую из этой среды невозможно. Все исправленные файлы и данный отчёт готовы в рабочем каталоге для синхронизации и коммита в `main`.
