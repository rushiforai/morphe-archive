# Stage 5.2.1 — Отчёт финальной проверки реестра и контрактов Samsung Spacebar Gestures

- **Репозиторий:** `vortexnode/GboardSamsung` (`main`, базовый коммит `e7a40e5357ec0dc16aef65f95477ef56499a4c18`)
- **Область:** проверка регистрации патчей, контрактов каталога/привязок, генерации `GboardTargetAdmission`, общего компоновщика `GboardKeyboardViewHolderTouchComposer` и ресурсного патча `GboardSpacebarGestureResourcePatch` без внесения новых фич.

---

## 1. Какие проверки выполнены

1. **Аудит регистрации публичных патчей и графа зависимостей:**
   - `patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/GboardPatchRegistry.kt`
   - `patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/GboardCapabilityWiringVerifier.kt`
   - `patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/GboardContributionWiring.kt`
   - Тестовые контракты: `GboardSamsungSpacebarGesturesPatchRegistryTest.kt`, `GboardSwipeDismissPatchRegistryTest.kt`, `GboardPublishedPatchCatalogContractTest.kt`, `GboardPublishedInventoryTestSupport.kt`, `GboardPortProductCatalogContractTest.kt`, `GboardStagedReleasePatchContractTest.kt`, `GboardRuntimePatchesContractTest.kt`, `GboardDeveloperOptionsGeneratedInventoryTest.kt`, `GboardContributionWiringTest.kt`, `GboardCompatibilitySourceTest.kt`, `GboardTargetNativeRetirementSourceTest.kt`.
2. **Аудит каталога и привязок 18.5.4 + прямая проверка инвариантов данных:**
   - `patches/src/main/resources/gboard/gboard-port-product-catalog.json` и `gboard-port-product-catalog.sha256`
   - `patches/src/main/resources/gboard/gboard-version-bindings.json`
   - `patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/shared/runtimeabi/RuntimeAbi.kt`
   - Проверены SHA-256 sidecar (`f86e07cfc814ff772b83793a76e2647e57e70f894fd7a858edf4bf48eb0321ff`), сортировка и уникальность 46 `feature_id`, существование всех `consumer_files`, наличие всех `runtime_calls` в `RuntimeCallId`, и точное совпадение объединения `required_bindings` с 238 ключами профиля `18.5.4`.
3. **Реальная генерация `GboardTargetAdmission.kt` и `GboardVersionBindings.kt`:**
   - Прямой запуск реального `TargetBindingGenerator` (без заглушек) из `patches/src/bindingCompiler/kotlin/...` на проверенных файлах репозитория.
   - Прямой запуск реального `GboardTargetBuildCompiler.compile(...)` с частичным допуском (`PortBundle`) для всех 4 комбинаций включения/выключения `samsung_spacebar_gestures` и `swipe_down_to_dismiss_keyboard`.
4. **Аудит общего touch-компоновщика (`GboardKeyboardViewHolderTouchComposer.kt`):**
   - Проверка генерации Smali-кода для всех 4 комбинаций включения патчей.
   - Проверка дедупликации (`LinkedHashSet` в `GboardKeyboardViewHolderTouchSelectionStore`), идемпотентности повторного вызова (`applyKeyboardViewHolderTouchInterceptors`), взаимного исключения на уровне рантайма (`isHeaderHolder(holder)` в `GboardSwipeDismissRuntime.java` и `GboardSpacebarGestureRuntime.java`, per-runtime `ThreadLocal<Boolean> CANCELLING`) и отсутствия других потребителей `KeyboardViewHolder.dispatchTouchEvent` в `patches/src/main/kotlin/`.
5. **Аудит ресурсного патча (`GboardSpacebarGestureResourcePatch.kt`):**
   - Подтверждена исключительная принадлежность патча `gboardSamsungSpacebarGesturesPatch`.
   - Подтверждено декодирование `res/xml*/*.xml` и пяти обфусцированных XML в корне `res/` (`res/IEX.xml`, `res/nB0.xml`, `res/bsB.xml`, `res/tER.xml`, `res/kgx.xml`).
   - Подтверждено сохранение Globe `PRESS`, Globe `LONG_PRESS` (`data="globe"`), `SPACE PRESS`, `ScrubDeleteMotionEventHandler` и `InlineSuggestionScrubSpaceMotionEventHandler`; отсутствие изменений поведения Globe и настроек скрытия Globe.
6. **Прямая проверка реальных JVM/JUnit тестов и ABI без заглушек:**
   - Компиляция и запуск Java-тестов расширения (`javac --release 17` + `android-36/android.jar` + `junit-4.13.2.jar`).
   - Компиляция и запуск Kotlin-тестов, не зависящих от `app.morphe.patcher` (`K2JVMCompiler 2.2.21` + реальные `asm 9.9`, `gson 2.13.1`, `junit 4.13.2`), плюс прямая проверка `RuntimeAbiVerifier.verify` против скомпилированного `GboardSpacebarGestureRuntime.class`.

---

## 2. Какие тесты реально запущены и их результаты

### Почему полный Gradle-прогон недоступен в этом контейнере

- `settings.gradle.kts` подключает плагин `id("app.morphe.patches") version "2.1.0"` из `https://maven.pkg.github.com/MorpheApp/registry`, требующий учётных данных GitHub Packages (`gpr.user`/`gpr.key` или `GITHUB_ACTOR`/`GITHUB_TOKEN`). В контейнере отсутствуют как эти учётные данные, так и кешированные артефакты `app.morphe:*` в `/opt/gradle` и `/root/.gradle`.
- Дополнительно, в `patches/build.gradle.kts` задача `:patches:test` объявляет зависимость от `mppJar` (сборка `.mpp` запрещена условиями Stage 5.2.1).
- Все указанные ниже результаты получены **без каких-либо заглушек (zero-stub)** на реальных классах репозитория и реальных библиотеках (`junit 4.13.2`, `asm 9.9`, `gson 2.13.1`, `android-36/android.jar`). Тесты, требующие `app.morphe.patcher` или Gradle-сборки, честно отмечены как `NOT RUN`.

### Таблица результатов по обязательным пунктам Stage 5.2.1

| Проверка / Тест | Статус | Детали |
|---|---|---|
| `GboardSamsungSpacebarGesturesPatchRegistryTest` | **NOT RUN** | Требует `app.morphe.patcher` / Gradle (`app.morphe.patches:2.1.0`). Выполнен полный статический аудит кода. |
| `GboardSwipeDismissPatchRegistryTest` | **NOT RUN** | Требует `app.morphe.patcher` / Gradle. Выполнен полный статический аудит кода. |
| `GboardPublishedPatchCatalogContractTest` | **NOT RUN** | Требует `app.morphe.patcher` / Gradle. Выполнен полный статический аудит кода (`assertMatchesPublishedRegistrationCount` динамически берёт `GboardPublishedPatchCatalog.morpheRegistrations.size` = 46). |
| `GboardPortProductCatalogContractTest` | **NOT RUN** | Требует `app.morphe.patcher` / Gradle (импортирует `Patch` и `GboardPublishedPatchCatalog`). Чистые инварианты данных каталога и sidecar SHA-256 дополнительно проверены напрямую (`PASS`: 46 фич, 238 привязок, SHA-256 совпал, все `consumer_files` и `runtime_calls` валидны). |
| `GboardTargetAdmission` (генерация) | **PASS** | Реальный запуск `TargetBindingGenerator` на `gboard-version-bindings.json` + `gboard-port-product-catalog.json` и 4-вариантный прогон `GboardTargetBuildCompiler.compile(...)` завершились без ошибок. |
| `GboardCapabilityWiringVerifier` | **NOT RUN** | Зависит от `GboardPublishedPatchCatalog` (`app.morphe.patcher`). Статический аудит подтвердил корректность: верификатор проверяет только мульти-вкладные фичи (`contributions.size > 1`), а обе фичи одно-вкладные и совпадают с `GboardTargetAdmission`. |
| `CompiledPatchRuntimeCallInventoryTest` | **PARTIAL** (13 `PASS`, 1 `NOT RUN`) | 13/14 автономных ASM-тестов инвентаризатора прошли (`PASS`). 1/14 (`compiled patch callers have no unregistered ABI literals or orphan call ids`) — `NOT RUN`, так как требует системное свойство `gboard.compiledPatchClasses` от Gradle `:patches:compileKotlin`. |
| `RuntimeAbiVerifierTest` | **PASS** | 3/3 JUnit-теста прошли (`PASS`). Дополнительно выполнен прямой вызов `RuntimeAbiVerifier.verify` на реально скомпилированном `GboardSpacebarGestureRuntime.class` — `mismatches=[]` (`PASS`). |

### Дополнительные реально выполненные наборы тестов (zero-stub)

| Набор тестов | Статус | Детали |
|---|---|---|
| `GboardSpacebarLanguageNavigatorTest` + `GboardSpacebarGestureStateTest` + `GboardSpacebarCursorSenderTest` + `GboardSwipeDismissGestureTest` | **PASS** | `OK (38 tests)` через `javac --release 17` + `JUnitCore`. |
| `RuntimeCallEmitterTest` | **PASS** | 7/7 JUnit-тестов (`PASS`). |
| `GboardTargetNativeRetirementSourceTest` | **PASS** | 1/1 JUnit-тест (`PASS`). |
| `GboardTargetBuildCompilerTest` + `TargetBindingGeneratorTest` | **PASS** | `OK (13 tests)` через `JUnitCore` с реальными ресурсами `src/bindingCompiler/resources` и `src/main/resources`. |
| `TargetBindingCompilerTest` | **PARTIAL** (9 `PASS`, 1 `FAIL`) | 9/10 тестов `PASS`. 1/10 (`authoritative 1854 admitted contract exactly matches sparse requirements and build output`) — `FAIL` исключительно из-за отсутствия файла `patches/build/generated/sources/versionBindings/kotlin/main/.../GboardVersionBindings.kt`, создаваемого Gradle-сборкой. |
| Частичный допуск `GboardTargetBuildCompiler.compile(...)` (4 комбинации) | **PASS** | `ONLY_SPACEBAR_GESTURES`, `ONLY_SWIPE_DISMISS`, `BOTH`, `NEITHER` — все 4 сценария скомпилированы с ожидаемыми `admittedFeatureIds` и `requiredBindingKeys`. |
| `GboardSpacebarGestureResourcePatchTest` | **NOT RUN** | Требует `app.morphe.patcher` (`ResourcePatchContext`). Логика патча проверена построчным аудитом. |

---

## 3. Подтверждена ли независимость двух публичных патчей

**Да, полная независимость подтверждена на всех уровнях:**

1. **Реестр патчей (`GboardPatchRegistry.kt`):**
   - `gboardSamsungSpacebarGesturesPatch` (`featureId = "samsung_spacebar_gestures"`, `name = "Samsung Spacebar Gestures"`, `default = true`) зависит только от `gboardSpacebarGestureBytecodePatch` и `gboardSpacebarGestureResourcePatch`. Зависимостей на `gboardSwipeDismissPatch`, `gboardSwipeDismissBytecodePatch`, `gboardSwipeDismissFeatureMarkerPatch` или `gboardPatchesSettingsPatch` нет.
   - `gboardSwipeDismissPatch` (`featureId = "swipe_down_to_dismiss_keyboard"`, `name = "Swipe Down to Dismiss Keyboard"`, `default = true`) зависит только от `gboardPatchesSettingsPatch`, `gboardSwipeDismissFeatureMarkerPatch` и `gboardSwipeDismissBytecodePatch`. Зависимостей на bytecode/resource-патчи `Samsung Spacebar Gestures` нет.
   - Оба патча зарегистрированы независимо в `GboardPublishedPatchCatalog.morpheRegistrations` (46 публичных патчей).
2. **Каталог и компилятор допусков (`gboard-port-product-catalog.json`, `GboardTargetBuildCompiler`):**
   - Ни одна из двух фич не объявляет `depends_on_feature_ids` на другую.
   - Реальный запуск `GboardTargetBuildCompiler.compile(...)` подтвердил независимую компиляцию всех 4 комбинаций:
     - `ONLY_SPACEBAR_GESTURES` -> `admittedFeatureIds=[samsung_spacebar_gestures]`
     - `ONLY_SWIPE_DISMISS` -> `admittedFeatureIds=[swipe_down_to_dismiss_keyboard]`
     - `BOTH` -> `admittedFeatureIds=[samsung_spacebar_gestures, swipe_down_to_dismiss_keyboard]`
     - `NEITHER` -> `admittedFeatureIds=[]`
3. **Общий touch-компоновщик (`GboardKeyboardViewHolderTouchComposer.kt`):**
   - **Только Spacebar Gestures:** вставляется только вызов `SPACEBAR_GESTURE_RUNTIME_ON_HOLDER_TOUCH`; вызовов SwipeDismiss нет.
   - **Только SwipeDismiss:** вставляется только вызов `SWIPE_DISMISS_RUNTIME_ON_HEADER_TOUCH`; вызовов Spacebar Gestures нет.
   - **Оба включены:** сначала `SWIPE_DISMISS_RUNTIME_ON_HEADER_TOUCH` с переходом `if-eqz v0, :jasondev_check_spacebar_gesture`, затем `SPACEBAR_GESTURE_RUNTIME_ON_HOLDER_TOUCH` с переходом `if-eqz v0, :jasondev_continue_holder_touch`. В рантайме они взаимно исключают друг друга по типу контейнера (`GboardSwipeDismissRuntime.onHeaderTouch` немедленно возвращает `false` при `!isHeaderHolder(holder)`, а `GboardSpacebarGestureRuntime.onHolderTouch` — при `isHeaderHolder(holder)`), а синтетический `ACTION_CANCEL` защищён собственным `ThreadLocal<Boolean> CANCELLING` в каждом рантайме.
   - **Оба выключены:** компоновщик не подключается к графу патчей, а при пустой выборке `finalize` завершается без модификации `dispatchTouchEvent`.
   - **Идемпотентность и конфликты:** `GboardKeyboardViewHolderTouchSelectionStore` использует `LinkedHashSet` (повторная регистрация не создаёт дубликатов); `applyKeyboardViewHolderTouchInterceptors` проверяет уже вставленные вызовы и безопасно пропускает идентичный повтор либо бросает `IllegalStateException` при несогласованном состоянии. Других патчей в репозитории, модифицирующих `KeyboardViewHolder.dispatchTouchEvent`, нет.
4. **Ресурсный патч (`GboardSpacebarGestureResourcePatch.kt`):**
   - Подключён исключительно к `gboardSamsungSpacebarGesturesPatch`. Отключение `Samsung Spacebar Gestures` полностью отключает очистку XML-ресурсов, даже если `Swipe Down to Dismiss Keyboard` включён.

---

## 4. Есть ли скрытая зависимость Spacebar Gestures от SwipeDismiss через `required_bindings`

**Скрытой логической зависимости на фичу SwipeDismiss нет.**

- В `patches/src/main/resources/gboard/gboard-version-bindings.json` ключ `swipe_dismiss_header_dispatch` описывает исключительно штатный метод Gboard:
  - `kind`: `method`
  - `class_type`: `Lcom/google/android/libraries/inputmethod/keyboard/impl/KeyboardViewHolder;`
  - `method_name`: `dispatchTouchEvent`
  - `parameter_types`: `["Landroid/view/MotionEvent;"]`
  - `return_type`: `Z`
  - `confidence`: `0.9`
- Это имя исторически унаследовано из upstream-профиля привязок `18.5.4`, где первым потребителем `KeyboardViewHolder.dispatchTouchEvent` был SwipeDismiss. В `GboardTargetBuildCompiler` зависимости между фичами проверяются исключительно через `depends_on_feature_ids`, а `required_bindings` проверяет лишь наличие данного метода в экспортируемом профиле Gboard. Это подтверждено прямым тестом `ONLY_SPACEBAR_GESTURES` (фича допускается без `swipe_down_to_dismiss_keyboard`).
- **Почему нельзя вводить/переименовывать нейтральный ключ сейчас:**
  - Авторитативный профиль `18.5.4` фиксирует ровно 238 ключей (`GboardPortProductCatalogContractTest.admittedBindingUnionExactlyMatchesTheAuthoritative1854Profile`) и защищён криптографическими дайджестами `projection_sha256` / `profile_sha256` / `port_bundle_sha256`.
  - Переименование или добавление нового ключа (например, `keyboard_view_holder_dispatch_touch_event`) без синхронного перевыпуска внешнего профиля привязок `18.5.4` сломает контракт каталога и валидацию дайджестов.
- **Архитектурное замечание (не дефект):** `GboardKeyboardViewHolderTouchComposer.kt` находит `KeyboardViewHolder.dispatchTouchEvent` по строковым константам (как и исходный upstream `GboardSwipeDismissBytecodePatch`), а не через `GboardVersionBindings.swipeDismissHeaderDispatch`. Сохранение `swipe_dismiss_header_dispatch` в `required_bindings` сохраняет привязку к профилю 18.5.4 и совместимость с внешним экспортёром без нарушения ABI.

---

## 5. Проверена ли генерация `GboardTargetAdmission`

**Да, проверена реальным запуском `TargetBindingGenerator`.**

Запуск `dev.jason.gboardpatches.tools.bindings.TargetBindingGenerator` на `patches/src/main/resources/gboard/gboard-version-bindings.json` и `patches/src/main/resources/gboard/gboard-port-product-catalog.json` успешно сгенерировал `GboardVersionBindings.kt` и `GboardTargetAdmission.kt`:

- `targetVersion = "18.5.4"`
- `profileVersion = "1.6.0"`
- `projectionSha256 = "ce992bb07dcf0fe4735746ce133cb9f43f91d42159da9ce3dec751f358778e4c"`
- Всего сгенерировано 46 записей в `admittedContributionIdsByFeature`, в том числе:
  - `"samsung_spacebar_gestures" to setOf("samsung_spacebar_gestures.dispatch")`
  - `"swipe_down_to_dismiss_keyboard" to setOf("swipe_down_to_dismiss_keyboard.dispatch")`
- В `GboardVersionBindings.kt` корректно сгенерирован `val swipeDismissHeaderDispatch = GboardMethodTarget(classType = "Lcom/google/android/libraries/inputmethod/keyboard/impl/KeyboardViewHolder;", name = "dispatchTouchEvent", ...)`.

---

## 6. Все изменённые файлы

В ходе аудита реальных дефектов в коде, контрактах, компоновщике и ресурсах не обнаружено, поэтому исходный код и ресурсы не изменялись. Создан только отчёт:

- `docs/SPACEBAR_STAGE_5_2_1_VERIFICATION_REPORT.md`

---

## 7. Оставшиеся ограничения и риски

1. **Невозможность запуска полного Gradle в данном контейнере:** без доступа к `https://maven.pkg.github.com/MorpheApp/registry` (`app.morphe.patches:2.1.0`) остались в статусе `NOT RUN` тесты, зависящие от `app.morphe.patcher` (`GboardSamsungSpacebarGesturesPatchRegistryTest`, `GboardSwipeDismissPatchRegistryTest`, `GboardPublishedPatchCatalogContractTest`, `GboardPortProductCatalogContractTest`, `GboardCapabilityWiringVerifier`, `GboardSpacebarGestureResourcePatchTest`, а также 1/14 тест `CompiledPatchRuntimeCallInventoryTest` по скомпилированным классам патчей и 1/10 тест `TargetBindingCompilerTest`, проверяющий файл в `patches/build/generated/...`). Перед релизом необходимо выполнить полный прогон тестов в CI или локальном окружении с токеном GitHub Packages.
2. **Отсутствие `.git` в контейнере:** каталог `.git` не смонтирован в рабочей директории контейнера, поэтому команды `git diff --check`, `git status` и создание коммита недоступны внутри этой среды.
3. **Историческое имя ключа `swipe_dismiss_header_dispatch`:** при будущем перевыпуске профиля привязок (следующий major/minor-порт версии Gboard) имеет смысл переименовать ключ на нейтральный на стороне генератора профиля синхронно с каталогом.
4. **Проверка на реальном устройстве/APK:** финальное поведение всех 4 комбинаций включения `Samsung Spacebar Gestures` и `Swipe Down to Dismiss Keyboard` на пропатченном APK Gboard 18.5.4 (включая отсутствие регрессий Glide Typing, ScrubDelete и Globe) следует подтвердить ручным smoke-тестом на устройстве после сборки в окружении с Morphe Patcher.
