# Stage 5.2 — Отчёт о реализации: независимость `Samsung Spacebar Gestures` и единый порядок переключения языков

**Репозиторий:** `vortexnode/GboardSamsung` (ветка `main`, базовый коммит `04f89b3`)
**Целевая версия Gboard:** `18.5.4.993608717-release-arm64-v8a`
**Целевое устройство для последующей проверки:** Samsung Galaxy S22 5G (`SM-S901U1`), Android 16 / One UI 8

---

## 1. Найденные архитектурные зависимости

В ходе аудита базового состояния (после Stage 5.1, коммит `04f89b3`) выявлены следующие жесткие архитектурные связки:

1. **Регистрация патча в `GboardPatchRegistry.kt`:**
   - `gboardSpacebarGestureResourcePatch` был подключён как зависимость внутри `gboardSwipeDismissPatch` (`Swipe Down to Dismiss Keyboard`), а отдельного публичного патча для Samsung-подобных жестов пробела не существовало.
   - При отключении `Swipe Down to Dismiss Keyboard` пользователь автоматически терял как перехват касаний на пробеле, так и XML-очистку конфликтующих `LONG_PRESS` / `ScrubMoveMotionEventHandler` / `TriggerFreeCursorMotionEventHandler`.
2. **Единый байткод-хук `KeyboardViewHolder.dispatchTouchEvent`:**
   - `GboardSwipeDismissBytecodePatch.kt` напрямую инжектировал вызов `GboardSwipeDismissRuntime.onHeaderTouch(p0, p1)` в `KeyboardViewHolder.dispatchTouchEvent(MotionEvent)Z` без композитора.
3. **Runtime-связность между `GboardSwipeDismissRuntime` и `GboardSpacebarGestureRuntime`:**
   - `GboardSwipeDismissRuntime.onHeaderTouch` делегировал все non-header касания в `GboardSpacebarGestureRuntime.onHolderTouch(holder, event)`, проверял `GboardSpacebarGestureRuntime.isCancelling()` и вызывал `GboardSpacebarGestureRuntime.reset()` в собственном `reset()`.
   - `GboardSpacebarGestureRuntime` зависел от `GboardSwipeDismissRuntime.resolveInputMethodService(holder)`.
4. **Пакетная связность патчей:**
   - `GboardSpacebarGestureResourcePatch.kt` и `GboardSpacebarGestureResourcePatchTest.kt` находились в пакете `features.swipedismiss`.
5. **Расхождение механизмов переключения языков (`NEXT` vs `PREVIOUS`) в `GboardSpacebarLanguageNavigator.java`:**
   - `switchNext(service)` вызывал `InputMethodManager.switchToNextInputMethod(token, true)` (системный порядок/MRU Android `InputMethodManager`),
   - тогда как `switchPrevious(service)` читал внутренний список Gboard `Lpga.Y` (`Lrek.b`) и переключался на `index - 1` через `Lsex.k` / `imm.setInputMethodAndSubtype`.
   - При 3+ языках два разных источника порядка могли расходиться (свайп вправо и свайп влево переставали быть точными обратными операциями).

---

## 2. Как убрана зависимость от `SwipeDismiss`

Архитектура приведена в строгое соответствие с контрактом репозитория `selected_only_call_chain: true, runtime_feature_mask: false` (`gboard-port-product-catalog.json`):

1. **Создан общий selected-only композитор `GboardKeyboardViewHolderTouchComposer.kt`** (по образцу `GboardGestureFamilyComposer.kt` / `GboardFlagFamilyComposer.kt`):
   - Введён enum `GboardKeyboardViewHolderTouchFeature { SWIPE_DISMISS, SAMSUNG_SPACEBAR_GESTURES }` и потокобезопасное хранилище выборок `GboardKeyboardViewHolderTouchSelectionStore<K>`.
   - Внутренний патч `gboardKeyboardViewHolderTouchComposerPatch` (зависит от `gboardPatchesExtensionCarrierPatch`) в фазе `finalize {}` формирует **один единый верифицированный пролог** в `KeyboardViewHolder.dispatchTouchEvent(MotionEvent)Z`, содержащий **только** реально выбранные пользователем патчи:
     - Выбран только `Swipe Down to Dismiss Keyboard` → инжектируется только `GboardSwipeDismissRuntime.onHeaderTouch(p0, p1)`.
     - Выбран только `Samsung Spacebar Gestures` → инжектируется только `GboardSpacebarGestureRuntime.onHolderTouch(p0, p1)`.
     - Выбраны оба → инжектируется один составной пролог: сначала `GboardSwipeDismissRuntime.onHeaderTouch(p0, p1)`, затем (если не поглощено) `GboardSpacebarGestureRuntime.onHolderTouch(p0, p1)`, с переходом в штатный `dispatchTouchEvent`. Используются только существующие регистры `v0, p0, p1`, встроена строгая проверка идемпотентности.
   - Новый ABI-идентификатор `SPACEBAR_GESTURE_RUNTIME_ON_HOLDER_TOUCH` зарегистрирован в `RuntimeAbi.kt` и передаётся напрямую в `RuntimeCallEmitter.invoke(...)` (совместимо с `CompiledPatchRuntimeCallInventory`).
2. **Независимый публичный патч `Samsung Spacebar Gestures` в `GboardPatchRegistry.kt`:**
   - Создан независимый публичный патч `gboardSamsungSpacebarGesturesPatch` (`featureId = "samsung_spacebar_gestures"`, `name = "Samsung Spacebar Gestures"`, `default = true`).
   - Зависит **только** от `gboardSpacebarGestureBytecodePatch` и `gboardSpacebarGestureResourcePatch` (перенесённого в пакет `features.spacebargesture`).
   - `gboardSwipeDismissPatch` полностью очищен от `gboardSpacebarGestureResourcePatch`: теперь зависит только от `gboardPatchesSettingsPatch`, `gboardSwipeDismissFeatureMarkerPatch` и `gboardSwipeDismissBytecodePatch`.
   - `gboardSpacebarGestureResourcePatch` зарегистрирован ровно на одном публичном патче (`gboardSamsungSpacebarGesturesPatch`) — дублирующая регистрация и двойное изменение XML исключены.
3. **Полная развязка runtime-классов:**
   - `GboardSwipeDismissRuntime.java`: удалены импорт, делегирование `GboardSpacebarGestureRuntime.onHolderTouch`, проверка `GboardSpacebarGestureRuntime.isCancelling()` и вызов `GboardSpacebarGestureRuntime.reset()`. При `!isHeaderHolder(holder)` метод сразу возвращает `false`.
   - `GboardSpacebarGestureRuntime.java`: удалён импорт `GboardSwipeDismissRuntime`; добавлена собственная проверка `isHeaderHolder(holder)` (игнорирует `keyboard_header_view_holder`, поэтому синтетические `ACTION_CANCEL` двух раннейтов не пересекаются) и локальный `resolveInputMethodService(View)`.
4. **Синхронизация control-plane каталога:**
   - В `gboard-port-product-catalog.json` добавлена запись `samsung_spacebar_gestures` (в алфавитном порядке, `feature_marker: null`, `migration_scope: "version-sensitive"`, `required_bindings: ["swipe_dismiss_header_dispatch"]`, `runtime_calls: ["SPACEBAR_GESTURE_RUNTIME_ON_HOLDER_TOUCH"]`, полные отсортированные `consumer_files`), в `swipe_down_to_dismiss_keyboard.consumer_files` добавлен `GboardKeyboardViewHolderTouchComposer.kt`.
   - Пересчитан `gboard-port-product-catalog.sha256` (`f86e07cfc814ff772b83793a76e2647e57e70f894fd7a858edf4bf48eb0321ff`).
   - Обновлён `patches-list.json` (добавлена запись `Samsung Spacebar Gestures` в алфавитном порядке).
   - Обновлён `EXPECTED_MIGRATION_SCOPES` в `GboardPortProductCatalogContractTest.kt`.

---

## 3. Единый механизм переключения языков `NEXT` / `PREVIOUS`

В `GboardSpacebarLanguageNavigator.java` оба направления (`switchNext` и `switchPrevious`) переведены на **один общий конвейер** `switchByStep(service, step, directionLabel)` → `switchWithBackend(backend, step, directionLabel)`:

1. **Единый источник списка языков:**
   - `Lpga.F(Context)` → `Lpga.C()` (текущий `Lpev`) → поле `Lpga.Y` (`Lrek`) → `Lrek.j(current)` (`currentIndex`) → поле `Lrek.b` (список/массив записей `Lpev`).
2. **Единая циклическая индексная арифметика (`resolveTargetIndex`):**
   - `NEXT` (`resolveNextIndex`, `step = +1`): `(currentIndex + 1) % size`.
   - `PREVIOUS` (`resolvePreviousIndex`, `step = -1`): `(currentIndex - 1 + size) % size`.
   - При `listSize <= 1`, `currentIndex < 0`, `currentIndex >= listSize`, `step == 0` или совпадении целевой записи с текущей переключение не выполняется (fail-closed no-op).
3. **Строгая Gboard-only верификация цели:**
   - Из целевого `Lpev` извлекается `InputMethodSubtype` через `Lpev.f()`.
   - Проверяется активный `InputMethodInfo` Gboard по строгому совпадению пакета `isSameImePackage(service.getPackageName(), gboardInfo.getPackageName())`.
   - Проверяется, что целевой `InputMethodSubtype` реально присутствует среди включённых подтипов Gboard (`imm.getEnabledInputMethodSubtypeList(gboardInfo, true)`). Недоступный или чужой подтип отбрасывается (no-op).
4. **Единый безопасный вызов переключения:**
   - Сначала вызывается внутренний helper Gboard `Lsex.k(gboardInfo, token, verifiedSubtype)` (поддерживаются `void` и `Boolean`-возврат).
   - Если `Lsex.k` недоступен или вернул `false` — после повторной проверки `isSameImePackage` вызывается `imm.setInputMethodAndSubtype(token, gboardInfo.getId(), verifiedSubtype)`.
   - Вызов `imm.switchToNextInputMethod(token, true)` полностью удалён. `Lpga.az` и `imm.setInputMethod(...)` не вызываются.

---

## 4. Почему выбранный механизм соответствует порядку языков Gboard

По данным байткод-анализа Gboard 18.5.4 (`docs/SPACEBAR_STAGE_4_2_APK_REANALYSIS.md`):
- Штатное действие `-10011` (`SWITCH_TO_NEXT_LANGUAGE`) проходит цепочку `Lpvd.m` → `Lpvd.e(qbc, true)` → `Lpex.t(true, Lpfi)` → `Lpga.t(Z, Lpfi;)Z` (`0x504ae0`) → `Lrek.k(current, boolean)` (`0x5309b4`) → `Lrek.j(current)` (`0x530b88`, сопоставление по локали `Lpev.i()` и идентификатору `Lpev.q()` в `Lrek.b`) → выбор `Lrek.b[(index + 1) % size]`.
- Использование того же самого `Lrek.b` и `Lrek.j(current)` для обоих направлений (`+1` для `NEXT`, `-1` для `PREVIOUS`) гарантирует, что:
  1. `NEXT` следует точно тому же внутреннему порядку `Lrek.b`, что и сам Gboard, без переключения на внешние IME (обходя TalkBack-ветку `Lpga.az`).
  2. `PREVIOUS` является точным обратным шагом по тому же `Lrek.b`.
  3. Переключение подтверждённого подтипа Gboard синхронизирует внутреннее состояние через `InputMethodService.onCurrentInputMethodSubtypeChanged` → `Lphr.onCurrentInputMethodSubtypeChanged` (`0x31ba30`) → `Lpeo.a(subtype)` (`0x312178`).

Клавиша Globe не изменялась: ни `PRESS` (`SWITCH_TO_NEXT_LANGUAGE`), ни `LONG_PRESS` (`SHOW_SYSTEM_IME_PICKER`, `data="globe"`) не затрагиваются, и пространство жестов пробела не зависит от наличия Globe. `GboardSpacebarCursorSender.java` не изменялся.

---

## 5. Список всех изменённых, перемещённых и созданных файлов

### Созданы
- `patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/shared/GboardKeyboardViewHolderTouchComposer.kt`
- `patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/spacebargesture/GboardSpacebarGestureBytecodePatch.kt`
- `patches/src/test/kotlin/dev/jason/gboardpatches/patches/gboard/registry/GboardSamsungSpacebarGesturesPatchRegistryTest.kt`
- `docs/SPACEBAR_STAGE_5_2_IMPLEMENTATION_REPORT.md`

### Перемещены и обновлены
- `patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/swipedismiss/GboardSpacebarGestureResourcePatch.kt` → `patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/spacebargesture/GboardSpacebarGestureResourcePatch.kt` (обновлён пакет)
- `patches/src/test/kotlin/dev/jason/gboardpatches/patches/gboard/features/swipedismiss/GboardSpacebarGestureResourcePatchTest.kt` → `patches/src/test/kotlin/dev/jason/gboardpatches/patches/gboard/features/spacebargesture/GboardSpacebarGestureResourcePatchTest.kt` (обновлён пакет, добавлена явная проверка сохранения Globe `PRESS` `SWITCH_TO_NEXT_LANGUAGE` и `LONG_PRESS` `SHOW_SYSTEM_IME_PICKER`)

### Изменены
- `patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/shared/runtimeabi/RuntimeAbi.kt`
- `patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/swipedismiss/GboardSwipeDismissBytecodePatch.kt`
- `patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/GboardPatchRegistry.kt`
- `patches/src/main/resources/gboard/gboard-port-product-catalog.json`
- `patches/src/main/resources/gboard/gboard-port-product-catalog.sha256`
- `patches-list.json`
- `extensions/extension/src/main/java/dev/jason/gboardpatches/extension/swipedismiss/GboardSwipeDismissRuntime.java`
- `extensions/extension/src/main/java/dev/jason/gboardpatches/extension/spacebargesture/GboardSpacebarGestureRuntime.java`
- `extensions/extension/src/main/java/dev/jason/gboardpatches/extension/spacebargesture/GboardSpacebarLanguageNavigator.java`
- `patches/src/test/kotlin/dev/jason/gboardpatches/patches/gboard/registry/GboardPortProductCatalogContractTest.kt`
- `patches/src/test/kotlin/dev/jason/gboardpatches/patches/gboard/registry/GboardSwipeDismissPatchRegistryTest.kt`
- `extensions/extension/src/test/java/dev/jason/gboardpatches/extension/spacebargesture/GboardSpacebarLanguageNavigatorTest.java`

### Не изменялись (проверено)
- `extensions/extension/src/main/java/dev/jason/gboardpatches/extension/spacebargesture/GboardSpacebarCursorSender.java`
- Существующие тесты не удалялись.

---

## 6. Список добавленных и обновлённых тестов

1. **`GboardSpacebarLanguageNavigatorTest.java`** (расширен до 10 unit-тестов):
   - `nextAndPreviousIndicesAreNoOpWhenListHasZeroOrOneLanguage`
   - `nextAndPreviousIndicesRejectOutOfBoundsAndZeroStep`
   - `twoLanguagesSwitchNextAndPreviousOnUnifiedOrder` (2 языка: `NEXT` и `PREVIOUS`)
   - `threeLanguagesSwitchSequentiallyInBothDirectionsWithExactInverseOrder` (3 языка: последовательно в обе стороны)
   - `fourLanguagesWrapCyclicallyAcrossStartAndEnd` (4 языка: циклический переход через начало `0 -> 3` и конец `3 -> 0` + полные циклы)
   - `singleLanguageListDoesNotTriggerSwitch` (1 язык — без переключения)
   - `invalidCurrentIndexDoesNotTriggerSwitch` (невалидный индекс `-1`, `size` — без переключения)
   - `unavailableOrUnenabledSubtypeDoesNotTriggerSwitch` (недоступный в Gboard subtype — без переключения)
   - `foreignImePackageNeverExecutesSwitch` (чужие IME `com.samsung.android.honeyboard`, `com.google.android.marvin.talkback` — без переключения)
   - `fallsBackToVerifiedInputMethodManagerWhenGboardHelperReturnsFalse` (проверка fallback с `Lsex.k` на верифицированный `setInputMethodAndSubtype`)
   - `sameImePackageGuardStrictlyPreventsExternalIme`
2. **`GboardSamsungSpacebarGesturesPatchRegistryTest.kt`** (новый, 4 теста):
   - Независимая публикация `Samsung Spacebar Gestures` (`default = true`, admitted contribution `samsung_spacebar_gestures.dispatch`).
   - Отсутствие зависимости от `gboardSwipeDismissPatch`, `gboardSwipeDismissBytecodePatch`, `gboardSwipeDismissFeatureMarkerPatch`.
   - Единственный владелец `gboardSpacebarGestureResourcePatch` во всём `GboardPublishedPatchCatalog.morpheRegistrations` (защита от двойной регистрации и двойной правки XML).
   - Изоляция выборок в `GboardKeyboardViewHolderTouchSelectionStore` (только Spacebar, только SwipeDismiss, оба вместе, идемпотентность дублирующего `add`, очистка после `take`).
3. **`GboardSwipeDismissPatchRegistryTest.kt`** (обновлён):
   - Добавлен тест `swipeDismissDoesNotDependOnSamsungSpacebarGesturesOrItsResources`.
4. **`GboardSpacebarGestureResourcePatchTest.kt`** (перенесён и дополнен):
   - Явная проверка сохранения как `PRESS` (`SWITCH_TO_NEXT_LANGUAGE`, `data="globe"`), так и `LONG_PRESS` (`SHOW_SYSTEM_IME_PICKER`, `data="globe"`), а также `PRESS` (`SPACE`), `ScrubDeleteMotionEventHandler` и `InlineSuggestionScrubSpaceMotionEventHandler`.
5. **`GboardPortProductCatalogContractTest.kt`** (обновлён):
   - Добавлена запись `"samsung_spacebar_gestures" to "version-sensitive"` в `EXPECTED_MIGRATION_SCOPES`.

---

## 7. Реально запущенные проверки и их результаты

В соответствии с ограничениями этапа сборка `.mpp` и сборка APK **не выполнялись**. Полный Gradle-прогон `:patches:test` / `:extensions:extension:testDebugUnitTest` в контейнере недоступен без сети/кэша `app.morphe:morphe-patcher:2.1.0`, поэтому были запущены прямые компиляции и JUnit-прогоны локальным JDK 17 (`javac`), `K2JVMCompiler` (`kotlin-compiler-embeddable-2.2.21`) и Python-валидатор контрактов:

| Проверка | Команда / инструмент | Результат |
|---|---|---|
| Standalone-компиляция `spacebargesture/*.java` (доказывает нулевую зависимость от `swipedismiss` и `settings`) | `javac --release 17` с `android-36/android.jar` + `junit-4.13.2.jar` | **PASS** (0 ошибок) |
| Java JUnit-тесты пространства жестов пробела (`GboardSpacebarLanguageNavigatorTest`, `GboardSpacebarGestureStateTest`, `GboardSpacebarCursorSenderTest`) | `java org.junit.runner.JUnitCore` | **PASS — 27/27 тестов** |
| Независимая компиляция `swipedismiss` (`GboardSwipeDismissRuntime`, `GboardSwipeDismissGesture`, `GboardSwipeDismissSettings`) + проверка отсутствия классов `spacebargesture` в выводе | `javac --release 17` | **PASS** (0 ошибок, 0 классов `spacebargesture`) |
| Java JUnit-тесты `GboardSwipeDismissGestureTest` | `java org.junit.runner.JUnitCore` | **PASS — 11/11 тестов** |
| Kotlin-компиляция `RuntimeAbi.kt`, `RuntimeCallEmitter.kt`, `GboardKeyboardViewHolderTouchComposer.kt`, `GboardSwipeDismissBytecodePatch.kt`, `GboardSpacebarGestureBytecodePatch.kt`, `GboardSpacebarGestureResourcePatch.kt` и `GboardSpacebarGestureResourcePatchTest.kt` (с минимальными compile-time стабами `app.morphe.patcher.*`) | `K2JVMCompiler` (`-Xcontext-parameters`) | **PASS** (0 ошибок) |
| Kotlin JUnit-тесты `GboardSpacebarGestureResourcePatchTest` (5 тестов) + `GboardKeyboardViewHolderTouchSelectionStore` (1 тест) | `java org.junit.runner.JUnitCore` | **PASS — 6/6 тестов** |
| Статический аудит каталога, схемы, SHA-256, `patches-list.json`, `RuntimeCallId`, 238 биндингов, развязки раннейтов, отсутствия запрещённых API (`switchToNextInputMethod`, `setInputMethod(`, `-10197`), отсутствия CRLF/хвостовых пробелов/конфликтных маркеров | `python3` скрипт проверки | **PASS** (`features=46`, `bindings=238`, `runtime_calls=157`, `sha256=f86e07cf...`) |

**Не запускались в контейнере (требуют полный Gradle / Morphe Patcher 2.1.0 / Robolectric в CI или на машине сборки):**
- `GboardPortProductCatalogContractTest`, `GboardPublishedPatchCatalogContractTest`, `GboardSwipeDismissPatchRegistryTest`, `GboardSamsungSpacebarGesturesPatchRegistryTest`, `CompiledPatchRuntimeCallInventoryTest`, `RuntimeAbiVerifierTest`, `GboardCapabilityWiringVerifier`, `GboardSwipeDismissDirectBootTest` (Robolectric).
- `git diff --check` / `git commit` / `git push`: директория `.git` отсутствует в файловой системе контейнера, поэтому проверка чистоты строк/пробелов выполнена скриптом Python по всем 17 затронутым файлам, а коммит/пуш необходимо выполнить в среде с git-репозиторием.

---

## 8. Оставшиеся риски

1. **Возможная динамическая перестановка `Lrek.b` (MRU) внутри Gboard при смене подтипа:**
   - Статический байткод-анализ подтвердил, что `Lrek.k` двигается по `Lrek.b` с шагом `+1`, а `Lphr.onCurrentInputMethodSubtypeChanged` вызывает `Lpeo.a(subtype)`. Однако точное поведение `Lrek.b` после серии переключений через `Lsex.k` / `setInputMethodAndSubtype` (фиксированный ли это порядок пользовательских языков или частично MRU) в рантайме можно окончательно подтвердить только на устройстве с 3 и 4 языками.
2. **Точный runtime-тип `Lrek.b` и сигнатура/возврат `Lsex.k`:**
   - Код поддерживает как `List<?>`, так и `Object[]` для `Lrek.b`, а также `static` и instance-вариант `Lsex.k` (с `void` или `Boolean` возвратом) и безопасный fallback на `imm.setInputMethodAndSubtype`. Если в будущем релизе Gboard обфусцированные имена (`pga`, `pev`, `rek`, `sex`) изменятся, переключение безопасно завершится no-op с диагностикой в `Log.w` (без краша и без ухода на внешний IME).
3. **Зависимость от полного Gradle-прогона реестра и `GboardTargetBuildCompiler`:**
   - В репозитории `GboardTargetAdmission` генерируется задачей компиляции биндингов (`GboardTargetBuildCompiler`) из `gboard-port-product-catalog.json` и `gboard-version-bindings.json`. После прогона Gradle в CI необходимо убедиться, что `GboardTargetAdmission.admittedContributionIdsByFeature` включает `"samsung_spacebar_gestures" -> setOf("samsung_spacebar_gestures.dispatch")` и проходят все тесты модуля `:patches`.

---

## 9. Что можно проверить только на реальном устройстве

После ревью Stage 5.2, прогона полного Gradle-тест-сьюта и сборки патча на реальном **Samsung Galaxy S22 5G (`SM-S901U1`, Android 16 / One UI 8)** с **Gboard `18.5.4.993608717-release-arm64-v8a`** требуется проверить:

1. **Независимость патчей в Morphe Manager:**
   - Сценарий A: включён **только** `Samsung Spacebar Gestures`, `Swipe Down to Dismiss Keyboard` **отключён** → все жесты пробела работают полностью; свайп вниз по шапке не закрывает клавиатуру.
   - Сценарий B: включён **только** `Swipe Down to Dismiss Keyboard`, `Samsung Spacebar Gestures` **отключён** → свайп вниз по шапке работает; пробел ведёт себя полностью штатно (стоковый Gboard).
   - Сценарий C: включены **оба** патча → оба работают совместно без конфликтов и без двойной правки XML.
2. **Единый порядок переключения языков (`NEXT` / `PREVIOUS`):**
   - 1 язык: свайпы по пробелу влево/вправо ничего не ломают и не открывают системный IME picker.
   - 2 языка (например EN ↔ RU): свайп вправо и свайп влево переключают строго между EN и RU, никогда не уходя в Samsung Keyboard или TalkBack.
   - 3 языка (например EN / RU / UK): последовательные свайпы вправо (`A → B → C → A`) и влево (`A → C → B → A`) идут строго в обратном порядке по одному списку.
   - 4 языка: проверка циклического перехода через начало (`0 → 3`) и конец (`3 → 0`), отсутствие «залипания» на 2 языках (проверка, не пересортировывает ли `Lrek.b` порядок по MRU).
3. **Удержание пробела (~300 мс) и движение курсора:**
   - Обычная клавиатура остаётся на экране (без Trackpad / FreeCursorKeyboard).
   - После отпускания пальца не вставляется случайный пробел и не переключается язык.
4. **Нетронутый Globe и остальные функции Gboard:**
   - Короткое нажатие Globe переключает язык штатно; долгое нажатие Globe открывает системный выбор IME штатно.
   - Короткое нажатие пробела вставляет одиночный пробел.
   - Glide Typing, автокоррекция/подсказки, голосовой ввод, Emoji/GIF, Clipboard, `ScrubDelete` (свайп от Backspace) и `InlineSuggestionScrubSpace` работают без регрессий.
