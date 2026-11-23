# Полный технический аудит Samsung Keyboard Appearance (One UI 8 / Android 16) для GboardSamsung (v2)

- **Дата аудита:** `2026-11-21`
- **Проект:** [`vortexnode/GboardSamsung`](https://github.com/vortexnode/GboardSamsung) (версия в репозитории: `4.4.2`, downstream-проект Vortex Node на базе `jasonwu1994/Gboard-patches`)
- **Целевая версия Gboard:** `18.5.4.993608717-release-arm64-v8a` (профиль биндингов `gboard-version-bindings.v1` / `1.6.0`)
- **Целевое устройство для последующего тестирования:** Samsung Galaxy S22 5G (`SM-S901U1`), Android 16 (API 36), One UI 8
- **Статус этапа:** **Этап 0 — исключительно технический аудит.** Исходный код, конфигурации, патчи, тесты, релизы, ветки и существующий отчёт [`docs/reports/samsung-keyboard-appearance-audit.md`](https://github.com/vortexnode/GboardSamsung/blob/main/docs/reports/samsung-keyboard-appearance-audit.md) не изменялись.
- **Шкала уверенности в отчёте:**
  - **`Подтверждено`** — напрямую проверено по исходному коду репозитория, привязкам Gboard `18.5.4` или реальным ZIP/CSS-архивам тем из закреплённого каталога `PackRepoBeta` (`4a8187dbe6b530c012e5996089c6a6246f42c65b`).
  - **`Гипотеза`** — технически обоснованное предположение на базе архитектуры Android/Gboard, но не подтверждённое прямым анализом APK Gboard `18.5.4`.
  - **`Требуется тест на устройстве`** — невозможно достоверно подтвердить без инспекции ресурсов целевого APK Gboard `18.5.4` и/или живого тестирования на Samsung Galaxy S22 5G (Android 16 / One UI 8).

> **Методологическая оговорка о границах доступных артефактов:** В соответствии с правилами репозитория (`AGENTS.md`), проприетарный APK Gboard `18.5.4` и извлечённые из него проприетарные ресурсы (`res/raw/style_sheet_*.binarypb`, `res/layout/*.xml`) не хранятся в репозитории. Все выводы ниже строго разделяют факты, подтверждённые по коду GboardSamsung, таблице биндингов [`gboard-version-bindings.json`](https://github.com/vortexnode/GboardSamsung/blob/main/patches/src/main/resources/gboard/gboard-version-bindings.json), выписке байткода [`GBOARD_18.5.4_BYTECODE_REFERENCE_EXTRACT.md`](https://github.com/vortexnode/GboardSamsung/blob/main/docs/GBOARD_18.5.4_BYTECODE_REFERENCE_EXTRACT.md) и реальным Gboard ZIP/CSS-темам, от гипотез и вопросов, подлежащих обязательной проверке на устройстве.

---

## 1. Краткое резюме технической реализуемости

Главная цель — максимально приблизить визуальный облик основной клавиатуры Gboard `18.5.4` к Samsung Keyboard One UI 8 (в светлой и тёмной темах), **полностью сохранив** оригинальный движок ввода Gboard, порядок и назначение клавиш, оригинальные иконки Google, карту вторичных символов, жесты, обработчики касаний и стабильность всех существующих патчей GboardSamsung.

По итогам глубокого аудита кодовой базы GboardSamsung и нативного движка тем Gboard установлено следующее:

1. **80–85% визуального сходства достижимо нативным движком ZIP/CSS-тем Gboard (минимальный риск, без изменения логики ввода):**
   - Нейтральный светло-серый фон в Light и почти чёрный OLED-фон в Dark (без Material You tint).
   - Белые буквенные/цифровые клавиши с мягкой нижней тенью в Light и средне-графитовые клавиши в Dark.
   - Фирменная контрастная иерархия функциональных клавиш (`Shift`, `Backspace`, `?123`): средне-серые в Light и **темнее буквенных** в Dark.
   - Прямоугольная форма клавиш с умеренным скруглением (`background_shape: rectangle`, `background_corner_radius`), границами (`enable_key_border = true`, `lock_key_border: true`) и нижней тенью (`elevation`, `shadow_color`, `edge_width`, `edge_color`).
   - Преобразование клавиши действия (Enter / Search / Send / Done) из акцентной «таблетки» Material 3 в прямоугольную функциональную клавишу с синей контурной иконкой Google через раздельные селекторы `.background-icon.for-action-key`, `.keytop.for-action-key` и `.icon.for-action-key` (требует контрольной проверки приоритета Material 3 в `18.5.4` на устройстве).
   - Визуальная стилизация цвета/контраста существующих вторичных символов Gboard через `.label.secondary`.
   - Бесшовная окраска нижней навигационной полосы на Android 16 (SDK 36), где Gboard рисует её самостоятельно по цвету активной темы.
2. **Обязательный лёгкий runtime-слой расширения Morphe требуется для 2 ключевых задач:**
   - **Автоматическое переключение Light / Dark:** нативный ключ Gboard `additional_keyboard_theme` хранит путь только к **одному** ZIP-файлу (`files:<name>.zip`) и не умеет сам переключаться между двумя кастомными ZIP-темами при смене `Configuration.UI_MODE_NIGHT_MASK`. Требуется лёгкий runtime-диспетчер на существующих lifecycle-хуках IME (`Lphr;`) + (опционально) `onConfigurationChanged`.
   - **Обязательные декоративные шевроны на пробеле (`‹ Русский ›` / `‹ English ›`):** ZIP/CSS-тема не умеет добавлять независимые левый/правый маркеры вокруг динамического названия языка. Задача безопасно решается через существующий `after_stock`-хук `SoftKeyView.s(SoftKeyDef, long)Z` (`GboardSoftKeyFamilyComposer`), уже проверенный в `GboardSpacebarGlobeKeyRuntime`, с использованием **неинтерактивного визуального слоя** (`ViewOverlay` или кастомного `Drawable`), не перехватывающего `MotionEvent` и корректно очищающегося при переиспользовании View.
3. **Задачи с повышенным риском или требующие живой проверки на Gboard `18.5.4`:**
   - **Круглые подложки-таблетки вокруг иконок верхнего тулбара (кроме `•••`):** в старом/Rboard CSS присутствуют `.icon.access-point-item` и `.background-icon.access-points-menu`, но в Gboard `18.5.4` с активным `enable_access_points_menu_redesign` структура контейнеров Access Points могла измениться; runtime-подмена background у кнопок тулбара несёт риск конфликтов с полосой подсказок, анимациями и динамическими кнопками. Рекомендуется сначала проверить чистый CSS, и при невозможности — не форсировать опасный View-хакинг.
   - **Мгновенная перезагрузка темы без закрытия клавиатуры** при смене системной темы (через запись в `SharedPreferences` vs повторный показ IME) — требует обязательного теста на Galaxy S22 (Android 16).
4. **Изменение исходной геометрии/кода самого Gboard APK НЕ требуется** для достижения целевого визуального уровня и **не рекомендуется** из-за высокой хрупкости между релизами Gboard.

---

## 2. Архитектура ZIP/CSS-тем Gboard 18.5.4

### 2.1. Подтверждённый контракт импорта, валидации и активации тем

Анализ [`GboardCustomThemeInstaller.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/customtheme/GboardCustomThemeInstaller.java), [`GboardThemeImportContract.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/customtheme/GboardThemeImportContract.java), [`GboardCustomThemeTargetContract.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/customtheme/GboardCustomThemeTargetContract.java) и [`gboard-version-bindings.json`](https://github.com/vortexnode/GboardSamsung/blob/main/patches/src/main/resources/gboard/gboard-version-bindings.json) полностью подтверждает рабочий конвейер тем в Gboard `18.5.4`:

- **Хранение ZIP-архивов:** внутренний каталог приложения `context.getFilesDir()` (имена стокового формата `user_theme_package_%015d_%02d.zip` или совместимый `files:<filename>`).
- **Структура архива (`GboardThemeImportContract`):**
  - В корне ZIP обязан присутствовать `metadata.json` (или бинарный `metadata.binarypb`).
  - Безопасные пути без `..` и абсолютных префиксов, защита от zip-slip.
- **Нативный валидатор Gboard `18.5.4`:**
  - Привязка `custom_theme_validator`: метод `Lrnw;->h(Ljava/io/File;)Z` (вызывается из `GboardCustomThemeTargetContract.validateThemeArchive(Context, File)`). Любой наш встроенный ZIP обязан проходить эту проверку перед активацией.
- **Активация темы (`GboardCustomThemeInstaller.activate`):**
  - Запись выполняется в device-protected `SharedPreferences`: `context.createDeviceProtectedStorageContext().getSharedPreferences(context.getPackageName() + "_preferences", Context.MODE_PRIVATE)`.
  - Используются ровно два ключа Gboard:
    - `additional_keyboard_theme` = `"files:" + committed.getName()`
    - `enable_key_border` = `boolean`
- **Официальный Theme Picker Gboard `18.5.4`:**
  - Привязки `Lkhl;` (`ThemeListingFragment`), `Lkhl;->i(Intent)` (extra `"intent_extra_key_new_theme_file_name"`), `Lkhr;->f(Lkhl;, Lkhu;, I)`.

### 2.2. Подтверждённый формат `metadata.json` и синтаксис CSS Gboard

По реальным ZIP-архивам из закреплённого в [`catalog.json`](https://github.com/vortexnode/GboardSamsung/blob/main/patches/src/main/resources/custom-theme-assets/catalog.json) репозитория `PackRepoBeta` (коммит `4a8187dbe6b530c012e5996089c6a6246f42c65b`, пакеты `stock_port.zip`, `3D_ThemePack.zip`, `Ios_ThemePack.zip`) подтверждены структура `metadata.json` и язык таблиц стилей Gboard:

- **Поля `metadata.json` (`format_version: 3`):**
  - `format_version`: `3`
  - `id`: уникальный строковый идентификатор темы
  - `name`: отображаемое имя
  - `is_light_theme`: `true` / `false` (критично для контраста системных элементов, цвета иконок навигационной панели и совместимости с `Frosted Glass`)
  - `prefer_key_border`: `true` / `false`
  - `lock_key_border`: `true` / `false` (встречается в `3D_Ios.zip`; поведение на `18.5.4` требует проверки на устройстве)
  - `style_sheets`: упорядоченный массив `.css` (или `.binarypb`) файлов
  - `flavors`: массив условных оверлеев, в частности `{ "type": "BORDER", "style_sheets": [...] }`, применяемых когда включён `enable_key_border = true`
- **Синтаксис CSS Gboard:**
  - Переменные объявляются директивой `@def <name> <value>;` (цвета в формате `#RRGGBBAA`, числа в `dp` без суффикса или float).
  - Селекторы классов и состояний: `.keytop`, `.keytop:pressed`, `.keytop.dark`, `.keytop.for-action-key`, `.background-icon.for-action-key`, `.icon.for-action-key`, `.label`, `.label.secondary`, `.space_bar`, `.keyboard-base-area`, `.keyboard-header-area`, `.keyboard-body-area`.
  - Подтверждённые свойства: `background_color`, `color`, `alpha`, `background_shape`, `background_corner_radius`, `elevation`, `shadow_color`, `edge_width`, `edge_color`, `padding_ratio_left/top/right/bottom`, `visibility`.
- **Ключевое архитектурное ограничение:**
  - `additional_keyboard_theme` хранит **ровно одну** строку. Внутри одного `metadata.json` (версии 3) не подтверждён встроенный механизм автоматического переключения стилей по системному `UI_MODE_NIGHT_YES` / `UI_MODE_NIGHT_NO` для пользовательских ZIP-тем (динамическое переключение в Gboard работает только для встроенной системной темы Dynamic Color / Material You).

### 2.3. Матрица оценки: Архитектура ZIP/CSS-тем Gboard 18.5.4

| Элемент | Желаемый результат | Возможности CSS/темы | Возможности runtime | Требуется изменение Gboard APK? | Доказательства | Уверенность | Риски |
|---|---|---|---|---|---|---|---|
| Валидация и установка встроенных ZIP-тем | Безопасная распаковка и проверка `samsung_oneui8_light.zip` и `samsung_oneui8_dark.zip` в `filesDir` | Полностью нативный формат `format_version: 3` + `.css` + `flavors: [BORDER]` | Полностью поддерживается через `GboardCustomThemeTargetContract.validateThemeArchive` (`Lrnw;->h`) и `GboardCustomThemeInstaller` | Нет (используются уже существующие хуки/API расширения) | [`GboardCustomThemeInstaller.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/customtheme/GboardCustomThemeInstaller.java), [`GboardThemeImportContract.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/customtheme/GboardThemeImportContract.java), [`gboard-version-bindings.json`](https://github.com/vortexnode/GboardSamsung/blob/main/patches/src/main/resources/gboard/gboard-version-bindings.json) (`custom_theme_validator`) | `Подтверждено` | Ошибка в CSS или `metadata.json` приведёт к отклонению архива валидатором `Lrnw;->h`; лечится обязательным предрелизным тестом на `18.5.4` |
| Переключатель `is_light_theme` и цвет системной навбара на Android 16 (SDK 36) | Тёмные иконки навбара в Light, светлые в Dark, цвет полосы совпадает с фоном клавиатуры | `is_light_theme: true/false` + цвет `.keyboard-body-area` / `.keyboard-base-area` | На SDK 36 Gboard сам красит полосу в `InputView` (`Lrra;->f(Window, Lrqz;)`); `GboardSeamlessNavBarRuntime` читает `uiMode` и цвет body | Нет | [`GboardFrostedGlassRuntime.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/frostedglass/GboardFrostedGlassRuntime.java) (`STOCK_STRIP_SDK = 36`, `navigationTheme`), [`GboardSeamlessNavBarRuntime.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/frostedglass/GboardSeamlessNavBarRuntime.java) | `Подтверждено` | На Android 16 нужно проверить контраст системной кнопки скрытия клавиатуры на чисто чёрном `#000000` и светлом `#EAEAEF` фонах |
| Поддержка `lock_key_border` и новых M3-свойств CSS в `18.5.4` | Гарантировать предсказуемый вид клавиш с границами без вмешательства Material You | `prefer_key_border: true`, `lock_key_border: true` встречаются в `3D_Ios.zip` | Runtime при активации явно записывает `enable_key_border = true` в device-protected prefs | Нет | `3D_Ios.zip/metadata.json` (из `PackRepoBeta` `4a8187db`), [`GboardCustomThemeInstaller.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/customtheme/GboardCustomThemeInstaller.java) | `Требуется тест на устройстве` | Если `18.5.4` игнорирует `lock_key_border`, достаточно принудительной установки `enable_key_border = true` из runtime с сохранением прежнего значения для отката |

---

## 3. Оформление основных и функциональных клавиш

По эталонным скриншотам Samsung Keyboard One UI 8 (Galaxy S22, Android 16) цветовая архитектура строится на **инвертированной контрастности в Dark** и **нейтральной кнопке действия с синей иконкой**:

- **Light (One UI 8):**
  - Фон панели клавиатуры (`.keyboard-base-area`, `.keyboard-body-area`): холодный светло-серый (`~#EAEAEF`).
  - Буквы, цифры, запятая, точка, пробел (`.keytop`, `.space_bar`): чистый белый (`#FFFFFFFF`), текст — глубокий тёмно-серый (`#1C1C1EFF`).
  - Функциональные клавиши `Shift`, `Backspace`, `?123` (`.keytop.dark`): приглушённый средне-серый (`~#C8CACFFF`), тёмные иконки/метки (`#1C1C1EFF`).
  - Клавиша действия `Enter / Search / Send / Done`: та же средне-серая прямоугольная клавиша (`~#C8CACFFF`), но с **синей контурной иконкой One UI** (`~#2A6BF2FF`).
- **Dark (One UI 8):**
  - Фон панели клавиатуры: глубокий почти чёрный OLED (`#000000FF` / `#08080AFF`).
  - Буквы, цифры, запятая, точка, пробел (`.keytop`, `.space_bar`): средне-тёмный графит (`~#38383BFF`), белый текст (`#FFFFFFFF`).
  - Функциональные клавиши `Shift`, `Backspace`, `?123` (`.keytop.dark`): **темнее буквенных клавиш** (`~#1C1C1FFF`), белые иконки (`#FFFFFFFF`).
  - Клавиша действия `Enter / Search / Send / Done`: та же тёмная подложка (`~#1C1C1FFF`), внутри — **синяя контурная иконка One UI** (`~#4D8BFFFF`).

**Важнейшая находка аудита по Action Key:** В [`GboardFrostedGlassRuntime.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/frostedglass/GboardFrostedGlassRuntime.java) (строки `1071–1076`, `1149–1151`) и реальной теме `3D_Ios.zip` (`style_sheet_3dios.css`, `style_sheet_3dios_border.css`) подтверждено, что в Gboard заливка круглой/капсульной кнопки действия часто рисуется отдельным слоем `.background-icon.for-action-key` поверх `.keytop.for-action-key`, а цвет самой Google-иконки задаётся отдельно через `.icon.for-action-key` и `.icon.for-action-key.for-action-default-key`. Сделав `.background-icon.for-action-key { color: #00000000; }`, задав `.keytop.for-action-key { background_color: @color_state_key_dark; }` и `.icon.for-action-key { color: @color_icon_action; }` (Samsung Blue), мы получаем точную визуальную семантику One UI 8 **без подмены иконок Google и без правки APK**.

### Матрица оценки: Основные и функциональные клавиши

| Элемент | Желаемый результат | Возможности CSS/темы | Возможности runtime | Требуется изменение Gboard APK? | Доказательства | Уверенность | Риски |
|---|---|---|---|---|---|---|---|
| Фон панели и области клавиш | Нейтральный светло-серый в Light (`~#EAEAEF`), почти чёрный OLED в Dark (`~#08080A`), без Material You tint | Полностью через `.keyboard-base-area`, `.keyboard-body-area`, `@def color_base` | Не требуется (достаточно CSS) | Нет | `style_sheet_3dios.css`, `style_sheet_3dblack.css`, [`GboardFrostedGlassRuntime.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/frostedglass/GboardFrostedGlassRuntime.java) (`TARGET_SURFACE`) | `Подтверждено` | Низкий: проверить отсутствие просвечивающих границ между `keyboard-header-area` и `keyboard-body-area` |
| Буквенные, цифровые клавиши, запятая, точка, пробел | Белые в Light, средне-графитовые в Dark; чёткие контрастные метки и состояние нажатия `:pressed` | Полностью через `.keytop`, `.keytop:pressed`, `.space_bar`, `.space_bar:pressed`, `.keytop.for-space-bar`, `.label`, `.label.for-space-key` | Не требуется | Нет | `style_sheet_3dios.css`, `style_sheet_3dblack_border.css`, [`GboardFrostedGlassRuntime.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/frostedglass/GboardFrostedGlassRuntime.java) (`TARGET_KEY`) | `Подтверждено` | Низкий: в Gboard запятая/точка могут использовать `.keytop.dark` в части раскладок — проверить на RU и EN раскладках, чтобы не стали «служебными» |
| Функциональные клавиши (`Shift`, `Backspace`, `?123`) | Средне-серые в Light, **темнее букв** (`~#1C1C1F`) в Dark; оригинальные иконки Google без подмены | Полностью через `.keytop.dark`, `.keytop.dark:pressed`, `.label.for-function-key`, `.icon.for-function-key`, `.icon.active.for-shift-key` | Не требуется | Нет | `style_sheet_3dios.css`, `style_sheet_3dblack_border.css` | `Подтверждено` | Средний: проверить состояние активного `Shift` и `Caps Lock` (`.icon.active.for-shift-key`), чтобы индикация регистра оставалась отчётливой |
| Клавиша действия (`Enter / Search / Send / Go / Next`) | Прямоугольная клавиша в тон функциональных + **синяя Google-иконка** (вместо сплошной круглой/pill заливки M3) | Раздельные селекторы `.background-icon.for-action-key` (`#00000000`), `.keytop.for-action-key` (`@color_state_key_dark`), `.icon.for-action-key` (синий One UI) и `.icon.for-action-key.for-action-default-key` | В крайнем случае возможен tint/скрытие слоя `.background-icon.for-action-key`, но нежелательно при рабочем CSS | Нет | `style_sheet_3dios.css`, `style_sheet_3dblack_border.css`, [`GboardFrostedGlassRuntime.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/frostedglass/GboardFrostedGlassRuntime.java) (`TARGET_ACTION_KEY`, строки 1071–1076) | `Требуется тест на устройстве` | Средний: в Gboard `18.5.4` Material 3 может накладывать собственный drawable/selector на action-key в разных IME-контекстах (`Search`, `Send`, `Enter`, `Done`, `Next`) — обязательна проверка всех типов полей ввода |
| Всплывающие окна нажатия и выбора вариантов (popup) | Единая с One UI 8 светлая/тёмная палитра без чужеродных цветов M3 | Полностью через `.popup`, `.popup-item`, `.popup-item:pressed`, `.label.for-popup-item`, `@def color_popup_background` | Не требуется | Нет | `style_sheet_3dios.css`, `style_sheet_3dblack.css` | `Подтверждено` | Низкий: проверить контраст выделенного символа в popup диакритики и `Long-Press Editing Shortcuts` |
| Текстовая метка клавиши символов (`?123` vs `!#1`) | Сохранить нативный `?123` (согласно принципу сохранения движка Gboard) | CSS не меняет текст метки | Не внедрять: перехват `SoftKeyDef` хрупок для локалей и режимов (`?123` / `=\<` / `ABC`) | Не требуется (оставляем `?123`) | [`GboardLongPressQuickActionsReflectionHandles.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/longpressquickactions/GboardLongPressQuickActionsReflectionHandles.java) | `Подтверждено` | Избыточный риск регрессий ради косметики — целесообразно не трогать |

---

## 4. Возможности изменения формы, скруглений, границ и теней

В Samsung Keyboard One UI 8 клавиши имеют форму **аккуратных прямоугольников со средним радиусом скругления (`~6–8dp`)**, чётким разделением между соседними клавишами, мягкой нижней тенью/каймой в светлой теме и чистым плоским контрастом на чёрном фоне в тёмной теме.

В GboardSamsung уже существуют два смежных механизма управления геометрией, которые важно не спутать и не столкнуть между собой:

1. **CSS-свойства индивидуальных клавиш (подтверждены в `3D_Ios.zip` и `3D_Black.zip`):**
   - `background_shape: rectangle;`
   - `background_corner_radius: @default_background_corner_radius;` (в `dp`, например `7`–`8` для One UI 8 вместо более округлых/капсульных форм Material 3)
   - `elevation: 2.0;` (в `BORDER`-flavor для мягкой тени в Light и `0` в Dark)
   - `shadow_color: #...;`
   - `edge_width: 1;` и `edge_color: #...;` (нижняя 1dp-кромка клавиши в светлой теме One UI!)
   - `padding_ratio_left`, `padding_ratio_top`, `padding_ratio_right`, `padding_ratio_bottom` — тонкая регулировка визуальных зазоров между keycap внутри неизменной touch-сетки (без изменения hit-target самой `SoftKeyView`).
2. **Патч `Key Shape Selection` (`GboardFeatureFlagsRuntime.FLAG_KEY_SHAPE_SELECTION = "more_pill_keys"`):**
   - Подтверждено в [`GboardFeatureFlagsRuntime.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/featureflags/GboardFeatureFlagsRuntime.java) (строка `20–21`). Этот флаг открывает нативную настройку «капсульных» клавиш Material 3 в деталях темы. **Важно:** если пользователь включил капсульную форму клавиш (pill keys) в настройках темы Gboard, она может конфликтовать с прямоугольным стилем One UI 8 — этот сценарий нужно проверить на устройстве.
3. **Патч `Rounded Keyboard Panel` (`GboardRoundedKeyboardRuntime` + `GboardRoundedKeyboardBytecodePatch`):**
   - Перехватывает `Lrnb;->b(String, List)` **только** для двух селекторов внешней рамки панели: `.keyboard-base-area.keyboard-outline` и `.keyboard-body-area.keyboard-outline-bottom.clip-to-outline-for-old-android`, подставляя `Lrpt` (`float[4]`). Отдельные клавиши `.keytop` он **не трогает**, поэтому полностью совместим с Samsung-темами.

### Матрица оценки: Форма, скругления, границы и тени

| Элемент | Желаемый результат | Возможности CSS/темы | Возможности runtime | Требуется изменение Gboard APK? | Доказательства | Уверенность | Риски |
|---|---|---|---|---|---|---|---|
| Форма клавиш (прямоугольник vs pill/круг) | Чёткие скруглённые прямоугольники для всех букв, цифр, модификаторов, пробела и action-key | `background_shape: rectangle;` на `.keytop`, `.keytop.for-space-bar`, `.keytop.for-action-key`, `.background-icon.for-action-key` | Не требуется (если `more_pill_keys` не переопределяет custom ZIP) | Нет | `style_sheet_3dios.css`, `style_sheet_3dios_border.css`, [`GboardFeatureFlagsRuntime.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/featureflags/GboardFeatureFlagsRuntime.java) | `Подтверждено` (базовый CSS) / `Требуется тест на устройстве` (приоритет при активном `more_pill_keys`) | Средний: в Gboard `18.5.4` при включённом `Key Shape Selection` (`more_pill_keys`) движок может применять flavor `PILL_KEY` поверх `BORDER` |
| Радиус скругления клавиш (`~6–8dp`) | Единый умеренный радиус One UI 8 вместо избыточного M3-скругления | `@def default_background_corner_radius 7;` (или `8`) + `background_corner_radius` на `.keytop`, `.keytop.for-space-bar`, `.keytop.for-numpad-big-panel` | Теоретически возможен перехват `Lrnb;->b` (по аналогии с `GboardRoundedKeyboardRuntime`), но избыточен при рабочем CSS | Нет | `style_sheet_3dios_border.css`, [`GboardRoundedKeyboardRuntime.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/roundedkeyboard/GboardRoundedKeyboardRuntime.java) | `Подтверждено` | Низкий: проверить, не обрезаются ли углы на узкой 11-колончатой русской раскладке `ЙЦУКЕН` |
| Включение границ клавиш | Клавиши всегда чётко отделены от подложки (`enable_key_border = true`) | `prefer_key_border: true` + `flavors: [BORDER]` | Обязательно сохранять прежний `enable_key_border` и выставлять `true` при активации режима Samsung | Нет | [`GboardCustomThemeInstaller.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/customtheme/GboardCustomThemeInstaller.java) | `Подтверждено` | Низкий: важно корректно восстанавливать старое значение `enable_key_border` при выключении режима |
| Мягкая нижняя тень / кайма в Light и плоский стиль в Dark | В Light — аккуратная 1dp нижняя тень (`#C5C8CE`-тональности); в Dark — без светлой обводки и артефактов | `elevation`, `shadow_color`, `edge_width`, `edge_color` в `BORDER`-таблице (`edge_width: 1`, `elevation: 1.5–2.0` в Light; `elevation: 0`, `edge_width: 0` в Dark) | Не требуется | Нет | `style_sheet_3dios_border.css`, `style_sheet_3dblack_border.css` | `Требуется тест на устройстве` | Средний: точный рендер `elevation` + `shadow_color` + `edge_color` на Android 16 (Hardware Accelerated Canvas) зависит от движка Gboard `18.5.4` и должен подбираться визуально на Galaxy S22 |
| Межклавишные зазоры (`padding_ratio_*`) | Аккуратная плотность, близкая к Samsung One UI 8, без изменения hit-box | `padding_ratio_left/top/right/bottom` в CSS (в `3D_Black` используется `0.85 / 1.2`) | Не рекомендуется менять layout margins в runtime | Нет | `style_sheet_3dblack_border.css` | `Требуется тест на устройстве` | Средний: чрезмерный `padding_ratio` в 11-колончатой RU-раскладке может визуально сжать узкие клавиши (`й..х`) или обрезать вторичные символы |

---

## 5. Возможности оформления верхнего тулбара

**Жёсткое ограничение проекта:** в верхнем тулбаре (Access Points Strip / Suggestion Strip) необходимо **на 100% сохранить** оригинальные иконки Google, их пропорции, функции, обработчики нажатий/долгого нажатия/перетаскивания, accessibility (`contentDescription`), анимации переключения на полосу подсказок, а также все динамические элементы (подсказки автодополнения, буфер обмена, undo/redo, AI-инструменты, кнопку `•••`). Подмена иконок на «клоны Samsung» или подмена контроллеров (`Lmwv;`, `Lmtr;`) недопустима.

По анализу репозитория установлено:
- В [`GboardAccessPointContributionsTargets.kt`](https://github.com/vortexnode/GboardSamsung/blob/main/patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/shared/accesspoint/GboardAccessPointContributionsTargets.kt) и [`gboard-version-bindings.json`](https://github.com/vortexnode/GboardSamsung/blob/main/patches/src/main/resources/gboard/gboard-version-bindings.json) тулбар управляется `Lmwv;` (AccessPointsController) и `Lmvg;` (порядок), а отображается внутри контейнера `.keyboard-header-area` (`keyboard_header_view_holder`).
- В реальных CSS-темах Gboard (`style_sheet_3dios.css`, `style_sheet_3dblack.css`) подтверждены селекторы:
  - `.keyboard-header-area`, `.tab.in-keyboard-header-area` — фон и геометрия самой полосы тулбара.
  - `.icon.access-point-item`, `.icon.header.inactive`, `.icon.active` — цвет и прозрачность иконок тулбара.
  - `.background-icon.access-points-menu`, `.background.access-point-panel-item`, `.access-points-panel`, `.expand-access-points-hint` — фон кнопок меню и панели расширенных инструментов.
- **Ключевой неизвестный момент (главный кандидат на проверку на устройстве):** в Gboard `18.5.4` действует флаг `enable_access_points_menu_redesign` (упомянут в патче `accesspointsmenu`). На скриншотах One UI 8 первые 5 кнопок тулбара имеют **круглые нейтральные подложки-таблетки** (`~#E4E4E8` в Light, `~#2C2C2E` в Dark), а крайняя `•••` — без круга.
  - Поддерживает ли CSS Gboard `18.5.4` круглую подложку (через `background_shape: oval` или `background_corner_radius: 100` + `background_color` на селекторе кнопки Access Point в верхней полосе) **без** затрагивания полосы подсказок и `•••` — **нельзя подтвердить без инспекции ресурсов Gboard `18.5.4` и теста на устройстве**.
  - Попытка дорисовывать круглые подложки через runtime-обход `keyboard_header_view_holder` сопряжена с **высоким риском**: в этой же зоне динамически появляются подсказки текста (`.candidates-area`), чипы буфера обмена, кнопки возврата из Emoji/GIF, drag-and-drop popup (`AccessPointDragPopupView`) и анимации сворачивания тулбара.

### Матрица оценки: Верхний тулбар

| Элемент | Желаемый результат | Возможности CSS/темы | Возможности runtime | Требуется изменение Gboard APK? | Доказательства | Уверенность | Риски |
|---|---|---|---|---|---|---|---|
| Фон полосы тулбара и разделитель | Light: мягкий светлый верх (`~#F4F4F6`) с тонким разделением; Dark: глубокий угольный (`~#141416` / `#08080A`) | `.keyboard-header-area`, `.candidates-area`, `@def color_header`, `@def color_keyboard_top_separator` | Не требуется | Нет | `style_sheet_3dios.css`, `style_sheet_3dblack.css`, [`GboardFrostedGlassRuntime.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/frostedglass/GboardFrostedGlassRuntime.java) | `Подтверждено` | Низкий: проверить отсутствие резкого шва при появлении полосы подсказок (`.candidates-area`) |
| Цвет и контраст оригинальных иконок Google и текста подсказок | Чёткие тёмно-серые иконки в Light, белые в Dark; оригинальные иконки, пропорции и клики не тронуты | `.icon.access-point-item`, `.icon.header.inactive`, `.icon.active`, `.label.for-candidate-key`, `.label.for-candidate-key:selected` | Не требуется | Нет | `style_sheet_3dios.css`, `style_sheet_3dblack.css` | `Подтверждено` | Низкий: проверить активное состояние открытых вкладок (Emoji / Clipboard / Translate), чтобы активная иконка выделялась |
| Круглые подложки-таблетки под кнопками тулбара (без `•••`) | Мягкие круглые бейджи (`#E4E4E8` в Light, `#2C2C2E` в Dark) позади иконок тулбара, как в One UI 8, без изменения размеров/кликов | Селекторы `.background-icon.access-points-menu` / `.background.access-point-panel-item` есть в CSS, но точный селектор слота верхней полосы в `18.5.4` (при `enable_access_points_menu_redesign`) не подтверждён | Теоретически возможен поиск слотов внутри `.keyboard-header-area`, но **высокий риск** поломки ripple, drag-and-drop (`AccessPointDragPopupView`), полосы подсказок и динамических кнопок | Возможно (XML layout слота Access Point), но **не рекомендуется** | `style_sheet_3dios.css`, [`GboardAccessPointContributionsTargets.kt`](https://github.com/vortexnode/GboardSamsung/blob/main/patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/shared/accesspoint/GboardAccessPointContributionsTargets.kt), [`gboard-version-bindings.json`](https://github.com/vortexnode/GboardSamsung/blob/main/patches/src/main/resources/gboard/gboard-version-bindings.json) | `Требуется тест на устройстве` | **Высокий (при runtime/APK-хакинге):** артефакты при переключении тулбар↔подсказки, обрезка ripple, регрессии при обновлении Gboard. Рекомендация: делать **только** если подтвердится безопасный чистый CSS-селектор в `18.5.4` |
| Панель раскрытого меню инструментов (`•••`) | Гармоничные светлый/тёмный фон и плитки меню инструментов | `.access-points-panel`, `.background.access-point-panel-item`, `.icon.access-points-panel-item`, `@def color_access_points_menu_background` | Не требуется | Нет | `style_sheet_3dios.css`, `style_sheet_3dblack.css` | `Подтверждено` | Низкий: проверить читаемость подписей в обоих режимах меню (старый и redesigned) |

---

## 6. Реализация обязательных шевронов на пробеле (`‹ Русский ›` / `‹ English ›`)

**Это обязательная функциональная цель проекта.** На эталонных скриншотах One UI 8 клавиша пробела отображает по центру название активного языка (`Русский`, `English (US)`), а слева и справа от него симметрично расположены тонкие направленные шевроны (`‹` и `›`), визуально подсказывающие возможность переключения языка свайпом по пробелу.

### 6.1. Обязательные требования безопасности к реализации шевронов

1. Шевроны должны быть **строго декоративными и неинтерактивными** (не перехватывать `ACTION_DOWN` / `ACTION_MOVE` / `ACTION_UP`, не добавлять `OnTouchListener`, не менять `hitRect` и не менять фокус/TalkBack).
2. Полностью сохранить все механики пробела:
   - короткий тап (ввод пробела);
   - горизонтальный свайп влево/вправо для переключения языка (`GboardSpacebarGestureRuntime` на `KeyboardViewHolder.dispatchTouchEvent`);
   - удержание пробела + ведение пальца для управления курсором;
   - долгое нажатие для системного диалога выбора метода ввода (если включено в Gboard).
3. Корректно работать при:
   - переиспользовании (recycling) `SoftKeyView` (когда слот пробела перебиндивается на другую клавишу — например, в символьных, цифровых, emoji-раскладках или калькуляторе);
   - переключении языков (короткие и длинные названия языков: `Русский`, `English (US)`, `EN · RU`, многоязычные пары);
   - переключении режимов клавиатуры: стандартный, разделённый (split), плавающий (floating), режим одной руки (one-handed), альбомная ориентация;
   - смене Light / Dark темы (цвет шевронов обязан подстраиваться под цвет текста пробела, а не оставаться невидимым);
   - скрытии/показе клавиши глобуса (`GboardSpacebarGlobeKeyRuntime`) и отключении режима `Samsung Keyboard`.

### 6.2. Архитектурный анализ 3 вариантов реализации на Gboard `18.5.4`

В GboardSamsung уже имеется **проверенная и композиционная точка входа** — [`GboardSoftKeyFamilyComposer.kt`](https://github.com/vortexnode/GboardSamsung/blob/main/patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/shared/GboardSoftKeyFamilyComposer.kt), которая перехватывает `SoftKeyView.s(SoftKeyDef, long)Z` (`soft_key_bind`) и уже вызывает `GboardSpacebarGlobeKeyRuntime.afterSoftKeyBind(View)` (с `afterOrder = 900`). Идентификация пробела уже реализована и проверена в [`GboardSpacebarKeyHitTester.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/spacebargesture/GboardSpacebarKeyHitTester.java): `SoftKeyView.e` → `SoftKeyDef.g(qae.PRESS)` → `ActionDef.f[0].c == KeyEvent.KEYCODE_SPACE (62)`.

Сравним три возможных способа отрисовки шевронов внутри `after_stock`-хука:

1. **Вариант A — Неинтерактивный кастомный `Drawable` в `ViewOverlay` (`softKeyView.getOverlay().add(chevronDrawable)`) [РЕКОМЕНДУЕМЫЙ]:**
   - **Как работает:** при биндинге `SoftKeyView` с `pressKeycode == KeyEvent.KEYCODE_SPACE` и активном режиме `Samsung Keyboard` создаётся (или переиспользуется из `WeakHashMap<View, SpacebarChevronHandle>`) лёгкий `Drawable`, который рисует векторные шевроны `‹` и `›` через `Canvas.drawPath(...)` симметрично внутри границ keycap (с отступом от левого и правого краёв, например `~12–16%` ширины пробела или фиксированный отступ `~14–18dp` с проверкой минимальной ширины!).
   - **Почему это лучший вариант:**
     - `ViewOverlay` в Android (`API 18+`) **физически не участвует в dispatch touch-событий и в иерархии Accessibility/TalkBack** — нулевой риск сломать тап, свайп или курсор!
     - **Не модифицирует** текст внутреннего `TextView` и не ломает TalkBack (экранный диктор продолжит читать «Пробел, Русский», а не «левая кавычка Русский правая кавычка»).
     - **Идеально защищён от дублирования** (в отличие от модификации текста `TextView`, где повторный вызов легко даёт `‹ ‹ Русский › ›`).
     - **Автоматически подстраивается под ширину:** слушатель `OnLayoutChangeListener` обновляет `chevronDrawable.setBounds(0, 0, v.getWidth(), v.getHeight())`. Если пробел стал слишком узким (например, в split-клавиатуре или при длинном названии языка, когда текстовый `TextView` занимает почти всю ширину) — `Drawable` просто не рисует шевроны (graceful degradation, ноль наложения текста на стрелки!).
     - **Точный цвет без хардкода:** цвет штриха можно брать напрямую из `currentTextColor` найденного дочернего `TextView` внутри `SoftKeyView` (с лёгким приглушением alpha `~0.85f` или `1.0f`) — тогда шевроны **автоматически** идеальны и в Light, и в Dark, и поверх `Frosted Glass`!
     - **Безопасная очистка при recycling:** если `SoftKeyView` перебиндился на любую клавишу с `pressKeycode != KeyEvent.KEYCODE_SPACE` (или режим выключен), `softKeyView.getOverlay().remove(handle.drawable)` + снятие `OnLayoutChangeListener` мгновенно возвращают View в 100% исходное состояние (точно по паттерну `WeakHashMap` из `GboardSpacebarGlobeKeyRuntime`).
   - **Нюанс для проверки на устройстве:** проверить на `SoftKeyView` Gboard `18.5.4`, корректно ли `ViewOverlay` отображается поверх фона keycap и не сдвигается ли относительно внутренних `padding` клавиши пробела (при необходимости `Drawable` учитывает `getPaddingLeft/Right/Top/Bottom` или `bounds` фонового `View` с тегом `.space_bar` / `.keytop`).

2. **Вариант B — Модификация текста дочернего `TextView` внутри `SoftKeyView` (`"‹   " + label + "   ›"`):**
   - **Плюсы:** проще по объёму кода.
   - **Серьёзные минусы:**
     - Загрязняет `contentDescription` / TalkBack (если текст используется для озвучивания).
     - Gboard может повторно перезаписывать текст `TextView` асинхронно после `SoftKeyView.s(...)` (например, при анимации смены подписи языка или подсказке «Пробел»), вызывая мерцание или потерю шевронов.
     - Невозможно развести шевроны ближе к краям пробела, как на Samsung One UI 8 (`[  ‹     Русский     ›  ]`), не вставляя ломкие пробелы, которые к тому же обрезают длинные названия языков (`ellipsize`)!
     - Риск двойного оборачивания (`‹ ‹ Русский › ›`), если логика очистки неидеальна.

3. **Вариант C — Использование ZIP/CSS-темы (`background_image` / 9-patch PNG со стрелками на `.space_bar`):**
   - **Плюсы:** нулевой Java-код.
   - **Серьёзные минусы:**
     - В Gboard 9-patch / `background_image` растягивает стрелки или не умеет скрывать их в режимах, где пробел не имеет названия языка (например, символьная раскладка `?123`, узкий пробел в split-mode, режим пароля/цифровой ввод, где свайп языка отключён).
     - Нельзя независимо включать/выключать шевроны настройкой без пересборки ZIP-темы.
     - Требует двух отдельных растровых/векторных ассетов для Light и Dark и не реагирует на `GboardSpacebarGestureSettings` (если пользователь отключил свайп по пробелу).

**Вывод по разделу 6:** **Вариант A (`ViewOverlay` + векторный `Canvas`-`Drawable` в `after_stock` хуке `SoftKeyView.s(SoftKeyDef, long)Z`)** — однозначно самый чистый, безопасный и визуально точный способ.

### Матрица оценки: Шевроны на пробеле (`‹ Русский ›` / `‹ English ›`)

| Элемент | Желаемый результат | Возможности CSS/темы | Возможности runtime | Требуется изменение Gboard APK? | Доказательства | Уверенность | Риски |
|---|---|---|---|---|---|---|---|
| Отрисовка шевронов `‹` и `›` по бокам названия языка | Чёткие симметричные шевроны One UI 8 слева и справа внутри keycap пробела, динамический цвет под Light/Dark | Ограниченно (9-patch не умеет скрываться на символьной/узкой раскладке и не зависит от настроек) | **Оптимально:** `after_stock` в `GboardSoftKeyFamilyComposer` (после `SAMSUNG_SPACEBAR_GESTURES`, напр. `afterOrder = 950`) → `ViewOverlay` с лёгким векторным `Drawable`, берущим цвет из дочернего `TextView` | Нет (хук `soft_key_bind` уже встроен и верифицирован для `18.5.4`) | [`GboardSoftKeyFamilyComposer.kt`](https://github.com/vortexnode/GboardSamsung/blob/main/patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/shared/GboardSoftKeyFamilyComposer.kt), [`GboardSpacebarGlobeKeyRuntime.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/spacebargesture/GboardSpacebarGlobeKeyRuntime.java), [`GboardSpacebarKeyHitTester.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/spacebargesture/GboardSpacebarKeyHitTester.java) | `Подтверждено` (точка хука и детекция пробела) / `Требуется тест на устройстве` (позиционирование `ViewOverlay` относительно внутренних padding `SoftKeyView`) | Низкий–средний: нужно проверить, не рисует ли `SoftKeyView` с `clipChildren` или нестандартным внутренним padding пробела смещённый keycap (решается привязкой bounds к внутреннему `.space_bar` child-view или insets) |
| Защита жестов пробела (тап, свайп языка, курсор) | 100% сохранение логики `GboardSpacebarGestureRuntime` и нативного курсора Gboard | Не применимо | `ViewOverlay` не принимает `MotionEvent`, не меняет `SoftKeyDef`, не ставит `OnTouchListener` | Нет | [`GboardSpacebarGestureRuntime.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/spacebargesture/GboardSpacebarGestureRuntime.java), спецификация Android `View.getOverlay()` | `Подтверждено` | Минимальный: необходимо всё равно пройти полный тест свайпа и курсора на Galaxy S22 |
| Защита от наложения на длинное название языка и в узких режимах (split / floating / one-handed / `?123`) | Шевроны скрываются автоматически, если пробел узкий или нет текстовой метки языка (например, на раскладке `?123` / `123`) | Невозможно в CSS | Проверка в runtime: наличие видимого непустого `TextView` с названием языка + проверка `availableSideMargin >= minChevronWidthPx` перед отрисовкой | Нет | Архитектура `TextView.getPaint().measureText(...)` и `View.getWidth()` | `Гипотеза` (требует подбора порогов и теста на `SoftKeyView` Gboard `18.5.4`) | Средний: если в `18.5.4` подпись языка на пробеле рисуется через кастомный `AutoSizeTextView` или `ImageView` (логотип Google при одном языке) — нужно проверить структуру дочерних View пробела на устройстве |
| Безопасная очистка при recycling `SoftKeyView` и отключении фичи | Ноль «фантомных» шевронов на других клавишах | Не применимо | `WeakHashMap<View, ChevronOverlayHandle>` + немедленное `overlay.remove(...)` при `pressKeycode != KEYCODE_SPACE` или при переключении настройки | Нет | Паттерн `TRACKED_GLOBE_VIEWS` в [`GboardSpacebarGlobeKeyRuntime.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/spacebargesture/GboardSpacebarGlobeKeyRuntime.java) | `Подтверждено` | Низкий при строгом покрытии unit/Robolectric-тестами переиспользования View |

---

## 7. Оформление вторичных символов

**Жёсткое ограничение проекта:** вторичные символы Gboard **НЕ переназначаются**. Полностью сохраняются оригинальные вторичные символы Gboard, нативная карта долгого нажатия, диакритика (`е → ё`, `ь → ъ`, европейские акценты) и встроенная функция GboardSamsung **`Long-Press Editing Shortcuts`** (`A / Z / X / C / V / Y`). Разрешена **исключительно визуальная стилизация** уже отображаемых нативных подсказок Gboard.

По реальным CSS-таблицам Gboard (`style_sheet_3dios.css`, `style_sheet_3dblack.css`) подтверждено наличие выделенного селектора вторичных меток:
- `.label.secondary { color: @color_label_secondary; }`
- В ряде тем также встречаются числовые переменные размера шрифта (`@def text_size_qwerty_label 15;`, `@def text_size_digit_label 17;`), но явная поддержка `text_size` / `alpha` / `padding` именно на `.label.secondary` в Gboard `18.5.4` не подтверждена локальными файлами и требует проверки на устройстве.
- В Gboard отображение самих вторичных символов на буквенных клавишах управляется штатной настройкой Gboard «Долгое нажатие для ввода символов» (`enable_popup_hint` / системный флаг Gboard в разделе «Настройки»). Мы не должны насильно переписывать карту символов; максимум допустимого в будущем — информативная подсказка в описании режима, что для полного сходства с One UI 8 рекомендуется включить нативную настройку Gboard «Цифровой ряд» и «Долгое нажатие для ввода символов».

### Матрица оценки: Вторичные символы (только визуальный стиль)

| Элемент | Желаемый результат | Возможности CSS/темы | Возможности runtime | Требуется изменение Gboard APK? | Доказательства | Уверенность | Риски |
|---|---|---|---|---|---|---|---|
| Цвет и контраст вторичных подсказок | В Light — аккуратный средне-тёмный серый (`~#5F6368FF` / `#4A4D52FF`), читаемый на белой клавише; в Dark — мягкий светло-серый (`~#C8C8CCFF`) на графитовой клавише | Полностью через `.label.secondary { color: @color_label_secondary; }` | Не требуется | Нет | `style_sheet_3dios.css`, `style_sheet_3dblack.css` | `Подтверждено` | Минимальный: при выборе слишком тусклого цвета символы потеряют читаемость на ярком солнце, при слишком ярком — визуально перегрузят 11-колончатую RU-раскладку |
| Размер шрифта и отступы вторичных подсказок | Чуть более выразительные и аккуратные подсказки в правом верхнем углу клавиши (как в One UI 8) | Возможность задать `text_size` / `alpha` на `.label.secondary` в `18.5.4` не подтверждена на 100% | Вмешательство в child `TextView` каждой из 30+ `SoftKeyView` нежелательно (лишняя нагрузка при каждом ребинде и риск наложения на основную букву в RU-раскладке) | Не требуется и не рекомендуется | `style_sheet_3dblack.css` (`@def text_size_qwerty_label`) | `Требуется тест на устройстве` | Средний: увеличение размера `.label.secondary` в 11-колончатой RU-раскладке может привести к перекрытию с основной буквой (`ш`, `щ`, `ж`) |
| Сохранение логики долгого нажатия, диакритики и `Long-Press Editing Shortcuts` | 100% сохранность `A/Z/X/C/V/Y` шорткатов и диакритики (`ё`, `ъ`) | CSS затрагивает только отрисовку, не `SoftKeyDef` | Не касаемся `before_stock` в `GboardSoftKeyFamilyComposer` | Нет | [`GboardLongPressQuickActionsRuntime.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/longpressquickactions/GboardLongPressQuickActionsRuntime.java), [`GboardLongPressQuickActionsReflectionHandles.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/longpressquickactions/GboardLongPressQuickActionsReflectionHandles.java) | `Подтверждено` | Нулевой риск при отказе от модификации `SoftKeyDef` |

---

## 8. Автоматическое переключение Light / Dark

Как установлено в разделе 2, нативный ключ `additional_keyboard_theme` в device-protected `SharedPreferences` указывает только на один ZIP-архив (`files:<filename>.zip`). Следовательно, автоматическая синхронизация с системной темой Android 16 / One UI 8 **обязательно требует runtime-механизма расширения Morphe**, управляющего парой пред-установленных валидных ZIP-тем (`samsung_oneui8_light.zip` и `samsung_oneui8_dark.zip`).

### 8.1. Источник системного состояния Light / Dark

В кодовой базе GboardSamsung уже подтверждён рабочий способ определения ночного режима Android ([`GboardSeamlessNavBarRuntime.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/frostedglass/GboardSeamlessNavBarRuntime.java)):
```java
(context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
    == Configuration.UI_MODE_NIGHT_YES
```
Важно: следует считывать `Configuration` из актуального контекста `InputMethodService` (или `Window.getContext()`), а не из устаревшего кэша, так как в Android 16 (особенно в режиме multi-window / One UI split screen) именно `InputMethodService.getResources().getConfiguration()` получает актуальный `uiMode`.

### 8.2. Точки жизненного цикла IME и поведение перезагрузки темы

По [`gboard-version-bindings.json`](https://github.com/vortexnode/GboardSamsung/blob/main/patches/src/main/resources/gboard/gboard-version-bindings.json) в базовом классе `InputMethodService` Gboard (`Lphr;`) **уже привязаны** следующие колбэки:
- `Lphr;->onConfigureWindow(Landroid/view/Window;ZZ)V` (`frosted_configure`, хук после `Window.setLayout` через [`GboardFrostedGlassLifecyclePatch.kt`](https://github.com/vortexnode/GboardSamsung/blob/main/patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/frostedglass/GboardFrostedGlassLifecyclePatch.kt))
- `Lphr;->onWindowShown()V` (`frosted_shown`)
- `Lphr;->onStartInputView(Landroid/view/inputmethod/EditorInfo;Z)V` (`calculator_input_start`, `manual_incognito_start_view`, `editing_ap_onstartinputview`)
- `Lphr;->onStartInput(Landroid/view/inputmethod/EditorInfo;Z)V` (`manual_incognito_start`, `editing_ap_onstartinput`)
- **НЕ привязан сейчас в `gboard-version-bindings.json`:** `Lphr;->onConfigurationChanged(Landroid/content/res/Configuration;)V`!

**Ключевые технические вопросы (требуют обязательной проверки на устройстве):**
1. **Срабатывает ли обновление темы немедленно без закрытия клавиатуры?**
   - Когда наш runtime записывает новое значение `additional_keyboard_theme = "files:samsung_oneui8_dark.zip"` в `<pkg>_preferences`, ожидается, что внутренний `OnSharedPreferenceChangeListener` Gboard подхватит изменение и перерисует клавиатуру.
   - Однако остаётся открытым вопрос: если пользователь переключил тёмную тему Android из шторки Quick Settings **при уже открытой клавиатуре**, вызовет ли Gboard `onConfigurationChanged` (где мы успеем переключить ключ) и перезагрузит ли View мгновенно, или новая тема применится только при следующем `onStartInputView` / переоткрытии клавиатуры. Это **невозможно подтвердить без теста на Galaxy S22 (Android 16)**.
2. **Защита от циклов переключения, рекурсии и мерцания:**
   - **Идемпотентность:** перед любой записью в `SharedPreferences` runtime сверяет текущее значение `additional_keyboard_theme` с целевым `files:<targetZip>`. Если значения уже совпадают — **никаких операций записи и I/O не выполняется** (нулевые накладные расходы).
   - **Однократная распаковка + кэш версии:** оба ZIP-файла распаковываются в `filesDir` один раз (с проверкой версии/SHA-256 и валидацией `Lrnw;->h`); при переключении Light ↔ Dark меняется **только строковый ключ** в `SharedPreferences` (переключается мгновенно, без копирования файлов).
   - **Anti-loop guard:** защита от повторного входа (`AtomicBoolean` + минимальный дебаунс / сверка `lastAppliedNightMode`), чтобы перезагрузка окна клавиатуры после смены темы не могла запустить повторный цикл записи.
   - **Проверка владения темой (`ownership check`):** автопереключение срабатывает **только** если режим `Samsung Keyboard` включён **И** текущий `additional_keyboard_theme` всё ещё равен одному из наших двух управляемых ZIP-файлов (подробнее — в разделе 9).

### Матрица оценки: Автоматическое переключение Light / Dark

| Элемент | Желаемый результат | Возможности CSS/темы | Возможности runtime | Требуется изменение Gboard APK? | Доказательства | Уверенность | Риски |
|---|---|---|---|---|---|---|---|
| Определение системного режима Light / Dark | Точное считывание `UI_MODE_NIGHT_YES` / `UI_MODE_NIGHT_NO` на Android 16 / One UI 8 | Невозможно (в `metadata.json` v3 нет авто-переключения между двумя custom ZIP) | Чтение `context.getResources().getConfiguration().uiMode & UI_MODE_NIGHT_MASK` (паттерн уже работает в `GboardSeamlessNavBarRuntime`) | Нет | [`GboardSeamlessNavBarRuntime.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/frostedglass/GboardSeamlessNavBarRuntime.java), [`GboardCustomThemeInstaller.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/customtheme/GboardCustomThemeInstaller.java) | `Подтверждено` | Низкий: важно читать `Configuration` именно из актуального IME/Window `Context`, а не кэшированного `Application` |
| Синхронизация при открытии клавиатуры (`onStartInputView` / `onConfigureWindow`) | При открытии клавиатуры после смены системной темы сразу отображается нужный вариант (Light или Dark) | Невозможно | Вызов `syncAppearanceIfNeeded(context)` в `onStartInputView` и/или `onConfigureWindow` через общий lifecycle-диспетчер (`GboardLifecycleDelegate`) | Нет (хуки уже в `gboard-version-bindings.json`) | [`gboard-version-bindings.json`](https://github.com/vortexnode/GboardSamsung/blob/main/patches/src/main/resources/gboard/gboard-version-bindings.json), [`GboardLifecycleDelegate.kt`](https://github.com/vortexnode/GboardSamsung/blob/main/patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/shared/GboardLifecycleDelegate.kt) | `Гипотеза` (требуется проверка порядка: успевает ли Gboard перечитать тему до первого кадра) | Средний: возможна 1-кадровая вспышка прежней темы при первом показе после смены режима, если запись в `onConfigureWindow` происходит уже после инфлейта `InputView` |
| Мгновенное переключение при смене темы из Quick Settings на открытой клавиатуре | Клавиатура меняет Light ↔ Dark сразу без закрытия | Невозможно | Потребует проверки/добавления биндинга `Lphr;->onConfigurationChanged(Configuration)` (или `ComponentCallbacks2`) | Потребуется новый bytecode-хук в `Lphr;` (если `onConfigurationChanged` переопределён в `Lphr;`) или регистрация `ComponentCallbacks` на `Application` | [`gboard-version-bindings.json`](https://github.com/vortexnode/GboardSamsung/blob/main/patches/src/main/resources/gboard/gboard-version-bindings.json) (`onConfigurationChanged` сейчас не привязан) | `Требуется тест на устройстве` | Средний: `Application.registerComponentCallbacks` не требует нового bytecode-хука в APK, но нужно проверить, доставляет ли Android 16 событие вовремя и перерисовывает ли Gboard открытую клавиатуру сразу |
| Защита от бесконечных циклов и лишних записей | 0 записей в `SharedPreferences`, если режим не менялся; 0 мерцаний | Не применимо | Сравнение текущего `additional_keyboard_theme` с целевым перед `edit().apply()`, `AtomicBoolean` re-entrancy guard | Нет | Стандартный контракт `SharedPreferences` + [`GboardCustomThemeInstaller.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/customtheme/GboardCustomThemeInstaller.java) | `Подтверждено` | Низкий при наличии unit-тестов на идемпотентность |

---

## 9. Совместимость с Custom Theme и другими существующими функциями

### 9.1. Взаимодействие с существующими патчами GboardSamsung

| Существующая функция | Механизм в GboardSamsung | Точка соприкосновения с Samsung Appearance | Оценка совместимости и стратегия | Уверенность |
|---|---|---|---|---|
| **Custom Theme** (`customtheme`) | Устанавливает ZIP в `filesDir`, пишет `additional_keyboard_theme` и `enable_key_border`, имеет свой `pref_custom_theme_enabled` | Разделяет **один и тот же** ключ Gboard `additional_keyboard_theme` и `enable_key_border` | **Критическая точка координации.** Нужна чёткая модель владения (ownership): если пользователь вручную применил стороннюю тему через Custom Theme или штатный Theme Picker Gboard, режим Samsung должен корректно уступить (автосброс режима в `Gboard` без перезатирания выбора пользователя) | `Подтверждено` |
| **Нативный `enable_key_border`** | Ключ в device-protected `<pkg>_preferences` | Samsung One UI 8 требует видимых границ клавиш (`enable_key_border = true`) | При включении Samsung сохранять исходное значение `enable_key_border` в backup-ключе; при выключении — точно восстанавливать | `Подтверждено` |
| **Frosted Glass** (`frostedglass`) | Хуки `onConfigureWindow` / `onWindowShown` / `onWindowHidden`; применяет `BackgroundBlurDrawable` к `.keyboard-base-area.keyboard-outline` и меняет alpha на `TARGET_SURFACE`, `TARGET_KEY`, `TARGET_ACTION_KEY` | Делит с нами `onConfigureWindow` / `onWindowShown` и опирается на `background` активной темы и `.background-icon.for-action-key` | **Хорошо совместим, но нужна проверка на устройстве.** `GboardFrostedGlassRuntime` работает поверх любой нативной темы, берёт цвет подложки и корректно обрабатывает смену `background`. Важно: не дублировать bytecode-хук `onConfigureWindow` — использовать общий lifecycle-диспетчер; проверить, как прозрачность `Frosted Glass` выглядит поверх `samsung_oneui8_light/dark.zip` | `Подтверждено` (архитектура) / `Требуется тест на устройстве` (визуальный вид) |
| **Rounded Keyboard Panel** (`roundedkeyboard`) | Перехватывает `Lrnb;->b(String, List)` только для `.keyboard-base-area.keyboard-outline` и `.keyboard-body-area.keyboard-outline-bottom...` | Работает только с внешним контуром всей клавиатуры, не трогает `.keytop` | **Полностью совместим.** Оба патча работают на ортогональных селекторах | `Подтверждено` |
| **Key Shape Selection** (`key_shape_selection`) | Принудительно включает флаг `more_pill_keys = true` в `GboardFeatureFlagsRuntime` | Открывает в Gboard выбор формы клавиш (в т. ч. капсульных/pill), что может влиять на форму `.keytop` | **Потенциальный визуальный конфликт.** Если пользователь включил в Gboard «капсульные клавиши», они могут перекрыть прямоугольную форму Samsung-темы | `Требуется тест на устройстве` |
| **Samsung Spacebar Gestures** (`samsung_spacebar_gestures`) | Хук `KeyboardViewHolder.dispatchTouchEvent` (свайпы/курсор) + `SoftKeyView.s` (`afterOrder = 900`, скрытие глобуса) | Разделяет точку композиции `GboardSoftKeyFamilyComposer` (`after_stock`) на `SoftKeyView.s` | **Полностью независим и отлично дополняет.** Шевроны регистрируются отдельным `afterOrder` (например `950`), не влияют на `dispatchTouchEvent` и на visibility глобуса; рекомендуется опция показа шевронов только при активном Samsung Appearance (с независимой настройкой) | `Подтверждено` |
| **Package Rename** | Переименовывает Android package ID (`gboardsamsung.com.google.android.inputmethod.latin`, `com.google.android.inputmethod.latin` или custom) | `SharedPreferences` name (`context.getPackageName() + "_preferences"`) и `filesDir` | **Полностью совместим** при строгом использовании динамического `context.getPackageName()` (как в `GboardCustomThemeInstaller` и `GboardPatchesSettings`) — никаких хардкодов имени пакета | `Подтверждено` |

### 9.2. Анализ всех 7 обязательных сценариев жизненного цикла

| Сценарий | Ожидаемое безопасное поведение | Архитектурный механизм | Уверенность | Риски |
|---|---|---|---|---|
| **1. Включение режима `Samsung Keyboard`** | Мгновенно (или со следующего кадра) применяется Light или Dark тема Samsung по текущему `uiMode`, включаются границы и шевроны пробела; прежние настройки пользователя не потеряны | 1) Если текущий `additional_keyboard_theme` не принадлежит Samsung — сохранить его (включая отсутствие ключа = stock) и `enable_key_border` в backup-ключи настроек расширения. 2) Убедиться, что оба ZIP распакованы и прошли `validateThemeArchive`. 3) Записать `additional_keyboard_theme`, `enable_key_border = true` и флаг режима `samsung`. | `Подтверждено` | Если валидация ZIP упадёт (например, при несовместимой версии Gboard) — безопасный fail-closed без изменения текущей темы пользователя |
| **2. Смена системной темы Android (Light ↔ Dark)** | Клавиатура переключается на парный ZIP Samsung (`light` ↔ `dark`), цвет шевронов и навбара (Android 16) обновляются согласованно | Проверка `uiMode & UI_MODE_NIGHT_MASK` в `onConfigurationChanged` / `ComponentCallbacks` + резервная проверка в `onStartInputView` / `onConfigureWindow`. Запись выполняется **только** при фактическом изменении варианта и подтверждённом ownership | `Требуется тест на устройстве` | Задержка обновления на 1 показ клавиатуры, если Gboard не перечитывает тему до `onStartInputView` |
| **3. Ручной выбор темы в `Custom Theme` или штатном Theme Picker Gboard** | Выбор пользователя **всегда побеждает**. Режим Samsung не должен откатывать или перезатирать вручную выбранную тему | При каждом `syncAppearanceIfNeeded` проверять: равен ли текущий `additional_keyboard_theme` одному из наших управляемых имён (`files:gboardsamsung_oneui8_light_*.zip` / `dark_*.zip`). Если нет — фиксировать, что пользователь ушёл на другую тему, автоматически перевести режим в `gboard`, очистить шевроны и **ничего не перезаписывать** | `Подтверждено` | Важно не сломать ситуацию, когда пользователь сам нажал на нашу же тему в Gboard Theme Picker (имя совпадёт — ownership сохранится) |
| **4. Включение / выключение `Frosted Glass` при активном Samsung Appearance** | Плавное добавление/снятие размытия и полупрозрачности поверх текущей Light/Dark палитры Samsung без потери границ и шевронов | `GboardFrostedGlassRuntime` работает по тегам `.keyboard-base-area`, `.keytop`, `.space_bar`, `.background-icon.for-action-key` и не трогает `additional_keyboard_theme`; при выключении `Frosted Glass` восстанавливает `localOriginalBackground` | `Требуется тест на устройстве` | Проверить на Galaxy S22, чтобы прозрачность `Frosted Glass` не делала `.background-icon.for-action-key` (прозрачный `#00000000`) снова видимым или не ломала контраст шевронов |
| **5. Выключение режима `Samsung Keyboard` (возврат на `Gboard`)** | 100% обратимый откат к прежней теме пользователя и прежнему состоянию `enable_key_border`; мгновенное удаление шевронов с живых `SoftKeyView` | Восстановить `additional_keyboard_theme` из backup (если ранее ключа не было — `remove("additional_keyboard_theme")`, что возвращает системный Material You!) и восстановить `enable_key_border`; пройтись по `WeakHashMap` живых пробелов и снять `ViewOverlay` | `Подтверждено` | Проверить кейс, когда до включения Samsung была удалённая позже кастомная ZIP-тема: перед восстановлением проверять существование `File(filesDir, prevFileName)`, иначе fallback на `remove(...)` (стоковая тема) |
| **6. Обновление расширения / патчей GboardSamsung (например `4.5.0` → `4.5.1`)** | Новые версии встроенных ZIP-тем Samsung подхватываются автоматически без поломки активной темы пользователя | Версионировать встроенные ZIP по content-hash (например, `gboardsamsung_oneui8_light_<hash8>.zip`), проверять актуальность хеша при старте IME; при обновлении устанавливать новый ZIP, переключать `additional_keyboard_theme` и удалять устаревший наш ZIP (не трогая чужие `user_theme_*` файлы!) | `Подтверждено` | Удалять старый ZIP только после успешной валидации и коммита нового, чтобы не оставить битую ссылку в `additional_keyboard_theme` |
| **7. Перезагрузка устройства (в т. ч. Direct Boot до разблокировки)** | Клавиатура на экране блокировки (PIN/пароль до разблокировки) и после разблокировки открывается стабильно, без краша и с корректной темой | Хранить ВСЕ настройки режима Samsung и оба ZIP-файла строго в **Device Protected Storage** (`context.createDeviceProtectedStorageContext()`), ровно так же, как уже делает [`GboardCustomThemeInstaller.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/customtheme/GboardCustomThemeInstaller.java) и `GboardPatchesSettings` | `Подтверждено` | Обращение к Credential-Encrypted (CE) storage до разблокировки вызывает `IllegalStateException` и падение IME на экране блокировки — использование DE storage обязательно! |

---

## 10. Ограничения, риски и неизвестные моменты

### 10.1. Принципиальные ограничения (не обходимые и не рекомендуемые к взлому)

1. **Проприетарный шрифт `SamsungOne`:** юридически недопустим в GPL-3.0 репозитории. Используется системный шрифт Android / One UI (на Galaxy S22 системный шрифт уже визуально близок к One UI) либо, при желании в будущем, открытый шрифт с совместимой лицензией (но без обязательной подмены).
2. **Геометрия сетки, высоты рядов и нативная раскладка (`SoftKeyboardView` / `KeyboardView`):** переписывать движок раскладки нельзя — это разрушит адаптивность (landscape, split, floating, one-handed, emoji/clipboard/GIF-панели) и сделает патч несовместимым с будущими версиями Gboard.
3. **Иконки Google и функционал тулбара:** запрещено заменять иконки на клоны Samsung, добавлять фиктивную кнопку Galaxy AI или ломать нативный контроллер Access Points.
4. **Карта вторичных символов и `?123` → `!#1`:** остаются нативными Gboard, чтобы не ломать диакритику, локали и `Long-Press Editing Shortcuts`.

### 10.2. Сводная карта технических рисков и неизвестных моментов

| Категория | Неизвестный момент / риск | Уровень риска | Статус | Способ снятия риска |
|---|---|---|---|---|
| **Gboard `18.5.4` CSS-движок** | Точный приоритет Material 3 / Dynamic Color над `.background-icon.for-action-key`, `.keytop.for-action-key`, `elevation`, `shadow_color`, `edge_width`, `edge_color` и `.label.secondary` в `18.5.4` | **Средний** | `Требуется тест на устройстве` | Этап 1: собрать минимальный тестовый прототип двух ZIP-тем и проверить на Galaxy S22 (Android 16) все состояния (`Enter`, `Search`, `Send`, `Done`, `Shift`, `Caps`, RU + EN) |
| **Тулбар (круглые подложки)** | Наличие безопасного чистого CSS-селектора для круглых подложек кнопок верхней полосы в `18.5.4` при `enable_access_points_menu_redesign` | **Высокий** (если лезть в runtime) / **Низкий** (если только CSS) | `Требуется тест на устройстве` | Проверить исключительно через CSS; при отсутствии безопасного CSS-селектора отказаться от круглых подложек в пользу сохранения 100% стабильности тулбара |
| **Своевременность Light ↔ Dark reload** | Подхватывает ли Gboard `18.5.4` запись в `additional_keyboard_theme` немедленно (через `OnSharedPreferenceChangeListener`) или только со следующего показа клавиатуры; нужна ли привязка `onConfigurationChanged` | **Средний** | `Требуется тест на устройстве` | Протестировать оба триггера (`ComponentCallbacks.onConfigurationChanged` + `onStartInputView`/`onConfigureWindow`) на Galaxy S22 при переключении Dark Mode из Quick Settings |
| **Шевроны на пробеле** | Точная внутренняя структура дочерних View внутри `SoftKeyView` пробела в `18.5.4` (padding, `AutoSizeTextView`, иконка логотипа Google при 1 языке, split/floating-режимы) | **Средний** | `Требуется тест на устройстве` | Провести отладочное логирование/проверку геометрии `SoftKeyView` на устройстве; предусмотреть автоматическое скрытие шевронов при нехватке ширины или отсутствии текстовой метки |
| **Взаимодействие с `Key Shape Selection` (`more_pill_keys`)** | Переопределяет ли выбранная пользователем капсульная форма клавиш `background_shape: rectangle` из нашего ZIP | **Средний** | `Требуется тест на устройстве` | Явно проверить на Galaxy S22 комбинацию `Key Shape Selection` (pill) + `Samsung Keyboard` |
| **Обновление Gboard выше `18.5.4`** | Стабильность обфусцированных привязок (`Lrnw;->h`, `Lphr;`, `SoftKeyView.s`) при миграции на будущие версии Gboard | **Низкий** | `Подтверждено` | Максимальное переиспользование уже существующих привязок `custom_theme_validator`, `frosted_configure`/`frosted_shown`, `soft_key_bind` — минимум новых хрупких точек в APK |

---

## 11. Рекомендуемая архитектура с минимальным риском

Чтобы добиться максимального визуального сходства с Samsung Keyboard One UI 8 при **минимальном числе новых bytecode-хуков** и **нулевом риске для стабильности ввода**, рекомендуется трёхуровневая модульная архитектура:

### Уровень 1 — Нативные ZIP/CSS-темы (ядро визуала, 0 рисков для логики)
- Два самостоятельных, строго валидируемых архива Gboard (`format_version: 3`), упакованные в ассеты расширения:
  - `assets/samsung_appearance/samsung_oneui8_light.zip` (`is_light_theme: true`, `prefer_key_border: true`)
  - `assets/samsung_appearance/samsung_oneui8_dark.zip` (`is_light_theme: false`, `prefer_key_border: true`)
- Устанавливаются в device-protected `filesDir` с версионируемым именем (`gboardsamsung_oneui8_light_<hash8>.zip` / `gboardsamsung_oneui8_dark_<hash8>.zip`) и обязательной проверкой через `GboardCustomThemeTargetContract.validateThemeArchive(...)`.
- Обеспечивают: палитры Light и Dark, более тёмные функциональные клавиши в Dark, прямоугольную клавишу действия с синей Google-иконкой, радиус скругления `~7–8dp`, границы, мягкую тень в Light, стиль тулбара/popup и контраст `.label.secondary`.

### Уровень 2 — Лёгкий Runtime-контроллер темы и автопереключения Light / Dark
- **Настройки (`GboardSamsungAppearanceSettings`):** хранение в device-protected `SharedPreferences`:
  - `pref_samsung_appearance_mode`: `"gboard"` (default) | `"samsung"`
  - `pref_samsung_appearance_spacebar_chevrons`: `boolean` (default `true` при активном `samsung`)
  - `pref_samsung_appearance_backup_theme`: сохранённое прежнее значение `additional_keyboard_theme` (или маркер отсутствия)
  - `pref_samsung_appearance_backup_key_border`: сохранённое прежнее значение `enable_key_border`
  - `pref_samsung_appearance_applied_light_file` / `applied_dark_file`: имена актуальных управляемых ZIP-файлов (для точного ownership-контроля и безопасного удаления устаревших версий)
- **Lifecycle-синхронизация (`GboardSamsungAppearanceRuntime`):**
  - Подключается к **существующему** lifecycle-механизму IME (`onConfigureWindow` / `onStartInputView` через общий композитор, без дублирования хуков `Frosted Glass`) + регистрирует лёгкий `ComponentCallbacks` на `Application` для реакции на `onConfigurationChanged(Configuration)` (нулевой новый bytecode-хук!).
  - Выполняет идемпотентную проверку: `mode == samsung` → проверка ownership (если пользователь вручную выбрал другую тему в Custom Theme / Theme Picker → мягкий автосброс в `gboard` и выход) → сравнение `uiMode` → переключение `additional_keyboard_theme` только при фактическом расхождении.

### Уровень 3 — Неинтерактивный визуальный слой шевронов на пробеле
- **Компонент `GboardSamsungSpacebarChevronsRuntime`:**
  - Подключается как дополнительный `after_stock` обработчик в существующем [`GboardSoftKeyFamilyComposer.kt`](https://github.com/vortexnode/GboardSamsung/blob/main/patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/shared/GboardSoftKeyFamilyComposer.kt) (после `GboardSpacebarGlobeKeyRuntime`, `afterOrder = 950`).
  - Использует проверенный [`GboardSpacebarKeyHitTester.extractPressKeycode(View)`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/spacebargesture/GboardSpacebarKeyHitTester.java) (`KeyEvent.KEYCODE_SPACE`).
  - Рисует чёткие симметричные векторные шевроны `‹` и `›` через неинтерактивный `ViewOverlay` (`Canvas.drawPath`), динамически берёт цвет от дочернего `TextView`, автоматически скрывается при отсутствии текста языка или узком пробеле (split/floating), и полностью очищается при переиспользовании View через `WeakHashMap`.

### Размещение в интерфейсе настроек GboardSamsung
- В существующей группе **«Макет клавиатуры» / `Keyboard layout`** ([`GboardKeyboardLayoutSettingsGroupFeature.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/keyboard/GboardKeyboardLayoutSettingsGroupFeature.java)):
  - Новый пункт **«Внешний вид клавиатуры» / `Keyboard appearance`**:
    - Выбор режима: `Gboard` (по умолчанию) / `Samsung Keyboard`
    - Под-опция (видна/активна в режиме `Samsung Keyboard`): `Показывать стрелки языка на пробеле / Show language chevrons on spacebar`
  - Полная RU/EN локализация в `gboard_settings_text.xml` + обновление поискового индекса настроек.

---

## 12. Предлагаемые этапы будущей реализации

Реализация должна идти строго инкрементально, с проверкой на реальном Galaxy S22 (Android 16) после каждого этапа:

1. **Этап 1 — Верификационный прототип ZIP/CSS-тем (Light + Dark) без сложного runtime:**
   - Спроектировать `samsung_oneui8_light.zip` и `samsung_oneui8_dark.zip`.
   - Проверить валидацию `Lrnw;->h` на Gboard `18.5.4`, приоритет `.background-icon.for-action-key` + `.icon.for-action-key`, скругления, тени/кромки (`elevation` / `shadow_color` / `edge_width`), `.label.secondary`, поведение с `more_pill_keys`, `Frosted Glass`, `Rounded Keyboard Panel` и возможный CSS-селектор круглых подложек тулбара.
   - Откалибровать точные цвета, радиусы и тени по скриншотам Galaxy S22.
2. **Этап 2 — Режим `Keyboard appearance` (`Gboard` / `Samsung Keyboard`) и автопереключение Light / Dark:**
   - Реализовать `GboardSamsungAppearanceSettings`, `GboardSamsungAppearanceThemePackInstaller`, `GboardSamsungAppearanceRuntime`, ownership-контроль, backup/restore и Direct Boot (DE storage).
   - Подключить UI-настройки (EN/RU) в `GboardKeyboardLayoutSettingsGroupFeature` и поисковый индекс.
   - Проверить на устройстве все 7 сценариев жизненного цикла (включая Quick Settings Dark Mode при открытой клавиатуре и перезагрузку).
3. **Этап 3 — Обязательные шевроны на пробеле (`‹ Русский ›` / `‹ English ›`):**
   - Реализовать `GboardSamsungSpacebarChevronsRuntime` на `GboardSoftKeyFamilyComposer` (`after_stock`, `ViewOverlay` + векторный `Drawable` + `WeakHashMap`).
   - Проверить на устройстве тап, свайп языка, удержание курсора, переиспользование `SoftKeyView`, RU/EN/длинные языки, `?123`, split/floating/one-handed/landscape и Light/Dark.
4. **Этап 4 — Опциональная полировка тулбара (только при положительном результате проверки CSS из Этапа 1) и финальное регрессионное тестирование:**
   - При наличии чистого и безопасного CSS-селектора для круглых подложек тулбара — включить его в обе ZIP-темы; если безопасного CSS нет — осознанно оставить чистый плоский тулбар в цветах One UI 8 без ломких runtime-хаков.
   - Провести полный прогон unit/Robolectric-тестов и чек-листа на Galaxy S22.

---

## 13. Список файлов, которые потенциально придётся изменить в будущем

> **На этапе аудита ни один из перечисленных файлов не изменялся.**

### 13.1. Модуль `patches/` (Kotlin / Morphe)
- **Новый пакет патча:** `patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/samsungappearance/`
  - `GboardSamsungAppearancePatch.kt` — публичный патч (опциональный, независимый от `SwipeDismiss` и `FrostedGlass`, с привязкой к общим композиторам).
  - `GboardSamsungAppearanceAssetsPatch.kt` — упаковка и проверка целостности встроенных ZIP-ассетов (если ассеты поставляются через ресурсный патч или через `extensions/extension/src/main/assets/`).
- **Общие композиторы и реестр:**
  - [`patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/shared/GboardSoftKeyFamilyComposer.kt`](https://github.com/vortexnode/GboardSamsung/blob/main/patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/shared/GboardSoftKeyFamilyComposer.kt) — регистрация `after_stock` слота для `GboardSamsungSpacebarChevronsRuntime` (`afterOrder = 950`).
  - [`patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/shared/GboardLifecycleDelegate.kt`](https://github.com/vortexnode/GboardSamsung/blob/main/patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/shared/GboardLifecycleDelegate.kt) (или общий IME-lifecycle composer) — разделяемое подключение к `onStartInputView` / `onConfigureWindow` без дублирования хуков.
  - `patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/shared/runtimeabi/RuntimeAbiCatalog.kt` & `RuntimeCallId.kt` — регистрация ABI для новых runtime-вызовов.
  - [`patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/GboardPatchRegistry.kt`](https://github.com/vortexnode/GboardSamsung/blob/main/patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/GboardPatchRegistry.kt) & `GboardContributionWiring.kt` — регистрация патча (EN + RU).
  - `patches/src/main/resources/gboard-port-product-catalog.json` (+ `.sha256`) и `patches-list.json` — синхронизация продуктового каталога и списка патчей.

### 13.2. Модуль `extensions/extension/` (Java Runtime + Настройки + Ассеты)
- **Новый пакет:** `extensions/extension/src/main/java/dev/jason/gboardpatches/extension/samsungappearance/`
  - `GboardSamsungAppearanceSettings.java` — хранение режима (`gboard` / `samsung`), под-опции шевронов, backup/restore `additional_keyboard_theme` и `enable_key_border` в DE storage.
  - `GboardSamsungAppearanceThemePackInstaller.java` — распаковка встроенных ZIP-тем в `filesDir`, валидация через `GboardCustomThemeTargetContract.validateThemeArchive`, обновление по content-hash и очистка устаревших версий.
  - `GboardSamsungAppearanceRuntime.java` — определение `UI_MODE_NIGHT_MASK`, ownership-проверка, идемпотентное переключение Light/Dark, регистрация `ComponentCallbacks`.
  - `GboardSamsungSpacebarChevronsRuntime.java` — `after_stock` отрисовка неинтерактивных шевронов `‹ ›` через `ViewOverlay` + векторный `Drawable` + `WeakHashMap`.
  - `GboardSamsungAppearanceSettingsFeature.java` — экран настроек «Внешний вид клавиатуры».
- **Интеграция в настройки и локализацию:**
  - [`extensions/extension/src/main/java/dev/jason/gboardpatches/extension/keyboard/GboardKeyboardLayoutSettingsGroupFeature.java`](https://github.com/vortexnode/GboardSamsung/blob/main/extensions/extension/src/main/java/dev/jason/gboardpatches/extension/keyboard/GboardKeyboardLayoutSettingsGroupFeature.java) — добавление экрана в группу «Макет клавиатуры».
  - `extensions/extension/src/main/java/dev/jason/gboardpatches/extension/settings/GboardPatchesFeatureAvailability.java` — новая константа доступности фичи.
  - `extensions/extension/src/main/settings-text/gboard_settings_text.xml` — EN + RU строки.
  - `extensions/extension/src/main/java/dev/jason/gboardpatches/extension/settings/GboardSettingsSearchIndexData.java` — обновление индекса поиска настроек.
- **Ассеты встроенных тем:**
  - `extensions/extension/src/main/assets/samsung_appearance/samsung_oneui8_light.zip`
  - `extensions/extension/src/main/assets/samsung_appearance/samsung_oneui8_dark.zip`

### 13.3. Тесты
- Unit/Robolectric-тесты в `extensions/extension/src/test/java/dev/jason/gboardpatches/extension/samsungappearance/`:
  - `GboardSamsungAppearanceSettingsTest.java` (backup/restore, отсутствие исходного ключа, Direct Boot).
  - `GboardSamsungAppearanceRuntimeTest.java` (Light/Dark переключение, идемпотентность, ownership-уступка при ручной Custom Theme, anti-loop).
  - `GboardSamsungSpacebarChevronsRuntimeTest.java` (детекция пробела, скрытие при узком пробеле, очистка при recycling, отсутствие перехвата touch).
- Контрактные тесты в `patches/src/test/kotlin/...`: реестр патчей, каталог, группировка и поисковый индекс настроек.

---

## 14. Список обязательных проверок на реальном устройстве

Все пункты ниже обязательны к выполнению на **Samsung Galaxy S22 5G (`SM-S901U1`), Android 16 / One UI 8, Gboard `18.5.4.993608717-release-arm64-v8a`**:

| № | Область проверки | Что именно проверяем на устройстве | Критерий успеха |
|---|---|---|---|
| 1 | Валидация встроенных ZIP | Установка `samsung_oneui8_light.zip` и `samsung_oneui8_dark.zip` через `Lrnw;->h` | Оба архива проходят нативную валидацию без ошибок в `logcat` |
| 2 | Основные и функциональные клавиши (Light и Dark) | Внешний вид RU (`11+11+9`), EN (`10+9+7`), цифровой ряд, запятая, точка, `Shift`, `Caps Lock`, `Backspace`, `?123` | Точная цветовая иерархия One UI 8; в Dark функциональные клавиши заметно темнее букв; чёткая читаемость |
| 3 | Клавиша действия во всех контекстах | Поля ввода: `Search` (лупа), `Send` (мессенджер), `Enter` (многострочный текст), `Go` (браузер), `Next` / `Done` (формы) | Прямоугольная клавиша в тон функциональных + синяя контурная Google-иконка, без круглой/pill заливки M3 |
| 4 | Форма, границы, тени и `Key Shape Selection` | Скругления, 1dp нижняя тень в Light, плоский стиль в Dark, комбинация с включённым `Key Shape Selection` (`more_pill_keys`) | Нет клиппинга углов, нет грязной обводки в Dark, зафиксировано поведение при активном `more_pill_keys` |
| 5 | Верхний тулбар | Обычный тулбар, полоса подсказок, буфер обмена, переводчик, Emoji, меню `•••`, перетаскивание кнопок | Оригинальные иконки Google, 0 сломанных кликов и анимаций; проверена возможность/невозможность чистого CSS для круглых подложек |
| 6 | Шевроны пробела + жесты | Тап, быстрый свайп влево/вправо, серия из 10 свайпов подряд, удержание + ведение курсора, скрытый/видимый глобус | Чёткие симметричные `‹ Язык ›`, нулевое ухудшение свайпа и курсора, корректный цвет в Light и Dark |
| 7 | Шевроны в краевых режимах | Длинное название языка, 1 язык (логотип/без текста), раскладка `?123` / `123`, split keyboard, floating, one-handed, landscape | Никакого наложения на текст, автоматическое скрытие при нехватке места, ноль «фантомных» шевронов после recycling |
| 8 | Вторичные символы и шорткаты | Отображение `.label.secondary` на RU/EN, долгое нажатие `е → ё`, `ь → ъ`, `A/Z/X/C/V/Y` (`Long-Press Editing Shortcuts`) | Хороший контраст без наложения в 11-колончатой RU-раскладке; все шорткаты и диакритика работают штатно |
| 9 | Автопереключение Light / Dark | Переключение Dark Mode из Quick Settings при закрытой и при открытой клавиатуре, переключение по расписанию | Нужная тема применяется без циклов и зависаний; зафиксировано, происходит ли обновление мгновенно или при переоткрытии |
| 10 | Нижняя полоса навигации (Android 16) | Жестовая навигация и 3-кнопочная навигация в Light и Dark, с `Frosted Glass` и без него | Цвет полосы бесшовно совпадает с фоном клавиатуры, системные кнопки/индикатор контрастны |
| 11 | Совместимость с `Custom Theme`, `Frosted Glass`, `Rounded Keyboard Panel` | Ручной выбор сторонней темы, включение/выключение `Frosted Glass`, включение/выключение `Rounded Keyboard Panel` | Ручная тема не перезатирается (автосброс режима в `Gboard`); `Frosted Glass` и `Rounded Keyboard Panel` работают без визуальных артефактов |
| 12 | Полный откат, обновление и перезагрузка | Выключение режима `Samsung Keyboard`, перезагрузка телефона и ввод PIN/пароля на экране блокировки (Direct Boot) | Точное восстановление исходной темы и `enable_key_border`; на экране блокировки до разблокировки клавиатура не падает |

---

## Итоговые ответы на 6 ключевых вопросов аудита

1. **Что можно реализовать исключительно ZIP/CSS-темами?**
   - Цветовые палитры Light и Dark (нейтральный светло-серый / почти чёрный OLED-фон, белые / графитовые буквы, средне-серые / более тёмные в Dark функциональные клавиши), прямоугольную форму клавиш и умеренные скругления (`~7–8dp`), границы и мягкую нижнюю тень в Light, стиль popup-окон и меню инструментов, цвет и контраст полосы тулбара и иконок, цвет вторичных символов (`.label.secondary`), бесшовную нижнюю полосу на Android 16, а также (подлежит контрольной проверке M3-приоритета на `18.5.4`) нейтральную прямоугольную клавишу действия с синей Google-иконкой (`.background-icon.for-action-key` + `.keytop.for-action-key` + `.icon.for-action-key`).
2. **Что потребует runtime расширения Morphe?**
   - Автоматическое переключение Light / Dark (синхронизация двух пред-установленных ZIP-тем по `Configuration.UI_MODE_NIGHT_MASK` с ownership-контролем, backup/restore и DE storage).
   - Обязательные неинтерактивные шевроны на пробеле (`‹ Русский ›` / `‹ English ›`) через `after_stock` хук `SoftKeyView.s(SoftKeyDef, long)Z` (`ViewOverlay` + векторный `Drawable` + `WeakHashMap`).
   - UI-переключатель «Внешний вид клавиатуры» (`Gboard` / `Samsung Keyboard`) и под-опцию шевронов в настройках GboardSamsung.
3. **Что потребует изменения ресурсов или кода самого Gboard APK?**
   - **Ничего из обязательного объёма задачи.** Единственными зонами, где теоретически мог бы понадобиться патч ресурсов/байткода Gboard APK, являются: (а) круглые подложки-таблетки под кнопками верхнего тулбара, если в `18.5.4` отсутствует чистый CSS-селектор; (б) принудительный хук `Lphr;->onConfigurationChanged(Configuration)`, если `Application.registerComponentCallbacks` окажется недостаточным для мгновенной реакции на Quick Settings. Оба пункта следует избегать при наличии более безопасных альтернатив.
4. **Какие задачи безопасны?**
   - Встроенные валидируемые Light/Dark ZIP/CSS-темы; цветовая иерархия основных и функциональных клавиш; визуальная стилизация цвета `.label.secondary`; reversible backup/restore `additional_keyboard_theme` и `enable_key_border` в Device Protected Storage; ownership-модель при ручном выборе `Custom Theme`; неинтерактивные шевроны пробела через `ViewOverlay` с защитой recycling и узкой ширины; интеграция настроек в `GboardKeyboardLayoutSettingsGroupFeature`.
5. **Какие задачи имеют существенный риск?**
   - Runtime-модификация View внутри верхнего тулбара (`keyboard_header_view_holder`) ради круглых подложек кнопок (высокий риск поломать подсказки, ripple, drag-and-drop и динамические кнопки).
   - Любое вмешательство в `SoftKeyDef` для переименования `?123` → `!#1` или замены карты вторичных символов (риск поломать локали, диакритику и `Long-Press Editing Shortcuts`).
   - Правка геометрии `SoftKeyboardView` или изменение текста `TextView` на пробеле напрямую (риск сломать TalkBack, `ellipsize` и перерисовки Gboard).
6. **Что невозможно подтвердить без тестирования на устройстве?**
   - Точный приоритет Material 3 / Dynamic Color в Gboard `18.5.4` над `.background-icon.for-action-key`, `elevation`, `shadow_color`, `edge_width`, `edge_color` и `padding_ratio_*`.
   - Влияние включённого `Key Shape Selection` (`more_pill_keys`) на прямоугольную форму клавиш в custom ZIP.
   - Наличие безопасного чистого CSS-селектора для круглых подложек иконок верхнего тулбара при `enable_access_points_menu_redesign`.
   - Поддержку изменения `text_size` / отступов на `.label.secondary` без наложения в 11-колончатой RU-раскладке.
   - Точную структуру дочерних View и внутренних отступов `SoftKeyView` пробела (для идеального выравнивания `ViewOverlay`-шевронов).
   - Мгновенность подхвата новой темы Gboard `18.5.4` при записи `additional_keyboard_theme` в `onConfigurationChanged` / `onStartInputView` (без закрытия клавиатуры) и визуальное сочетание `Samsung Keyboard` + `Frosted Glass` на Android 16 (SDK 36).
