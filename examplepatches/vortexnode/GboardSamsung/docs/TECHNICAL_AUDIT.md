# Технический аудит проекта `vortexnode/GboardSamsung`

- **Репозиторий:** `https://github.com/vortexnode/GboardSamsung`
- **Upstream-база:** `jasonwu1994/Gboard-patches` (коммит `463269a0f315ef9cee749e10d155af1aedaa49ad`, файл `UPSTREAM_COMMIT.txt`)
- **Целевое приложение:** Google Gboard (`com.google.android.inputmethod.latin`), версия `18.5.4.993608717-release-arm64-v8a`
- **Целевой артефакт:** пакет патчей Morphe (`.mpp`), **не** standalone APK
- **Целевое устройство:** Samsung Galaxy S22 5G (`SM-S901U1`), Android 16, One UI 8
- **Формат аудита:** read-only анализ исходного кода (реализация патчей ещё не начата)

> Везде в отчёте **подтверждённые факты** из прочитанного кода отделены от **предположений / пунктов, требующих проверки на целевом APK Gboard или устройстве**.

---

## 1. Доступность и полнота репозитория

### Подтверждённые факты
- Текущая рабочая директория содержит импортированный downstream-репозиторий **`vortexnode/GboardSamsung`**:
  - Downstream-документация: `README.md`, `AGENTS.md`, `docs/PROJECT_SCOPE.md`, `docs/UPSTREAM.md`, `UPSTREAM_COMMIT.txt`, `UPSTREAM_README.md`, `NOTICE`, `LICENSE`, `CHANGELOG.md`.
  - Конфигурации Gradle: `settings.gradle.kts`, `gradle.properties`, `gradle/libs.versions.toml`, `gradle/wrapper/gradle-wrapper.properties`, `patches/build.gradle.kts`, `extensions/extension/build.gradle.kts`, `extensions/calculator/build.gradle.kts`.
  - Метаданные релизов и патчей: `patches-bundle.json`, `patches-list.json` (564 строки).
  - Конфигурации CI/CD: `.github/workflows/release.yml`, `.github/workflows/import-upstream.yml`, `.github/workflows/custom-theme-previews-release.yml`.
  - Исходные коды и ресурсы всех 3 модулей (`patches/`, `extensions/extension/`, `extensions/calculator/`), включая `patches/src/main/resources/gboard/`, `patches/src/main/resources/custom-theme-assets/catalog.json`, `extensions/extension/native-payload/arm64-v8a/libgboardpatches_quickjs.so` и `extensions/extension/image-payload/google-g-color.png`.
  - Полный набор автоматических тестов — **376 тестовых файлов**:
    - `patches/src/test`: 76 файлов;
    - `extensions/extension/src/test`: 296 файлов;
    - `extensions/calculator/src/test`: 4 файла.
- **Расхождение в документации**: в `README.md` (строка 15) всё ещё указано, что репозиторий *«is currently a documentation seed, not yet a complete buildable copy of upstream»*, однако фактически полный код upstream уже импортирован в рабочее дерево.

### Недоступные внешние артефакты (отсутствуют в workspace)
- Репозиторий **`vortexnode/GbSu`** (упоминаемый в `docs/PROJECT_SCOPE.md` и `AGENTS.md`) в рабочем пространстве отсутствует; его код (включая Gemini-версию Rambler) не анализировался и не предполагается.
- Оригинальный APK Gboard (`18.5.4.993608717-release-arm64-v8a`) отсутствует в репозитории (и запрещён к коммиту правилами `AGENTS.md`).
- Учётные данные GitHub Packages (`GITHUB_TOKEN` / `GITHUB_ACTOR`) в контейнере не заданы (подробности в разделе 7).

---

## 2. Архитектура проекта

Проект представляет собой **многомодульную сборку Morphe Patches**, производящую patch-бандл **`.mpp`** для последующего применения к установленному APK Google Gboard через Morphe Patcher.

### Модули (`settings.gradle.kts`)
Корневое имя проекта в `settings.gradle.kts`: `rootProject.name = "gboard-patches"`, плагин `id("app.morphe.patches") version "2.1.0"` подключает 3 модуля:

1. **`:patches`** (`patches/build.gradle.kts`, **Kotlin** + inline **Smali**):
   - Содержит bytecode/resource-патчи Morphe, реестр патчей, композиторы хуков и кодогенерацию.
   - Включён флаг компилятора `-Xcontext-parameters`.
   - Дополнительные sourceSet:
     - `bindingCompiler` (`patches/src/bindingCompiler/kotlin/dev/jason/gboardpatches/tools/bindings/TargetBindingGenerator.kt`, `GboardTargetBuildCompiler.kt`) — на этапе сборки компилирует `gboard-port-product-catalog.json` и `gboard-version-bindings.json` в сгенерированные Kotlin-объекты `GboardVersionBindings.kt` и `GboardTargetAdmission.kt`.
     - `patchMetadata` (`patches/src/patchMetadata/kotlin/dev/jason/gboardpatches/util/PatchListGenerator.kt`) — генерирует `patches-list.json` из собранного `.mpp`.
   - Тесты: 76 файлов (`patches/src/test`).

2. **`:extensions:extension`** (`extensions/extension/build.gradle.kts`, **Android Library → DEX-артефакт `extensions/gboard-patches.rve`**, **Java**, `minSdk = 26`):
   - Java-рантайм, внедряемый Morphe в DEX пропатченного Gboard.
   - Содержит бизнес-логику, политики, reflection-адаптеры, встроенный UI настроек (`GboardPatchesSettingsFeatureRegistry.java`), модули FTP/Web Clipboard (`apache-ftpserver-core:1.2.1`, `apache-mina-core:2.2.9`), обход скрытых API (`hiddenapibypass:4.3`), `androidx.annotation:1.9.1` и нативную библиотеку `libgboardpatches_quickjs.so` (`arm64-v8a`) для пользовательских скриптов свайпа верхнего ряда.
   - Тесты: 296 файлов (`extensions/extension/src/test`), JUnit `4.13.2` + Robolectric `4.14.1`.

3. **`:extensions:calculator`** (`extensions/calculator/build.gradle.kts`, **Android Library → `extensions/gboard-calculator.rve`**, **Java**, `minSdk = 26`):
   - Изолированный модуль inline-калькулятора подсказок (`GboardCalculatorEngine`, `GboardCalculatorLifecycleRuntime`, `GboardCalculatorSuggestionView`).
   - Тесты: 4 файла (`extensions/calculator/src/test`).

### Принцип разделения ответственности
- **`:patches`** проверяет сигнатуры/формы целевого байткода Gboard и внедряет минимальные `invoke-static` делегаты.
- **`:extensions:*`** содержат всю логику, настройки (`SharedPreferences`, с поддержкой Direct Boot через `GboardPatchesSettings.isUserUnlocked`), политики и UI.
- Контракт между smali-хуками и Java-рантаймом жёстко фиксируется перечислением **`RuntimeCallId`** (`patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/shared/runtimeabi/RuntimeAbi.kt`, 158 записей) и проверяется против скомпилированного `.rve` DEX на этапе сборки.

---

## 3. Система патчинга Morphe

### Регистрация и верификация патчей
- Используется Morphe Gradle Plugin `app.morphe.patches:2.1.0` (`settings.gradle.kts:26`).
- Все **45 публичных патчей** зарегистрированы в `GboardPublishedPatchCatalog.morpheRegistrations` (`patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/GboardPatchRegistry.kt:875-921`).
- Зависимости и состав каждого фиче-патча описаны декларативно в:
  - `patches/src/main/resources/gboard/gboard-port-product-catalog.json` (2243 строки — `feature_id`, `contributions`, `required_bindings`, `runtime_calls`, `depends_on_feature_ids`).
  - `patches/src/main/resources/gboard/gboard-version-bindings.json` (41 КБ — точные обфусцированные дескрипторы классов, методов и полей для версии `18.5.4`).
  - `patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/GboardContributionWiring.kt` — связывает `feature_id`/`contribution_id` с `bytecodePatch`/`resourcePatch` и проверяет целостность через `verifyGboardCapabilityWiring`.

### 4 верифицированных Family Composers (защита от коллизий хуков)

| Композитор | Файл | Целевой метод(ы) Gboard (`18.5.4`) | Назначение и охват |
|---|---|---|---|
| `GboardFlagFamilyComposer` | `shared/GboardFlagFamilyComposer.kt` | `Loki;->g()Ljava/lang/Object;` + поле `Loki;->a:Ljava/lang/String;` (строгая проверка регистров `count=3, receiver=v2`) | Переопределение внутренних feature-флагов Gboard (18 фич) |
| `GboardSoftKeyFamilyComposer` | `shared/GboardSoftKeyFamilyComposer.kt` | `SoftKeyView->s(SoftKeyDef, J)Z` (хуки **до** и **после** штатного биндинга) | Модификация `SoftKeyDef`/метаданных, иконок, лейблов, геометрии клавиш (8 фич) |
| `GboardPointerOwnerTransformation` | `shared/GboardPointerOwnerTransformation.kt` | `Lqin;->B(SoftKeyView, F, F, J, I)V`, `r(J, I)V` (finish), `s(J)V` (cancel), `C()V` (reset), `ac()V` (pre-reset) | Контроль владения касанием и трекинг свайпов на уровне указателя (4 фичи) |
| `GboardGestureFamilyComposer` | `shared/GboardGestureFamilyComposer.kt` | `Lqil;->f(Lqin;, Lqae;, Lqbc;, SoftKeyDef, J, Z, Z, I, Z, J, I)V` (оборачивает `Lqij;->o(...)V`) | Перехват и поглощение диспатча клавишных жестов (3 фичи) |

### Независимые точечные bytecode-патчи
- `KeyboardViewHolder->dispatchTouchEvent(MotionEvent)Z` (`GboardSwipeDismissBytecodePatch.kt:23-68`).
- `Lphr;->aw(Lohe;)Z` (`GboardLongPressQuickActionsInputEventPatch.kt` — `Lphr;` является наследником `InputMethodService`).
- `Lrnb;->b(String, List)List` (`GboardRoundedKeyboardBytecodePatch.kt:38-165` — резолвер стилей темы для скругления контура клавиатуры).
- `InputView` / nav-bar и `onConfigureWindow` (`GboardFrostedGlassLifecycleRuntime`, `RuntimeAbi.kt:70-74`).
- `LatinIme->N()Lyrt;` (`GboardLatinGlobeKeyIgnoreIntervalBytecodePatch.kt`).

### Механизмы целостности
- `GboardTargetBuildCompiler.kt:424-433`: жёсткая привязка к `com.google.android.inputmethod.latin`, `ApkFileType.APK`, двум SHA-256 подписям Google и `versionNames = ["18.5.4.993608717-release-arm64-v8a"]`.
- `RuntimeAbi.kt` + верификация DEX гарантируют, что каждый `invoke-static` из smali указывает на реально существующий метод в `.rve`.
- Любая новая фича обязана быть зарегистрирована в: `gboard-port-product-catalog.json`, `GboardContributionWiring.kt`, `GboardPatchRegistry.kt`, `RuntimeAbi.kt` и (при наличии настроек) в `GboardPatchesSettingsFeatureRegistry.java` / `GboardKeyboardLayoutSettingsGroupFeature.java`.

---

## 4. Возможности визуальной кастомизации (адаптация под Samsung Keyboard / One UI)

| Элемент | Подтверждённые возможности в кодовой базе | Что требуется для Samsung One UI / Ограничения |
|---|---|---|
| **1. Темы и цветовые схемы** | Полноценный импорт/установка штатных Gboard ZIP-тем (`GboardCustomThemeZipImporter.java`, `GboardCustomThemeInstaller.java`, `GboardThemeImportContract.java`), валидация родным валидатором Gboard `Lrnw;->h(File)Z`, активация через `additional_keyboard_theme` и `enable_key_border`, каталог `catalog.json` (3401 строка). Есть `GboardFrostedGlassRuntime` (blur окна/фона, учитывает Android 16 / `STOCK_STRIP_SDK = 36`). | **Реализуемо полностью штатной архитектурой.** Можно создать собственный пакет тем Samsung One UI (Light / Dark / AMOLED / Dynamic accent) в формате Gboard theme ZIP (`metadata.binarypb`/`metadata.json` + `.css` + drawables) и устанавливать через существующий `GboardCustomThemeInstaller` + новый пресетный UI. |
| **2. Шрифты** | Поиск по всей кодовой базе (`grep typeface\|Typeface\|font`) подтвердил: **патчей на замену шрифта клавиш Gboard в проекте нет**. `Typeface` используется только в диалогах настроек, калькуляторе, веб-портале и в `GboardAddSymbolsRuntime.java:538,1907`. | **Требует проверки на APK `18.5.4` (не подтверждено).** Нельзя заявлять поддержку произвольных шрифтов до проверки: (а) поддерживает ли `SoftKeyView` / внутренний `AutoSizeTextView` установку `Typeface` после `SoftKeyView.s()` (через `GboardSoftKeyFamilyComposer` post-bind); (б) не сбрасывает ли Gboard шрифт при перерисовке/смене темы. |
| **3. Формы и размеры клавиш** | Есть `GboardKeyShapeSelectionFlagPatch` (флаг `more_pill_keys` в `GboardFeatureFlagsRuntime.java`), `GboardRoundedKeyboardRuntime` + `GboardRoundedKeyboardBytecodePatch.kt` (переопределение радиусов `.keyboard-base-area.keyboard-outline` через `Lrnb;->b`), нативный флаг `enable_key_border`. | Форма и радиус клавиш One UI (прямоугольные клавиши с мягким скруглением) в значительной степени задаются через **CSS/9-patch в Gboard ZIP-теме**. Для дополнительной подстройки вне темы потребуется расширение `Lrnb;->b` или post-bind правка `SoftKeyView`. |
| **4. Основные и дополнительные символы** | `GboardAddSymbolsSoftKeyRuntime.java` и `GboardLongPressQuickActionsReflectionHandles.java` (`qcv` metadata builder, `qaf` action builder, `qbc` entries) подтверждают возможность клонирования и модификации `SoftKeyDef` до `SoftKeyView.s()` через `GboardSoftKeyFamilyComposer`. | Вторичные подсказки в углу клавиши обеспечиваются сочетанием штатной опции Gboard «Длительное нажатие для ввода символов», стилей CSS темы и/или кэшированной трансформации `SoftKeyDef` (`qcv`) в `GboardSoftKeyFamilyComposer`. |
| **5. Символы при длительном нажатии** | Подтверждено `GboardLongPressQuickActionsReflectionHandles.java:232-276` (`appendLongPressAction`: чтение/замена `ActionDef` с `ActionType.LONG_PRESS`, поля `f`, `p`, `q`). | Можно адаптировать набор long-press символов под раскладку Samsung Keyboard через pre-bind трансформацию `SoftKeyDef` с обязательным кэшированием по паре `(SoftKeyDef, locale)` (по аналогии с `GboardEnglishUppercaseToggleRuntime`). |
| **6. Цифровой ряд** | Штатно поддерживается Gboard (настройка «Ряд цифр»). Есть `GboardTopRowSwipeRuntime.java` для работы с верхним рядом. | Внешний вид цифрового ряда (высота, фон, отступы) настраивается через тему (CSS) и опционально через `LayoutParams` верхнего ряда; нативная логика ввода сохраняется. |
| **7. Нижний ряд клавиатуры** | `GboardZhuyinBottomRowWeightRuntime.java` (561 строка) уже изменяет `LinearLayout.LayoutParams.weight` для слотов нижнего ряда (`key_pos_switch_to_symbol`, `key_pos_switch_to_next_language`, `key_pos_space`, `key_pos_del`, `key_pos_ime_action`) в post-bind `GboardSoftKeyFamilyComposer`, но ограничен Zhuyin. | Можно создать обобщённый **Latin/Samsung Bottom Row Proportion Runtime** по тому же паттерну для настройки ширины клавиш нижнего ряда (`?123`, глобус/эмодзи, запятая, пробел, точка, Enter). Полная перестановка функциональных клавиш сложнее и потребует модификации `SoftKeyDef` по слотам или resource-патча XML. |
| **8. Клавиша пробела** | `GboardSpacebarLogoAdapter.java` и `GboardSpacebarLogoRuntime.java` уже идентифицируют пробел (`SPACEBAR_VIEW_ID = 0x7f0b05b5`, `key_pos_space`, keycode `62`, label view `0x7f0b05f5`) и управляют его отображением. | Можно добавить оформление пробела в стиле Samsung Keyboard: отображение текущего языка со стрелками `‹ English ›` / `‹ Русский ›` как визуальную подсказку свайпа, ширину через bottom row weights и стиль через тему. |
| **9. Панель инструментов (Toolbar)** | Есть `GboardAccessPointCountRuntime.java` (флаги `config_max_access_points`, `config_default_access_points_num_on_bar`), `GboardAccessPointsMenuRuntime.java`, `GboardAccessPointContributionsRuntime.java`, `GboardCloseProactiveSuggestionsRuntime`. | Пропорции, число иконок и внешний вид тулбара One UI реализуются комбинацией существующих флагов, CSS темы и набора иконок в теме. |
| **10. Отступы, интервалы и пропорции** | Частично: `GboardRoundedKeyboardRuntime`, `GboardZhuyinBottomRowWeightRuntime`, `GboardAccessibilityLayoutRuntime`, `GboardSplitKeyboardRuntime`, штатная высота клавиатуры Gboard. | Межклавишные интервалы и боковые отступы задаются преимущественно через **CSS-переменные темы** (точные имена переменных в `18.5.4` нужно верифицировать по извлечённой теме Gboard) и при необходимости через resource-патч `dimens.xml` / post-bind правку `MarginLayoutParams`. |
| **11. Экраны эмодзи и доп. символов** | Есть `GboardEmojiSizeRuntime.java` (флаг `emoji_scale_supported`), `GboardSymbolFooterOrderRuntime` (порядок вкладок), `GboardAddSymbolsRuntime` (расширение экрана символов). | Цвета, фон сетки, вкладки и скругления адаптируются через Gboard ZIP-тему + существующие патчи. Полная структурная переделка навигации эмодзи/стикеров хрупка и нецелесообразна в первых итерациях. |

---

## 5. Архитектура переключения языков и свайпа по пробелу

### 5.1. Подтверждённые классы, методы и идентификаторы Gboard (`18.5.4`)
- **Пробел**:
  - View ID: `0x7f0b05b5` (`key_pos_space`) — `GboardSpacebarLogoAdapter.java:17`, `GboardZhuyinBottomRowWeightRuntime.java:30`.
  - Keycode нажатия: `62` (`KEYCODE_SPACE`, проверяется через `SoftKeyDef.g(qae.PRESS).b().c == 62`) — `GboardSpacebarLogoAdapter.java:18, 132-165`.
  - Label View ID на пробеле: `0x7f0b05f5` — `GboardSpacebarLogoAdapter.java:19`.
- **Клавиша глобуса и переключение языков**:
  - `SWITCH_TO_NEXT_LANGUAGE = -0x271b` (`-10011`), payload `"globe"` — `GboardGlobeDragAdapter.java:10`, `GboardLongPressQuickActionsReflectionHandles.java:226-227`.
  - Long-press глобуса (диалог выбора языка): `-0x2726` (`-10022`) — `GboardLongPressQuickActionsReflectionHandles.java:228`.
  - `GboardLatinGlobeKeyIgnoreIntervalBytecodePatch.kt` хукает `LatinIme->N()Lyrt;` (`yrt.h:F` — интервал игнорирования глобуса после печати).
  - **Не подтверждено в текущем репо**: keycode `SWITCH_TO_PREVIOUS_LANGUAGE` (например `-0x271c`) и внутренний класс менеджера `InputMethodEntry` Gboard в исходниках репозитория не встречаются (`grep` не нашёл совпадений) — **требует проверки на целевом APK `18.5.4`**.
- **Точки перехвата касаний и жестов**:
  1. `GboardPointerOwnerTransformation.kt` — `Lqin;->B(...)`, `r(...)`, `s(...)`, `C()`, `ac()`, а также `Lqin;->y()V` (`scheduleLongPress`) и поле `Lqin;->A:Ljava/util/concurrent/Future;` (`GboardLongPressQuickActionsReflectionHandles.java:114, 361`).
  2. `GboardGestureFamilyComposer.kt` — `Lqil;->f(Lqin;, Lqae;, Lqbc;, SoftKeyDef, J, Z, Z, I, Z, J, I)V` (оборачивает `Lqij;->o(...)V`).
  3. `GboardLongPressQuickActionsInputEventPatch.kt` — `Lphr;->aw(Lohe;)Z` (`InputMethodService` Gboard).
  4. `GboardSwipeDismissBytecodePatch.kt` — `KeyboardViewHolder->dispatchTouchEvent(MotionEvent)Z`.
  5. `GboardTopRowSwipeRuntime.java` — готовый референс горизонтального свайпа через `PointerOwner` + `GestureFamilyComposer`.

### 5.2. Анализ конфликтов жестов на пробеле
На пробеле Gboard сходятся 4 механизма:
1. **Tap-to-space** (`keycode = 62`).
2. **Встроенный горизонтальный scrub курсора (`enable_scrub_move`)**: `GboardCursorTrackpadRuntime.java:12` и `GboardCursorTrackpadPolicy.java` (ресурс `0x7f14096b`). При включённом `enable_scrub_move` быстрый горизонтальный свайп по пробелу **физически совпадает** с движением курсора!
3. **Long-press Cursor Trackpad (`free_cursor` / `free_cursor_lock_mode`)**: длительное удержание пробела переводит клавиатуру в режим 2D-трекпада для курсора.
4. **Жестовый ввод (Glide Typing)**: траектория начинается на буквенных клавишах, а не на пробеле.

### 5.3. Архитектурно безопасная схема реализации

#### Слой A: Конечный автомат арбитража жестов (`GboardSpacebarLanguageSwipeStateMachine`)
Чистая Java-машина состояний (полностью покрывается JVM unit-тестами):
1. `IDLE`
2. `ARMED_ON_SPACEBAR` — вход на `ACTION_DOWN` / `Lqin.B` **только** если:
   - `pointerCount == 1`;
   - стартовый view — пробел (`id == 0x7f0b05b5`, `pressKeycode == 62`), не активен трекпад/popup;
   - функция включена и активных языков ≥ 2 (при 1 языке — мгновенный pass-through).
   - Фиксируются `downX`, `downY`, `downTimeMs`, `spacebarWidthPx`.
3. `TRACKPAD_LOCKED` (уступаем Gboard) — переход из `ARMED_ON_SPACEBAR`, если:
   - удержание превысило порог (`elapsed >= min(ViewConfiguration.getLongPressTimeout(), 320ms)`) при смещении `|dx| < touchSlop`, либо сработал системный long-press пробела.
   - Обработчик полностью освобождает жест → работает штатный long-press cursor trackpad (`free_cursor`).
4. `CANCELLED_PASSTHROUGH` (уступаем Gboard) — при мультитаче (`ACTION_POINTER_DOWN`), доминировании вертикального сдвига (`|dy| > maxVerticalDriftPx` или `|dy| > |dx| * 0.65f` до горизонтального порога) или старте вне пробела (нулевой риск конфликта с Glide Typing).
5. `SWIPE_TRIGGERED` — переход из `ARMED_ON_SPACEBAR`, если:
   - `elapsed < longPressLockMs`;
   - `|dx| >= max(touchSlop * 1.5f, min(36dp, spacebarWidthPx * 0.22f))`;
   - `|dx| >= |dy| * 1.6f`;
   - `dx > 0` (слева направо) → **`NEXT_LANGUAGE`**;
   - `dx < 0` (справа налево) → **`PREVIOUS_LANGUAGE`**.
   - Действия: отмена запланированного long-press (`cancelScheduledLongPress`), поглощение/отмена события пробела (`ACTION_CANCEL` или возврат `true` в `GboardGestureFamilyComposer`), ровно **одно** переключение языка за жест.

- **Tap-to-space сохраняется полностью**: `ACTION_UP` в состоянии `ARMED_ON_SPACEBAR` ничего не поглощает.
- **Разрешение конфликта с `enable_scrub_move`**: при включённой опции «Свайп по пробелу для смены языка» программно подавляется только `enable_scrub_move` (в `GboardCursorTrackpadRuntime`), при этом `free_cursor` (long-press трекпад) остаётся активным — полностью повторяя эргономику Samsung Keyboard.

#### Слой B: Диспатч «Следующий / Предыдущий язык» (2+ языков)
1. **Подтверждено для «Следующий язык»**: событие `Lohe;` с keycode `-0x271b` (`-10011`) через `Lphr;->aw(Lohe;)Z`.
2. **Для двунаправленного циклического переключения 2+ языков (проверить на APK `18.5.4`)**:
   - **Предпочтительно (Вариант 1)**: найти внутренний менеджер `InputMethodEntry` Gboard, вызываемый обработчиком `-0x271b`, получить упорядоченный список включённых раскладок `N` и переключать на `(i + 1) % N` / `(i - 1 + N) % N`. Работает корректно даже когда все языки Gboard находятся внутри одного системного `InputMethodSubtype`.
   - **Вариант 2**: проверить наличие штатного keycode `SWITCH_TO_PREVIOUS_LANGUAGE` (`-0x271c`) рядом с `-0x271b` в `18.5.4`.
   - **Вариант 3 (только fallback)**: `InputMethodManager.getEnabledInputMethodSubtypeList` + `InputMethodService.switchInputMethod(id, subtype)`.
3. **Кнопка глобуса** (`-0x271b` / long-press `-0x2726`) и все штатные механизмы переключения полностью сохраняются.

---

## 6. Совместимость с оригинальным Gboard

- Целевой APK (`GboardTargetBuildCompiler.kt:424-433`, `patches-list.json:11`): `com.google.android.inputmethod.latin`, версия **`18.5.4.993608717-release-arm64-v8a`** (профиль `18.5.4`, `profile_version: 1.6.0`).
- **Оригинальный движок ввода полностью сохраняется**: автокоррекция, предиктивный ввод, подсказки слов, многоязычный ввод, словари, жестовый ввод, голосовой ввод, эмодзи, GIF, буфер обмена и настройки языков не подменяются и не переписываются.
- **Разграничение Rambler**:
  - В upstream уже присутствует `GboardRamblerOfficialSelectorPatch.kt` + `GboardRamblerOfficialSelectionRuntime.java` — это патч встроенного в Google Gboard **Agentic voice dictation (внутреннее имя Google: Rambler)** в `VoiceSettingsFragment` (`Lnca;->a`).
  - Это **не** Gemini-модуль Rambler из `vortexnode/GbSu`. Upstream-патч Rambler сохраняется нетронутым; интеграция функциональности из `GbSu` не планируется в рамках данного аудита без прямого доступа к `GbSu`.

---

## 7. Система сборки `.mpp`

### Требования и конфигурация
- **JDK:** 21 (Temurin 21, `.github/workflows/release.yml:32`).
- **Gradle Wrapper:** `gradle-9.6.1-bin.zip` (`gradle/wrapper/gradle-wrapper.properties`).
- **Плагин Morphe:** `app.morphe.patches:2.1.0` (`settings.gradle.kts:26`).
- **Репозитории:** `gradlePluginPortal()`, `google()`, `mavenCentral()`, `https://jitpack.io`, **`https://maven.pkg.github.com/MorpheApp/registry`** (требует аутентификацию `gpr.user`/`GITHUB_ACTOR` и `gpr.key`/`GITHUB_TOKEN` с правом `read:packages`).
- **Ключевые задачи:**
  - `:patches:buildAndroid` — компиляция `.rve` расширений, `GenerateTargetBindingsTask`, сборка **`.mpp`**.
  - `generatePatchesList` — обновление `patches-list.json`.
  - `:patches:test`, `:extensions:extension:testDebugUnitTest`, `:extensions:calculator:testDebugUnitTest` — 376 unit/Robolectric-тестов.
- **Выходной артефакт:** `patches/build/libs/patches-<version>.mpp` (текущая версия `4.3.0` в `gradle.properties`).

### Фактический результат проверки окружения (read-only запуск)
- `java -version`: **`OpenJDK 21.0.13 LTS (Temurin)`** — совместимо.
- `gradle --version`: системный **`Gradle 9.3.1`** (в wrapper прописан `9.6.1`; запуск `./gradlew` в контейнере не поддерживается).
- Переменные `GITHUB_TOKEN` и `GITHUB_ACTOR`: **не заданы**.
- Запуск `gradle tasks --console=plain` **завершился ошибкой на этапе разрешения плагина**:
  ```text
  Settings file '/app/applet/settings.gradle.kts' line: 26
  Plugin [id: 'app.morphe.patches', version: '2.1.0'] was not found in any of the following sources:
    GitHubPackages(https://maven.pkg.github.com/MorpheApp/registry)
  ```
- **Вывод:** локальная сборка `.mpp` в данном контейнере заблокирована отсутствием GitHub Packages токена (`read:packages`) для `MorpheApp/registry`. После предоставления учётных данных сборку необходимо перепроверить.

---

## 8. CI/CD (GitHub Actions)

### Существующие workflow
1. **`.github/workflows/release.yml`** (97 строк): триггер по тегам `v*` и `workflow_dispatch`; JDK 21; `./gradlew :patches:buildAndroid generatePatchesList`; требует секрет **`MORPHE_PACKAGES_TOKEN`**; проверяет совпадение URL в `patches-bundle.json` (строки 68–72); публикует GitHub Release (`patches-*.mpp`, `patches-list.json`, `patches-bundle.json`).
2. **`.github/workflows/import-upstream.yml`** (99 строк): ручной `workflow_dispatch`; копирует файлы из `jasonwu1994/Gboard-patches`, сохраняя `README.md`, `AGENTS.md`, `docs/`, `UPSTREAM_COMMIT.txt`; требует `GH_PAT` / `GITHUB_TOKEN`.
3. **`.github/workflows/custom-theme-previews-release.yml`** (77 строк): релиз архивов превью тем по тегам `custom-theme-previews-*`.

### Обнаруженные проблемы CI/CD
1. **Сломанный релизный гейт в `patches-bundle.json:4`**: указан upstream URL `https://github.com/jasonwu1994/Gboard-patches/releases/download/v4.3.0/patches-4.3.0.mpp`. В `vortexnode/GboardSamsung` проверка `release.yml:68-72` гарантированно упадёт до обновления URL.
2. **Upstream-идентификаторы в метаданных**: `patches/build.gradle.kts:198-201`, `extensions/extension/build.gradle.kts:99-105`, `Constants.kt:10-12` по-прежнему указывают на `jasonwu1994/Gboard-patches` (при обновлении обязательно сохранить GPL-3.0 и `NOTICE`).
3. **Нет PR/push CI-workflow**: отсутствует автоматический прогон тестов и сборки `.mpp` на Pull Request и push в `main`.
4. **Риск перезаписи в `import-upstream.yml`**: повторный запуск ручного импорта способен перезаписать downstream-изменения в `patches/` и `extensions/`.

---

## 9. Проблемы и риски

| Категория | Риск | Последствия | Митигация |
|---|---|---|---|
| **Привязка к версии Gboard** | Обфусцированные биндинги жёстко привязаны к `18.5.4.993608717-release-arm64-v8a`. | Обновление Gboard из Play Store ломает патчинг или reflection в рантайме. | Все новые патчи проводить через `gboard-port-product-catalog.json`, `gboard-version-bindings.json`, `RuntimeAbi.kt` и 4 Family Composers; отключать автообновление Gboard на устройстве. |
| **Конфликт жестов на пробеле** | Пересечение горизонтального свайпа с `enable_scrub_move`, `free_cursor` и `tap-to-space`. | Ложные пробелы, рывки курсора или потеря режима трекпада. | Детерминированная State Machine, автоматическое подавление `enable_scrub_move` при сохранении `free_cursor`, отмена long-press future, полное покрытие unit-тестами. |
| **API «предыдущий язык»** | В репо подтверждён только `-0x271b` (следующий язык). | Невозможность обратного переключения при 3+ языках. | Верификация обработчика `-0x271b` и `InputMethodEntry` на целевом APK `18.5.4` на Этапе 2. |
| **Android 16 (SDK 36) и One UI 8** | В `GboardFrostedGlassRuntime.java` зафиксирован `STOCK_STRIP_SDK = 36` (Gboard рисует полосу навигации сам); в One UI 8 — жестовая навигация Samsung, predictive back, политики blur. | Перехват свайпа системной навигацией Samsung, визуальные артефакты нижней полосы и blur. | Ограничение зоны старта свайпа внутри `SoftKeyView` пробела, учёт `WindowInsets` и `STOCK_STRIP_SDK = 36`, обязательная проверка на `SM-S901U1`. |
| **Визуальные правки и кэш** | Некорректные правки `LayoutParams` / некэшированное клонирование `SoftKeyDef`. | Поломка hit-testing, лаги при переключении раскладок. | Кэширование `SoftKeyDef` (`WeakHashMap`), изменение пропорций через `LinearLayout.LayoutParams.weight` и проверенные CSS-свойства темы. |
| **Сборка и CI без токена** | Нет `GITHUB_TOKEN` в контейнере; upstream URL в `patches-bundle.json`. | Нельзя собрать `.mpp` без токена; падение `release.yml`. | Настроить `MORPHE_PACKAGES_TOKEN` и `gpr.user`/`gpr.key`; починить `patches-bundle.json` и добавить PR CI на Этапе 1. |
| **Шрифты** | Не подтверждено в кодовой базе. | Мерцание или сброс шрифта при ребинде клавиш. | Вынести в отдельный исследовательский этап после проверки `SoftKeyView` в `18.5.4`. |

---

## 10. Поэтапный план разработки

### Этап 1. Downstream-инфраструктура, CI и воспроизводимая сборка `.mpp`
- **Файлы:** `README.md`, `patches-bundle.json`, `patches/build.gradle.kts`, `extensions/extension/build.gradle.kts`, `patches/src/main/kotlin/.../shared/Constants.kt`, новый `.github/workflows/ci.yml`.
- **Изменения:** актуализировать `README.md`; исправить `download_url` в `patches-bundle.json` под `vortexnode/GboardSamsung` (с сохранением GPL-3.0/`NOTICE`); добавить PR/push CI; проверить `MORPHE_PACKAGES_TOKEN` и сборку `.mpp`.
- **Критерии:** зелёный CI, 376/376 тестов проходят, собираются `patches-*.mpp` и `patches-list.json`.

### Этап 2. Верификация биндингов Gboard `18.5.4` (вне коммита APK)
- **Файлы:** `gboard-version-bindings.json`, `gboard-port-product-catalog.json`.
- **Изменения:** проверить на APK `18.5.4.993608717-release-arm64-v8a` обработчик `-0x271b`, наличие `-0x271c` и менеджер `InputMethodEntry`; зафиксировать реальные CSS-переменные тем `18.5.4`; проверить поля `TextView` в `SoftKeyView` для шрифтов.
- **Критерии:** новые биндинги проходят `GenerateTargetBindingsTask` и тесты `patches/src/test`.

### Этап 3. Двунаправленное переключение языка свайпом по пробелу
- **Новые файлы:**
  - `extensions/extension/src/main/java/dev/jason/gboardpatches/extension/spacebarswipe/`: `GboardSpacebarLanguageSwipePolicy.java`, `GboardSpacebarLanguageSwipeStateMachine.java`, `GboardSpacebarLanguageSwipeSettings.java`, `GboardSpacebarLanguageSwipeSettingsFeature.java`, `GboardSpacebarLanguageSwipeRuntime.java`, `GboardSpacebarLanguageSwitchDispatcher.java`.
  - `patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/spacebarswipe/GboardSpacebarLanguageSwipePatch.kt`.
- **Изменения в существующих файлах:** подключение в `GboardPointerOwnerTransformation.kt` / `GboardGestureFamilyComposer.kt` (или `KeyboardViewHolder.dispatchTouchEvent`), `GboardCursorTrackpadRuntime.java` (подавление только `enable_scrub_move` с сохранением `free_cursor`), `RuntimeAbi.kt`, `gboard-port-product-catalog.json`, `GboardContributionWiring.kt`, `GboardPatchRegistry.kt`, `GboardKeyboardLayoutSettingsGroupFeature.java`.
- **Критерии:** unit-тесты на все переходы State Machine (tap, L→R, R→L, 2/3/4 языка, вертикальный дрейф, мультитач, long-press trackpad, glide typing) + Robolectric-тесты настроек и Direct Boot.

### Этап 4. Индикатор языка на пробеле в стиле Samsung One UI
- **Файлы:** `GboardSpacebarLogoRuntime.java`, `GboardSpacebarLogoAdapter.java`, `GboardSpacebarLogoSettings.java` (или отдельный `GboardSamsungSpacebarStyleRuntime.java`).
- **Изменения:** отображение языка со стрелками `‹ Язык ›` при наличии ≥ 2 языков с сохранением существующих режимов логотипа.
- **Критерии:** Robolectric-тесты биндинга `0x7f0b05b5` / `0x7f0b05f5` для 1 и 2+ языков.

### Этап 5. Базовый пакет тем Samsung One UI (Light / Dark / AMOLED / Material You)
- **Файлы:** `patches/src/main/resources/samsung-theme-assets/` (оригинальные ассеты без проприетарных файлов), `GboardCustomThemeInstaller.java`, новый `GboardSamsungThemePresetFeature.java`.
- **Изменения:** палитры, мягкие прямоугольные клавиши, границы, функциональные клавиши, тулбар, экраны эмодзи и символов средствами стандартного Gboard theme ZIP.
- **Критерии:** валидация архивов по `GboardThemeImportContract` и `Lrnw;->h(File)Z`, Robolectric-тесты установки пресетов.

### Этап 6. Геометрия, нижний ряд, скругления, тулбар и пропорции One UI
- **Файлы:** новый пакет `extensions/extension/.../samsunglayout/` (`GboardLatinBottomRowWeightRuntime.java`, `GboardSamsungLayoutPresetSettings.java`, `GboardSamsungLayoutSettingsFeature.java`), интеграция с `GboardRoundedKeyboardRuntime`, `GboardAccessPointCountRuntime`, `GboardEmojiSizeRuntime`, `GboardFrostedGlassRuntime`.
- **Изменения:** веса клавиш нижнего ряда для Latin/Cyrillic, пресет тулбара One UI, совместимость с `STOCK_STRIP_SDK = 36`.
- **Критерии:** Robolectric-тесты пересчёта `LayoutParams.weight` с глобусом и без, проверка hit-targets.

### Этап 7. Вторичные и long-press символы в стиле Samsung Keyboard
- **Файлы:** новый пакет `extensions/extension/.../samsungsymbols/` (`GboardSamsungSymbolsMapping.java`, `GboardSamsungSymbolsSoftKeyRuntime.java`, `GboardSamsungSymbolsSettings.java`) + подключение в `GboardSoftKeyFamilyComposer.kt`.
- **Изменения:** опциональная карта дополнительных/long-press символов QWERTY/ЙЦУКЕН через кэшированное клонирование `SoftKeyDef` без конфликтов с `GboardAddSymbolsSoftKeyRuntime` и `GboardLongPressQuickActionsRuntime`.
- **Критерии:** unit-тесты маппинга и отсутствия конфликтов с существующими softkey-патчами.

### Этап 8. Исследование и опциональная поддержка шрифтов
- **Файлы:** `extensions/extension/.../samsungfont/` (только после положительной верификации `SoftKeyView` на Этапе 2).
- **Изменения:** кэшированный `Typeface` в post-bind `GboardSoftKeyFamilyComposer` с fallback.
- **Критерии:** отсутствие мерцания, корректная кириллица/латиница/диакритика, стабильный FPS.

### Этап 9. Интеграционная сборка `.mpp` и приёмка на Samsung Galaxy S22
- **Изменения:** финальная сборка `.mpp` через CI (`:patches:buildAndroid generatePatchesList`), патчинг Gboard `18.5.4.993608717-release-arm64-v8a` через Morphe, полный прогон матрицы из раздела 11.
- **Критерии:** 100% прохождение матрицы без исключений `GboardPatches` в `logcat` и без регрессий оригинального Gboard.

---

## 11. Матрица тестирования для Samsung Galaxy S22 (`SM-S901U1`, Android 16, One UI 8)

| № | Категория | Сценарий проверки | Ожидаемый результат |
|---|---|---|---|
| 1 | **Установка и патч** | Патчинг Gboard `18.5.4.993608717-release-arm64-v8a` собранным `.mpp` через Morphe, установка и активация в One UI 8 | Нет ошибок DEX/ABI; клавиатура работает после перезагрузки и в режиме Direct Boot |
| 2 | **Пробел: Tap** | Быстрое нажатие, двойной пробел (точка + пробел) в портрете и ландшафте | Мгновенный пробел без задержки и ложной смены языка |
| 3 | **Пробел: Свайп (2 языка)** | EN ↔ RU: L→R (следующий), R→L (предыдущий) | 1 свайп = 1 смена языка, без лишнего пробела и без сдвига курсора |
| 4 | **Пробел: Свайп (3+ языка)** | EN ↔ RU ↔ UK/DE (3–4 языка): свайпы в обе стороны через границу списка | Корректный циклический обход `(i+1)%N` и `(i-1+N)%N` |
| 5 | **Пробел: Трекпад** | Удержание пробела (long-press) + движение пальца по осям X/Y | Активируется `free_cursor` трекпад, курсор двигается, язык НЕ переключается |
| 6 | **Glide Typing** | Жестовый ввод слов, проходящих рядом с пробелом (`b`, `v`, `n`, `m`) | Слово вводится корректно, язык НЕ переключается |
| 7 | **Кнопка глобуса** | Короткое и длительное нажатие глобуса | Короткое — следующий язык; длительное — диалог выбора языка |
| 8 | **Базовые функции Gboard** | Автокоррекция, подсказки, двуязычный ввод, голос, эмодзи, GIF, буфер обмена, словари, настройки языков | Работают полностью идентично оригинальному Gboard |
| 9 | **Внешний вид One UI** | Light / Dark / AMOLED темы, смена системной темы One UI 8, скругления, нижний ряд, цифровой ряд, тулбар, экран эмодзи/символов | Чёткие пропорции и палитра, без обрезания символов и наложения элементов |
| 10 | **One UI 8 / Android 16** | Жестовая навигация Samsung (с полосой и без), 3-кнопочная навигация, кнопка скрытия клавиатуры, Frosted Glass blur, Split Screen / Pop-up View | Нет конфликта с нижним системным свайпом, корректный `STOCK_STRIP_SDK = 36` фон навигации, нет мерцания и крашей |
| 11 | **Регрессия upstream** | Калькулятор, Top-Row Swipe, Long-Press Quick Actions, Custom Theme Import, Frosted Glass, Rounded Keyboard, Rambler selector | Все upstream-фичи работают без регрессий |
