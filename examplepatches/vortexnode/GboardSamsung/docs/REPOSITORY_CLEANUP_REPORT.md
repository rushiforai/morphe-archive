# GboardSamsung — Отчёт о безопасной очистке репозитория и оформлении downstream-проекта

## 1. Краткое резюме

Репозиторий `vortexnode/GboardSamsung` приведён в порядок как самостоятельный downstream Morphe-проект **Vortex Node**, основанный на исходном проекте Jason Wu (`https://github.com/jasonwu1994/Gboard-patches`, GPL-3.0, импортированный базовый коммит `463269a0f315ef9cee749e10d155af1aedaa49ad`).

Выполнены все согласованные задачи:
- Полностью удалены **12** ненужных upstream-функций вместе с их патчами, extension-классами, ресурсами, превью-медиа, эксклюзивными зависимостями (`Apache FTPServer`, `Apache MINA`, QuickJS native payload, G Logo image payload), 36 эксклюзивными `RuntimeCallId`, 20 эксклюзивными target bindings, записями поискового индекса, строками локализации (`gboard_settings_text.xml`), backup-модулями и эксклюзивными тестами.
- Сохранены все **34** активные функции GboardSamsung (33 отобранные upstream-функции + самостоятельный downstream-патч `Samsung Spacebar Gestures`) и вся общая инфраструктура.
- Полностью синхронизированы `GboardPatchRegistry.kt`, `GboardContributionWiring.kt`, композиторы семейств (`Flag` / `SoftKey` / `Gesture` / `Pointer`), `RuntimeAbi.kt`, `gboard-port-product-catalog.json`, `gboard-port-product-catalog.sha256`, `gboard-version-bindings.json`, `patches-list.json`, `patches-bundle.json`, настройки, поиск, резервное копирование и тесты.
- Обновлены авторство и ссылки на `Vortex Node` / `https://github.com/vortexnode/GboardSamsung`, default `app_display_name` в `Package Rename` изменён с `GboardWu` на `GboardSamsung`.
- Обновлена устаревшая документация (`README.md`, `AGENTS.md`, `docs/PROJECT_SCOPE.md`, `docs/UPSTREAM.md`) и шаблоны GitHub (`.github/FUNDING.yml`, `.github/ISSUE_TEMPLATE/*`) при полном сохранении `LICENSE`, `NOTICE`, `UPSTREAM_COMMIT.txt`, `UPSTREAM_README.md`, `CHANGELOG.md` и всех исследовательских отчётов `docs/SPACEBAR_*` / `docs/GBOARD_*` / `docs/SAMSUNG_*`.
- Проведена реальная offline JVM-верификация: компиляция `bindingCompiler`, генерация `GboardVersionBindings.kt` и `GboardTargetAdmission.kt`, компиляция всех 241 Java-файлов `extensions/extension` и 9 Java-файлов `extensions/calculator`, проверка `RuntimeAbiVerifier` по реальному байткоду (121/121 `RuntimeCallId`, 0 несоответствий), компиляция всех 199 тестовых файлов extension (133 pure-JVM + 66 Robolectric) и прогон pure-JVM JUnit-наборов (`46/46` patch-тестов и `400/400` runnable extension-тестов без единой реальной ошибки).

---

## 2. Рабочая ветка, исходная точка и статус Git в контейнере

- **Запрошенная рабочая ветка:** `chore/repository-cleanup`
- **Исходная контрольная точка (по ТЗ):** `eb9f6e0a685123371e9818988af64ed2f573dcb4`
- **Фактическое состояние среды выполнения (честная фиксация):** в данном контейнере каталог `.git` отсутствует (рабочее дерево смонтировано без Git-метаданных). В связи с этим операции `git checkout -b chore/repository-cleanup`, `git status`, `git diff --check` и `git commit` физически не могли быть выполнены внутри контейнера.
- **Что необходимо выполнить в локальном Git-репозитории / CI:**
  1. Убедиться, что рабочее дерево находится на ветке `chore/repository-cleanup` от коммита `eb9f6e0a685123371e9818988af64ed2f573dcb4` (не изменять `main` и не выполнять merge в `main`).
  2. Запустить `git diff --check` и просмотреть итоговый diff.
  3. Разбить изменения на логические ревьюируемые коммиты и запустить полный CI-прогон Gradle/Morphe.

---

## 3. Таблица удалённых функций (12 из 46)

| № | `feature_id` | Публичное имя патча (upstream) | Что удалено | Что специально сохранено рядом |
|---|---|---|---|---|
| 1 | `latin_globe_key_ignore_interval` | `Latin Globe Key Ignore Interval` | Патч, feature marker, binding (`latin_globe_ignore_interval`), extension runtime/settings, backup module + adapter, search index, строки локализации, тесты | Общая инфраструктура клавиатуры и `Samsung Spacebar Gestures` |
| 2 | `web_clipboard` | `Web Clipboard` | Патч, feature marker, `extension/webclipboard/*`, вкладка `Extensions` в `GboardClipboardSettingsFeature`, backup module, search index, строки локализации, тесты | Стандартный Gboard Clipboard, `Clipboard Enhancements`, `Clipboard Custom Character Limit` |
| 3 | `zhuyin_bottom_row_key_sizes` | `Zhuyin Bottom Row Key Sizes` | Патч, feature marker, SoftKey-вклад, `extension/zhuyinbottomrow/*`, backup module + adapter, search index, строки локализации, тесты | `SoftKeyFamilyComposer` для оставшихся 2 фич |
| 4 | `zhuyin_quick_traditional_simplified_toggle` | `Zhuyin Quick Traditional/Simplified Toggle` | Патч, feature marker, SoftKey-вклад, `extension/zhuyinquicktrad/*`, search index, строки локализации, тесты | — |
| 5 | `zhuyin_slide_input` | `Zhuyin Slide Input` | Патч, feature marker, Gesture/Pointer/SoftKey-вклады, `extension/zhuyinslide/*`, search index, строки локализации, тесты | `Custom Symbols` (`custom_symbols`, пакет `addsymbols`) |
| 6 | `g_logo_on_spacebar` | `G Logo on Spacebar` | Патч, feature marker, SoftKey-вклад, `extension/spacebarlogo/*`, `image-payload`, задача `generateSpacebarImage`, backup module + `refreshRuntime` + legacy `pref_spacebar_g_logo_` нормализация, search index, строки локализации, тесты | `Samsung Spacebar Gestures` (`samsung_spacebar_gestures`) |
| 7 | `english_qwerty_up_flick_uppercase` | `English QWERTY Up-Flick Uppercase` | Патч, feature marker, SoftKey-вклад, `extension/englishuppercase/*`, backup module, search index, строки локализации, тесты | — |
| 8 | `lan_ftp_server` | `FTP Server` | Патч, feature marker, `extension/lanftp/*`, зависимости `Apache FTPServer` и `Apache MINA`, задача `generateLanFtpMessageResource`, `ic_lan_ftp_tile.xml`, связка с `GboardPackageRenameResourcePatch`, backup module, search index, строки локализации, тесты | `Package Rename` (полностью отвязан от LAN FTP), `More` group |
| 9 | `swipeable_custom_top_row` | `Swipeable Custom Top Row` | Патч, feature marker, Gesture/Pointer/SoftKey-вклады, `extension/toprowswipe/*`, QuickJS `native-payload` и задача `generateQuickJsNativePayload`, IPC в `GboardPatchesSettingsProvider`, backup module, search index, строки локализации, превью-видео `.mp4`, тесты | `GboardPatchesSettingsProvider` (сохранён IPC для `Symbol Footer Order`) |
| 10 | `enable_ocr_scan_text` | `Enable OCR / Scan Text` | Патч, feature marker, Flag-вклад, `extension/ocr/*`, search index, строки локализации, превью-ассеты, тесты | Остальные 15 фич `FlagFamilyComposer` |
| 11 | `enable_accessibility_layout` | `Enable accessibility layout` | Патч, feature marker, Flag-вклад, `extension/accessibilitylayout/*`, search index, строки локализации, превью-ассеты, тесты | Остальные фичи `GboardFiveFlagPatchesContractTest` / `GboardFiveFlagSettingsContractTest` (`change_emoji_size`, `access_points_menu_style`, `enable_split_keyboard`) |
| 12 | `enable_cursor_trackpad_mode` | `Enable cursor trackpad mode` | Патч, feature marker, Flag-вклад, `extension/cursortrackpad/*`, search index, строки локализации, превью-ассеты, тесты | `Samsung Spacebar Gestures` (тап-пробел, свайп смены языка, удержание ~300 мс + перетаскивание курсора) |

---

## 4. Таблица сохранённых активных функций (34)

| № | `feature_id` | Публичное имя патча | `migration_scope` |
|---|---|---|---|
| 1 | `access_point_count` | `Top Toolbar Item Count` | `version-sensitive` |
| 2 | `access_points_menu_style` | `Access Points menu style` | `version-sensitive` |
| 3 | `add_gboard_signature_bypass` | `Add Gboard Signature Bypass` | `version-sensitive` |
| 4 | `advanced_voice_typing` | `Advanced Voice Typing` | `version-sensitive` |
| 5 | `ai_writing_tools` | `AI Writing Tools` | `version-sensitive` |
| 6 | `backup_restore` | `Backup & Restore` | `version-neutral-extension` |
| 7 | `change_emoji_size` | `Change emoji size` | `version-sensitive` |
| 8 | `clipboard_custom_character_limit` | `Clipboard Custom Character Limit` | `version-sensitive` |
| 9 | `clipboard_enhancements` | `Clipboard Enhancements` | `version-sensitive` |
| 10 | `close_proactive_suggestions` | `Close Proactive Suggestions` | `version-sensitive` |
| 11 | `custom_symbols` | `Custom Symbols` | `version-sensitive` |
| 12 | `custom_theme` | `Custom Theme` | `version-sensitive` |
| 13 | `developer_options` | `Developer options` | `version-sensitive` |
| 14 | `editing_access_points` | `Toolbar Editing Buttons` | `version-sensitive` |
| 15 | `emojis_stickers_gifs_tab_order` | `Emojis, stickers & GIFs Tab Order` | `version-sensitive` |
| 16 | `enable_inline_autofill_suggestions` | `Enable Inline Autofill Suggestions` | `version-sensitive` |
| 17 | `enable_split_keyboard` | `Enable split keyboard` | `version-sensitive` |
| 18 | `floating_web_search` | `Floating Web Search` | `version-sensitive` |
| 19 | `frosted_glass` | `Frosted Glass` | `version-sensitive` |
| 20 | `grammar_checker` | `Grammar Checker` | `version-sensitive` |
| 21 | `incognito_mode_toggle` | `Incognito Mode Toggle` | `version-sensitive` |
| 22 | `inline_suggestions` | `Inline Suggestions` | `version-sensitive` |
| 23 | `key_shape_selection` | `Key Shape Selection` | `version-sensitive` |
| 24 | `keypress_haptics` | `Keypress Vibration Intensity Control` | `version-sensitive` |
| 25 | `language_model_versions` | `Dictionaries & Predictions` | `version-sensitive` |
| 26 | `long_press_editing_shortcuts` | `Long-Press Editing Shortcuts` | `version-sensitive` |
| 27 | `package_rename` | `Package Rename` | `generic` |
| 28 | `quick_insert` | `Quick Insert` | `version-sensitive` |
| 29 | `rounded_keyboard_panel` | `Rounded Keyboard Panel` | `version-sensitive` |
| 30 | `samsung_spacebar_gestures` | `Samsung Spacebar Gestures` | `version-sensitive` |
| 31 | `settings_homepage_override` | `Settings Homepage Override` | `version-sensitive` |
| 32 | `simple_calculator` | `Simple Calculator` | `version-sensitive` |
| 33 | `swipe_down_to_dismiss_keyboard` | `Swipe Down to Dismiss Keyboard` | `version-sensitive` |
| 34 | `use_bluetooth_microphone` | `Use Bluetooth Microphone` | `version-sensitive` |

Все критические инварианты сохранённых функций подтверждены:
- `Samsung Spacebar Gestures` остался полностью независимым публичным патчем (без зависимости от `Swipe Down to Dismiss Keyboard`).
- `Simple Calculator` (`extensions/calculator`) и все 9 его Java-файлов скомпилированы и проверены через `RuntimeAbiVerifier`.
- `Custom Theme`, `Frosted Glass`, `Custom Symbols`, `Clipboard Enhancements`, `Clipboard Custom Character Limit`, `Backup & Restore` (8 активных модулей) сохранены и верифицированы.

---

## 5. Удалённые зависимости, бинарные payload-ы и ресурсы

- **Gradle / Version Catalog (`gradle/libs.versions.toml`, `extensions/extension/build.gradle.kts`):**
  - Удалены `ftpserver` (`org.apache.ftpserver:ftpserver-core`) и `apache-mina` (`org.apache.mina:mina-core`).
  - Удалены build-задачи `generateSpacebarImage`, `generateQuickJsNativePayload`, `generateLanFtpMessageResource`, а также проверки FTP-ресурсов в `syncExtension`.
- **Бинарные payload-ы и ресурсы:**
  - Удалены директории `extensions/extension/src/main/image-payload`, `extensions/extension/src/main/native-payload` (QuickJS), `extensions/extension/src/main/res/raw`, `extensions/extension/src/main/res/drawable/ic_lan_ftp_tile.xml`, превью-видео `.mp4` и изображения удалённых функций из `assets/settings-previews/`.
- **Локализация и поиск:**
  - Из `extensions/extension/src/main/settings-text/gboard_settings_text.xml` удалено **318** записей удалённых фич (осталось **623** валидные XML-записи), обновлены сводки групп (`keyboard_tools`, `keyboard_layout`, `more`, `clipboard`).
  - В `GboardSettingsSearchIndexData.java` удалены пути и записи 10 удалённых фич; оставшиеся **32** пути последовательно перенумерованы (`0..31`).
  - В `extensions/extension/src/test/resources/gboard-settings-access-baseline.properties` удалены записи несуществующих классов.

---

## 6. Синхронизация каталогов, bindings, ABI и контрольных сумм

| Артефакт | Состояние до очистки | Состояние после очистки | Примечания |
|---|---|---|---|
| `GboardPatchRegistry.kt` | 46 публичных патчей, default `"GboardWu"` | **34** публичных патча, default `"GboardSamsung"` | 1:1 соответствие каталогу и `patches-list.json` |
| `GboardContributionWiring.kt` | 12 multi-contribution фич | **7** сохранённых multi-contribution фич | Удалены вклады 5 удалённых фич |
| Композиторы семейств | Flag (18), SoftKey (7), Gesture (3), Pointer (3) | **Flag (15)**, **SoftKey (2)**, **Gesture (1)**, **Pointer (1)** | Порядки Flag: `[5, 10, 20, 30, 40, 100, 200, 300, 400, 500, 900, 1000, 1200, 1300, 1400]` |
| `RuntimeAbi.kt` | 157 `RuntimeCallId` | **121** `RuntimeCallId` (−36 эксклюзивных) | 121/121 подтверждены по байткоду `RuntimeAbiVerifier` |
| `gboard-port-product-catalog.json` | 46 фич, 238 `binding_contracts` | **34** фичи, **218** `binding_contracts` | Все `consumer_files` проверены на диске (0 отсутствующих) |
| `gboard-port-product-catalog.sha256` | старый хэш | `509d1e79e4a1d2b38c7eea93a5d7b3dda76fda4f41c85c18a443879cd26416dc` | Точный SHA-256 нормализованного LF-каталога |
| `gboard-version-bindings.json` | 238 bindings + внешние linkage-хэши | **218** bindings | Устаревшие внешние `projection_sha256`, `profile_sha256`, `port_bundle_sha256` **намеренно опущены** (не сфабрикованы); схема допускает их отсутствие для checked-in профиля |
| `TargetBindingCompilerTest.kt` | `238`, старый `AUTHORITATIVE_SOURCE_SHA256` | **`218`**, `cddca9d10866d76d5cd2733042d27738b2466a91c70552d4892743ea62bd960f` | Вычислено непосредственно `TargetBindingGenerator` и подтверждено тестом |
| `patches-list.json` | 46 записей, `"GboardWu"` | **34** записи, `"GboardSamsung"` | Детерминированно синхронизировано с `GboardPatchRegistry.kt` (требует финальной перепроверки через `./gradlew generatePatchesList` в CI) |
| `patches-bundle.json` | upstream `download_url` | `https://github.com/vortexnode/GboardSamsung/releases/download/v4.3.0/patches-4.3.0.mpp` | Указывает на downstream-репозиторий |

---

## 7. Брендинг, метаданные и намеренно сохранённые upstream-ссылки

### Изменённые метаданные (downstream: Vortex Node / GboardSamsung)
- `patches/src/main/kotlin/dev/jason/gboardpatches/patches/shared/Constants.kt`: `Vortex Node`, `https://github.com/vortexnode/GboardSamsung`.
- `patches/build.gradle.kts`: `patches.about` (`name`, `description`, `source`, `author`, `contact`, `website`).
- `extensions/extension/build.gradle.kts`: `BuildConfig.PATCH_AUTHOR`, `PATCH_AUTHOR_URL`, `PATCH_REPOSITORY_URL`.
- `extensions/extension/src/main/java/.../settings/GboardPatchesSettingsActivity.java`: `ABOUT_AUTHOR_URL = "https://github.com/vortexnode"`, `ABOUT_PATCH_REPOSITORY_URL = "https://github.com/vortexnode/GboardSamsung"`.
- `extensions/extension/src/main/java/.../advancedvoice/GboardAdvancedVoiceSettingsFeature.java`: `ADVANCED_VOICE_GITHUB_URL = "https://github.com/vortexnode/GboardSamsung"`.
- `GboardPatchRegistry.kt` и `patches-list.json`: `Package Rename` default `app_display_name = "GboardSamsung"`.
- `.github/FUNDING.yml`: удалена привязка `ko_fi: jasonwu1994`.
- `.github/ISSUE_TEMPLATE/bug_report.yml`, `feature_request.yml`: обновлены под `GboardSamsung`.

### Неизменённые технические пространства имён (по ТЗ)
- `dev.jason.gboardpatches`
- `dev.jason.com.google.android.inputmethod.latin`
- `extensions/gboard-patches.rve`

### Намеренно сохранённые upstream-ссылки и атрибуция (состояние этапа очистки; актуализировано в разделе 13)
1. **`GboardCustomThemePreviewRepository.java` + `GboardCustomThemePreviewRepositoryTest.java` + `release-assets/custom-theme-previews/README.md`:** на этапе очистки временно сохранялся upstream-URL; **в финальном этапе (раздел 13) переключён на `vortexnode/GboardSamsung`**.
2. **`GboardFrostedGlassSettingsFeature.java` + `GboardFrostedGlassSettingsFaqTest.java`:** опциональные информационные FAQ-ссылки `jasonwu1994/Gboard-patches/issues/68` и `issues/58` на исторические треды диагностики (не требуются для работы приложения, сборки или CI).
3. **`.github/workflows/import-upstream.yml`:** на этапе очистки сохранялся; **в финальном этапе (раздел 13) удалён**.
4. **JSON Schema `$id`** в `gboard-port-product-catalog.schema.json`, `gboard-version-bindings.schema.json`, `gboard-port-bundle.schema.json`: пассивные строковые URI-идентификаторы схемы (никогда не запрашиваются по сети).
5. **Лицензия и история:** `LICENSE`, `NOTICE`, `UPSTREAM_COMMIT.txt`, `UPSTREAM_README.md`, `CHANGELOG.md` полностью сохранены без изменений.

---

## 8. Обновление документации

- `README.md`: убрано устаревшее описание «documentation seed, not yet a complete buildable copy»; документирован активный downstream-проект Vortex Node, точный список 34 активных и 12 удалённых патчей, целевая версия Gboard `18.5.4.993608717-release-arm64-v8a`, модель сборки `.mpp` и upstream-атрибуция GPL-3.0.
- `AGENTS.md`: актуализированы правила работы с downstream-репозиторием, сохранения технических namespace, независимости `samsung_spacebar_gestures` и честной отчётности по сборкам/тестам.
- `docs/PROJECT_SCOPE.md`: обновлён статус проекта (импорт завершён, Stage 5.2.1 завершён, очистка 12 функций выполнена), синхронизирован точный состав 34 патчей.
- `docs/UPSTREAM.md`: зафиксированы фактический импортированный коммит `463269a0f315ef9cee749e10d155af1aedaa49ad`, расхождения downstream (добавлен `samsung_spacebar_gestures`, удалены 12 функций, дефолт `GboardSamsung`), намеренно сохранённые upstream-URL и правила будущих выборочных синхронизаций.
- Все исследовательские отчёты (`docs/SPACEBAR_*`, `docs/GBOARD_18.5.4_*`, `docs/SAMSUNG_KEYBOARD_*`, `docs/TECHNICAL_AUDIT.md`, `docs/research/*`) оставлены нетронутыми.

---

## 9. Результаты верификации (честный отчёт `PASS` / `NOT RUN`)

| Проверка | Статус | Детали / Фактический вывод |
|---|---|---|
| Валидация JSON / XML / SHA-256 / LF | **PASS** | Все 4 JSON-файла и 2 XML-файла валидны; `gboard-port-product-catalog.sha256` совпадает побайтно; 34 фичи = 34 записи `patches-list.json`; 218 `binding_contracts` = 218 `bindings`; 0 отсутствующих `consumer_files`; `CRLF = []` |
| `K2JVMCompiler` 2.2.21 (`patches/src/bindingCompiler/kotlin`) | **PASS** | `rc = 0`, все классы `bindingCompiler` скомпилированы под JVM 17 |
| `TargetBindingGenerator` на очищенных каталоге и bindings | **PASS** | `rc = 0`; сгенерированы `GboardVersionBindings.kt` (1438 строк, `sourceSha256 = cddca9d10866d76d5cd2733042d27738b2466a91c70552d4892743ea62bd960f`) и `GboardTargetAdmission.kt` (52 строки) |
| `javac --release 17` — все production Java-файлы `extensions/extension` (241 файл + сгенерированные `BuildConfig`, `R`, `GboardSettingsTextCatalog`, `GboardCustomThemeVersionBindings`) | **PASS** | `rc = 0`, 0 ошибок компиляции |
| `javac --release 17` — все production Java-файлы `extensions/calculator` (9 файлов) | **PASS** | `rc = 0`, 0 ошибок компиляции |
| Реальный ASM `RuntimeAbiVerifier` по скомпилированному байткоду обеих extensions (`503` класса, `3945` методов) | **PASS** | Проверены все **121 / 121** `RuntimeCallId` -> `mismatches = 0` (`RUNTIME_ABI_VERIFY_PASS`) |
| `javac --release 17` — ВСЕ тестовые файлы `extensions/extension` (133 pure-JVM + 66 Robolectric = **199 / 199** файлов) | **PASS** | `rc = 0`, 0 ошибок компиляции (в процессе выявлена и исправлена опечатка константы `FEATURE_ROUNDED_KEYBOARD` -> `FEATURE_ROUNDED_KEYBOARD_PANEL` в `GboardFiveFlagSettingsContractTest.java` и `GboardSettingsGroupingTest.java`) |
| JUnit 4 — pure-JVM тесты `extensions/extension` (87 тестовых классов, 411 методов) | **PASS (400/400 runnable)** | 400 тестов прошли успешно, 0 реальных ошибок; 11 тестов требуют mockable `android.jar` (`RuntimeException: Stub!` на `Context.<init>`) |
| JUnit 4 — standalone pure-JVM тесты `patches` (12 классов, 46 тестов: `TargetBindingCompilerTest`, `GboardTargetBuildCompilerTest`, `TargetBindingGeneratorTest`, `RuntimeAbiVerifierTest`, `RuntimeCallEmitterTest`, `GboardTargetNativeRetirementSourceTest`, `GboardDeveloperOptionsPatchContractSourceTest`, `GboardAdvancedVoiceFeatureMarkerSourceTest`, `GboardClipboardTargetSourceContractTest`, 3 теста `GboardAiWritingTools*SourceTest`) | **PASS (46/46)** | 46/46 прошли успешно (`GboardCalculatorExtensionClosureTest` отдельно требует собранных `.rve` dex-артефактов через `-Dgboard.runtimeAbiOutputDirectories`) |
| `./gradlew :patches:test` / Morphe-зависимые тесты (`GboardPortProductCatalogContractTest`, `GboardPublishedPatchCatalogContractTest`, `GboardContributionWiringTest`, `GboardSamsungSpacebarGesturesPatchRegistryTest`, `GboardSwipeDismissPatchRegistryTest` и др.) | **NOT RUN** | Зависимость `app.morphe.patches:2.1.0` отсутствует в offline-кэше контейнера (требуется GitHub Packages auth в CI) |
| `./gradlew :extensions:extension:testDebugUnitTest` (66 Robolectric-тестов, вкл. `GboardPatchesBackupManagerTest`, `GboardFiveFlagSettingsContractTest`) | **NOT RUN (выполнение)** / **PASS (компиляция)** | Все 66 файлов успешно скомпилированы `javac --release 17`, но запуск Robolectric/AGP требует полного Gradle Android окружения |
| `./gradlew generatePatchesList` / сборка `.mpp` | **NOT RUN** | Запрещено условиями задачи (`.mpp` не собирать) и недоступно без `app.morphe.patches` |
| `git status` / `git diff --check` / `git commit` | **NOT RUN** | Каталог `.git` отсутствует в контейнере |

---

## 10. Остаточный аудит (Global Grep Audit)

Выполнен глобальный поиск по всему репозиторию (исключая сохранённые архивные/исторические файлы `UPSTREAM_README.md`, `UPSTREAM_COMMIT.txt`, `CHANGELOG.md`, `NOTICE`, `LICENSE`, `docs/TECHNICAL_AUDIT.md`, `docs/SPACEBAR_*`, `docs/gboard_18_5_4_*`) по идентификаторам всех 12 удалённых функций, их пакетам/классам, `QuickJs`, `ftpserver`, `apache-mina`, `GboardWu` и `jasonwu1994`:

- **Удалённые функции и `GboardWu`:** найдено **6** совпадений, все **6** легитимны и ожидаемы:
  - 3 негативных assert-а в тестах (`GboardSettingsGroupingTest.java:131`, `GboardTilePreferencesActivitySourceTest.java:27-28`: `assertFalse(...contains("LanFtp"/"WebClipboard"))`),
  - 1 историческая строка исследовательского отчёта (`docs/SAMSUNG_KEYBOARD_5.9.50.10_ANALYSIS_REPORT.md:288`),
  - 2 пояснительные строки истории расхождений в `docs/UPSTREAM.md:17, 22`.
  - **0** неожиданных совпадений в исходном коде, каталогах, ресурсах, `gboard_settings_text.xml`, `build.gradle.kts` и `libs.versions.toml`.
- **`jasonwu1994` / `Jason Wu`:** только явная upstream-атрибуция в документации (`README.md`, `AGENTS.md`, `docs/PROJECT_SCOPE.md`, `docs/UPSTREAM.md`), намеренно сохранённые внешние URL (`GboardCustomThemePreviewRepository.java`, `GboardFrostedGlassSettingsFeature.java` и их тесты, `release-assets/custom-theme-previews/README.md`), JSON Schema `$id` и `.github/workflows/import-upstream.yml`.

---

## 11. Известные ограничения и риски

1. **Отсутствие `.git` в контейнере:** изменения находятся в рабочем дереве на диске, но не зафиксированы коммитами в ветке `chore/repository-cleanup`.
2. **Offline-ограничения Gradle/Morphe:** тесты, напрямую импортирующие `app.morphe.patcher.*`, и runtime-прогон 66 Robolectric-тестов (включая `GboardSettingsSearchIndexSnapshotTest`, `GboardPatchesBackupManagerTest`, `GboardFiveFlagSettingsContractTest`) не исполнялись в контейнере (хотя все 66 Robolectric-файлов скомпилированы без ошибок).
3. **`GboardSettingsSearchIndexData.java`:** вручную очищен и переиндексирован (`0..31`), но в CI рекомендуется дополнительно подтвердить через `:extensions:extension:testDebugUnitTest` (при расхождении снимка поиска можно обновить флагом `-PupdateSettingsSearchIndex=true`).
4. **Внешний архив превью `Custom Theme`:** в финальном этапе (см. раздел 13) переведён на `vortexnode/GboardSamsung`; требуется ручная публикация релиза `custom-theme-previews-v1` после синхронизации ветки `main`.

---

## 12. Рекомендуемые следующие шаги в CI / локальном Git

1. Проверить изменения в локальном Git-репозитории (`git status`, `git diff --check`) и оформить небольшими логическими коммитами.
2. Настроить секрет `MORPHE_PACKAGES_TOKEN` и прогнать добавленный CI workflow (`.github/workflows/ci.yml`), который автоматически выполняет `:patches:test`, `:extensions:extension:testDebugUnitTest`, `:extensions:calculator:testDebugUnitTest`, проверку `generatePatchesList` + `git diff --exit-code -- patches-list.json` и сборку `:patches:buildAndroid`.
3. Опубликовать релиз `custom-theme-previews-v1` в `vortexnode/GboardSamsung` (см. раздел 13.5).

---

## 13. Финальный этап: завершение независимости GboardSamsung (после базового коммита очистки `8b6d6ea1ae8c5760aef9a9d565136559436cca4e`)

### 13.1. Выполненные изменения

1. **Устранена последняя runtime-зависимость от `jasonwu1994/Gboard-patches` (Custom Theme Previews):**
   - `extensions/extension/src/main/java/dev/jason/gboardpatches/extension/customtheme/GboardCustomThemePreviewRepository.java`: `URL` переключён на `https://github.com/vortexnode/GboardSamsung/releases/download/custom-theme-previews-v1/custom-theme-previews-v1.zip`. Без изменений сохранены `VERSION = "v1"`, `SHA256 = "368af5064b2e8ed62800417efd6fa015d12c74a94553002823eade85d8213ee9"`, HTTPS-проверка, лимиты размера, защита распаковки (zip-slip/count/size), валидация манифеста и сам архив `release-assets/custom-theme-previews/v1/custom-theme-previews-v1.zip`.
   - `extensions/extension/src/test/java/dev/jason/gboardpatches/extension/customtheme/GboardCustomThemePreviewRepositoryTest.java`: обновлена проверка `GboardCustomThemePreviewRepository.URL` на `vortexnode/GboardSamsung`.
   - `release-assets/custom-theme-previews/README.md`: обновлён `Runtime URL` на `https://github.com/vortexnode/GboardSamsung/releases/download/custom-theme-previews-vN/custom-theme-previews-vN.zip`.
   - Проверен `.github/workflows/custom-theme-previews-release.yml` и `release-assets/custom-theme-previews/v1/custom-theme-previews-v1-manifest.json`: workflow валидирует `schemaVersion = 1`, `bundleVersion = "v1"`, имя файла `custom-theme-previews-v1.zip`, размер `7957397` байт и SHA-256 `368af5064b2e8ed62800417efd6fa015d12c74a94553002823eade85d8213ee9`, после чего публикует оба файла в GitHub Release текущего репозитория (`vortexnode/GboardSamsung`) по тегу `custom-theme-previews-v1`.
2. **Удалён механизм автоматического импорта из upstream:**
   - Удалён файл `.github/workflows/import-upstream.yml`.
   - Полностью сохранены `UPSTREAM_README.md`, `UPSTREAM_COMMIT.txt`, `NOTICE`, `LICENSE`, `CHANGELOG.md`, `docs/UPSTREAM.md` и атрибуция GPL-3.0 / Jason Wu.
   - Обновлён `docs/UPSTREAM.md`: upstream зафиксирован исключительно как исторический источник происхождения, а не активный источник импорта/сборки/runtime.
3. **Завершено Gradle-именование проекта:**
   - `settings.gradle.kts`: `rootProject.name` изменён с `"gboard-patches"` на `"GboardSamsung"`.
   - Проверены все вхождения `gboard-patches` по репозиторию: ни один скрипт, workflow, Gradle task или тест не зависит от старого `rootProject.name`. Технические идентификаторы совместимости (`dev.jason.gboardpatches`, `dev.jason.com.google.android.inputmethod.latin`, `extensions/gboard-patches.rve`, `gboard-patches-backup.json`, ID backup-модулей `gboard-patches.*`, тег калькулятора) намеренно сохранены.
4. **Добавлен полноценный CI workflow (`.github/workflows/ci.yml`):**
   - Триггеры: `push` в `main`, `pull_request` в `main`, `workflow_dispatch`.
   - Стек: `ubuntu-latest`, Java 21 (`temurin`, `actions/setup-java@v6`), Gradle cache (`burrunan/gradle-cache-action@v3`), `concurrency` с отменой устаревших запусков.
   - Использует секрет `MORPHE_PACKAGES_TOKEN` (передаётся в `GITHUB_TOKEN`, без вывода токена в логи; при отсутствии секрета завершается с понятной ошибкой до запуска Gradle).
   - Выполняет:
     1. `./gradlew :patches:test :extensions:extension:testDebugUnitTest :extensions:calculator:testDebugUnitTest`
     2. `./gradlew generatePatchesList` и `git diff --exit-code -- patches-list.json`
     3. `./gradlew :patches:buildAndroid`
   - Не публикует релизы автоматически.

### 13.2. Полная инвентаризация оставшихся ссылок на `jasonwu1994` / `Gboard-patches`

Глобальная проверка всех файлов репозитория (за исключением build/cache-директорий) показала **ровно 3 категории** оставшихся упоминаний и **0 обязательных runtime/build/CI-зависимостей**:

| Категория | Файлы | Назначение / почему сохранено |
|---|---|---|
| **Историческая атрибуция, лицензия и архивы (GPL-3.0)** | `UPSTREAM_README.md` (7), `CHANGELOG.md` (104), `README.md` (2), `AGENTS.md` (2), `docs/UPSTREAM.md` (1), `docs/PROJECT_SCOPE.md` (3), `docs/TECHNICAL_AUDIT.md` (4), `docs/REPOSITORY_CLEANUP_REPORT.md` | Обязательная атрибуция происхождения от проекта Jason Wu (GPL-3.0), история релизов и архивные отчёты. |
| **Опциональные информационные FAQ-ссылки в UI** | `extensions/extension/.../frostedglass/GboardFrostedGlassSettingsFeature.java` (строки 22, 24: `issues/68`, `issues/58`) и тест `GboardFrostedGlassSettingsFaqTest.java` (строки 41, 42) | Внешние ссылки в браузер для чтения исторических тредов диагностики Frosted Glass. Не участвуют в сборке, CI или работе патча. |
| **Пассивные URI-идентификаторы `$id` JSON Schema** | `patches/src/main/resources/gboard/gboard-port-product-catalog.schema.json` (строка 3), `patches/src/main/resources/gboard/gboard-version-bindings.schema.json` (строка 3), `patches/src/bindingCompiler/resources/gboard/gboard-port-bundle.schema.json` (строка 3) | Статические строковые идентификаторы JSON Schema; по сети никогда не запрашиваются. |

### 13.3. Подтверждение полной независимости от `jasonwu1994/Gboard-patches`

- **Обязательные runtime-зависимости от `jasonwu1994/Gboard-patches`:** **отсутствуют (0)**.
- **Обязательные build/CI-зависимости от `jasonwu1994/Gboard-patches`:** **отсутствуют (0)** (в `.github/workflows/` остались только `ci.yml`, `release.yml`, `custom-theme-previews-release.yml` — ни один из них не обращается к `jasonwu1994`).
- **Сценарий недоступности `jasonwu1994/Gboard-patches`:** если репозиторий `jasonwu1994/Gboard-patches` будет удалён или станет недоступен, `vortexnode/GboardSamsung` продолжит полностью собираться, проходить CI, выпускать релизы `.mpp` и работать на устройствах (при условии публикации собственного релиза `custom-theme-previews-v1` в `vortexnode/GboardSamsung`, см. 13.5). Единственным деградирующим элементом останутся две необязательные кнопки «FAQ» в настройках Frosted Glass, открывающие внешние обсуждения в браузере.

### 13.4. Таблица верификации финального этапа (`PASS` / `FAIL` / `NOT RUN`)

| Команда / Проверка | Статус | Фактический результат / Причина |
|---|---|---|
| Валидация 8 JSON-файлов (вкл. `patches-list.json`, `patches-bundle.json`, `custom-theme-previews-v1-manifest.json`, каталоги и схемы, отсутствие UTF-8 BOM) | **PASS** | `8/8` валидны, 0 BOM |
| Валидация XML (`extensions/extension/src/main/settings-text/gboard_settings_text.xml`) | **PASS** | `1/1` валиден |
| Проверка архива `release-assets/custom-theme-previews/v1/custom-theme-previews-v1.zip` (ZIP-целостность, размер, SHA-256) | **PASS** | `sha256 = 368af5064b2e8ed62800417efd6fa015d12c74a94553002823eade85d8213ee9`, `7957397` байт, `484` записи ZIP (`testzip() == None`), 100% совпадение с манифестом и кодом |
| Проверка каталога, bindings, `patches-list.json`, `patches-bundle.json` | **PASS** | `34` фичи, `218` `binding_contracts`, `218` `bindings`, `34` записи в `patches-list.json`, `gboard-port-product-catalog.sha256 = 509d1e79e4a1d2b38c7eea93a5d7b3dda76fda4f41c85c18a443879cd26416dc`, версия `4.3.0` |
| Проверка списка workflows (`.github/workflows/`) | **PASS** | `['ci.yml', 'custom-theme-previews-release.yml', 'release.yml']` (`import-upstream.yml` отсутствует) |
| Offline JVM-компиляция `javac --release 17` изменённых `GboardCustomThemePreviewRepository.java` и `GboardCustomThemePreviewRepositoryTest.java` + исполнение `releaseCoordinatesArePinnedToPublicRepository()` | **PASS** | `rc = 0`; подтверждены `VERSION=v1`, `URL=https://github.com/vortexnode/GboardSamsung/releases/download/custom-theme-previews-v1/custom-theme-previews-v1.zip`, `SHA256=368af5064b2e8ed62800417efd6fa015d12c74a94553002823eade85d8213ee9` |
| `gradle :patches:test --offline` | **FAIL (заблокировано средой)** | `Plugin [id: 'app.morphe.patches', version: '2.1.0'] was not found` — плагин Morphe отсутствует в offline-кэше контейнера и требует авторизации в `https://maven.pkg.github.com/MorpheApp/registry` |
| `./gradlew :patches:test`, `:extensions:extension:testDebugUnitTest`, `:extensions:calculator:testDebugUnitTest`, `generatePatchesList`, `:patches:buildAndroid` | **NOT RUN** | Заблокированы тем же отсутствием плагина `app.morphe.patches:2.1.0` и доступа к Morphe GitHub Packages в offline-контейнере; подлежат прогону в GitHub Actions через `.github/workflows/ci.yml` |
| `git diff --check` | **NOT RUN** | Каталог `.git` отсутствует в контейнере |

### 13.5. Статус GitHub Release `custom-theme-previews-v1` (требуется ручное действие)

- **Текущий статус:** GitHub Release `custom-theme-previews-v1` в репозитории `vortexnode/GboardSamsung` **ещё НЕ опубликован** (в контейнере теги и релизы не создавались). До публикации релиза URL `https://github.com/vortexnode/GboardSamsung/releases/download/custom-theme-previews-v1/custom-theme-previews-v1.zip` будет возвращать `404`.
- **Как опубликовать после синхронизации изменений в `main`:**
  ```bash
  git tag custom-theme-previews-v1
  git push origin custom-theme-previews-v1
  ```
  После отправки тега автоматически запустится `.github/workflows/custom-theme-previews-release.yml`, проверит размер и SHA-256 (`368af5064b2e8ed62800417efd6fa015d12c74a94553002823eade85d8213ee9`) и создаст релиз `Custom Theme Previews v1` с файлами `custom-theme-previews-v1.zip` и `custom-theme-previews-v1-manifest.json` (`make_latest: false`).

### 13.6. Необходимые GitHub Secrets в `vortexnode/GboardSamsung`

| Секрет | Где используется | Назначение и права |
|---|---|---|
| `MORPHE_PACKAGES_TOKEN` | `.github/workflows/ci.yml`, `.github/workflows/release.yml` | GitHub Personal Access Token (classic с областью `read:packages` или fine-grained с доступом чтения пакетов), используемый для загрузки `app.morphe.patches:2.1.0` и зависимостей Morphe из `https://maven.pkg.github.com/MorpheApp/registry`. Без этого секрета Gradle-сборка в CI и Release не сможет разрешить плагин Morphe. |

