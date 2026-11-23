# GboardSamsung — Samsung One UI 8 Keyboard Appearance: Финальный технический аудит перед реализацией (Audit v3.1)

> **Уточнённая редакция технического аудита v3 (v3.1). Учитывает окончательные решения пользователя по отдельной настройке шевронов переключения языка, адаптивности их отображения и уточнению структуры Access Point Count. Исходный код проекта в рамках данного обновления не изменялся.**

**Проект:** [vortexnode/GboardSamsung](https://github.com/vortexnode/GboardSamsung)  
**Подтверждённая стабильная версия у пользователя на устройстве:** `v4.4.2` *(собрана, опубликована, автоматически получена Morphe Patchery и проверена пользователем на реальном смартфоне)*  
**Состояние метаданных репозитория на диске:** `v4.4.4` *(наличие более новых версий/коммитов в репозитории не означает, что пользователь установил их на устройство)*  
**Целевая версия Gboard:** `18.5.4.993608717-release-arm64-v8a` (профиль привязок `gboard-version-bindings.v1`, `profile_version: 1.6.0`)  
**Целевое устройство тестирования:** Samsung Galaxy S22 5G (`SM-S901U1`), Android 16 (API 36), One UI 8, без root, установка через Morphe  
**Статус документа:** Строго исследовательский аудит v3.1 (исходный код, ресурсы, Gradle, CI/CD, PR, релизы, MPP, commit и push **не затрагивались**)  
**Связанные предыдущие отчёты (сохранены без изменений):** `samsung-keyboard-appearance-audit.md` (v1), `samsung-keyboard-appearance-audit-v2.md` / `.pdf` (v2)  
**Целевые файлы публикации:**  
- Markdown: [docs/reports/samsung-keyboard-appearance-audit-v3.md](https://github.com/vortexnode/GboardSamsung/blob/main/docs/reports/samsung-keyboard-appearance-audit-v3.md)  
- PDF: [docs/reports/samsung-keyboard-appearance-audit-v3.pdf](https://github.com/vortexnode/GboardSamsung/blob/main/docs/reports/samsung-keyboard-appearance-audit-v3.pdf)

---

## Иерархия приоритетов и стандарт доказательности аудита

Все архитектурные решения и оценки рисков в этом отчёте подчинены строгому порядку приоритетов:

1. **Сохранение полной работоспособности Gboard** (ноль крашей, ноль регрессий Direct Boot, ноль потери пользовательских настроек).
2. **Сохранение оригинальной логики клавиш, жестов и обработки касаний** (тап, свайп-набор, подсказки, буфер обмена, голосовой ввод Rambler, эмодзи, Action Keys, режимы Floating/Split/One-handed, переключение языков).
3. **Совместимость с существующими функциями и настройками GboardSamsung** (`Custom Theme`, `Frosted Glass`, `Rounded Keyboard Panel`, `Samsung Spacebar Gestures`, `Swipe Down to Dismiss Keyboard`, `Access Point Count`, `Access Points Menu`, `Editing Access Points`, `Key Shape Selection`, `Package Rename`, `Backup & Restore`).
4. **Отсутствие конфликтов с Morphe и другими расширениями**, а также корректность на целевой версии `Gboard 18.5.4`.
5. **Визуальное сходство с Samsung Keyboard / One UI 8** — исключительно в рамках безопасных, проверяемых и обратимых механизмов.

### Стандарт разделения фактов и гипотез

В каждом техническом утверждении отчёта строго различаются четыре уровня доказательности:
- **[Подтверждено исходниками]** — прямо проверено по файлам репозитория `vortexnode/GboardSamsung`.
- **[Сторонние темы / CSS]** — встречается в сторонних ZIP-темах сообщества (`PackRepoBeta` `4a8187db`), но **не доказано** для `Gboard 18.5.4`.
- **[Архитектурное предположение]** — инженерный вывод или кандидат реализации, не проверенный в рантайме `18.5.4`.
- **[Требует проверки на устройстве]** — невозможно доказать статически без эксперимента на Galaxy S22 5G (`Gboard 18.5.4`).

> **Важное методологическое правило:** наличие `try/catch`, проверок `null`, `WeakHashMap` или `isUserUnlocked()` **само по себе не доказывает безопасность архитектуры**. Для каждого механизма дополнительно оцениваются последствия частичного выполнения, повторного входа, переиспользования View, смены системной конфигурации, перезагрузки и восстановления состояния.

---

## 1. Executive Summary

### Краткий вывод

Приблизить внешний вид **GboardSamsung** на `Gboard 18.5.4` (Samsung Galaxy S22 5G, Android 16 / One UI 8, без root) к **Samsung Keyboard / One UI 8** при сохранении оригинального движка Gboard, иконок Google, обработчиков касаний, жестов и стабильности подтверждённой базы `v4.4.2` **технически возможно**, но **только небольшими независимыми этапами**, начиная с чистых CSS ZIP-тем через штатный импорт `Custom Theme` без каких-либо изменений runtime.

### Ключевые уточнения редакции v3.1 (по сравнению с v3)

1. **Шевроны переключения языка на пробеле (`‹ Русский ›`) вынесены в полностью самостоятельную функцию (Уточнение №1):**
   - Шевроны **НЕ являются частью** Samsung Keyboard Appearance и **не включаются автоматически** при выборе Samsung-темы.
   - Окончательное название настройки: **«Шевроны переключения языка на пробеле»** (EN: *Spacebar language switch chevrons*), выключена по умолчанию.
   - **[Подтверждено исходниками]** В проекте уже существует отдельный экран настроек `GboardLanguageSettingsFeature` (**«Язык»** → секция **«Переключение языка»**), содержащий независимые переключатели `Переключение языка свайпом по пробелу` и `Скрыть клавишу переключения языка`. Новая настройка логично размещается **третьим независимым переключателем внутри этой существующей секции**, без создания нового раздела и без дублирования.
   - **[Архитектурное предположение / Требует проверки на устройстве]** `ViewOverlay` поверх `SoftKeyView` остаётся наиболее безопасным пассивным кандидатом (0 вмешательства в `MotionEvent`, hit-testing и геометрию), но **не считается готовым доказанным решением**: выполнен полный 11-пунктный анализ рисков (`SoftKeyView` lifecycle, recycling, «призраки» на других клавишах, bounds при ресайзе, очистка при скрытии/пересоздании IME, Floating/Split/One-handed, адаптация цвета к Custom Theme и Dynamic Color). Если на устройстве выявятся артефакты или нестабильность — функцию следует отложить, а не переходить к опасным обходам.
2. **Устранена неоднозначность вокруг `Access Point Count` (Уточнение №2):**
   - **[Подтверждено исходниками]** Прослежена полная цепочка: `GboardAccessPointCountSettingsFeature` (`.setRestartRequired`) → `GboardAccessPointCountSettings` (`3..8`, по умолчанию `6`) → `GboardAccessPointCountPolicy` → `GboardAccessPointCountRuntime` → `GboardFlagFamilyComposer` (переопределяет **ровно два** `Long`-флага: `config_max_access_points` и `config_default_access_points_num_on_bar`).
   - **[Подтверждено исходниками]** Пользовательские Access Points (`Manual Incognito`, `Floating Web Search`, `Editing Access Points`) регистрируются через `GboardAccessPointContributionsRuntime` в тот же каталог (`Lmvg;->m`, `Lmwv;`, `Lmwg;`, `Lwpa;`, `mtr`/`mtm`), что и системные AP. Кнопка **Rambler** (`GboardRamblerStockPolicy`, `GboardRamblerResetHeader`) полностью отделена по флагам и жизненному циклу и **не проходит** через `Access Point Count` или `GboardAccessPointContributionsRuntime`.
   - **[Исправление противоречия v3]** На реальном скриншоте пользователя (`Screenshot_20261121_205256_ChatGPT.jpg`) видны **8 элементов перед отдельной кнопкой Rambler** (левая иконка меню/сетки `⊞` + 7 инструментов), а 9-м элементом справа стоит Rambler с нативной круглой подложкой. В v3 было преждевременно указано, будто подтверждено, что `Access Point Count = 8` включает кнопку меню `⊞`. В v3.1 прямо зафиксировано: **по исходникам репозитория невозможно однозначно доказать**, включает ли число `config_max_access_points` / `config_default_access_points_num_on_bar` кнопку меню `⊞` или считает только обычные Access Points (так как логика компоновки слотов находится в закрытом коде Gboard `18.5.4`). Подготовлен безопасный эксперимент на устройстве (**V9**) для значений `3`, `6` и `8`.
3. **Критическое уточнение по автоматическому переключению Light/Dark (`additional_keyboard_theme`):**
   - **[Подтверждено исходниками]** Существующая галерея `GboardCustomThemeGalleryView.handleCommittedInstall()` после записи `additional_keyboard_theme` и `enable_key_border` в DE `SharedPreferences` **вызывает принудительный холодный перезапуск процесса Gboard** (`requestTargetRestart()` → `coldRestartGboard()` → `System.exit(0)`). В то же время штатный импорт в `ThemeListingFragment` (`GboardCustomThemeOfficialImportRuntime`) передаёт имя файла через `Lkhl;->i(Intent)V`.
   - Следовательно, **в репозитории нет никаких доказательств**, что Gboard `18.5.4` подхватывает смену `additional_keyboard_theme` «на лету» без перезапуска процесса или хотя бы при следующем `onStartInputView`. Вызывать `System.exit(0)` из активной IME-сессии недопустимо; реальное поведение `18.5.4` обязательно проверяется в эксперименте **V7**.
4. **Круглые подложки Access Points — строго необязательный эксперимент последнего приоритета:**
   - Вынесены в самый конец плана (Шаг 7). Без безопасного способа (предпочтительно CSS) детерминированно отличать типы элементов (обычные AP vs кнопка меню `⊞` vs Rambler vs полоса подсказок) без привязки к индексам и позициям — **от круглых подложек следует отказаться**.

### Сводная карта зрелости подсистем (редакция v3.1)

| Подсистема | Базовый механизм | Доказательность до теста на S22 | Уровень риска |
| --- | --- | --- | --- |
| Оформление фона и клавиш (Samsung Light / Dark) | ZIP/CSS-темы (`metadata.json` + CSS) через штатный `Custom Theme` | Механизм установки/валидации подтверждён; рендер CSS-свойств в `18.5.4` не проверен | Средний |
| Форма клавиш (6–8 dp) и `Key Shape Selection` | CSS + сохранение нетронутого патча `more_pill_keys` | Флаг `more_pill_keys` подтверждён; приоритет CSS над pill-геометрией `18.5.4` не проверен | Средний |
| Вторичные символы | Оригинальная карта Gboard; только безопасная CSS-стилизация | Исходная логика не затрагивается; читаемость `.label.secondary` требует проверки | Низкий / Средний |
| Шевроны пробела (`‹ Русский ›`) — **отдельная настройка** | Кандидат: пассивный `Drawable` в `ViewOverlay` из `SoftKeyView.s(...)` (или отложение) | Точка хука и `KEYCODE_SPACE` подтверждены; `ViewOverlay` bounds/recycling/color в `18.5.4` не доказаны | Средний / Высокий |
| Фон и цвета иконок верхнего тулбара | CSS (`.keyboard-header-area` + проверенные селекторы) | Тег `.keyboard-header-area` подтверждён; CSS-селекторы иконок и кандидатов не проверены | Средний |
| Авто-переключение Light/Dark + Backup/Restore | `Configuration.UI_MODE_NIGHT_MASK` в `Lphr;` + DE/CE snapshot + ownership | Точки `Lphr;` подтверждены; перечитывание `additional_keyboard_theme` без `System.exit(0)` не доказано | Средний / Высокий |
| Круглые подложки 3–8 Access Points (необязательно) | Только если есть безопасный механизм различения типов без индексов | Иерархия слотов `18.5.4`, формула `Access Point Count` и плотность 8+1 не подтверждены | Высокий |
| Кнопка голосового ввода Rambler | **Не модифицировать / явно исключить** | Архитектурно отделена, уже имеет нативный круг; внутренний View/CSS в `18.5.4` неизвестен | Высокий |

**Итоговый вердикт раздела 1:** **Можно реализовывать после проверки на устройстве**

---

## 2. Что подтверждено исходным кодом

Все факты ниже получены прямым чтением исходного кода репозитория `vortexnode/GboardSamsung` (`patches/` и `extensions/extension/`), без предположений.

### 2.1. Установка, валидация, активация и перезапуск при смене ZIP-тем

- **`extensions/extension/src/main/java/dev/jason/gboardpatches/extension/customtheme/GboardCustomThemeInstaller.java`**:
  - Строки 38, 118, 126: временный staging-файл `.gboard_patches_theme_<uuid>.part`, поиск дубликатов (`user_theme_*` по размеру и SHA-256) и финальный `atomicCommit` выполняются в **`context.getFilesDir()` (CE-хранилище)**.
  - Строки 43, 76–109: проверка ZIP-безопасности по `GboardThemeImportContract` (лимит числа записей, запрет path traversal, коэффициент сжатия `<= 100x`, лимиты распакованного размера, обязательное наличие корневого `metadata.json`).
  - Строки 44, 111–113: валидация архива нативным методом Gboard через `GboardCustomThemeTargetContract.validateThemeArchive(context, staging)`.
  - Строки 63–74: активация темы выполняется синхронным `.commit()` в **DE-хранилище**:
    - `Context storage = context.createDeviceProtectedStorageContext();`
    - `SharedPreferences preferences = storage.getSharedPreferences(context.getPackageName() + "_preferences", Context.MODE_PRIVATE);`
    - `putString("additional_keyboard_theme", "files:" + committed.getName())`
    - `putBoolean("enable_key_border", keyBorder)`
- **`extensions/extension/src/main/java/dev/jason/gboardpatches/extension/customtheme/GboardCustomThemeGalleryView.java` (строки 132–133, 471–496)** и **`GboardPatchesSettingsActivity.java` (строки 1313–1320, 2441–2478)**:
  - После успешного вызова `GboardCustomThemeInstaller.install(...)` галерея **принудительно запрашивает холодный перезапуск процесса Gboard**: `GboardPatchesSettingsContract.requestTargetRestart(host)` → `requestGboardRestart()` → `GboardRestartCrashRecoveryGuard.prepare(...)` → `coldRestartGboard(...)` → `Intent.makeRestartActivityTask(...)` + `System.exit(0)`.
  - Это подтверждает, что существующая галерея `Custom Theme` **не полагается** на автоматическое «живое» перечитывание `additional_keyboard_theme` без перезапуска процесса!
- **`extensions/extension/src/main/java/dev/jason/gboardpatches/extension/customtheme/GboardCustomThemeOfficialImportRuntime.java` (строки 15, 21–92)**:
  - Перехватывает нажатие «+» в штатном `ThemeListingFragment`, позволяет выбрать фото или ZIP, а после импорта вызывает `GboardCustomThemeTargetContract.deliverImportedTheme(peer, intent)` → `Lkhl;->i(Intent)V` с `intent_extra_key_new_theme_file_name`. Это путь штатного экрана тем Gboard, а не фоновый IME-сервис.
- **`extensions/extension/src/main/java/dev/jason/gboardpatches/extension/customtheme/GboardCustomThemeTargetContract.java` (строки 69–80)**:
  - Вызывает статический валидатор `Lrnw;->h(Ljava/io/File;)Z` (профиль `18.5.4`).

### 2.2. Структура настроек GboardSamsung и хранилище Direct Boot

- **`extensions/extension/src/main/java/dev/jason/gboardpatches/extension/settings/GboardPatchesSettings.java`**:
  - Строки 11, 21–28: все настройки патчей хранятся в `gboard_patches_settings` в **CE-хранилище**.
  - Строки 55–89: `preferencesOrNull(context)` и `readRuntimeSetting(...)` проверяют `isUserUnlocked(context)` (`UserManager.isUserUnlocked()`), возвращая `null` / `fallback` до разблокировки.
- **`extensions/extension/src/main/java/dev/jason/gboardpatches/extension/settings/GboardPatchesSettingsFeatureRegistry.java` (строки 34–43)**:
  - Главный экран настроек `Patches` содержит 7 верхнеуровневых пунктов в строгом порядке:
    1. `GboardAiVoiceSettingsGroupFeature` («ИИ и голосовой ввод»)
    2. **`GboardLanguageSettingsFeature` («Язык»)** — отдельный верхнеуровневый экран!
    3. `GboardLanguageModelSettingsFeature` («Словари и подсказки»)
    4. `GboardKeyboardToolsSettingsGroupFeature` («Инструменты и сочетания»)
    5. `GboardKeyboardLayoutSettingsGroupFeature` («Клавиши, макет и символы» — внутри: `Dismiss Suggestions`, `Symbol Footer`, `Emoji Size`, `Access Points Menu`, `Split Keyboard`, `Rounded Keyboard`, `Top Toolbar Item Count`, `Custom Theme`, `Frosted Glass`)
    6. `GboardClipboardSettingsFeature` («Буфер обмена»)
    7. `GboardMoreSettingsGroupFeature` («Дополнительно»)
- **`extensions/extension/src/main/java/dev/jason/gboardpatches/extension/spacebargesture/GboardLanguageSettingsFeature.java` (строки 15–126)** и **`GboardSpacebarGestureSettings.java` (строки 14–103)**:
  - Экран **«Язык»** (`gboard_patches_language_settings_title`) имеет ровно одну секцию **«Переключение языка»** (`gboard_patches_language_settings_section`) с двумя независимыми переключателями:
    1. `Переключение языка свайпом по пробелу` (`pref_spacebar_language_swipe_enabled`, по умолчанию `true`);
    2. `Скрыть клавишу переключения языка` (`pref_hide_language_switch_key`, по умолчанию `false`, при изменении немедленно вызывает `GboardSpacebarGlobeKeyRuntime.onHidePreferenceChanged(hidden)`).
  - Обе настройки кэшируются с `CACHE_TTL_MS = 1000L` и читаются через `GboardPatchesSettings.readRuntimeSetting(...)`.
  - Поисковый индекс настроек хранится в генерируемом `GboardSettingsSearchIndexData.java` (строки 19, 90–92).

### 2.3. View-теги Gboard, Frosted Glass, Rounded Keyboard и Key Shape Selection

- **`extensions/extension/src/main/java/dev/jason/gboardpatches/extension/frostedglass/GboardFrostedGlassRuntime.java`**:
  - Строки 47–49, 1140–1155, 1259–1265: подтверждены живые строковые `View.getTag()` в `Gboard 18.5.4`:
    - Поверхности: `.keyboard-base-area`, `.keyboard-base-area.keyboard-outline`, `.keyboard-header-area`, `.keyboard-body-area`, `.candidates-area`.
    - Клавиши: `.keytop`, `.keytop.*`, `.space_bar`, `.space_bar.*`.
    - Action Key: `.background-icon.for-action-key` и `.background-icon.for-action-key.*` (в строке 1071 прямо отмечено, что заливка Action Key может быть отдельным `ImageView.getDrawable()`, а не `view.getBackground()`).
    - Исключения: `.for-candidate-key`.
  - Строки 64, 79–180: жизненный цикл IME перехвачен через `Lphr;` (`onConfigureWindow`, `onWindowShown`, `onWindowHidden`); нижняя полоса навигации на Android 16 (`STOCK_STRIP_SDK = 36`) окрашивается Gboard внутри `InputView` через `Lrra;->f(Window, Lrqz;)`.
- **`extensions/extension/src/main/java/dev/jason/gboardpatches/extension/roundedkeyboard/GboardRoundedKeyboardRuntime.java`**:
  - Переопределяет радиусы **только** для `.keyboard-base-area.keyboard-outline` и `.keyboard-body-area.keyboard-outline-bottom.clip-to-outline-for-old-android` через `Lrnb;->b(String, List)`. На радиусы отдельных клавиш не влияет.
- **`extensions/extension/src/main/java/dev/jason/gboardpatches/extension/featureflags/GboardFeatureFlagsRuntime.java` (строки 20–21, 65–71)** и **`GboardFlagFamilyComposer.kt` (строки 51–55)**:
  - Патч **`Key Shape Selection`** работает исключительно через композитор флагов (`compositionOrder = 40`): когда Gboard запрашивает boolean-флаг `"more_pill_keys"` и сток возвращает `Boolean.FALSE`, runtime возвращает `Boolean.TRUE` (если маркер фичи `FEATURE_KEY_SHAPE_SELECTION` включён). Это открывает в штатных настройках Gboard («Тема» → детали темы) выбор формы клавиш. Патч не имеет собственного runtime-перехвата отрисовки View.

### 2.4. Пробел, SoftKeyView и жесты пробела

- **`patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/shared/GboardSoftKeyFamilyComposer.kt` (строки 21–52, 204–234, 259–290)**:
  - Компонует хуки вокруг `SoftKeyView.s(SoftKeyDef, long)Z` (`soft_key_bind`, confidence `0.99`, проверенная форма `18.5.4`: `registerCount == 8`, `returnInstructionIndices().size == 2`, `tryBlocks.isNotEmpty()`, `SoftKeyView.setSoftKeyDef` trace marker, запись `f:J`, чтение `e:SoftKeyDef`).
  - `after_stock` вставляет вызовы **перед каждым нормальным `return`** метода `SoftKeyView.s(...)`. Сейчас там один участник — `SAMSUNG_SPACEBAR_GESTURES` (`afterOrder = 900`, `GboardSpacebarGlobeKeyRuntime.afterSoftKeyBind(View)`).
- **`extensions/extension/src/main/java/dev/jason/gboardpatches/extension/spacebargesture/GboardSpacebarGlobeKeyRuntime.java`**:
  - Использует `WeakHashMap<View, Integer>` (`TRACKED_GLOBE_VIEWS`) и при каждом `afterSoftKeyBind` проверяет, не переназначен ли слот другой клавише, чтобы восстановить исходную видимость переиспользованного `SoftKeyView`.
- **`extensions/extension/src/main/java/dev/jason/gboardpatches/extension/spacebargesture/GboardSpacebarKeyHitTester.java` (строки 48–75, 148–187)**:
  - Читает primary `PRESS` keycode напрямую из `SoftKeyView.e` (`SoftKeyDef`) → `SoftKeyDef.g(qae.PRESS)` (`ActionDef`) → `ActionDef.f[0]` (`qbc`) → `qbc.c == KeyEvent.KEYCODE_SPACE (62)`. Не опирается на layout ID.

### 2.5. Верхний тулбар: Access Point Count, Contributions, Menu и Rambler

- **`GboardAccessPointCountSettings.java` / `GboardAccessPointCountPolicy.java` / `GboardAccessPointCountRuntime.java` / `GboardAccessPointCountSettingsFeature.java` / `GboardAccessPointCountFlagValuePatch.kt` / `GboardFlagFamilyComposer.kt` (строки 96–100)**:
  - Подтверждённая цепочка: пользователь задаёт `PREF_KEY_ENABLED` (по умолчанию `false`) и `PREF_KEY_COUNT` (`3..8`, по умолчанию `6`), обе настройки помечены `.setRestartRequired(...)`. В рантайме `GboardFlagFamilyComposer` (`order = 1300`) на выходе `Loki;->g()Object` вызывает `GboardAccessPointCountRuntime.applyFlagValue(flagName, stockResult)`, который при `enabled == true` и `stockResult instanceof Long` заменяет значения **ровно двух флагов** — `config_max_access_points` и `config_default_access_points_num_on_bar` — на `Long.valueOf(settings.count)`. Никаких других хуков в макете тулбара этот патч не ставит.
- **`GboardAccessPointContributionsRuntime.java` / `GboardAccessPointContributionsPatch.kt` / `GboardEditingAccessPointsContribution.java`**:
  - Хукает `Lmvg;->m(...)` (каталог токенов порядка `Lwpa;`, `Set<String>`) и `Lmwv;-><init>(Context, Lmyc;)V` (контроллер AP, синхронизация `mwv.g` (`Lmwg;`) → `mwg.c` (`Lwpa;`)).
  - Регистрирует пользовательские AP (`Manual Incognito`, `Floating Web Search`, `Editing Access Points`: `Select All`, `Copy`, `Cut`, `Paste`) через `mtr.c()` → `mtm` → `mwv.g(descriptor, false)` как обычные перетаскиваемые Access Points.
- **`GboardAccessPointsMenuRuntime.java` / `GboardAccessPointsMenuPatch.kt`**:
  - Управляет флагом `enable_access_points_menu_redesign`, выбором body/layout (`0x7f0b070c` / `0x7f0b070d`, `0x7f0e062e` / `0x7f0e01aa`) и `AccessPointDragPopupView` (`prepareDrag`, `completeDrag`, `rollbackDrag`, `dragMode`, `dragScale`). Не читает `config_max_access_points`.
- **`GboardRamblerStockPolicy.java` / `GboardRamblerOfficialSelectorPatch.kt` / `GboardRamblerResetHeader.kt`**:
  - Отдельные флаги (`enable_agentic_dictation`, `enable_rambler_al_toolbar`, `enable_rambler_toolbar_at_cursor_position`, `filter_rambler_contributed_input_view_session`, `show_rambler_dict_settings`, `ad_activation_type = 2L`) и 5 жёстких SHA-256 отпечатков голосового заголовка (`Lflb;`, `Lfkl;`, `Lfkm;`, `Les;`, `Lflz;`, `Lkaf;`).

**Итоговый вердикт раздела 2:** **Можно реализовывать безопасно** *(имеется в виду опора на перечисленные подтверждённые факты исходного кода).*

---

## 3. Что подтверждено реальными ZIP/CSS темами

В ходе анализа сторонних ZIP-тем Gboard (закреплённая ревизия каталога `PackRepoBeta` `4a8187db`: `3D_Black.zip`, `3D_Ios.zip`, `google_blue_dark_port.zip`) изучен фактический формат пользовательских ZIP/CSS-тем, используемый сообществом.

> **Критическое ограничение доказательности:** присутствие свойства или селектора в стороннем ZIP-архиве **подтверждает лишь синтаксис формата тем Gboard в прошлых/общих сборках**, но **НЕ доказывает** его поддержку, приоритет над Material 3 (`more_pill_keys`) или корректный рендеринг в `Gboard 18.5.4` на Android 16 / One UI 8.

### 3.1. Структура архива ZIP-темы (сторонние эталоны `PackRepoBeta` `4a8187db`)

- Корневой `metadata.json`:
  - `format_version: 3`, `id`, `name`
  - `is_light_theme: true | false`
  - `prefer_key_border: true | false`, `lock_key_border: true | false`
  - `style_sheets`: список базовых CSS-файлов (например, `["style_sheet_base.css"]`)
  - `flavors`: условные оверлеи, например `{ "type": "BORDER", "style_sheets": ["style_sheet_border.css"] }`
- CSS-файлы с переменными (`@def color_... #RRGGBB;`) и правилами для селекторов.

### 3.2. Строгая четырёхкатегорийная классификация CSS-свойств и селекторов

| Категория | Свойства / селекторы | Источник / основание классификации |
| --- | --- | --- |
| **1. Подтверждено исходниками для Gboard `18.5.4`** | View-теги поверхностей и клавиш: `.keyboard-base-area`, `.keyboard-base-area.keyboard-outline`, `.keyboard-header-area`, `.keyboard-body-area`, `.candidates-area`, `.keytop`, `.space_bar`, `.background-icon.for-action-key`, `.for-candidate-key`; панельные радиусы `Lrnb;->b(String, List)` для `.keyboard-base-area.keyboard-outline` и `.keyboard-body-area.keyboard-outline-bottom.clip-to-outline-for-old-android`; валидатор архивов `Lrnw;->h(File)Z`. | Прямой исходный код `GboardFrostedGlassRuntime.java`, `GboardRoundedKeyboardRuntime.java`, `gboard-version-bindings.json` (`18.5.4`). |
| **2. Найдено только в сторонних темах (`PackRepoBeta` `4a8187db`)** | Селекторы: `.keytop.dark`, `.keytop.for-action-key`, `.icon.for-action-key`, `.label`, `.label.secondary`, `.icon.access-point-item`, `.background-icon.access-points-menu`, `.background.access-point-panel-item`, `.keytop:pressed`, `.space_bar:pressed`. Свойства: `background_shape`, `background_corner_radius`, `elevation`, `shadow_color`, `edge_width`, `edge_color`, `padding_ratio_left/right/top/bottom`, `alpha`, `color`, `background_color`, `visibility`, `text_size`. | Сторонние архивы `3D_Black.zip`, `3D_Ios.zip`, `google_blue_dark_port.zip`. **Совместимость с `Gboard 18.5.4` НЕ доказана.** |
| **3. Механизм подтверждён, но фактический рендер не проверен** | Применение пользовательских ZIP-тем через `additional_keyboard_theme = "files:<name>"` и `enable_key_border`, а также стилизация живых тегов `18.5.4` (`.keyboard-base-area`, `.keyboard-header-area`, `.keyboard-body-area`, `.keytop`, `.space_bar`, `.background-icon.for-action-key`) собственным Samsung CSS-архивом. | Установка/валидация (`GboardCustomThemeInstaller`) и View-теги подтверждены в `18.5.4`, но Samsung ZIP ещё не запускались на устройстве. |
| **4. Требуют эксперимента на реальном устройстве (`18.5.4`)** | (а) Переопределяют ли `background_shape` и `background_corner_radius` pill-форму `?123` / `Enter` при активном/отключённом `Key Shape Selection` (`more_pill_keys`); (б) рендерятся ли `elevation`, `shadow_color`, `edge_color`, `padding_ratio_*` в `18.5.4` без артефактов; (в) различает ли CSS обычные Access Points, кнопку меню `⊞`, кнопку Rambler и подсказки; (г) перечитывает ли Gboard `18.5.4` ключ `additional_keyboard_theme` без `System.exit(0)`; (д) поведение `lock_key_border` и `enable_key_border` совместно с `Frosted Glass`. | Невозможно доказать без запуска тестовых ZIP на Galaxy S22 5G с `Gboard 18.5.4`. |

**Итоговый вердикт раздела 3:** **Можно реализовывать после проверки на устройстве**

---

## 4. Что подтверждено непосредственно для Gboard 18.5.4

Все перечисленные факты подтверждены для `Gboard 18.5.4` (`gboard-version-bindings.json` с `"target_version": "18.5.4"`, структурные SHA-256 проверки в `patches/` и реальный скриншот пользователя `Screenshot_20261121_205256_ChatGPT.jpg`):

1. **Валидация и импорт тем `18.5.4`:** `Lrnw;->h(Ljava/io/File;)Z` (`custom_theme_validator`) валидирует ZIP-архивы; `ThemeListingFragment` (`Lkhl;`, `Lkhr;`, `Lsrk;`) обрабатывает выбор и импорт ZIP через `Lkhl;->i(Intent)V`. При этом галерея `GboardCustomThemeGalleryView` после записи `additional_keyboard_theme` делает холодный перезапуск (`System.exit(0)`).
2. **Жизненный цикл IME `18.5.4`:** класс `Lphr;` с точными методами `onConfigureWindow(Window, Z, Z)`, `onWindowShown()`, `onWindowHidden()`, `onStartInput(EditorInfo, Z)`, `onStartInputView(EditorInfo, Z)`, `onFinishInput()`, `onFinishInputView(Z)`, `onDestroy()` и полем `Lphr;->i:InputView`.
3. **Привязка клавиш `18.5.4`:** `SoftKeyView.s(SoftKeyDef, long)Z` (`soft_key_bind`, confidence `0.99`), поля `SoftKeyView.e`, `SoftKeyDef.g(Lqae;)`, `ActionDef.f`, `Lqbc;->c:I`. Используется в подтверждённой базе `v4.4.2` для определения пробела (`KEYCODE_SPACE = 62`).
4. **Навигационная полоса Android 16 (API 36):** `Lrra;->f(Window, Lrqz;)` (`STOCK_STRIP_SDK = 36`), где `Lrqz;` несёт `a: color`, `b: divider`, `c: OptionalInt body`, `d: OptionalInt header`, `e: boolean light`.
5. **Верхний тулбар `18.5.4`:** контроллер AP `Lmwv;`, порядок `Lmvg;->m(...)` и `Lmwg;->c:Lwpa;`, флаги `config_max_access_points` / `config_default_access_points_num_on_bar` (`3..8`) через `Loki;->g()Object`, стиль меню `enable_access_points_menu_redesign` и `AccessPointDragPopupView`.
6. **Rambler `18.5.4`:** жёсткие SHA-256 отпечатки `Lflb;->i(Z)V`, `Lfkl;->d()V`, `Lfkm;->c(Lfkm;)V`, `Les;`, плюс `Lflz;->J()V` → `Lkaf;->h(CharSequence)V` и `Lnca;->a(Context)Z`.
7. **Визуальные факты с реального скриншота пользователя (`GboardSamsung`, Galaxy S22):**
   - В верхнем тулбаре **нет `•••`**: слева кнопка меню 4-квадрата (`⊞`), далее 7 иконок инструментов (`Translate`, `Writing Tools`, `Clipboard`, `Select All`, `Paste`, `Text Editing`, `Globe` — всего **8 элементов перед Rambler** без круглых подложек), справа — отдельная кнопка **Rambler** (`[Микрофон ✦]`) **с уже готовой нативной тёмной круглой подложкой**.
   - Клавиши `?123` и `Enter` сейчас имеют круглую/pill-форму (`more_pill_keys` / Material 3), функциональные клавиши имеют синевато-серый оттенок Material You, вторичные символы включены, пробел показывает центрированное `Русский` без шевронов.
8. **Что НЕ подтверждено для `18.5.4` по репозиторию (проприетарный APK отсутствует):**
   - Точный список поддерживаемых CSS-свойств (`background_shape`, `background_corner_radius`, `elevation`, `shadow_color`, `edge_color`, `padding_ratio_*`) и селекторов тулбара/Action Key/вторичных символов;
   - Внутреннее View-дерево `SoftKeyView` пробела (тег `.space_bar`, тип `TextView` метки языка, отступы, момент обновления цвета при Dynamic Color);
   - Точная формула, как Gboard `18.5.4` трактует `config_max_access_points` и `config_default_access_points_num_on_bar` (входит ли кнопка меню `⊞` в это число);
   - Внутренний View/CSS-контракт кнопки Rambler и её отличие от обычных AP на уровне View-иерархии;
   - Момент перечитывания `additional_keyboard_theme` и путь разрешения префикса `"files:"` (CE vs DE) в загрузчике тем `18.5.4`.

**Итоговый вердикт раздела 4:** **Можно реализовывать после проверки на устройстве**

---

## 5. Что требует проверки на устройстве

Закрытый реестр гипотез, которые **невозможно** доказать по исходникам репозитория и которые должны быть проверены на Samsung Galaxy S22 5G (`SM-S901U1`, Android 16 / One UI 8, `Gboard 18.5.4`, без root):

| # | Что проверить на Galaxy S22 5G | Когда проверять | Критерий успеха | Действие при провале |
| --- | --- | --- | --- | --- |
| **V1** | Валидация Samsung Light/Dark ZIP через `Lrnw;->h(File)Z` и фактический рендер CSS (`.keyboard-base-area`, `.keytop`, `.keytop.dark`, `.space_bar`, `.label`, `.label.secondary`, `background_corner_radius`, `elevation`, `shadow_color`, `edge_color`, `padding_ratio_*`). | Шаги 2–3 | Палитра, контраст, границы, тени, popup-клавиши и вторичные символы корректны в Light и Dark без крашей. | Убрать неподдерживаемые свойства; скорректировать селекторы под фактический парсер `18.5.4`. |
| **V2** | Взаимодействие CSS (`background_shape`, `background_corner_radius`) с существующим патчем `Key Shape Selection` (`more_pill_keys` вкл/выкл) на клавишах `?123` и `Enter`. | Шаг 3 | Понятная и предсказуемая форма клавиш (прямоугольная с 6–8 dp или чётко описанное поведение `Key Shape Selection`). | Не удалять и не ломать `Key Shape Selection`; не внедрять bytecode-хаки формы клавиш. |
| **V3** | Все 6 типов Action Key (`Enter`, `Search`, `Send`, `Done`, `Next`, `Go`): заливка (`.background-icon.for-action-key` / `.keytop.for-action-key`) и иконка (`.icon.for-action-key`) в Light и Dark. | Шаг 3 | Высокий контраст во всех 6 вариантах, отсутствие «белого на белом» или двойной заливки. | Отказаться от синего акцента, если селекторы ненадёжны, либо выбрать подтверждённый контрастный вариант. |
| **V4** | Внутренняя иерархия `SoftKeyView` пробела в `18.5.4`: наличие `.space_bar`, точные `bounds`/`padding`, класс `TextView` метки языка, поведение `getCurrentTextColor()` на Light/Dark/Samsung/Custom Theme/Dynamic Color, поведение `ViewOverlay` при recycling (`QWERTY`↔`?123`↔`Emoji`), Floating, Split, One-handed, повороте и масштабе. | Шаг 4 (пред-гейт) | 0 «призраков» на других клавишах, 0 наложений на текст, корректные bounds и цвет во всех проверенных режимах. | Упростить (уменьшение/скрытие) или **отложить реализацию шевронов** до нахождения безопасного механизма. |
| **V5** | CSS-селекторы верхнего тулбара (`.keyboard-header-area`, `.icon.access-point-item`, `.background-icon.access-points-menu`, `.candidates-area`) и влияние на кнопку **Rambler** и полосу подсказок. | Шаг 5 | Фон тулбара, иконки и подсказки контрастны; кнопка Rambler и её диктовка не искажены. | Сузить CSS только до `.keyboard-header-area` и подтверждённых безопасных правил. |
| **V6** | Точная View/CSS-структура слотов верхнего тулбара при 3, 6 и 8 AP + `⊞` + Rambler: возможно ли детерминированно отличить типы элементов (обычные AP vs меню vs Rambler vs подсказки) без привязки к индексам. | Шаг 7 (пред-гейт) | 100% детерминированный идентификатор типа слота + отсутствие слипания при `Count = 8` и в One-handed. | **Отказаться от круглых подложек AP** (штатный безопасный исход). |
| **V7** | Реакция Gboard `18.5.4` на изменение `additional_keyboard_theme` в DE `SharedPreferences` **без** `System.exit(0)`: есть ли штатный `OnSharedPreferenceChangeListener`, обновляется ли тема при открытой клавиатуре, при следующем `onStartInputView`, или только после перезапуска процесса. | Шаг 6 (пред-гейт) | Известен точный момент перечитывания ключа; ноль крашей и мерцания при смене системной темы Android. | Если требуется рестарт процесса — **не применять `System.exit(0)` в IME**, пересмотреть или отложить авто-переключение. |
| **V8** | Direct Boot и путь чтения `"files:"`: после перезагрузки Galaxy S22 **до первого ввода PIN** (CE `getFilesDir()` заблокировано, DE `additional_keyboard_theme` = `"files:..."`) — падает ли `18.5.4` или мягко откатывается к стоку? Читает ли `18.5.4` префикс `"files:"` исключительно из CE `filesDir`? | Шаги 3 и 6 | Ноль сбоев до ввода PIN; после разблокировки тема активна; пользовательские настройки не теряются. | Не переносить ZIP в DE без доказательства; не переключать тему до доступности CE и всех настроек. |
| **V9** | **Эксперимент Access Point Count (`3`, `6`, `8`):** установить `Top Toolbar Item Count` = `3`, затем `6`, затем `8` (с перезапуском Gboard каждый раз), а также проверить добавление/удаление пользовательского AP (`Copy`) и скрытие голосового ввода в поле пароля. | Перед Шагами 5 и 7 | Однозначно установлена формула видимых слотов: входит ли кнопка меню `⊞` в число `3..8`, как ведёт себя Rambler и сколько обычных AP помещается на баре. | Не проектировать адаптацию тулбара на допущениях; использовать измеренную формулу. |

**Итоговый вердикт раздела 5:** **Требуется дополнительное исследование**

---

## 6. Архитектура оформления клавиш, геометрии и вторичных символов

### 6.1. Согласованная цель и жёсткие границы

Цель — визуально приблизить основную клавиатуру Gboard к Samsung Keyboard / One UI 8, **полностью сохранив**:
- оригинальный движок Gboard (`SoftKeyboardView`, `KeyboardView` **не переписываются**);
- исходную сетку клавиш, порядок клавиш, карту символов и назначения клавиш;
- обработчики касаний, жесты (`Samsung Spacebar Gestures`, `Swipe Down to Dismiss`, свайп-набор, удержание пробела для курсора) и логику переключения языков.

Запрещено менять внутреннюю геометрию клавиатурного движка, переносить клавиши между рядами или перестраивать карту клавиш.

### 6.2. Две отдельные темы: Samsung One UI 8 Light и Samsung One UI 8 Dark

Базовая палитра (отправная точка для Шага 1, подлежащая визуальной проверке на AMOLED-экране Galaxy S22 на Шаге 3):

| Элемент | Samsung One UI 8 Light | Samsung One UI 8 Dark | Примечание и уровень доказательности |
| --- | --- | --- | --- |
| Фон клавиатуры (`.keyboard-base-area`, `.keyboard-body-area`) | `#EAEAEF` (светло-серый) | `#08080A` (почти чёрный) | Теги **[Подтверждено исходниками]**; фактический рендер из Samsung ZIP — **[Требует проверки на устройстве]**. |
| Фон тулбара (`.keyboard-header-area`) | `#F3F3F7` / `#EAEAEF` | `#121214` / `#08080A` | Тег **[Подтверждено исходниками]**; проверка контраста с подсказками и Rambler — на Шаге 5 (V5). |
| Буквенные/цифровые клавиши и пробел (`.keytop`, `.space_bar`) | `#FFFFFF` (белые) | `#38383B` (графитовые) | Теги **[Подтверждено исходниками]**; умеренная тень в Light — **[Требует проверки на устройстве]**. |
| Функциональные клавиши (`Shift`, `Backspace`, `?123`, `,`, `.`) | `#C8CACF` (нейтрально-серые) | `#1C1C1F` (темнее буквенных) | Селектор `.keytop.dark` — **[Сторонние темы / CSS]** (`PackRepoBeta` `4a8187db`), требует проверки V1. |
| Основной текст и иконки клавиш | `#1C1C1E` (тёмный, WCAG AAA) | `#FFFFFF` (светлый, WCAG AAA) | Селектор `.label` — **[Сторонние темы / CSS]**, требует проверки V1. |
| Вторичные символы (`.label.secondary`) | `#6B6E75` (или alpha `~0.62`) | `#B0B3B8` (или alpha `~0.68`) | Селектор `.label.secondary` — **[Сторонние темы / CSS]**, требует проверки V1. |
| Синий акцент `Enter` / `Search` / `Send` | `#2A6BF2` *(условно)* | `#4D8BFF` *(условно)* | **Допустим ТОЛЬКО при подтверждённых безопасных селекторах (V3).** В `18.5.4` `.background-icon.for-action-key` может быть отдельным `ImageView.getDrawable()` (**[Подтверждено исходниками]**). Назначение клавиш не меняется. |
| Состояние нажатия (`:pressed`) | `#DCDCE2` / `#B4B7BE` | `#525256` / `#2E2E33` | Псевдокласс `:pressed` — **[Сторонние темы / CSS]**, требует проверки V1. |

### 6.3. Геометрия клавиш (6–8 dp), тени и взаимодействие с `Key Shape Selection`

- **Целевая визуальная форма:** прямоугольные клавиши со скруглением ~`6–8 dp`, аккуратными границами, мягкими тенями (в Light) и чётким разделением без изменения сетки движка.
- **Честный статус CSS-свойств геометрии:** свойства `background_shape`, `background_corner_radius`, `elevation`, `shadow_color`, `edge_width`, `edge_color`, `padding_ratio_left/right/top/bottom` взяты из сторонних тем (`PackRepoBeta` `4a8187db`: `3D_Black.zip`, `3D_Ios.zip`, `google_blue_dark_port.zip`). **Их фактическая поддержка и визуальное поведение в `Gboard 18.5.4` на Android 16 НЕ подтверждены** и проверяются в **V1 / V2**.
- **Проверка существующего патча `Key Shape Selection` (`more_pill_keys`) — [Подтверждено исходниками]:**
  - В `GboardFeatureFlagsRuntime.java` (`FLAG_KEY_SHAPE_SELECTION = "more_pill_keys"`, `GboardFlagFamilyComposer.kt` order `40`) патч включает флаг `more_pill_keys = true`, который открывает выбор формы клавиш в деталях темы Gboard.
  - На скриншоте пользователя `?123` и `Enter` сейчас круглые/pill.
  - **Жёсткое правило:** патч `Key Shape Selection` **не отключать, не удалять и не менять его назначение**. В эксперименте **V2** (Шаг 3) проверяется, имеет ли CSS `background_shape: rectangle` + `background_corner_radius` приоритет над `more_pill_keys` при обоих положениях настройки пользователя. Если `more_pill_keys` имеет приоритет — это документируется пользователю, а не обходится опасным патчингом рендера.
- **Взаимодействие с `Rounded Keyboard Panel`:** `GboardRoundedKeyboardRuntime` управляет только углами самой панели (`Lrnb;->b`), не вмешиваясь в отдельные клавиши. Конфликт маловероятен, но проверяется на Шаге 3.

### 6.4. Вторичные символы

- **Неприкосновенно:** оригинальная карта вторичных символов Gboard, назначение символов, поведение долгого нажатия (long-press) и обработка popup-клавиш. **Запрещено** переносить проприетарную карту Samsung или воспроизводить её внутреннюю логику.
- **Разрешено исследовать (только CSS, Шаги 1–3):** цвет, контрастность, размер текста (`.label.secondary`) и штатное позиционирование — исключительно если соответствующие CSS-свойства штатно поддерживаются `Gboard 18.5.4` и не ухудшают читаемость на 11-колоночной русской раскладке (`ЙЦУКЕН`) и 10-колоночной английской (`QWERTY`).

### 6.5. Спецификация потенциального изменения (Шаги 1–3: CSS ZIP-темы Light & Dark)

1. **Точное место:** на Шагах 1–3 — только автономные ZIP-файлы (`samsung_oneui8_light.zip`, `samsung_oneui8_dark.zip`) для проверки через **существующий** механизм `Custom Theme` (без единой правки Java/Kotlin/runtime!). Позже (Шаг 6, при утверждении) — встроенные ассеты расширения.
2. **Механизм:** чистые архивы `format_version: 3`, соответствующие `GboardThemeImportContract` и `Lrnw;->h(File)Z`, без растровых изображений.
3. **Файлы:** на Шагах 1–3 исходный код и патчи не изменяются вообще.
4. **Затрагиваемые компоненты:** штатный валидатор `Lrnw;->h(File)Z`, `GboardCustomThemeInstaller` / `ThemeListingFragment`, отображение клавиш, Action Keys, popup, `Frosted Glass`, `Key Shape Selection`.
5. **Потенциально уязвимые функции:** читаемость Action Keys, вторичных символов, long-press popup, буфера обмена, эмодзи, следа свайп-набора.
6. **Уровень риска:** **Средний** (полностью обратимо на устройстве за 2 секунды переключением темы).
7. **Проверка:** импорт обоих ZIP через `Custom Theme` на Galaxy S22 (`18.5.4`) и прогон V1, V2, V3, V8.
8. **Откат:** выбор любой другой темы в настройках Gboard → «Тема».

**Итоговый вердикт раздела 6:** **Можно реализовывать после проверки на устройстве**

---

## 7. Самостоятельная настройка: Шевроны переключения языка на пробеле (`‹ Русский ›`)

> **Окончательное решение пользователя (Уточнение №1):** шевроны на пробеле **НЕ являются частью Samsung Keyboard Appearance**. Это полностью **самостоятельная необязательная функция** с отдельным переключателем, выключенным по умолчанию.

### 7.1. Название, размещение и полная независимость настройки

- **Название настройки (RU):** **«Шевроны переключения языка на пробеле»**  
  *(EN: `Spacebar language switch chevrons`)*
- **Состояние по умолчанию:** **Выключено (`false`)**.
  - Когда **выключено**: Gboard отображает полностью оригинальный пробел без шевронов; ни один элемент и механизм не изменяются.
  - Когда **включено**: по обеим сторонам названия активного языка на пробеле отображаются пассивные визуальные шевроны (пример: `‹ Русский ›`); само название языка остаётся оригинальным; шевроны служат лишь визуальной подсказкой о возможности переключения языка.
- **Оптимальное размещение в реальной структуре проекта [Подтверждено исходниками]:**
  - В `GboardPatchesSettingsFeatureRegistry.java` (строка 37) уже существует верхнеуровневый экран **`GboardLanguageSettingsFeature`** (**«Язык»** / `Language`), а внутри него (`GboardLanguageSettingsFeature.java`, строки 111–125) — одна секция **«Переключение языка»** (`gboard_patches_language_settings_section`), где уже расположены два независимых `ToggleRow`:
    1. *Переключение языка свайпом по пробелу* (`pref_spacebar_language_swipe_enabled`);
    2. *Скрыть клавишу переключения языка* (`pref_hide_language_switch_key`).
  - **Рекомендуемое место:** добавить **третий независимый `ToggleRow`** («Шевроны переключения языка на пробеле», ключ `pref_spacebar_language_chevrons_enabled` в `gboard_patches_settings`) **прямо внутри этой существующей секции «Переключение языка»**.
  - Это **не создаёт** новый большой раздел настроек, **не дублирует** существующие настройки и логически объединяет все настройки поведения/отображения языкового переключения в одном месте.
  - *Важная техническая деталь из исходников:* сейчас `GboardLanguageSettingsFeature.isAvailable(Context)` (строки 70–73) проверяет только маркер `FEATURE_SAMSUNG_SPACEBAR_GESTURES`. При будущей реализации необходимо гарантировать, что: (а) выключение тоггла «Переключение языка свайпом по пробелу» **не скрывает и не блокирует** тоггл шевронов; (б) при выделении шевронов в отдельный Morphe-патч `isAvailable` проверяет наличие любого из маркеров (`FEATURE_SAMSUNG_SPACEBAR_GESTURES || FEATURE_SPACEBAR_CHEVRONS`) и показывает только те строки, чьи патчи установлены; (в) обновляется `GboardSettingsSearchIndexData.java`.
- **Полная независимость от других функций (обязательное требование):**
  - Шевроны работают независимо от: **Samsung Keyboard Appearance**, **Samsung Spacebar Gestures**, **Swipe Down to Dismiss Keyboard**, включения/отключения **клавиши глобуса**, **выбранной темы клавиатуры** и любых других механизмов смены языка.
  - **Запрещено** объединять переключатель шевронов с переключателем Samsung Appearance.
  - **Запрещено** автоматически включать шевроны при выборе Samsung-темы.

### 7.2. Адаптивность отображения (цвет и размер)

#### Адаптация цвета — честная граница доказательности

| Тема / режим | Предполагаемый способ подбора цвета | Статус доказательности |
| --- | --- | --- |
| Светлые темы / Samsung One UI 8 Light | Чтение текущего цвета текста `TextView` метки языка на пробеле (`textView.getCurrentTextColor()` с лёгким приглушением alpha ~0.78–0.85), фоллбек на тёмный контрастный тон (`#1C1C1E`). | **[Архитектурное предположение / Требует проверки V4]** — необходимо убедиться, что в `18.5.4` метка языка является `TextView` (или наследником) и имеет актуальный `currentTextColor` в момент рендера. |
| Тёмные темы / Samsung One UI 8 Dark | Аналогично — чтение `textView.getCurrentTextColor()`, фоллбек на светлый тон (`#FFFFFF`). | **[Архитектурное предположение / Требует проверки V4]**. |
| **Dynamic Color** (Material You) | Теоретически `TextView` метки языка уже окрашен движком Gboard в токен `onSurface` / `onSurfaceVariant` палитры Dynamic Color, поэтому чтение `getCurrentTextColor()` может подхватывать нужный оттенок без доступа к закрытым темам Gboard. | **[Требует проверки V4]** — в исходниках **не доказано**, обновляется ли цвет `TextView` до или после `SoftKeyView.s(...)` при смене обоев/системной темы. Поддержка Dynamic Color не гарантируется до проверки на устройстве. |
| **Пользовательские темы (Custom Theme)** | В стандартных CSS-темах `getCurrentTextColor()` может дать читаемый цвет. Однако в темах с фоновой фотографией, градиентом, нестандартным `ColorStateList` или скрытой меткой языка цвет может оказаться малоконтрастным или не читаться. | **Адаптация ко всем пользовательским темам НЕ гарантирована** (в исходниках репозитория нет механизма чтения фактического цвета/яркости пикселей подложки произвольной ZIP-темы). |

#### Адаптация размера и геометрии

Шевроны **ни при каких условиях не должны**: перекрывать название языка, выходить за пределы видимого keycap пробела, пересекаться с соседними клавишами, создавать визуальные артефакты или изменять ширину пробела / перестраивать сетку клавиатуры.

- Учитываемые факторы: фактическая ширина видимого keycap пробела (`.space_bar` или внутренние границы `SoftKeyView`), общие размеры клавиатуры, системное масштабирование экрана/шрифта (Display Size / Font Size), фактическая ширина отрендеренного названия языка (`TextView` / `Paint.measureText`), разные раскладки (RU 11-кол., EN 10-кол., `?123`, символы, телефон).
- **Поведение при нехватке ширины (graceful degradation):**
  1. При достаточной ширине (ориентировочно `keycapWidth >= 140 dp` и зазор между краем текста языка и шевроном `>= 8 dp`) — стандартный размер шеврона (`~8–9 dp` по высоте).
  2. При средней ширине (например, `115–140 dp` или длинное название языка) — допустимо пропорциональное уменьшение размера шеврона (`~6–7 dp`) при сохранении минимального зазора от текста (`>= 6 dp`).
  3. При недостаточной ширине (`< 115 dp`, зазор `< 6 dp`, отсутствие видимой метки языка или невозможность достоверно измерить `TextView`/keycap) — **полное безопасное скрытие шевронов** без изменения размеров клавиши.

### 7.3. Абсолютный запрет на вмешательство в касания и полный 11-пунктный анализ `ViewOverlay`

#### Абсолютный запрет
Шевроны — исключительно пассивная визуальная подсказка. **Категорически запрещено:** добавлять собственные `OnTouchListener`, перехватывать `MotionEvent`, изменять существующие touch handlers, менять обработку свайпов, обычного нажатия пробела, удержания пробела для курсора, алгоритмы переключения языков или любые существующие жесты. По тем же причинам **отвергнута** мутация `TextView.setText("‹ " + text + " ›")` (риск дублирования `‹ ‹ ... › ›`, искажение TalkBack, неверное позиционирование вплотную к тексту вместо краёв клавиши).

#### Глубокий 11-пунктный анализ кандидата `ViewOverlay` поверх `SoftKeyView`

Точка подключения, уже подтверждённая в `18.5.4`, — композитор `SoftKeyView.s(SoftKeyDef, long)Z` (`GboardSoftKeyFamilyComposer.kt`, `after_stock`, например `afterOrder = 950`, не пересекается с `GboardSpacebarGlobeKeyRuntime` на `afterOrder = 900`), с фильтрацией `GboardSpacebarKeyHitTester.extractPressKeycode(view) == KeyEvent.KEYCODE_SPACE (62)`.

Однако сам механизм `ViewOverlay` **НЕ доказан как полностью безопасный на `Gboard 18.5.4`** без проверки всех 11 аспектов ниже:

| # | Аспект анализа `ViewOverlay` | Инженерный анализ и выявленный риск | Требуемая защита / статус доказательности |
| --- | --- | --- | --- |
| **1** | **Жизненный цикл `SoftKeyView`** | Хук `SoftKeyView.s(...)` вызывается только при привязке `SoftKeyDef`, но **не** при `onDetachedFromWindow()` или смене темы. Без `OnAttachStateChangeListener` объект `Drawable` остаётся привязанным к `ViewOverlay` на всё время жизни View. | Прикреплять `OnAttachStateChangeListener` для очистки на `onViewDetachedFromWindow`; **[Требует проверки V4]**. |
| **2** | **Повторное использование и recycling `View`** | **[Подтверждено исходниками]** Gboard активно переиспользует `SoftKeyView` между раскладками (см. `GboardSpacebarGlobeKeyRuntime.java`). При смене `QWERTY` → `?123` / `Emoji` тот же экземпляр `SoftKeyView` может стать другой клавишей. | Мгновенно удалять `Drawable` и слушатели в `afterSoftKeyBind`, если `extractPressKeycode != KEYCODE_SPACE` или настройка выключена. |
| **3** | **Получение и обновление координат пробела** | В момент возврата из `SoftKeyView.s(...)` View ещё может не пройти `measure/layout` (`width == 0`), а видимый keycap `.space_bar` является внутренним дочерним View с собственными отступами. Внутренняя структура `SoftKeyView` в `18.5.4` **не подтверждена в репозитории**. | Обновлять `Drawable.setBounds(...)` через `OnLayoutChangeListener` на **внутреннем** `.space_bar` (или fail-closed, если `.space_bar` не найден); **[Требует проверки V4]**. |
| **4** | **Корректность bounds при изменении размеров клавиатуры** | Смена высоты клавиатуры в настройках Gboard, включение ряда цифр, изменение DPI/шрифта меняют размеры `SoftKeyView` и `.space_bar` без обязательного повторного вызова `SoftKeyView.s(...)`. | Пересчёт bounds и проверка коллизии с `TextView` на каждом `onLayoutChange` (и на `Drawable.draw` при смене размера), без вызова `requestLayout()`. |
| **5** | **Очистка Overlay при скрытии клавиатуры** | При скрытии клавиатуры (`onWindowHidden`) `SoftKeyView` может оставаться в кэше `InputView`. При следующем показе после смены темы старый цвет шевронов может мелькнуть на 1 кадр. | Сбрасывать/перечитывать цвет при `onWindowShown` или непосредственно перед отрисовкой в `Drawable.draw(Canvas)` из актуального `TextView.getCurrentTextColor()`. |
| **6** | **Поведение при пересоздании IME** | При пересоздании `InputMethodService` старые View уничтожаются. Сильные ссылки в статических коллекциях вызвали бы утечку памяти и `Context`. | Только `WeakHashMap<View, ChevronAttachment>` и `WeakReference<View>` внутри `Drawable` и слушателей; явная отписка на detach. |
| **7** | **Риск появления шевронов на другой клавише после recycling («призраки»)** | **КРИТИЧЕСКИЙ РИСК:** если в `Gboard 18.5.4` существует путь очистки/перепривязки `SoftKeyView`, который **не** проходит через `SoftKeyView.s(SoftKeyDef, long)Z` (например, прямой reset пула или вторичный метод bind), `Drawable` останется в `ViewOverlay` не-пробельной клавиши! | Двойной барьер: очистка в `afterSoftKeyBind` **плюс** проверка в `Drawable.draw(Canvas)` (актуальный `extractPressKeycode(host) == KEYCODE_SPACE` и наличие видимой метки языка; при несовпадении — немедленный self-detach и пропуск рисования). **[Требует проверки V4]**. |
| **8** | **Floating Keyboard** | Уменьшенная ширина, произвольный ресайз пользователем, возможное масштабирование `scaleX`/`scaleY`. Если `ViewOverlay` не масштабируется синхронно с внутренним keycap или ширина мала — возможны смещения/обрезка. | Проверять фактическую ширину keycap в dp и масштаб; при узком окне уменьшать или полностью скрывать шевроны. **[Требует проверки V4]**. |
| **9** | **Split Keyboard** | В разделённой клавиатуре пробел делится на **две узкие половинки**, обе могут иметь `KEYCODE_SPACE (62)`. Риск: шевроны появятся на обеих узких половинках и налезут на текст. | Порог минимальной ширины + проверка наличия видимого текста языка; при узких половинках авто-скрытие. **[Требует проверки V4]**. |
| **10** | **One-handed Keyboard** | Ширина клавиатуры сжимается на ~15–20%. С длинным названием языка (`English (US)`, `Русский`) свободное место по бокам резко сокращается. | Обязательный динамический замер ширины текста (`Paint.measureText` + bounds `TextView`) с уменьшением или скрытием при зазоре `< 6 dp`. **[Требует проверки V4]**. |
| **11** | **Изменение ориентации и масштаба** | Портрет ↔ Ландшафт, системное увеличение шрифта (Font Scale `1.3x+`) и масштаба экрана (Display Size). При большом шрифте текст расширяется при неизменной ширине пробела. | Все размеры шевронов — в `dp` (не `sp`), пересчёт bounds и проверка коллизии с текстом на каждый `onLayoutChange`; скрытие при нехватке зазора. **[Требует проверки V4]**. |

#### Честный вывод по механизму шевронов и альтернативы

- **Статус `ViewOverlay`:** перспективный пассивный кандидат, **НЕ готовое доказанное решение**. Без проверки **V4** на реальном Galaxy S22 (`18.5.4`) нельзя гарантировать отсутствие «призраков» при recycling, точное совпадение bounds с `.space_bar` и стабильную адаптацию цвета на Dynamic Color и всех Custom Theme.
- **Рассмотренные альтернативы:**
  - *Альтернатива 1 (обёртка/LayerDrawable поверх `background` у `.space_bar`):* **выше риск**, так как напрямую конфликтует с `GboardFrostedGlassRuntime.applyKeyOpacity` (меняет альфу `Drawable`) и перезаписывается движком тем при перерисовке состояния `:pressed`. **Не рекомендуется.**
  - *Альтернатива 2 (изменение `TextView.setText` / `Spannable` / `compoundDrawables`):* **запрещена**, так как искажает TalkBack, конфликтует с перепривязкой текста Gboard и не привязывает шевроны к краям клавиши.
  - *Альтернатива 3 (отложить реализацию):* если эксперимент **V4** выявит артефакты recycling, некорректные bounds в Floating/Split/One-handed или ненадёжный подбор цвета — **рекомендуется отложить реализацию шевронов**, сохранив чистый оригинальный пробел.

### 7.4. Спецификация потенциального изменения (Шаг 4: самостоятельная настройка шевронов)

1. **Точное место в исходном коде:** `GboardLanguageSettingsFeature.java` (3-й независимый `ToggleRow` в секции `Переключение языка`), `GboardSpacebarGestureSettings.java` (или новый `GboardSpacebarChevronSettings.java`), существующий композитор `GboardSoftKeyFamilyComposer.kt` (`after_stock`, `afterOrder = 950`), новый `GboardSpacebarChevronRuntime.java`, `GboardSpacebarKeyHitTester.java` (открыть `extractPressKeycode`), `gboard_settings_text.xml` (RU/EN), `GboardSettingsSearchIndexData.java`.
2. **Точный механизм:** независимый тоггл (по умолчанию `false`) → пассивный `Drawable` в `ViewOverlay` после `SoftKeyView.s(...)` (только при `KEYCODE_SPACE == 62`, `isUserUnlocked == true` и подтверждении V4), с двойным барьером recycling, привязкой к `.space_bar` и адаптивным уменьшением/скрытием.
3. **Изменяемые файлы (после прохождения V4 и одобрения):** перечислены в п. 1 + unit/Robolectric-тесты. Никаких изменений в `Samsung Appearance`, `GboardSpacebarGestureRuntime` (обработка жестов) и `Swipe Down to Dismiss`.
4. **Затрагиваемые существующие компоненты:** `GboardSoftKeyFamilyComposer` (совместно с `GboardSpacebarGlobeKeyRuntime` на разных `afterOrder`), `GboardLanguageSettingsFeature`.
5. **Потенциально уязвимые функции:** визуальный вид пробела и соседних переиспользуемых клавиш при смене раскладок/режимов; контраст в нестандартных Custom Theme. Обработка касаний и жестов не затрагивается.
6. **Уровень риска:** **Средний / Высокий** до прохождения эксперимента **V4** на устройстве.
7. **Как проверить результат:** прогнать все 11 пунктов анализа на Galaxy S22 (включая RU/EN, `?123`, длинные названия языков, Floating, Split, One-handed, смену масштаба/ориентации, Light/Dark/Dynamic Color/Custom Theme/Frosted Glass, включение/выключение без перезапуска, полную проверку жестов пробела и глобуса).
8. **Как откатить:** выключить тоггл «Шевроны переключения языка на пробеле» (мгновенная очистка `ViewOverlay`) или откатить изолированный коммит Шага 4.

**Итоговый вердикт раздела 7:** **Требуется дополнительное исследование** *(механизм `ViewOverlay` нельзя считать доказанным до проверки V4 на реальном `Gboard 18.5.4`; при выявлении рисков — отложить).*

---

## 8. Подробный анализ верхнего тулбара и точная трассировка `Access Point Count` (Уточнение №2)

### 8.1. Фактическая цепочка реализации `Access Point Count` в репозитории [Подтверждено исходниками]

Прямой аудит всех файлов подсистем `accesspointcount/`, `accesspoint/`, `accesspointsmenu/` и `rambler/` установил точную цепочку от пользовательской настройки до байткода Gboard:

1. **Экран настроек (`GboardAccessPointCountSettingsFeature.java`):**
   - Отображается в группе `Клавиши, макет и символы` → «Количество значков на верхней панели».
   - Содержит переключатель `Enable` (`PREF_KEY_ENABLED`, по умолчанию `false`) и выбор числа `Count` (`PREF_KEY_COUNT`, по умолчанию `6`, валидация `MIN_COUNT = 3`, `MAX_COUNT = 8`).
   - **Обе настройки помечены `.setRestartRequired(...)`** (строки 133–143): подсказка прямо требует перезапуска Gboard, чтобы изменение вступило в силу.
2. **Хранилище (`GboardAccessPointCountSettings.java`):**
   - Читает/пишет `pref_access_point_count_enabled` и `pref_access_point_count_value` в CE `gboard_patches_settings`.
3. **Политика и рантайм (`GboardAccessPointCountPolicy.java`, `GboardAccessPointCountRuntime.java`):**
   - Реагирует **ТОЛЬКО** на два имени флагов и **ТОЛЬКО** когда стоковый результат — `Long`:
     - `config_max_access_points`
     - `config_default_access_points_num_on_bar`
   - При `enabled == true` и валидном `count ∈ [3..8]` подменяет возвращаемое значение обоих флагов на `Long.valueOf(settings.count)`.
4. **Точка внедрения (`GboardAccessPointCountFlagValuePatch.kt` → `GboardFlagFamilyComposer.kt`, строки 96–100):**
   - Встраивается в общий композитор флагов (`compositionOrder = 1300`) на выходе `Loki;->g()Object`. **Никаких других хуков в макете, адаптере или View-иерархии тулбара патч `Access Point Count` не имеет.**
5. **Пользовательские Access Points (`GboardAccessPointContributionsRuntime.java`, `GboardAccessPointContributionsPatch.kt`, `GboardEditingAccessPointsContribution.java`):**
   - Хукает `Lmvg;->m(...)` (расширяет неизменяемый `Set<String>` токенов порядка `Lwpa;`) и `Lmwv;-><init>(Context, Lmyc;)V` (синхронизирует `mwv.g` (`Lmwg;`) → `mwg.c` (`Lwpa;`) и вызывает `mwv.g(mtr descriptor, false)` для регистрации `Manual Incognito`, `Floating Web Search`, `Select All`, `Copy`, `Cut`, `Paste`).
   - Тем самым пользовательские AP становятся **полноправными обычными перетаскиваемыми Access Points** в том же контроллере `Lmwv;`, что и системные AP Gboard.
6. **Меню Access Points (`GboardAccessPointsMenuRuntime.java`):**
   - Управляет только флагом `enable_access_points_menu_redesign`, выбором макета меню (`0x7f0b070c`/`0x7f0b070d`, `0x7f0e062e`/`0x7f0e01aa`) и `AccessPointDragPopupView`. С флагами `config_max_access_points` / `config_default_access_points_num_on_bar` никак не связан.
7. **Rambler (`GboardRamblerStockPolicy.java`, `GboardRamblerResetHeader.kt`):**
   - Управляется отдельными флагами (`enable_agentic_dictation`, `enable_rambler_al_toolbar`, `ad_activation_type = 2L` и др.) и отдельным жизненным циклом заголовка (`Lflb;`/`Lkaf;`). **Не регистрируется** через `GboardAccessPointContributionsRuntime` и **не управляется** `Access Point Count`.

### 8.2. Ответы на 9 ключевых вопросов о `Access Point Count`

| # | Вопрос | Честный ответ на основе исходников репозитория | Статус |
| --- | --- | --- | --- |
| **1** | Что именно регулирует `Access Point Count`? | Переопределяет два `Long`-флага Gboard: `config_max_access_points` и `config_default_access_points_num_on_bar` в диапазоне `3..8`. Внутренние потребители этих двух флагов находятся в закрытом коде Gboard `18.5.4`. | Частично подтверждено (выход патча — да; логика Gboard — нет) |
| **2** | Входит ли кнопка меню/сетки (`⊞`) в это число? | **Нельзя однозначно доказать по исходникам репозитория.** В коде патчей нет разбора класса компоновщика бара `18.5.4`. *(Уточнение: утверждение в v3 о том, что 8 = 1 меню + 7 инструментов при `Count = 8`, признаётся неподтверждённой гипотезой!)* | **[Требует проверки V9]** |
| **3** | Считаются ли только обычные Access Points? | Не доказано, считает ли `config_max_access_points` только обычные слоты AP (тогда на скриншоте пользователя либо `Count = 7`, либо пользователь закрепил 7 из 8 возможных AP) или включает слот меню `⊞` (`1 + 7 = 8`). | **[Требует проверки V9]** |
| **4** | Является ли кнопка меню (`⊞`) отдельным элементом? | Визуально и функционально кнопка `⊞` фиксирована слева и открывает панель `AccessPointKeyboard` (`Lmwv;->F()`), но занимает ли она один из `config_max_access_points` слотов в `18.5.4` — неизвестно без эксперимента. | **[Требует проверки V9]** |
| **5** | Входит ли кнопка Rambler в `Access Point Count`? | В коде репозитория Rambler полностью отделён от `Lmwv;` AP-регистрации и управляется своими флагами. На скриншоте пользователя Rambler стоит 9-м элементом справа (при максимуме настройки `MAX_COUNT = 8`!), что **сильно указывает**, что Rambler — отдельный слот вне лимита `Access Point Count`. Окончательно подтверждается в V9 (при `Count = 3` Rambler должен остаться). | Сильное косвенное свидетельство + **[проверка V9]** |
| **6** | Как соотносятся пользовательские AP и системные элементы панели? | **[Подтверждено исходниками]** Пользовательские AP (`Editing Access Points`, `Manual Incognito`, `Floating Web Search`) добавляются в тот же `Lwpa;` каталог и регистрируются в `Lmwv;->g(mtr, false)`, как и системные AP — для движка Gboard они равноправны (что видно на скриншоте: `Select All` и `Paste` стоят в одном ряду с `Translate` и `Clipboard`). | **[Подтверждено исходниками]** |
| **7** | Как ведёт себя панель при значениях `3`, `6` и `8`? | Точное количество видимых иконок между `⊞` и Rambler при `3`, `6` и `8`, а также поведение при попытке перетащить лишнюю иконку из меню на бар не описаны в исходниках патчей. | **[Требует проверки V9]** |
| **8** | Что происходит при изменении состава Access Points (drag-and-drop)? | При перетаскивании порядок сохраняется самим контроллером Gboard (`Lmwv;` / `Lmwg;`), а при перетаскивании задействуется `AccessPointDragPopupView`. Пользователь может закрепить на баре **меньше** элементов, чем лимит `config_max_access_points` (гипотеза, проверяемая в V9). | Частично подтверждено + **[проверка V9]** |
| **9** | Как ведёт себя интерфейс при включении/отключении дополнительных элементов (например, `Copy`, `Manual Incognito` или скрытии микрофона в поле пароля)? | При отключении пользовательского AP в настройках он перестаёт регистрироваться в `Lmwv;` (требуется перезапуск/переинициализация). Заполняет ли Gboard освободившийся слот следующим AP или сокращает число иконок, и перераспределяется ли ширина при скрытии Rambler в поле пароля — проверяется в V9. | **[Требует проверки V9]** |

### 8.3. Сопоставление с реальной конфигурацией пользователя и безопасный эксперимент V9

На скриншоте пользователя (`Screenshot_20261121_205256_ChatGPT.jpg`) слева направо расположены:
1. `[1]` Кнопка меню/сетки (`⊞`, 4 квадрата) — без круглой подложки;
2. `[2..8]` 7 инструментов (`Translate`, `Writing Tools`, `Clipboard`, `Select All`, `Paste`, `Text Editing`, `Globe`) — без круглых подложек;
3. `[9]` Кнопка голосового ввода **Rambler** (`[Микрофон ✦]`) — справа, **с готовой нативной круглой подложкой**.

Итого: **8 элементов до кнопки Rambler** + **1 кнопка Rambler** = **9 видимых элементов**. Из одного скриншота невозможно определить, какой именно вариант верен:
- *Гипотеза А:* в Gboard `18.5.4` лимит `Count = 8` **включает** кнопку меню `⊞` (`1 меню + 7 AP = 8`) + отдельный Rambler (`9`).
- *Гипотеза Б:* лимит `Count` считает **только обычные AP** (без `⊞`), и на скриншоте либо задано `Count = 7`, либо задано `Count = 8`, но закреплено 7 инструментов.

#### Безопасный эксперимент на устройстве (V9, без изменений кода, ~2 минуты)

На текущей установленной сборке `v4.4.2` на Samsung Galaxy S22 5G:
1. Открыть `Настройки GboardSamsung → Клавиши, макет и символы → Количество значков на верхней панели`. Зафиксировать текущее состояние (`Вкл/Выкл` и число).
2. Выставить **`3`**, нажать перезапуск Gboard (кнопка в правом верхнем углу). Открыть клавиатуру в обычном текстовом поле и посчитать: (а) есть ли `⊞`, (б) сколько обычных иконок между `⊞` и Rambler, (в) на месте ли Rambler. Попробовать перетащить ещё одну иконку из меню `⊞` на верхнюю панель — добавляется ли она или вытесняет существующую?
3. Повторить шаг 2 для **`6`** и для **`8`** (после `8` попробовать перетащить максимальное число иконок на панель, пока Gboard не начнёт вытеснять старые).
4. При одном из значений (например, `6`) открыть **поле ввода пароля** (где голосовой ввод скрывается) и проверить, исчез ли Rambler и изменилось ли число остальных иконок.
5. Включить/выключить один пользовательский AP (например, `Копировать` в `Кнопки редактирования на панели`) и проверить, как меняется состав панели.
6. Вернуть исходное значение настройки пользователя.

### 8.4. Безопасные и небезопасные области оформления тулбара

| Аспект оформления тулбара | Механизм | Безопасность и позиция v3.1 |
| --- | --- | --- |
| **Фон тулбара** | CSS `.keyboard-header-area` (**[Подтверждено исходниками]** как View-тег в `18.5.4`) | **Безопасный кандидат Шага 5** после проверки V5 (контраст с подсказками и `Frosted Glass`). |
| **Цвет иконок тулбара и текста подсказок** | CSS (кандидаты `.icon.access-point-item`, `.background-icon.access-points-menu` — **[Сторонние темы / CSS]**) | **Средний риск:** допускается на Шаге 5 **только** после V5 и при 100% сохранении читаемости активных состояний, подсказок и Rambler. |
| **Круглые подложки Access Points** | **Необязательный эксперимент** (Шаг 7) — предпочтительно чистый CSS, только если он различает типы элементов | **Высокий риск.** Запрещено привязываться к индексам/позициям или использовать рискованные runtime-обходы ради декора. Если CSS не позволяет безопасно отличать типы — **отказаться от круглых подложек**. |

### 8.5. Спецификация потенциального изменения (Шаг 5: фон и цвета тулбара)

1. **Точное место:** только CSS-файлы внутри `samsung_oneui8_light.zip` и `samsung_oneui8_dark.zip` (ноль изменений в Kotlin/Java-коде тулбара).
2. **Механизм:** декларативные правила для `.keyboard-header-area` и подтверждённых в V5 селекторов иконок/кандидатов.
3. **Файлы:** только CSS-ассеты Samsung ZIP-тем.
4. **Затрагиваемые компоненты:** `.keyboard-header-area`, `.candidates-area`, `GboardFrostedGlassRuntime.applySurfaceOpacity`.
5. **Потенциально уязвимые функции:** читаемость подсказок, активных/неактивных иконок AP, кнопки `⊞`, кнопки Rambler.
6. **Уровень риска:** **Средний** (только CSS, но селекторы иконок и кандидатов не проверены в `18.5.4`).
7. **Проверка:** пустой тулбар, ввод текста (подсказки + автоисправление), открытые панели (`Clipboard`/`Emoji`/`Translate`), drag-and-drop AP, `Frosted Glass`, Legacy и Modern `Access Points Menu`, 5 циклов диктовки Rambler.
8. **Откат:** удаление/корректировка CSS-правил в ZIP-теме.

**Итоговый вердикт раздела 8:** **Требуется дополнительное исследование** *(обязательны эксперименты V5 и V9 на устройстве; до отдельного согласования пользователя в тулбаре ничего не реализовывать).*

---

## 9. Анализ кнопки голосового ввода Rambler

### 9.1. Почему Rambler нельзя приравнивать к обычным Access Points

По данным исходников (`GboardRamblerStockPolicy.java`, `GboardRamblerOfficialSelectorPatch.kt`, `GboardRamblerResetHeader.kt`) и реального скриншота пользователя установлены **четыре критических отличия**:

1. **Изолированная система флагов:** `enable_agentic_dictation`, `enable_rambler_al_toolbar`, `enable_rambler_toolbar_at_cursor_position`, `filter_rambler_contributed_input_view_session`, `show_rambler_dict_settings`, `ad_activation_type = 2L`.
2. **Хрупкий жизненный цикл голосового заголовка:** 5 жёстких SHA-256 отпечатков (`Lflb;`, `Lfkl;`, `Lfkm;`, `Les;`) + патч `Lflz;->J()` → `Lkaf;->h(CharSequence)V`, защищающий от бага повторного захвата заголовка.
3. **Готовая нативная круглая подложка:** на скриншоте пользователя кнопка Rambler (`[Микрофон ✦]`) уже имеет круглую подложку и работает штатно; во время диктовки она трансформируется в активную голосовую панель.
4. **Неизвестный View/CSS-контракт в APK `18.5.4`:** в репозитории нет её View ID, тега или CSS-селектора. Считать её обычным Access Point без доказательства **запрещено**.

### 9.2. Архитектурное правило для кнопки Rambler

- Кнопка Rambler **не модифицируется вообще** ни на одном из этапов.
- На Шаге 5 (V5) проверяется, что общие CSS-правила тулбара не искажают контраст или фон кнопки Rambler; при малейшем искажении правило сужается или удаляется.
- На условном Шаге 7 (если до него дойдёт дело) Rambler обязан быть **явно исключён** по типу элемента (никогда не по индексу!). При невозможности 100% надёжно отделить обычные AP от Rambler — от круглых подложек AP отказываются целиком.

### 9.3. Спецификация потенциального изменения (защита Rambler)

1. **Место:** пакет `rambler/` (`GboardRambler*`) **не изменяется**.
2. **Механизм:** политика неприкосновенности + проверка V5 (и allowlist-фильтрация, если когда-либо рассматривается Шаг 7).
3. **Изменяемые файлы в `rambler/`:** ноль.
4. **Затрагиваемые компоненты:** косвенно — визуальный фон `.keyboard-header-area` вокруг правого слота.
5. **Потенциально уязвимые функции:** запуск/остановка диктовки, анимация микрофона, сброс заголовка (`Lflz;->J()`), `Manual Incognito`, переключение голосовой службы в `VoiceSettingsFragment`.
6. **Уровень риска:** **Высокий** при любой прямой модификации / **Средний** при политике «не трогать + проверка V5».
7. **Проверка:** 5+ циклов старта/остановки диктовки Rambler в Light и Dark, возврат в тулбар, `Manual Incognito`, переключение в `VoiceSettingsFragment`.
8. **Откат:** удаление CSS-правила тулбара; байткод `rambler/` не затрагивался.

**Итоговый вердикт раздела 9:** **Не рекомендуется реализовывать** *(любые прямые модификации кнопки Rambler запрещены; допускается только безопасное сосуществование без её изменения после V5).*

---

## 10. Адаптивность тулбара (3–8 элементов) и необязательный эксперимент с круглыми подложками

### 10.1. Геометрическая плотность на Galaxy S22 5G (~360 dp портрет, ~348 dp рабочая ширина)

Поскольку точная формула включения/исключения `⊞` в `Access Point Count` ещё подлежит проверке в **V9**, ниже приведена оценка ширины на слот по **фактическому числу видимых элементов в строке** (от 5 до 10 слотов, включая меню `⊞` и Rambler):

| Видимых слотов в строке (включая `⊞` и Rambler) | Ширина на 1 слот (портрет ~348 dp) | Ширина в One-handed (~295 dp) | Оценка безопасности круглых подложек |
| --- | --- | --- | --- |
| **5 слотов** (например, `Count = 3` + `⊞` + Rambler) | ~69 dp | ~59 dp | Геометрически просторно (круг `32–36 dp`). |
| **7–8 слотов** (ориентир для `Count = 6`) | ~43–49 dp | ~37–42 dp | Впритык; при One-handed зазор резко сокращается. |
| **9 слотов** *(факт со скриншота пользователя!)* | **~38–39 dp** | **~32–33 dp** | **Критическая плотность:** нативный круг Rambler уже близок к ширине слота; круги `34–36 dp` на левых элементах дадут слипание (`2–4 dp` зазор), а в One-handed — обрезку или перекрытие. |
| **10 слотов** *(если `Count = 8` не включает `⊞` и Rambler!)* | **~34–35 dp** | **~29–30 dp** | **Неприемлемая плотность:** круглые подложки в портрете и One-handed будут неизбежно слипаться или обрезаться. |

### 10.2. Жёсткие правила для необязательного эксперимента с круглыми подложками (Шаг 7)

Круглые подложки Access Points — **необязательный эксперимент, а не обязательная часть проекта**. Они рассматриваются **самыми последними** и подчиняются строгим запретам:

1. **Запрещено:** привязываться к фиксированным индексам (`0..N-1`), привязываться к постоянным позициям, предполагать неизменность числа элементов (количество AP динамически меняется от 3 до 8, элементы добавляются, удаляются и перетаскиваются), допускать «пустые» подложки, допускать смещение оформления при изменении состава панели, изменять обработчики кнопок.
2. **Условие допуска:** допускается **только** если эксперимент **V6** на `Gboard 18.5.4` подтвердит безопасный механизм (в первую очередь чистый CSS), который детерминированно различает типы элементов: обычные AP отдельно от кнопки меню `⊞`, отдельно от кнопки Rambler и отдельно от полосы подсказок (`.candidates-area` / `.for-candidate-key`).
3. **Запрет на рискованные runtime-обходы:** если CSS `18.5.4` не позволяет безопасно различать типы элементов — **от круглых подложек следует отказаться**, не прибегая к хрупким runtime-обходам View-дерева заголовка ради декоративного эффекта.
4. **Отказ от реализации без отдельного согласования:** до отдельного согласования пользователя в тулбаре ничего не реализуется.

### 10.3. Спецификация потенциального изменения (Шаг 7 — необязательный эксперимент)

1. **Место:** не определено до V6 и V9; допустимо в первую очередь в CSS Samsung ZIP-тем, если `18.5.4` поддерживает изолированный селектор подложки только для обычных AP.
2. **Механизм:** селектор/декоратор строго по типу элемента с учётом динамического состава 3–8 AP, One-handed, Floating, Split, `AccessPointDragPopupView` и исключения Rambler.
3. **Файлы:** либо только CSS-темы, либо **полный отказ от реализации** (если CSS недостаточно).
4. **Затрагиваемые компоненты:** `.keyboard-header-area`, `AccessPointCount`, `AccessPointsMenu` (Legacy/Modern), `EditingAccessPoints`, `FrostedGlass`, `Rambler`, `.candidates-area`.
5. **Потенциально уязвимые функции:** кликабельность, drag-and-drop AP, активные состояния кнопок, отображение Rambler, читаемость подсказок, One-handed / Floating.
6. **Уровень риска:** **Высокий**.
7. **Проверка:** все значения `Count = 3, 6, 8`, перетаскивание AP, добавление/удаление AP, поле пароля (без Rambler), One-handed, Floating, Split, подсказки.
8. **Откат:** удаление CSS-правила или полный отказ от Шага 7.

**Итоговый вердикт раздела 10:** **Требуется дополнительное исследование** *(при отсутствии безопасного CSS-различения типов — отказаться от круглых подложек).*

---

## 11. Автоматическое переключение Light / Dark (`Configuration.UI_MODE_NIGHT_MASK`)

### 11.1. Исследуемое направление и критическое ограничение, выявленное в исходниках

Идея автоматического переключения между `Samsung One UI 8 Light` и `Samsung One UI 8 Dark` по системной теме Android (`context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK`) сохраняется как **исследуемое направление (Шаг 6)**, но к ней добавляется критическая оговорка из исходников:

- **[Подтверждено исходниками]** Активная пользовательская тема Gboard задаётся одним ключом `additional_keyboard_theme` (плюс `enable_key_border`) в DE `SharedPreferences` (`context.createDeviceProtectedStorageContext().getSharedPreferences(pkg + "_preferences", MODE_PRIVATE)` — `GboardCustomThemeInstaller.java:65–71`).
- **[Подтверждено исходниками — ВАЖНАЯ НАХОДКА v3.1]** В текущей кодовой базе существуют только два способа активации ZIP-темы:
  1. `GboardCustomThemeGalleryView.handleCommittedInstall()` записывает DE `SharedPreferences` и **вызывает холодный перезапуск всего процесса Gboard (`System.exit(0)`)** через `requestTargetRestart()`.
  2. `GboardCustomThemeOfficialImportRuntime` передаёт имя файла через `Intent` (`intent_extra_key_new_theme_file_name`) в `Lkhl;->i(Intent)V` внутри `ThemeListingFragment` (UI-экран выбора тем, не IME-сервис).
- **Следствие (честный статус):**
  - В исходниках репозитория **НЕ подтверждено**, существует ли у Gboard `18.5.4` штатный `OnSharedPreferenceChangeListener` на `additional_keyboard_theme`;
  - **НЕ подтверждено**, когда Gboard перечитывает `additional_keyboard_theme` (сразу при записи, при следующем `onStartInputView` / переоткрытии клавиатуры или только при холодном старте процесса);
  - **Мгновенное переключение без перезапуска клавиатуры НЕ заявляется и НЕ гарантируется** до эксперимента **V7** на Galaxy S22 5G!
  - **Жёсткий запрет:** вызывать `System.exit(0)` или `Process.killProcess` из IME-сервиса (`Lphr;`) ради авто-переключения темы **категорически запрещено** (обрывает ввод, теряет composing text, противоречит Приоритету №1).

### 11.2. Подтверждённые точки наблюдения и ограничения `Lphr;`

- **[Подтверждено исходниками]** Точки жизненного цикла в `Lphr;` (`gboard-version-bindings.json`): `onStartInputView(EditorInfo, Z)`, `onWindowShown()`, `onConfigureWindow(Window, Z, Z)`.
- **[Архитектурное предположение]** Точка `onConfigurationChanged(Configuration)` в `18.5.4` в `gboard-version-bindings.json` сейчас **не привязана** — её наличие/обфускация потребуют отдельной проверки, если понадобится реакция при уже открытой клавиатуре.
- **Производительность:** установка/валидация обоих ZIP (`Light` и `Dark`) должна выполняться **заранее** в Settings UI (когда пользователь включает режим), чтобы на горячем пути `onStartInputView` не было никакого файлового I/O и ZIP-распаковки (только идемпотентная проверка флагов и при несовпадении — запись в DE `SharedPreferences`).

### 11.3. Возможные исходы эксперимента V7

1. *Исход A (лучший):* Gboard `18.5.4` реагирует на запись `additional_keyboard_theme` немедленно (есть штатный listener) или при следующем открытии клавиатуры (`onStartInputView`) без рестарта процесса → авто-переключение реализуемо безопасно (с честным описанием момента обновления в UI).
2. *Исход B (ограничение Gboard):* Gboard `18.5.4` кэширует `additional_keyboard_theme` в памяти на всё время жизни процесса и **не перечитывает** его без перезапуска процесса → автоматическое переключение из `Lphr;` **не сработает без недопустимого `System.exit(0)`**; в этом случае от автоматического переключения следует **отказаться или отложить его**, оставив ручной выбор Light / Dark с применением через Settings UI.

### 11.4. Спецификация потенциального изменения (Шаг 6: авто-переключение Light/Dark)

1. **Точное место:** существующий lifecycle-композитор `Lphr;` (`onStartInputView` / `onWindowShown`) + новый пакет `extension/samsungappearance/`.
2. **Механизм:** проверка `isUserUnlocked` → чтение режима из CE `gboard_patches_settings` → чтение `Configuration.UI_MODE_NIGHT_MASK` → проверка существования целевого ZIP в CE `getFilesDir()` → проверка `Ownership Check` → идемпотентная запись `additional_keyboard_theme` в DE `SharedPreferences` (только при положительном результате V7!).
3. **Изменяемые файлы:** `GboardSamsungAppearanceRuntime.java`, `GboardSamsungAppearanceSettings.java`, регистрация в `Lphr;`, экран настроек в группе `Клавиши, макет и символы` (RU/EN) + `GboardSettingsSearchIndexData.java`.
4. **Затрагиваемые компоненты:** `Lphr;` lifecycle hooks (`Frosted Glass`, `Manual Incognito`, `Editing Access Points`, `Calculator`), `GboardCustomThemeInstaller`, DE `<pkg>_preferences`.
5. **Потенциально уязвимые функции:** время открытия IME, `Custom Theme`, `Frosted Glass` (перерасчёт прозрачности после смены темы), сохранность ручного выбора темы пользователем.
6. **Уровень риска:** **Средний / Высокий** до прохождения V7 и V8.
7. **Проверка:** переключение системной темы при закрытой и открытой клавиатуре, ручной выбор другой темы в Gboard → «Тема», перезагрузка устройства (Direct Boot).
8. **Откат:** выключить режим в настройках (восстановит исходную тему по схеме Раздела 12) или удалить вызов из `Lphr;`.

**Итоговый вердикт раздела 11:** **Требуется дополнительное исследование** *(критически зависит от результата эксперимента V7: перечитывает ли `Gboard 18.5.4` ключ `additional_keyboard_theme` без перезапуска процесса).*

---

## 12. Сохранение и восстановление пользовательских настроек

### 12.1. Полная модель состояния и 10 сценариев устойчивости

Чтобы автоматический режим **никогда** не перезаписывал навсегда пользовательскую тему и не оставлял битых ссылок, проектируется строгий снимок исходного состояния в CE `gboard_patches_settings` до первой записи Samsung-темы:

| Ключ в CE `gboard_patches_settings` | Тип | Назначение |
| --- | --- | --- |
| `pref_samsung_appearance_backup_valid` | `boolean` | Маркер активного снимка (запрещает перезаписывать бэкап нашей же Samsung-темой при переключении Light↔Dark). |
| `pref_samsung_appearance_prev_theme_present` | `boolean` | Физическое наличие ключа `additional_keyboard_theme` (`prefs.contains(...)`) до активации. |
| `pref_samsung_appearance_prev_theme_value` | `String` | Прежнее значение `additional_keyboard_theme` (если `present == true`). |
| `pref_samsung_appearance_prev_border_present` | `boolean` | Физическое наличие ключа `enable_key_border` (`prefs.contains(...)`). |
| `pref_samsung_appearance_prev_border_value` | `boolean` | Прежнее значение `enable_key_border` (если `present == true`). |
| `pref_samsung_appearance_owned_light_file` | `String` | Имя установленного нами Light ZIP (уникальный префикс, не пересекается с пользовательскими файлами). |
| `pref_samsung_appearance_owned_dark_file` | `String` | Имя установленного нами Dark ZIP. |

#### Разбор всех 10 обязательных сценариев (включая частичное выполнение и ошибки)

1. **Исходная активная тема пользователя (сток Dynamic Color / `assets:...` / `files:user_theme_...` / фото-тема):** сохраняется пара `(contains, value)` до первой записи; при `present == false` восстановление выполняется строго через `editor.remove("additional_keyboard_theme")`, а не пустой строкой.
2. **Исходное значение `enable_key_border`:** аналогично сохраняется `(contains, value)` и восстанавливается через `remove` либо `putBoolean`.
3. **Ручная смена темы пользователем (модель передачи управления — Ownership Check):** при каждом срабатывании авто-режима проверяется текущее значение `additional_keyboard_theme`. Если оно **не совпадает** ни с `files:<owned_light>`, ни с `files:<owned_dark>` (значит, пользователь сам выбрал тему в Gboard → «Тема» или в галерее `Custom Theme`), авто-режим **немедленно уступает управление**: не перезаписывает `additional_keyboard_theme`, переводит себя в состояние «Выключено» и сбрасывает `backup_valid = false`, сохраняя новый выбор пользователя нетронутым!
4. **Отключение автоматического режима:** если владение ещё за нами (`additional_keyboard_theme` указывает на наш Light или Dark ZIP), восстанавливаются сохранённые `additional_keyboard_theme` и `enable_key_border`, после чего `backup_valid = false`.
5. **Повторное включение автоматического режима:** так как `backup_valid == false`, делается **свежий снимок** актуальных на этот момент настроек пользователя (если пользователь успел сменить тему за время отключения — сохранится именно новая тема, а не устаревшая).
6. **Удаление или замена исходной пользовательской темы:** перед восстановлением `files:<prev_name>` проверяется `new File(context.getFilesDir(), prevName).isFile()`. Если исходный ZIP уже удалён — выполняется безопасный `editor.remove("additional_keyboard_theme")` (откат к стоку вместо битой ссылки). Пользовательские ZIP-файлы нашим кодом **никогда не удаляются**; при установке Samsung ZIP нельзя переиспользовать чужой файл через `findDuplicate` в качестве `owned_*`.
7. **Ошибки установки ZIP (нехватка места, ошибка валидации `Lrnw;->h`, I/O error):** staging-файл удаляется, DE `SharedPreferences` вообще не затрагиваются, `backup_valid` не выставляется, режим остаётся в `OFF` с понятным сообщением пользователю.
8. **Частичное выполнение операции (краш/убийство процесса между установкой 1-го и 2-го ZIP или между записью снимка и записью DE-ключа):**
   - Порядок операций строго транзакционный по инварианту: **(1)** установить и провалидировать оба ZIP в CE → **(2)** синхронно (`commit()`) сохранить снимок в CE `gboard_patches_settings` → **(3)** синхронно (`commit()`) записать `additional_keyboard_theme` в DE → **(4)** включить флаг режима в CE.
   - Если сбой произошёл на шаге (1) — ничего не изменилось. На шаге (2)/(3) — режим остался `OFF`, при следующем запуске лишний `backup_valid` при `mode == OFF` игнорируется и безопасно очищается.
9. **Перезапуск устройства:** DE `<pkg>_preferences` и CE-файлы сохраняются штатно; после разблокировки IME сверяет целостность `owned_light_file` / `owned_dark_file` до переключения.
10. **Direct Boot (до разблокировки):** см. Раздел 13 — авто-переключатель полностью неактивен и не делает никаких записей ни в CE, ни в DE.

*Примечание по `Backup & Restore` и `Frosted Glass`:* ключи снимка (`backup_valid`, `prev_*`, `owned_*`) являются локально-привязанными к файлам конкретного устройства и должны исключаться из кросс-устройственного экспорта настроек; `Frosted Glass` продолжает работать штатно поверх любой активной темы.

### 12.2. Спецификация потенциального изменения (Snapshot / Restore)

1. **Место:** `GboardSamsungAppearanceSettings.java` (новый класс), использующий `GboardPatchesSettings` (CE) и DE `<pkg>_preferences`.
2. **Механизм:** упорядоченный 4-шаговый `commit()`, `Ownership Check`, проверка существования `files:` при восстановлении.
3. **Файлы:** `GboardSamsungAppearanceSettings.java` + unit-тесты всех 10 сценариев.
4. **Затрагиваемые компоненты:** CE `gboard_patches_settings`, DE `<pkg>_preferences`, `GboardBackupRestore`.
5. **Потенциально уязвимые функции:** сохранность исходной пользовательской темы и `enable_key_border`.
6. **Уровень риска:** **Средний** (необходимо подтвердить на `18.5.4`, что `editor.remove("additional_keyboard_theme")` корректно возвращает стоковый Dynamic Color).
7. **Проверка:** unit-тесты всех 10 веток + ручной прогон на Galaxy S22 (Dynamic Color → Samsung → Off; Custom Theme → Samsung → Off; Samsung → ручной выбор другой темы → смена системной темы не перезаписывает выбор).
8. **Откат:** ручной выбор темы в Gboard → «Тема» немедленно забирает управление через `Ownership Check`.

**Итоговый вердикт раздела 12:** **Можно реализовывать после проверки на устройстве**

---

## 13. Direct Boot и хранение данных (CE vs DE)

### 13.1. Подтверждённая карта хранилищ [Подтверждено исходниками]

| Данные | Источник в репозитории | Хранилище | Доступно в Direct Boot (до ввода PIN)? |
| --- | --- | --- | --- |
| ZIP-файлы тем (`user_theme_*.zip`) | `GboardCustomThemeInstaller.java` (стр. 38, 118, 126) | **`context.getFilesDir()` — CE** (`/data/user/0/<pkg>/files`) | **НЕТ** (`IllegalStateException` при доступе до разблокировки) |
| Ключи `additional_keyboard_theme`, `enable_key_border` | `GboardCustomThemeInstaller.java` (стр. 65–71) | **`createDeviceProtectedStorageContext().getSharedPreferences(...)` — DE** | **ДА** |
| Настройки патчей (`gboard_patches_settings`) | `GboardPatchesSettings.java` (стр. 21–28, 55–89) | **CE** за проверкой `isUserUnlocked(context)` | **НЕТ** (fail-closed → `null` / `fallback`) |

### 13.2. Почему нельзя переносить ZIP-файлы в DE без доказательства

- В Android `context.getFilesDir()` (CE) и `context.createDeviceProtectedStorageContext().getFilesDir()` (DE) — это **два разных каталога файловой системы** (`/data/user/0/...` и `/data/user_de/0/...`).
- **[Подтверждено исходниками]** Существующий рабочий `Custom Theme` (`GboardCustomThemeInstaller.java`) кладёт ZIP строго в **CE `context.getFilesDir()`**, а в DE-преференсы пишет `"files:" + committed.getName()`.
- В репозитории **отсутствуют доказательства**, что внутренний загрузчик `"files:"` в `Gboard 18.5.4` умеет читать DE `filesDir`. Перенос ZIP в DE без проверки реального загрузчика способен сломать загрузку темы даже после разблокировки! **Не менять существующую архитектуру хранения без доказанной необходимости.**

### 13.3. Поведение до разблокировки и почему одного `isUserUnlocked()` недостаточно

1. **Когда безопасно устанавливать тему:** исключительно после разблокировки пользователя (`isUserUnlocked == true`) и из Settings UI (или в момент, когда подтверждён доступ одновременно к CE `getFilesDir()`, CE `gboard_patches_settings` и DE `<pkg>_preferences`).
2. **Что произойдёт при запуске IME до разблокировки (Direct Boot):**
   - Наш код не может прочитать CE `gboard_patches_settings` и не может проверить наличие ZIP в CE `getFilesDir()`.
   - Сам Gboard `18.5.4` увидит DE-ключ `additional_keyboard_theme = "files:..."`, но физический ZIP в CE в этот момент заблокирован системой Android! Как именно поведёт себя загрузчик `18.5.4` (тихий откат к стоку или исключение) — **не доказано по исходникам** и обязательно проверяется в тесте **V8** (перезагрузка Galaxy S22 с активной Custom Theme / Samsung ZIP до ввода PIN).
3. **Почему одной проверки `isUserUnlocked()` недостаточно для доказательства безопасности:**
   - `isUserUnlocked()` защищает наш код от `IllegalStateException` при чтении CE, но **НЕ гарантирует**: (а) что сам Gboard `18.5.4` безопасно обработает `"files:..."` в DE до разблокировки; (б) что сразу после разблокировки файлы не были удалены/повреждены; (в) что не произойдёт гонка записи DE-преференсов до завершения инициализации CE; (г) что при сбое записи снимка не потеряются исходные настройки пользователя.
4. **Безопасная деградация (обязательный принцип):**
   - До полной доступности **всех** необходимых данных (`isUserUnlocked == true`, успешно прочитан CE `gboard_patches_settings`, физически существует целевой ZIP в CE `getFilesDir()`, и успешно прочитан DE `<pkg>_preferences`) **не выполнять никаких переключений и записей темы** (строгий no-op).
   - Никогда не модифицировать DE `additional_keyboard_theme` в Direct Boot, чтобы не стереть или не испортить сохранённую конфигурацию пользователя до проверки `Ownership Check`.

### 13.4. Спецификация потенциального изменения (политика хранения и Direct Boot)

1. **Место:** переиспользование CE-каталога `GboardCustomThemeInstaller` + многоступенчатый guard (unlock + CE prefs + file exists + ownership) в будущих runtime-классах.
2. **Механизм:** установка ZIP только в разблокированном состоянии; в Direct Boot — полная деградация в no-op без записи в DE/CE.
3. **Файлы:** новые классы будущего Шага 6 (без изменения хранилища `GboardCustomThemeInstaller`).
4. **Затрагиваемые компоненты:** CE `getFilesDir()`, CE `gboard_patches_settings`, DE `<pkg>_preferences`.
5. **Потенциально уязвимые функции:** первый запуск IME после перезагрузки (ввод PIN/пароля), сохранность настроек темы.
6. **Уровень риска:** **Средний** (код расширения fail-closed, но реакция загрузчика `Gboard 18.5.4` на `"files:..."` в Direct Boot требует реальной проверки V8).
7. **Проверка:** полная перезагрузка Galaxy S22 5G с активной ZIP-темой → экран PIN до разблокировки → разблокировка → открытие клавиатуры.
8. **Откат:** выключение режима удаляет `"files:..."` из DE `SharedPreferences` и возвращает исходное значение.

**Итоговый вердикт раздела 13:** **Можно реализовывать после проверки на устройстве** *(обязателен тест V8; при проблемах Gboard в Direct Boot — не переносить в DE вслепую, а провести отдельное исследование загрузчика `18.5.4`).*

---

## 14. Совместимость с Custom Theme, Frosted Glass и всеми функциями Gboard / GboardSamsung

| # | Функция / режим | Механизм взаимодействия | Риск конфликта | Защитные меры |
| --- | --- | --- | --- | --- |
| 1 | **Custom Theme** (импорт ZIP и галерея) | Общий ключ `additional_keyboard_theme` (DE) и каталог `getFilesDir()` (CE). | Средний | Снимок/восстановление (Раздел 12), `Ownership Check`, уникальные имена Samsung ZIP, запрет удаления пользовательских ZIP. |
| 2 | **Frosted Glass** (размытие и прозрачность) | `GboardFrostedGlassRuntime` меняет `Drawable.setAlpha(...)` на `.keyboard-base-area`, `.keyboard-header-area`, `.keyboard-body-area`, `.keytop`, `.space_bar`, `.background-icon.for-action-key`. | Средний | Чистые CSS-заливки без нестандартных обёрток; обязательный тест с прозрачностью 0%/50%/100%; шевроны в `ViewOverlay` не трогают `background` `.space_bar`. |
| 3 | **Swipe typing** (ввод жестами) | `ScrubMotionEventHandler` / движок Gboard. | Низкий | Ни CSS, ни пассивный `ViewOverlay` не касаются `MotionEvent`; проверить контраст линии следа в Light и Dark. |
| 4 | **Переключение языков** (глобус / системные субтипы) | `GboardSpacebarGlobeKeyRuntime` (`SoftKeyView.s`, `afterOrder = 900`). | Низкий | Шевроны независимы от видимости глобуса, используют `afterOrder = 950` и фильтр `KEYCODE_SPACE == 62`. |
| 5 | **Samsung Spacebar Gestures** (свайп по пробелу) | Перехват `MotionEvent` в `KeyboardViewHolder`. | Низкий | Шевроны абсолютно пассивны и полностью независимы от тоггла свайпа по пробелу; обязателен регрессионный тест. |
| 6 | **Удержание пробела и перемещение курсора** | `FreeCursorMotionEventHandler` / `TriggerFreeCursorMotionEventHandler`. | Низкий | Нулевое вмешательство в `MotionEvent`, отсутствие `requestLayout()`. |
| 7 | **Swipe Down to Dismiss Keyboard** | Перехват свайпа вниз от заголовка/подсказок. | Низкий | Шевроны и CSS-темы полностью независимы и не затрагивают touch-диспетчер заголовка. |
| 8 | **Clipboard** (буфер обмена + лимиты) | `ClipboardKeyboard` наследует `.keyboard-base-area`, `.keyboard-header-area`, карточки буфера. | Средний | Проверить контраст текста карточек, закреплённых элементов и кнопок в Light и Dark. |
| 9 | **Emoji / GIF / Stickers** | Панели `Expression`, поиск и нижние вкладки категорий. | Средний | Проверить контраст строки поиска, активной вкладки и фона в Light и Dark. |
| 10 | **Подсказки (Suggestions / Autocorrect / Inline)** | `.candidates-area` внутри `.keyboard-header-area`; `.for-candidate-key` защищён даже в `Frosted Glass`. | Средний | Контрастный цвет текста кандидатов; не добавлять непрозрачный фон на неактивный `.for-candidate-key` и не привязывать подложки AP к области кандидатов. |
| 11 | **Вторичные символы** (`.label.secondary`) | Верхний правый угол клавиш (включены у пользователя). | Средний | Оригинальная карта Gboard не меняется; проверить читаемость в RU (11 кол.) и EN (10 кол.). |
| 12 | **Long press и popup-клавиши** | Всплывающее окно альтернатив + `Long Press Quick Actions`. | Средний | Проверить контраст фона и текста popup в Light и Dark (частый дефект сторонних CSS-тем). |
| 13 | **Action Keys** (`Enter`, `Search`, `Send`, `Done`, `Next`, `Go`) | Заливка `.background-icon.for-action-key` может быть отдельным `ImageView.getDrawable()`. | Средний | Проверить все 6 типов Action Key в Light и Dark (V3); синий акцент только при безопасных селекторах. |
| 14 | **Seamless Navigation Bar / Nav bar (API 36)** | `Lrra;->f(Window, Lrqz;)` (`STOCK_STRIP_SDK = 36`). | Средний | Проверить совпадение цвета нижней полосы и корректность `Lrqz;->e` (светлые/тёмные системные иконки) в Light, Dark и с `Frosted Glass`. |
| 15 | **Floating keyboard** | Произвольная ширина, ручка перетаскивания, ресайз. | Средний | Проверить контраст ручки; адаптивное уменьшение/скрытие шевронов; отсутствие тесных подложек. |
| 16 | **Split keyboard** | Две узкие половинки пробела с `KEYCODE_SPACE`. | Средний | Авто-скрытие шевронов на узких половинках; проверка симметрии и фона разрыва. |
| 17 | **One-handed mode** | Сжатие ширины ~15–20% + боковая панель. | Средний | Проверить контраст боковых кнопок; динамическое уменьшение/скрытие шевронов; защита от слипания тулбара. |
| 18 | **Dynamic Color** | Системная палитра Material You. | Средний | При выключенном Samsung Appearance — 100% сохранение Dynamic Color; для шевронов поверх Dynamic Color требуется проверка V4 (цвет не гарантирован заранее). |
| 19 | **Key Shape Selection (`more_pill_keys`)** | Флаг в `GboardFeatureFlagsRuntime` (order `40`). | Средний | Патч не удалять и не ломать; зафиксировать реальное взаимодействие с CSS в V2. |

**Итоговый вердикт раздела 14:** **Можно реализовывать после проверки на устройстве**

---

## 15. Матрица рисков

Ни одному пункту не присвоен уровень `Низкий`, если отсутствует прямое доказательство в коде и/или на устройстве `18.5.4`.

| ID | Риск | Компонент / шаг | Вероятность | Тяжесть | Итоговый уровень | Смягчение и триггер остановки |
| --- | --- | --- | --- | --- | --- | --- |
| **R1** | Искажение или поломка кнопки Rambler (двойной круг, обрезка диктовки, баг `Lflb`/`Lkaf`). | Тулбар (Шаги 5, 7) | Высокая (при наивной правке) | Критическая | **Высокий** | Запрет модификации Rambler; проверка V5; если на Шаге 7 нет 100% изоляции без индексов — **отказ от Шага 7**. |
| **R2** | Слипание, обрезка или пустые подложки AP при динамическом `Count = 3..8` и в One-handed/Floating. | Круглые подложки AP (Шаг 7) | Высокая | Высокая | **Высокий** | Сначала эксперимент V9 + V6; только безопасный CSS по типу элемента; при малейших проблемах — **отказ от Шага 7**. |
| **R3** | «Призрачные» шевроны на другой клавише после recycling `SoftKeyView` или смещённые bounds / плохой контраст в Custom Theme / Dynamic Color. | Шевроны пробела (Шаг 4) | Средняя | Высокая | **Высокий / Средний** | Двойной барьер (`afterSoftKeyBind` + проверка keycode в `draw`), привязка к `.space_bar`, замер текста, авто-скрытие; при провале V4 — **отложить Шаг 4**. |
| **R4** | Gboard `18.5.4` не перечитывает `additional_keyboard_theme` без `System.exit(0)` (подтверждено, что галерея `Custom Theme` делает cold restart!). | Авто Light/Dark (Шаг 6) | Высокая / Средняя | Высокая | **Высокий / Средний** | Обязательный пред-гейт V7; **запрет `System.exit(0)` из IME**; если живого обновления нет — отказаться/отложить авто-переключение. |
| **R5** | Нечитаемые Action Keys, popup long-press, вторичные символы, подсказки или карточки буфера из-за неподтверждённых CSS-свойств в `18.5.4`. | CSS ZIP-темы (Шаги 1–3) | Средняя | Высокая | **Средний** | Проверка через штатный `Custom Theme` без правок runtime; полный прогон V1–V3 на Galaxy S22. |
| **R6** | `more_pill_keys` (`Key Shape Selection`) перекрывает CSS-форму `?123` / `Enter`. | Геометрия клавиш (Шаг 3) | Средняя | Низкая / Средняя | **Средний** | Проверить в V2; не ломать `Key Shape Selection` и не добавлять bytecode-хаки формы клавиш. |
| **R7** | Перенос ZIP в DE ломает `"files:"` в `18.5.4`, либо CE-блокировка в Direct Boot вызывает сбой до ввода PIN. | Хранение ZIP / Direct Boot (Шаги 3, 6) | Средняя (при переносе в DE) / Низкая (в CE + деградация) | Критическая | **Средний** | Запрет переноса в DE без доказательства; полная деградация (no-op) до доступности CE+DE; обязательный тест V8. |
| **R8** | Потеря исходной темы или `enable_key_border` при частичном выполнении, ручном выборе темы или повторном включении авто-режима. | Backup/Restore (Шаг 6) | Низкая (при 4-шаговом commit + Ownership Check) | Средняя | **Средний** | 4-шаговый порядок записи, проверка `contains()`, `Ownership Check`, проверка существования `files:` при восстановлении. |
| **R9** | Конфликт CSS-тем с `Frosted Glass` (прозрачность поверхностей/клавиш, Seamless Nav Bar). | Совместимость (Шаг 3) | Средняя | Средняя | **Средний** | Стандартные CSS-заливки без нестандартных обёрток; тест `Frosted Glass` на 0%/50%/100% прозрачности. |
| **R10** | Попытка переписать `SoftKeyboardView` / обработчики касаний / приватные классы рендера ради 100% копии One UI 8. | Любой шаг | — | Критическая | **Недопустимый** | **Строго запрещено.** Лучше отказаться от декоративной детали, чем сломать клавиатуру. |

**Итоговый вердикт раздела 15:** **Можно реализовывать после проверки на устройстве**

---

## 16. Рекомендуемая модульная архитектура (уточнена в v3.1)

В редакции v3.1 исправлена схема настроек из v3: **«Шевроны переключения языка на пробеле»** полностью отделены от блока «Внешний вид Samsung One UI 8» и размещены в уже существующем экране **«Язык» (`GboardLanguageSettingsFeature`)**:

```
┌────────────────────────────────────────────────────────────────────────────┐
│ Настройки GboardSamsung (GboardPatchesSettingsActivity, RU + EN)           │
│                                                                            │
│ 1) Существующий экран «Язык» (GboardLanguageSettingsFeature)               │
│    └─ Секция «Переключение языка»:                                         │
│        ├─ Переключение языка свайпом по пробелу     (уже есть, независим)  │
│        ├─ Скрыть клавишу переключения языка         (уже есть, независим)  │
│        └─ Шевроны переключения языка на пробеле     (НОВЫЙ, по умолч. Выкл)│
│                                                                            │
│ 2) Существующая группа «Клавиши, макет и символы»                          │
│    └─ (После Шагов 1–3 и V7) Внешний вид Samsung One UI 8:                 │
│        └─ Режим темы: Выкл / Светлая / Тёмная / [Авто — только после V7]  │
└──────────────────────────┬──────────────────────────────┬──────────────────┘
                           │ (CE: gboard_patches_settings │  + Direct Boot guard)
              ┌────────────▼────────────┐   ┌─────────────▼─────────────┐
              │ НЕЗАВИСИМЫЙ СЛОЙ        │   │ СЛОЙ ОФОРМЛЕНИЯ SAMSUNG   │
              │ Шевроны пробела (Шаг 4) │   │ (Шаги 1–3, 5, 6)          │
              │ [ТОЛЬКО ПОСЛЕ V4!]      │   │                           │
              │ • SoftKeyView.s (950)   │   │ • Шаги 1–3: CSS ZIP-темы  │
              │ • KEYCODE_SPACE == 62   │   │   Light & Dark через      │
              │ • Пассивный ViewOverlay │   │   штатный Custom Theme    │
              │   + проверка в draw()   │   │ • Шаг 5: CSS фона/цветов  │
              │ • Границы .space_bar,   │   │   тулбара (без Rambler!)  │
              │   адаптивный размер/цвет│   │ • Шаг 6 (после V7/V8):    │
              │ • 0 касаний MotionEvent │   │   Авто Light/Dark в Lphr; │
              │ • Не связан с темой!    │   │   + Snapshot/Ownership    │
              └─────────────────────────┘   │ • Шаг 7 (опционально):    │
                                            │   Круги AP — только если  │
                                            │   безопасный CSS по типу  │
                                            └───────────────────────────┘
```

### Ключевые архитектурные инварианты

1. **Пространство имён и совместимость:** все технические namespaces (`dev.jason.gboardpatches`, `extensions/gboard-patches.rve`) и поддержка `Package Rename` сохраняются без изменений.
2. **Абсолютная независимость подфункций:** шевроны пробела не зависят от Samsung Appearance, `Samsung Spacebar Gestures`, `Swipe Down to Dismiss`, видимости глобуса и активной темы; выбор Samsung-темы не включает шевроны автоматически.
3. **Нулевое вмешательство в ввод и Rambler:** движок клавиатуры, `MotionEvent`, жесты, карта вторичных символов, `Key Shape Selection` и пакет `rambler/` не изменяются.
4. **Безопасная деградация вместо жёстких обходов:** при провале V4 — отложить шевроны; при провале V6 — отказаться от круглых подложек AP; при провале V7 — отказаться от авто-переключения без перезапуска (запрет `System.exit(0)` в IME).

**Итоговый вердикт раздела 16:** **Можно реализовывать после проверки на устройстве**

---

## 17. Рекомендуемая последовательность будущей реализации (7 независимых шагов)

> **Важно:** это план исследования и возможной поэтапной реализации, а **не** разрешение немедленно менять код. Никаких рискованных изменений в одном этапе не объединяется; переход к следующему шагу разрешён только после закрытия ворот проверки предыдущего.

1. **Шаг 1 — Подготовить CSS ZIP-темы Samsung One UI 8 Light и Dark:**
   - Создать два чистых автономных архива (`samsung_oneui8_light.zip` и `samsung_oneui8_dark.zip`) формата `format_version: 3`, проверенных по `GboardThemeImportContract` (палитра, клавиши, границы, тени, вторичные символы, popup-клавиши, аккуратные Action Keys). **Ноль изменений в runtime и патчах.**
2. **Шаг 2 — Проверить их штатным механизмом импорта `Custom Theme`, не меняя runtime:**
   - Импортировать оба ZIP на Galaxy S22 5G (`v4.4.2`, `Gboard 18.5.4`) через уже работающий `Custom Theme` (`ThemeListingFragment` → «+» → ZIP) и убедиться, что `Lrnw;->h(File)Z` принимает оба архива без ошибок.
3. **Шаг 3 — Проверить внешний вид и совместимость на `Gboard 18.5.4`:**
   - Закрыть на реальном устройстве эксперименты **V1** (CSS-свойства и контраст), **V2** (`Key Shape Selection` / `more_pill_keys`), **V3** (все 6 Action Keys), **V8** (Direct Boot до ввода PIN), а также проверить `Frosted Glass`, `Clipboard`, `Emoji`, `Suggestions`, `Nav bar`, `Floating`, `Split`, `One-handed`, RU/EN/цифры/символы/popup. Откалибровать палитру и радиусы по живому экрану.
4. **Шаг 4 — Отдельно исследовать и реализовать настройку шевронов (только если механизм признан безопасным):**
   - Сначала провести диагностику **V4** на `18.5.4` (структура `SoftKeyView`, `.space_bar`, `TextView`, цвет при Dynamic Color/Custom Theme, recycling across layouts, Floating/Split/One-handed).
   - Только если `ViewOverlay` с двойным барьером recycling доказал 100% безопасность и отсутствие артефактов — реализовать самостоятельную настройку «Шевроны переключения языка на пробеле» в секции «Переключение языка» (`GboardLanguageSettingsFeature`), выключенную по умолчанию. Если безопасность не подтверждена — отложить Шаг 4.
5. **Шаг 5 — Исследовать оформление фона и цветов верхнего тулбара:**
   - Провести эксперименты **V9** (`Access Point Count` = 3, 6, 8) и **V5** (CSS `.keyboard-header-area`, цвета иконок и кандидатов, неприкосновенность Rambler).
   - Внести в CSS-темы только подтверждённые безопасные правила фона и цветов, не затрагивая Rambler и подсказки.
6. **Шаг 6 — Только после подтверждения предыдущих этапов исследовать автоматическое переключение Light/Dark:**
   - Провести эксперимент **V7** (перечитывает ли `Gboard 18.5.4` ключ `additional_keyboard_theme` без `System.exit(0)`) и повторно проверить **V8** (Direct Boot).
   - Только при безопасном результате V7 реализовать встроенную установку тем, 4-шаговый Snapshot/Restore с `Ownership Check`, переключение по `Configuration.UI_MODE_NIGHT_MASK` в `Lphr;` и RU/EN UI.
7. **Шаг 7 — Круглые подложки Access Points рассматривать последними и только при наличии безопасного способа различать типы элементов:**
   - Провести пред-гейт **V6** на основе результатов **V9**.
   - Реализовывать **исключительно** если существует безопасный (предпочтительно CSS) способ отличать обычные AP от кнопки `⊞`, Rambler и подсказок без привязки к индексам и без слипания при `3..8` и One-handed. В противном случае — **официально отказаться от Шага 7**.

**Итоговый вердикт раздела 17:** **Можно реализовывать после проверки на устройстве**

---

## 18. Проверка совместимости и расширенная тестовая матрица

> **Статус выполнения:** ни один из перечисленных ниже тестов **фактически ещё не выполнялся**, так как текущая задача — строго технический аудит и документация без модификации кода.

### 18.1. Автоматические JVM / Robolectric тесты (проектируются для будущих этапов)

1. Валидация Samsung ZIP-архивов контрактом `GboardThemeImportContract` (структура, размеры, `metadata.json`, защита от path traversal).
2. Unit-тесты `GboardSamsungAppearanceSettings` на все 10 сценариев Snapshot / Restore / `Ownership Check` / частичный сбой / Direct Boot (`isUserUnlocked == false` → no-op).
3. Unit/Robolectric-тесты `GboardSpacebarChevronRuntime` (если Шаг 4 допущен): привязка только на `KEYCODE_SPACE == 62`, очистка при recycling на другой keycode, проверка keycode в `draw()`, скрытие при узкой ширине / коллизии с текстом, независимость от `Samsung Spacebar Gestures` и от темы, мгновенное снятие `ViewOverlay` при выключении тоггла.
4. Unit-тесты локализации RU/EN (`gboard_settings_text.xml`) и поискового индекса (`GboardSettingsSearchIndexData`).

### 18.2. Полная матрица тестирования на реальном устройстве (Galaxy S22 5G, Android 16 / One UI 8, Gboard 18.5.4)

#### A. Языки и раскладки

| Тест | Цель | Проверяемое поведение | Критерий успеха | Возможный риск | На устройстве |
| --- | --- | --- | --- | --- | --- |
| **T-L1** | Русская раскладка (11 кол.) | Отображение букв, цифр, вторичных символов, пробела `Русский` в Light и Dark. | Нет обрезки букв и вторичных символов, высокий контраст, ровные границы клавиш. | Слишком узкие клавиши при некорректных `padding_ratio_*`. | Обязательно |
| **T-L2** | Английская раскладка (10 кол.) | Отображение QWERTY, вторичных символов, пробела `English (US)`. | Соответствие палитре One UI 8, чёткое разделение буквенных и функциональных клавиш. | Визуальный дисбаланс с русской раскладкой. | Обязательно |
| **T-L3** | Переключение между языками | Переключение свайпом по пробелу, клавишей глобуса и системным диалогом при вкл/выкл шевронах. | Язык переключается мгновенно; при вкл шевронах текст пробела обновляется без дублей и залипаний. | Задержка, «призраки» или сбой `Samsung Spacebar Gestures`. | Обязательно |
| **T-L4** | Длинные названия языков | Языки с длинной подписью на пробеле (например, `English (US)`, двуязычный режим) + увеличенный системный шрифт. | Шевроны уменьшаются или полностью скрываются при зазоре `< 6 dp`, никогда не наезжают на текст. | Наложение шевронов на текст языка. | Обязательно |
| **T-L5** | Символьные, цифровые и телефонные раскладки | Переход `QWERTY` → `?123` → `=\<` → цифры / PIN и обратно. | Все клавиши читаемы; на переиспользованных не-пробельных `SoftKeyView` нет «призрачных» шевронов. | Появление шевронов на другой клавише после recycling. | Обязательно |
| **T-L6** | Popup-клавиши (long-press) | Долгое нажатие на буквы (ё, ъ, акценты, цифры) и пунктуацию (`.`, `,`). | Фон и символы всплывающего окна чётко контрастны в Light и Dark; выбор символа работает штатно. | Невидимый текст в popup (частая ошибка CSS-тем). | Обязательно |

#### B. Клавиши и действия

| Тест | Цель | Проверяемое поведение | Критерий успеха | Возможный риск | На устройстве |
| --- | --- | --- | --- | --- | --- |
| **T-K1** | Action Keys (`Enter`, `Search`, `Send`, `Done`, `Next`, `Go`) | Открытие полей чата, браузера, мессенджера, форм входа в Light и Dark. | Все 6 иконок и их подложки контрастны, различимы, выполняют исходное действие. | «Белое на белом» или двойная заливка `.background-icon.for-action-key`. | Обязательно |
| **T-K2** | Обычное нажатие пробела | Серия быстрых тапов пробела при вкл и выкл шевронах. | 100% тапов вставляют пробел без задержек и пропусков. | Побочное влияние на `SoftKeyView`. | Обязательно |
| **T-K3** | Удержание пробела и курсор | Длительное удержание пробела + плавное движение курсора влево/вправо (при вкл/выкл шевронах). | Курсор управляется идентично стабильной `v4.4.2`, нет сброса указателя. | Конфликт с `FreeCursorMotionEventHandler` при неверном хуке. | Обязательно |
| **T-K4** | Функциональные клавиши | `Shift` (строчные/заглавные/Caps Lock), `Backspace` (тап и свайп-удаление), `?123`, `,`, `.`. | Визуально отличны от буквенных; состояние Caps Lock чётко видно; свайп-удаление работает. | Потеря индикации Caps Lock или неконтрастная иконка. | Обязательно |
| **T-K5** | Вторичные символы | Отображение и ввод всех вторичных символов долгим нажатием. | Оригинальная карта Gboard полностью сохранена; символы чётко читаются в Light и Dark. | Низкий контраст `.label.secondary` или обрезка в углу клавиши. | Обязательно |

#### C. Верхний тулбар

| Тест | Цель | Проверяемое поведение | Критерий успеха | Возможный риск | На устройстве |
| --- | --- | --- | --- | --- | --- |
| **T-T1** | `Access Point Count` = `3`, `6`, `8` (Эксперимент V9) | Переключение значения с перезапуском Gboard, подсчёт `⊞`, обычных AP и Rambler. | Зафиксирована точная формула слотов; нет обрезки и наложения элементов. | Неверная оценка ширины слотов и теснота при 8+1/10 слотах. | Обязательно |
| **T-T2** | Изменение состава и порядка AP | Вкл/выкл `Editing Access Points` (`Copy`/`Cut`), перетаскивание AP на бар и обратно (`AccessPointDragPopupView`). | Порядок сохраняется, анимация drag-and-drop плавная, нет «пустых» подложек или смещения стилей. | Поломка `AccessPointDragPopupView` или «прилипшее» оформление. | Обязательно |
| **T-T3** | Голосовой ввод **Rambler** | 5+ циклов запуска/остановки диктовки в Light и Dark, поле пароля (скрытие микрофона), `Manual Incognito`. | Нативный круг Rambler и анимация диктовки на 100% не затронуты; возврат в тулбар без артефактов. | Двойной круг, обрезка диктовки, регрессия `Lflb`/`Lkaf`. | Обязательно |
| **T-T4** | Кнопка меню/сетки (`⊞`) | Открытие панели инструментов в Legacy и Modern режимах `Access Points Menu`. | Иконка `⊞` и плитки внутри меню читаемы в Light и Dark; переключение стилей меню работает. | Потеря контраста иконки меню или фона сетки. | Обязательно |
| **T-T5** | `Clipboard`, `Emoji`, `GIF`, `Suggestions` | Открытие буфера (обычные и закреплённые карточки), панели эмодзи/GIF, активный ввод с подсказками и автоисправлением. | Высокий контраст во всех панелях; нет посторонних рамок/кругов поверх подсказок (`.for-candidate-key`). | Нечитаемый текст подсказок или карточек буфера. | Обязательно |

#### D. Режимы клавиатуры

| Тест | Цель | Проверяемое поведение | Критерий успеха | Возможный риск | На устройстве |
| --- | --- | --- | --- | --- | --- |
| **T-M1** | Стандартный режим | Обычная закреплённая клавиатура в портрете. | Ровные клавиши, корректные отступы, симметричные шевроны (если включены). | Смещение границ относительно `.space_bar`. | Обязательно |
| **T-M2** | Floating Keyboard | Переключение в плавающий режим, перемещение, изменение ширины/размера окна. | Ручка перетаскивания видна; шевроны уменьшаются/скрываются при сужении; нет выхода за границы. | Выход `ViewOverlay` за пределы клавиши при ресайзе. | Обязательно |
| **T-M3** | Split Keyboard | Включение разделённой клавиатуры (ландшафт/планшетный вид). | Обе половинки ровные; шевроны не сжимаются в «кашу» на узких половинках пробела. | Дублирование тесных шевронов на обеих половинках. | Обязательно |
| **T-M4** | One-handed Keyboard | Переключение влево и вправо при `Access Point Count = 8` и включённых шевронах. | Боковые кнопки контрастны; тулбар не слипается; шевроны не наезжают на название языка. | Перекрытие иконок тулбара и обрезка на ~295 dp. | Обязательно |
| **T-M5** | Разные масштабы и ориентации | Портрет ↔ Ландшафт; системный Font Size (мин/макс) и Display Size; настройка высоты клавиатуры Gboard. | Корректный пересчёт bounds и контраста без перезапуска клавиатуры. | Залипшие старые координаты `Drawable` после поворота/масштабирования. | Обязательно |

#### E. Совместимость тем и существующих функций

| Тест | Цель | Проверяемое поведение | Критерий успеха | Возможный риск | На устройстве |
| --- | --- | --- | --- | --- | --- |
| **T-C1** | Samsung Light / Dark + `Custom Theme` | Включение Samsung-темы поверх пользовательской ZIP-темы и последующее выключение / возврат. | Исходная `Custom Theme` и `enable_key_border` восстанавливаются точно; пользовательский ZIP не удалён. | Потеря пользовательской темы или битая ссылка. | Обязательно |
| **T-C2** | `Frosted Glass` + `Seamless Navigation Bar` | Samsung Light/Dark совместно с `Frosted Glass` (0%/50%/100% прозрачность фона и клавиш, расширение на Nav bar на API 36). | Размытие и прозрачность работают; нижняя полоса навигации и её системные иконки контрастны. | Непрозрачные артефакты, чёрные углы или невидимые кнопки Nav bar. | Обязательно |
| **T-C3** | `Dynamic Color` + независимые шевроны | Samsung Appearance = Выкл (активен стоковый Dynamic Color), Шевроны пробела = Вкл. | Клавиатура остаётся в Dynamic Color; шевроны видны и гармонируют (или зафиксировано ограничение цвета). | Неконтрастный или устаревший цвет шевронов после смены обоев. | Обязательно |
| **T-C4** | `Key Shape Selection` (`more_pill_keys`) | Переключение `Key Shape Selection` вкл/выкл при активной Samsung-теме (Эксперимент V2). | Настройка остаётся рабочей; поведение формы `?123` и `Enter` предсказуемо и задокументировано. | Конфликт формы клавиш или неожиданное игнорирование CSS. | Обязательно |
| **T-C5** | `Samsung Spacebar Gestures` + `Swipe Down to Dismiss` | Проверка обеих функций при всех комбинациях: Samsung-тема (вкл/выкл) × Шевроны (вкл/выкл) × Глобус (вкл/выкл). | Ни одна функция не зависит от другой и не имеет регрессий относительно `v4.4.2`. | Нежелательная связность настроек или перехват жестов. | Обязательно |

#### F. Системные условия

| Тест | Цель | Проверяемое поведение | Критерий успеха | Возможный риск | На устройстве |
| --- | --- | --- | --- | --- | --- |
| **T-S1** | Системная светлая / тёмная тема | Запуск клавиатуры при системной светлой и системной тёмной теме Android 16 / One UI 8. | Корректная тема при старте в обоих режимах (при включённом авто-режиме на Шаге 6). | Неверное чтение `UI_MODE_NIGHT_MASK`. | Обязательно |
| **T-S2** | Смена системной темы при открытой и закрытой клавиатуре (V7) | Переключение «Тёмный режим» в шторке Samsung One UI 8: (а) когда клавиатура закрыта; (б) когда клавиатура открыта. | Зафиксирован точный момент смены темы без краша, мерцания и без `System.exit(0)`. | Тема не перечитывается без перезапуска процесса Gboard. | Обязательно |
| **T-S3** | Перезапуск устройства, Direct Boot, блокировка/разблокировка (V8) | Полная перезагрузка Galaxy S22 → экран ввода PIN до разблокировки → разблокировка → блокировка экрана → разблокировка → ввод текста. | Ноль крашей до разблокировки; после разблокировки тема и настройки в целостности. | `IllegalStateException` в CE или сбой загрузчика `"files:"` до ввода PIN. | Обязательно |
| **T-S4** | Ручной выбор темы пользователем поверх авто-режима | Включить авто-режим Samsung → вручную выбрать любую другую тему в Gboard → переключить системную тему Android. | `Ownership Check` уступает управление: ручной выбор пользователя **не перезаписывается**. | Навязчивый возврат Samsung-темы поверх выбора пользователя. | Обязательно |

**Итоговый вердикт раздела 18:** **Можно реализовывать безопасно** *(имеется в виду сама методика тестирования).*

---

## 19. План отката

Архитектура проектируется так, чтобы каждый независимый слой имел **мгновенный откат на устройстве без переустановки APK** и **изолированный кодовый откат по коммитам**:

### 19.1. Пользовательский откат на устройстве

1. **Откат CSS ZIP-тем (Шаги 1–3, 5, 6):** выбрать любую другую тему в штатных настройках **Gboard → Тема** (`Ownership Check` сразу передаёт управление пользователю), либо выключить режим Samsung Appearance (восстанавливаются исходные `additional_keyboard_theme` и `enable_key_border`).
2. **Откат шевронов пробела (Шаг 4):** выключить независимый переключатель **«Шевроны переключения языка на пробеле»** в разделе **«Язык» → «Переключение языка»** — все `Drawable` немедленно удаляются из `ViewOverlay`.
3. **Откат круглых подложек AP (Шаг 7, если вообще будет реализован):** удалить CSS-правило или выключить отдельный независимый переключатель без влияния на тему и шевроны.
4. **Аварийный выход в Direct Boot:** все runtime-хуки полностью бездействуют до доступности CE + DE; на крайний случай пользователь всегда может переключиться на системную «Клавиатуру Samsung» в системном переключателе IME.

### 19.2. Кодовый откат в репозитории

- Каждый шаг реализуется отдельным изолированным PR/коммитом.
- Откат любого шага (например, Шага 4 или Шага 6) выполняется одним `git revert` без затрагивания подтверждённой базы `v4.4.2`, `Custom Theme`, `Frosted Glass`, `Samsung Spacebar Gestures`, `Swipe Down to Dismiss`, `Key Shape Selection` и `Rambler`.

**Итоговый вердикт раздела 19:** **Можно реализовывать безопасно**

---

## 20. Список нерешённых вопросов (техническая сводка)

Краткий перечень технических вопросов, остающихся открытыми до экспериментов на Galaxy S22 5G (`Gboard 18.5.4`) — развёрнутая итоговая классификация приведена в Разделе 21:

1. **CSS-совместимость в `Gboard 18.5.4` (V1, V2, V3, V5):** фактическая поддержка сторонних свойств (`background_shape`, `background_corner_radius`, `elevation`, `shadow_color`, `edge_color`, `padding_ratio_*`) и селекторов (`.keytop.dark`, `.label.secondary`, `.background-icon.for-action-key`, `.icon.for-action-key`, `.icon.access-point-item`, `.background-icon.access-points-menu`).
2. **Приоритет `Key Shape Selection` (`more_pill_keys`) над CSS (V2):** возвращает ли CSS прямоугольную форму `?123` и `Enter` при включённом `more_pill_keys`.
3. **Точная семантика `Access Point Count` в `18.5.4` (V9):** включает ли число `3..8` кнопку меню `⊞` или считает только обычные AP, и как ведёт себя бар при `3`, `6`, `8` и скрытии Rambler.
4. **Безопасность `ViewOverlay` для шевронов на `18.5.4` (V4):** внутренняя иерархия `SoftKeyView` (`.space_bar` и `TextView`), отсутствие «призраков» при всех путях recycling, поведение в Floating/Split/One-handed, и надёжность чтения цвета текста на Dynamic Color и Custom Theme.
5. **Момент перечитывания `additional_keyboard_theme` без `System.exit(0)` (V7):** обновляется ли тема при записи DE `SharedPreferences` сразу, при следующем `onStartInputView`, или только после холодного перезапуска процесса.
6. **Direct Boot и загрузчик `"files:"` в `18.5.4` (V8):** падает ли `18.5.4` или мягко откатывается к стоку до ввода PIN, и читает ли `"files:"` исключительно CE `getFilesDir()`.
7. **Различение типов слотов верхнего тулбара без индексов (V6):** существует ли в `18.5.4` чистый CSS-селектор, отделяющий обычные AP от `⊞`, Rambler и подсказок.

**Итоговый вердикт раздела 20:** **Требуется дополнительное исследование**

---

## 21. Итоговая архитектура и открытые вопросы перед реализацией

### A. Можно реализовывать после документальной проверки

Сюда входят исключительно те части, для которых найден безопасный, полностью обратимый путь с минимальным риском для работоспособности Gboard:

1. **Две автономные CSS ZIP-темы (`Samsung One UI 8 Light` и `Samsung One UI 8 Dark`)** формата `format_version: 3`, валидируемые существующим `GboardThemeImportContract` и `Lrnw;->h(File)Z`, предназначенные для проверки через уже работающий импорт `Custom Theme` **без каких-либо изменений runtime и байткода**.
2. **Безопасное оформление палитры фона, буквенных/функциональных клавиш, пробела и вторичных символов** исключительно средствами CSS (с сохранением оригинальной сетки, карты символов, долгого нажатия, popup-логики и патча `Key Shape Selection`).
3. **Архитектура размещения будущей отдельной настройки шевронов** — 3-й независимый `ToggleRow` («Шевроны переключения языка на пробеле», выключен по умолчанию) внутри уже существующей секции «Переключение языка» экрана `GboardLanguageSettingsFeature` (сама реализация runtime — только после проверки V4!).
4. **Модель хранения и 4-шагового Snapshot / Restore с `Ownership Check`** (сохранение `contains()` + значений `additional_keyboard_theme` и `enable_key_border`, сохранение CE-хранилища ZIP-файлов, запрет удаления пользовательских ZIP) — при условии положительного результата проверок V7 и V8.

### B. Обязательно проверить на устройстве

Всё, что невозможно достоверно подтвердить по исходникам репозитория и что обязательно проверяется на **Samsung Galaxy S22 5G (`SM-S901U1`, Android 16 / One UI 8, `Gboard 18.5.4`, база `v4.4.2`)**:

1. **V1:** принятие Samsung Light/Dark ZIP валидатором `Lrnw;->h(File)Z` и фактический рендер сторонних CSS-свойств (`background_shape`, `background_corner_radius`, `elevation`, `shadow_color`, `edge_color`, `padding_ratio_*`, `.keytop.dark`, `.label.secondary`, popup long-press, Clipboard, Emoji, Suggestions, swipe-след, `Frosted Glass`, `Seamless Navigation Bar`).
2. **V2:** реальное взаимодействие CSS-формы клавиш с существующим патчем `Key Shape Selection` (`more_pill_keys` вкл/выкл) на `?123` и `Enter`.
3. **V3:** контраст и заливка всех 6 типов Action Key (`Enter`, `Search`, `Send`, `Done`, `Next`, `Go`) в Light и Dark (включая проверку синего акцента).
4. **V4:** реальная иерархия `SoftKeyView` пробела (`.space_bar`, `TextView`), проверка `ViewOverlay` по всем 11 пунктам (recycling, «призраки», координаты при ресайзе/повороте/масштабе, Floating, Split, One-handed, адаптация цвета на Light/Dark/Samsung/Dynamic Color/Custom Theme).
5. **V5:** работа CSS-селекторов верхнего тулбара (`.keyboard-header-area`, иконки, кандидаты) и подтверждение нулевого искажения кнопки **Rambler**.
6. **V6:** проверка, существует ли в `18.5.4` безопасный механизм различения типов слотов тулбара (обычные AP vs `⊞` vs Rambler vs подсказки) без индексов.
7. **V7:** фактический момент перечитывания `additional_keyboard_theme` в `Gboard 18.5.4` без `System.exit(0)` (при открытой клавиатуре, при следующем `onStartInputView` или только при холодном перезапуске процесса).
8. **V8:** поведение Direct Boot после полной перезагрузки смартфона до первого ввода PIN с `"files:..."` в DE `SharedPreferences` и заблокированным CE `getFilesDir()`, а также корректность `editor.remove("additional_keyboard_theme")` для возврата к стоку Dynamic Color.
9. **V9:** безопасный эксперимент `Access Point Count` на значениях `3`, `6`, `8` (+ поле пароля и вкл/выкл пользовательского AP) для установления точной формулы подсчёта слотов.

### C. Пока не рекомендуется реализовывать

Функции с повышенным риском, неподтверждённой совместимостью или угрозой критическим механизмам Gboard:

1. **Любая модификация кнопки голосового ввода Rambler** (у неё уже есть нативный круг, отдельные флаги и 5 SHA-256 отпечатков голосового заголовка).
2. **Круглые подложки обычных Access Points через runtime-обходы View-дерева или привязку к индексам/позициям** (высокий риск слипания при 8+1/10 элементах, обрезки в One-handed, поломки `AccessPointDragPopupView`, наложения на подсказки и двойного круга на Rambler). Без безопасного CSS-различения типов — **отказаться целиком**.
3. **Принудительный `System.exit(0)` / `killProcess` из IME-сервиса ради авто-переключения Light/Dark** (разрушает сессию ввода).
4. **Перенос ZIP-тем из CE `getFilesDir()` в DE `createDeviceProtectedStorageContext().getFilesDir()`** без доказательства из байткода `18.5.4`, что загрузчик `"files:"` читает DE-каталог.
5. **Мутация `TextView.setText` пробела для шевронов или обёртка `background` `.space_bar`** (конфликты с перепривязкой, TalkBack и `Frosted Glass`), а также **отгрузка шевронов без прохождения V4**.
6. **Переписывание `SoftKeyboardView` / `KeyboardView`, изменение сетки/карты клавиш, перенос проприетарной карты вторичных символов Samsung, удаление или изменение назначения `Key Shape Selection`.**

### D. Открытые технические вопросы

1. **Access Point Count:** включает ли `config_max_access_points` / `config_default_access_points_num_on_bar` кнопку меню `⊞` или считает только обычные AP? Сколько именно обычных AP помещается при `3`, `6`, `8`? *(Закрывается экспериментом V9.)*
2. **`ViewOverlay` на `SoftKeyView` в `18.5.4`:** существует ли путь recycling `SoftKeyView` в обход `SoftKeyView.s(...)`? Какова точная структура дочерних View (`.space_bar` и `TextView`)? Обновляется ли `getCurrentTextColor()` до `SoftKeyView.s` при Dynamic Color и всех Custom Theme? *(Закрывается экспериментом V4.)*
3. **CSS-совместимость `18.5.4`:** какие именно свойства из сторонних тем (`background_shape`, `background_corner_radius`, `elevation`, `shadow_color`, `edge_color`, `padding_ratio_*`) и селекторы (`.keytop.dark`, `.label.secondary`, `.background-icon.for-action-key`, `.icon.access-point-item`) реально работают в `18.5.4`, и каков их приоритет относительно `more_pill_keys`? *(Закрывается экспериментами V1–V3, V5.)*
4. **Момент перечитывания `additional_keyboard_theme`:** имеет ли `Gboard 18.5.4` штатный listener на DE `<pkg>_preferences`, перечитывает ли ключ при следующем `onStartInputView`, или для смены ZIP-темы действительно нужен перезапуск процесса (как сейчас делает `GboardCustomThemeGalleryView`)? *(Закрывается экспериментом V7.)*
5. **Direct Boot и `"files:"`:** как именно загрузчик `18.5.4` ведёт себя до первого ввода PIN, когда в DE записан `"files:..."`, а CE `getFilesDir()` заблокирован? *(Закрывается экспериментом V8.)*
6. **Типизация слотов тулбара:** можно ли в `18.5.4` средствами CSS отличить обычные AP от кнопки `⊞`, кнопки Rambler и полосы подсказок? *(Закрывается экспериментом V6.)*

### E. Следующий безопасный этап

После утверждения этого аудита пользователем рекомендуется выполнить **два микро-шага с нулевым риском для кода `v4.4.2`**:

1. **Без единой правки исходного кода выполнить на текущей `v4.4.2` (Galaxy S22 5G) 2-минутный эксперимент V9** (`Access Point Count` = `3`, `6`, `8`, поле пароля, вкл/выкл AP), чтобы окончательно закрыть вопрос структуры верхнего тулбара.
2. **Перейти исключительно к Шагам 1–3:** подготовить два автономных тестовых файла `samsung_oneui8_light.zip` и `samsung_oneui8_dark.zip` и проверить их на Galaxy S22 5G через уже существующий `Custom Theme` (без модификации runtime, патчей и релизов), закрыв на практике гипотезы **V1, V2, V3, V5 и V8**. Только по фактическим результатам этих проверок принимать отдельное решение по Шагу 4 (шевроны), Шагу 6 (авто Light/Dark) и целесообразности Шага 7 (подложки AP).

**Итоговый вердикт раздела 21:** **Можно реализовывать после проверки на устройстве**
