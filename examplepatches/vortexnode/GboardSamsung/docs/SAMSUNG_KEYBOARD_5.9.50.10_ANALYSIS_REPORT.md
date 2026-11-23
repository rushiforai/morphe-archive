# Технический отчёт по анализу Samsung Keyboard `5.9.50.10` (индексы DEX)

> **Статус документа:** промежуточный исследовательский отчёт по индексам строк DEX (без декомпиляции Java/Smali).
> **Репозиторий:** `vortexnode/GboardSamsung` (ветка `main`).
> **Область действия:** только анализ эталонного APK Samsung Keyboard `5.9.50.10` по переданным текстовым индексам. Исходный код `GboardSamsung`, патчи, `RuntimeAbi`, Gradle/workflows и `docs/SPACEBAR_LANGUAGE_SWITCH_DESIGN.md` не изменялись.

---

## 1. Методологическая оговорка и классификация утверждений

**Java/Smali-декомпиляция оригинальных DEX-файлов не проводилась.** В рабочую область были загружены только 5 текстовых файлов с метаданными и отфильтрованными таблицами строковых кандидатов DEX (`string_ids`).

Чтобы исключить подмену строковых совпадений доказательствами реализации, все сведения в этом отчёте строго разделены на четыре категории:

1. **Подтверждённые факты** — дословно проверенные метаданные из переданного `00_README_AND_LIMITATIONS.txt` и точные строки/дескрипторы с индексами `[xxxxxx]` из файлов `DEX1/2/3_KEYWORD_CANDIDATES.txt`. Наличие строки доказывает только её присутствие в `string_ids` соответствующего DEX, но **не** доказывает поток управления.
2. **Косвенные признаки** — сопоставление нескольких строк, имён классов, лог-шаблонов и параметров настроек, указывающее на вероятную архитектурную связность компонентов.
3. **Гипотезы** — рабочие предположения о механизмах работы, подлежащие обязательной проверке по телам методов после декомпиляции в JADX/baksmali.
4. **Не установлено** — факты, параметры и механизмы, которые невозможно определить без просмотра байткода/декомпилированных методов и декодированных ресурсов XML.

---

## 2. Сведения об APK, его целостности и составе переданных материалов

### 2.1. Подтверждённые факты (по `00_README_AND_LIMITATIONS.txt` и `00_QUICK_INDEX.txt`)

- **Исходный APK:** `Клавиатура_Samsung_v5.9.50.10_c87b(1).apk`
- **Размер APK:** `86,899,269` байт
- **SHA-256 APK:** `c87bfd9ae4bb9e17f527a53aaccd955cbc203083dabe9fc9673134d4adbbfb8e`
- **Проверка целостности ZIP:** `PASS (no corrupt entries)` (по отчёту среды подготовки)
- **Всего записей в архиве APK:** `5,544`
- **Количество DEX-файлов:** `3` (`classes.dex`, `classes2.dex`, `classes3.dex`)
- **Количество нативных библиотек (`.so`):** `37`

### 2.2. Фактический состав файлов, доступных при анализе

В каталоге загруженных вложений присутствовали **только 5 текстовых файлов**:

1. `00_QUICK_INDEX.txt`
2. `00_README_AND_LIMITATIONS.txt`
3. `DEX1_KEYWORD_CANDIDATES.txt`
4. `DEX2_KEYWORD_CANDIDATES.txt`
5. `DEX3_KEYWORD_CANDIDATES.txt`

### 2.3. Что отсутствовало в переданном пакете (не проверялось)

- Сам бинарный файл `Клавиатура_Samsung_v5.9.50.10_c87b(1).apk` (повторная независимая проверка SHA-256 и ZIP-структуры агентом **не проводилась**; данные выше приведены строго из `00_README_AND_LIMITATIONS.txt`).
- Сырые файлы `classes.dex`, `classes2.dex`, `classes3.dex`.
- Упомянутые в `00_README_AND_LIMITATIONS.txt` и `00_QUICK_INDEX.txt` полные дампы `DEX1/2/3_STRING_TABLE.txt` и `DEX1/2/3_CLASS_DESCRIPTORS.txt`.
- Декодированный `AndroidManifest.xml`, `resources.arsc`, `res/xml/*`, `res/values/*` и нативные библиотеки `.so`.

---

## 3. Результаты проверки трёх DEX-файлов

### 3.1. Сводная инвентаризация DEX (подтверждённые факты из метаданных и подсчёта кандидатов)

| Файл DEX | Размер (байт) | SHA-256 | Всего строк (`string_ids`) | Всего классов (`class_defs`) | Строк-кандидатов в переданном файле |
|---|---:|---|---:|---:|---:|
| `classes.dex` (`DEX1`) | `11,172,568` | `e672411581ff91f1bc27b20305095444bc7a77682c66d1535e7301260b7e26eb` | `92,459` | `8,119` | `4,183` |
| `classes2.dex` (`DEX2`) | `11,205,604` | `4f582ab5f7068e61c86bb9f38726c268b05dbe427ee30100c73df427fb388b19` | `78,156` | `8,052` | `6,812` |
| `classes3.dex` (`DEX3`) | `4,297,992` | `abf8954c240934db8da8011845b280d4052005d23142fdc856fee16654ddb618` | `29,576` | `4,395` | `248` |

### 3.2. Распределение релевантных находок по DEX-файлам

- **`classes.dex` (`DEX1`)** — содержит ключевые строковые ссылки на базовый слой языков (`BaseLanguageRepo`, `Language`, `SelectedLanguage`, `SelectedLanguageInfo`, `getCurrentLang`, `getSelectedLanguageList`, `getCurrentLanguageOrder`, `setCurrentLanguage`), обёртки `InputConnection` (`[HBIC]`, `CACHEDIC`), настройки удержания и переключения пробелом (`/HBD/TouchAndHoldDelay`, `/HBD/UseLanguageSwitchingUsingSpaceBar`, `spaceLanguageThresholdDefaultValue`), провайдер настроек (`KeyboardSettingsProvider`), а также отдельные символы тача/пробела (`ClickSpace`, `onClickSpaceButton`, `INS_SPACE`, `mTouchSlop`, `mActivePointerId`, `SpaceCursorControlLayout`).
- **`classes2.dex` (`DEX2`)** — наиболее насыщенный файл по взаимодействию с пробелом, жестами и курсором: содержит строки и дескрипторы для `SpaceKeyA`, `Func_Space`, `SpaceKeyIconViewModel`, `SpaceKeyMainKeyLabelViewModel`, `TouchTicket`, `PresenterContainerImpl`, `touchLogicManager`, `space_lang_change_next`, `space_lang_change_prev`, `ChangeLanguageGestureA`, `SpaceBubble`, `language changed by space last diff = `, `onTouchMove: Space bubble show, cause by absDiff(`, `SpaceCursorControlLayout`, `SpaceCursorControlSpeedTuningTestActivity`, `TouchAndHoldSpaceBarSettings*`, `sendSpaceLongPress: keyCode = `, `space_launch_cursor_control`, `CursorControlA`, `CursorControlActionFactory`, `sendCursorMoveEvent: keyEventCode - `, `SendDownUpKeyEventDecorator`, `LanguagePackDecorator`, `MSG_REQUEST_SWITCH_LANGUAGES`, `updateCurrentLanguageCommand`, `Clear keymap on language change`, `UPDATE_KEYBOARD_VIEW`, а также строки движков ввода (`ET9AWLdbSetLanguage`, `nativeSetActiveLanguage`).
- **`classes3.dex` (`DEX3`)** — содержит преимущественно сторонние и вспомогательные библиотеки (Kotlin reflection/protobuf, SQLCipher, Glide, SimpleXML, HTML entities, AR Emoji, MotionPhoto, WritingToolkit) и небольшое число ссылок на классы настроек и контейнера HoneyBoard (`ManageInputLanguages`, `KeyboardSwipeSettingsFragment`, `TouchAndHoldDelayCustomSettingsFragment`, `textboard/keyboard/container/b`, `f`, `Language`, `SelectedLanguage`, `LanguageDownloadManager`, `switchToLastInputMethod`). Прямых строковых наводок на обработчики свайпа/курсора пробела в `DEX3_KEYWORD_CANDIDATES.txt` не обнаружено.

---

## 4. Доступность и результаты проверки инструментов декомпиляции

### 4.1. Подтверждённые факты

- **Самостоятельная декомпиляция DEX в текущем процессе невозможна** по двум причинам:
  1. Исходные файлы `.apk` и `classes*.dex` не загружены в рабочее пространство.
  2. В среде подготовки (зафиксировано в `00_README_AND_LIMITATIONS.txt`) присутствует Java, но отсутствуют `JADX`, `Apktool`, `Baksmali`, `AAPT` и `Androguard`. В среде агента отсутствуют инструменты интерактивной декомпиляции APK; кроме того, правила проекта (`AGENTS.md`, `docs/PROJECT_SCOPE.md`) запрещают хранить и коммитить проприетарные APK и извлечённые проприетарные ассеты в репозитории.
- **Вывод:** ни один метод Samsung Keyboard `5.9.50.10` на момент составления отчёта не был декомпилирован в Java/Kotlin или дизассемблирован в Smali.

### 4.2. Инструменты, необходимые для следующего этапа (локальная декомпиляция)

Для получения проверяемых доказательств по телам методов и ресурсам требуются:

- **JADX (`jadx` / `jadx-cli`)** — декомпиляция `classes.dex`, `classes2.dex`, `classes3.dex` и поиск перекрёстных ссылок (xref) по строкам-якорям из раздела 9.
- **baksmali (`baksmali d`)** или **`dexdump -d`** (Android SDK Build-Tools) — проверка точного Dalvik-байткода в обфусцированных методах.
- **Apktool (`apktool d`)** или **`aapt2 dump`** — декодирование `AndroidManifest.xml`, `res/xml/*` и `res/values/*` (пороговые константы, конфиги клавиш и настройки `TouchAndHoldSpaceBar`).

---

## 5. Анализ механизмов пробела по обнаруженным классам, методам и строкам

### 5.1. Обработка короткого нажатия на пробел (`TAP`) и базовый touch-конвейер

#### Подтверждённые факты (строки и дескрипторы в DEX)
- **Идентификаторы действия и клавиши пробела:**
  - `DEX1 [008099]`: `ClickSpace`
  - `DEX1 [059359]`: `onClickSpaceButton`
  - `DEX1 [056433]`: `mToolbarViewModelOnClickSpaceButtonKotlinJvmFunctionsFunction0`
  - `DEX1 [011518]`, `[011520]`: `INS_LANG_SPECIFIC_SPACE`, `INS_SPACE`
  - `DEX1 [042192]–[042194]`, `DEX2 [046376]–[046377]`: `disableSpaceKey`, `disableSpaceKeyInput`, `disableSpaceKeyInput=true`
  - `DEX2 [015272]`: `Func_Space`
  - `DEX2 [034530]`: `Space bar action`
  - `DEX2 [034536]`: `SpaceKeyA`
  - `DEX2 [034534]`, `[034535]`: `SpaceHWKeyA`, `SpaceHWKeyAction()`
  - `DEX2 [063317]–[063320]`: `processSpaceKeySogou()` (`insert space`, `isNextWordOnSpaceEnabled`, `select focused candidate`)
  - `DEX2 [007995]–[007997]`: `, spaceKeyIndex=`, `, spaceL=`, `, spaceR=`
  - `DEX2 [070747]`: `space_on`
- **ViewModel клавиши пробела:**
  - `DEX2 [020478]`: `Lcom/samsung/android/honeyboard/textboard/keyboard/presenter/viewmodel/keyicon/SpaceKeyIconViewModel;`
  - `DEX2 [020484]`: `Lcom/samsung/android/honeyboard/textboard/keyboard/presenter/viewmodel/keylabel/SpaceKeyMainKeyLabelViewModel;`
- **Узлы диспетчеризации касаний:**
  - `DEX1 [055152]`, `[056443]–[056444]`, `[059655]`: `mActivePointerId`, `mTouchSlop`, `mTouchSlop2`, `onIntercept DOWN mTouchSlop[`
  - `DEX2 [019447]`, `[036321]`: `Lcom/samsung/android/honeyboard/forms/ticket/TouchTicket;`, `TouchTicket(keyLabel=`
  - `DEX2 [020465]`, `[039399]–[039401]`: `Lcom/samsung/android/honeyboard/textboard/keyboard/container/PresenterContainerImpl$Item;`, `[PresenterContainerImpl] onFirstOnLayoutChanged: set touch listeners`
  - `DEX2 [046415]–[046417]`: `dispatchTouchEvent`, `dispatchTouchEventInternal : action = `, `dispatchTouchEventOnSoftInputPanel`
  - `DEX2 [050022]`, `[052833]–[052834]`: `getHoneyboardTouchLayerManager`, `honeyBoardTouchLayer dismiss.`, `honeyBoardTouchLayer start`
  - `DEX2 [061919]`, `[061923]`, `[061927]`, `[031137]`: `onTouchDown : actionIndex=`, `onTouchMove : pointerCount=`, `onTouchUp`, `OnSwipe_onTouchUp`
  - `DEX2 [072698]`: `touchLogicManager`
  - `DEX2 [060772]`: `null cannot be cast to non-null type com.samsung.android.honeyboard.textboard.touchmovesensitivitytuner.TouchMoveSensitivityTunerImpl`

#### Косвенные признаки
- В `DEX2` прослеживается разделение между слоем приёма и маршрутизации касаний (`PresenterContainerImpl`, `honeyBoardTouchLayer`, `touchLogicManager`, `TouchTicket`) и слоем действий (`SpaceKeyA`, `Func_Space`, `SpaceHWKeyAction`).
- Наличие `spaceKeyIndex=`, `spaceL=`, `spaceR=` и `disableSpaceKeyInput` указывает на отслеживание геометрии области пробела и флагов блокировки ввода пробела в зависимости от контекста/типа поля.

#### Гипотезы
- Короткое нажатие на экранный пробел маршрутизируется через `touchLogicManager` в обработчик действия `SpaceKeyA` / `Func_Space` при `onTouchUp`, если не сработали сценарии свайпа языка и долгого удержания.

#### Не установлено
- Точный класс-владелец `onTouchDown`/`onTouchMove`/`onTouchUp` и `touchLogicManager`.
- Условие, при котором короткое нажатие пробела отменяется движением пальца (`mTouchSlop` vs порог свайпа языка).
- Точное взаимодействие `SpaceKeyA` с подсказками/кандидатами (NWP) и `InputConnection.commitText(" ")` vs `sendKeyEvent(KEYCODE_SPACE)`.

---

### 5.2. Обработка свайпа по пробелу слева направо и справа налево (смена языка)

#### Подтверждённые факты (строки и дескрипторы в DEX)
- **Явные направленные действия смены языка с пробела:**
  - `DEX2 [070742]`: `space_lang_change_next`
  - `DEX2 [070743]`: `space_lang_change_prev`
  - `DEX2 [011554]`: `ChangeLanguageGestureA`
  - `DEX2 [015262]`: `Func_LanguageChange`
  - `DEX2 [009570]`, `[015470]`: `AbstractGestureAction`, `GestureActionFactory`
  - `DEX2 [018606]`, `[018613]`: `LanguageKeyA`, `LanguageSelectDialogA`
- **Диагностические строки измерения смещения и отображения пузыря пробела:**
  - `DEX2 [055779]`: `language changed by space last diff = `
  - `DEX2 [061924]`: `onTouchMove: Space bubble show, cause by absDiff(`
  - `DEX2 [060768]`: `null cannot be cast to non-null type com.samsung.android.honeyboard.textboard.keyboard.bubble.view.SpaceBubble`
  - `DEX2 [034532]`: `SpaceBubbleData(keyViewInfo=`
  - `DEX1 [070181]`, `[070183]`: `spaceBubbleCreator`, `spaceFocusTracker`
  - `DEX2 [039490]`: `[ToastDecorator] sendToastLanguageChange()`
- **Конфигурация, флаги и порог свайпа по пробелу:**
  - `DEX1 [070184]`: `spaceLanguageThresholdDefaultValue`
  - `DEX1 [004615]`, `DEX2 [008730]`: `/HBD/UseLanguageSwitchingUsingSpaceBar`
  - `DEX1 [012732]`: `LANGUAGE_VALUE_SWITCH_USING_SPACE_BAR`
  - `DEX1 [028633]`, `DEX2 [032725]`: `SETTINGS_DEFAULT_SPACE_LANGUAGE_CHANGE`
  - `DEX1 [046955]`: `getLanguageSwitchingUsingSpaceBar()Z`
  - `DEX1 [072247]`: `supportSpaceLanguageChange`
  - `DEX2 [018617]`: `LanguageSwitchingUsingSpaceBarItem`
  - `DEX2 [034531]`: `Space bar swipe`
  - `DEX2 [070053]`: `settings_language_switching_method`
  - `DEX1 [012149]`, `DEX2 [034382]`: `KBDVIEW_SUPPORT_SPACE_SHORT_LANGUAGE_NAME`, `Show short language name (ex: English -> EN) on space bar`

#### Косвенные признаки
- Строки `space_lang_change_next` и `space_lang_change_prev` подтверждают наличие **двух раздельных направлений** переключения языка с пробела (следующий/предыдущий).
- Строка `onTouchMove: Space bubble show, cause by absDiff(` свидетельствует, что в `onTouchMove` вычисляется модуль смещения (`absDiff`) и используется для показа `SpaceBubble`.
- Строка `language changed by space last diff = ` указывает на использование накопленного или последнего горизонтального смещения (`diff`) непосредственно в момент переключения языка.
- Наличие `spaceLanguageThresholdDefaultValue` подтверждает существование явного порога чувствительности свайпа по пробелу.

#### Гипотезы
- При перемещении пальца (`onTouchMove`) по клавише пробела при активной настройке `getLanguageSwitchingUsingSpaceBar() == true` измеряется горизонтальное смещение (`diff` / `absDiff`); по преодолении порога (`spaceLanguageThresholdDefaultValue`) отображается `SpaceBubble` и в зависимости от знака `diff` (влево/вправо) запускается `space_lang_change_prev` или `space_lang_change_next` через `ChangeLanguageGestureA` / `Func_LanguageChange`.
- После смены языка обновляется подпись клавиши пробела (`SpaceKeyMainKeyLabelViewModel`) и при необходимости показывается уведомление (`ToastDecorator.sendToastLanguageChange()`).

#### Не установлено
- Конкретное числовое значение `spaceLanguageThresholdDefaultValue` (в `dp`, `px` или доле ширины клавиши пробела).
- Какому именно физическому направлению жеста (`dx > 0` слева направо или `dx < 0` справа налево) соответствуют `space_lang_change_next` и `space_lang_change_prev`, а также инвертируется ли направление для RTL-локалей.
- Момент переключения языка: происходит ли оно сразу в `onTouchMove` (с возможным повторным переключением за один непрерывный свайп при сбросе базовой координаты `last diff`) или однократно при `onTouchUp`.
- Вертикальный допуск (наклон жеста) и условие, при котором свайп отменяет запуск long-press управления курсором.
- Поведение при одном установленном языке (отключается ли свайп полностью или только `SpaceBubble`).

---

### 5.3. Обработка долгого удержания пробела и перемещения пальца для управления курсором

#### Подтверждённые факты (строки и дескрипторы в DEX)
- **Выделенные классы UI, настроек и калибровки скорости:**
  - `DEX1 [020067]` и `DEX2 [020489]`: `Lcom/samsung/android/honeyboard/textboard/keyboard/view/SpaceCursorControlLayout;`
  - `DEX2 [020099]`, `[034533]` (+ SMAP `SpaceCursorControlSpeedTuningTestActivity.kt`): `Lcom/samsung/android/honeyboard/settings/developeroptions/SpaceCursorControlSpeedTuningTestActivity;`
  - `DEX2 [020242]–[020245]`:
    - `TouchAndHoldSpaceBarSettings$1`
    - `TouchAndHoldSpaceBarSettings`
    - `TouchAndHoldSpaceBarSettingsFragment`
    - `TouchAndHoldSpaceBarStatus`
  - `DEX1 [020030]–[020031]`, `DEX2 [020237]–[020241]`, `DEX3 [006150]`: `TouchAndHoldDelaySettings*`, `TouchAndHoldDelayCustomSettings*`, `TouchAndHoldDelayCustomView`
- **Настройки задержки и действия по удержанию пробела:**
  - `DEX1 [004596]`, `DEX2 [008705]`: `/HBD/TouchAndHoldDelay`
  - `DEX1 [049009]`, `DEX2 [051954]`: `getTouchAndHoldDelayValue()I`, `getTouchAndHoldDelayValueInSeconds(...)`
  - `DEX2 [008706]`, `[036317]`, `DEX1 [049010]`, `DEX2 [051955]–[051956]`: `/HBD/TouchAndHoldSpaceBar`, `TouchAndHoldSpaceBarTypeItem`, `getTouchAndHoldSpaceBarType()Ljava/lang/String;`, `getTouchAndHoldSpaceBarValue(...)`
  - `DEX2 [070744]–[070746]`: `space_launch_cursor_control`, `space_launch_voice_ime`, `space_no_action`
  - `DEX2 [055898]–[055899]`: `launchSpaceSmartTips`, `launchSpaceSmartTips - skip smart tip`
- **События запуска long-press и действия управления курсором:**
  - `DEX2 [065687]`: `sendSpaceLongPress: keyCode = `
  - `DEX2 [012503]–[012505]`: `CursorControlA`, `CursorControlActionFactory`, `CursorControlActionListener`
  - `DEX2 [011372]–[011374]`, `[011376]–[011377]`: `CURSOR_DOWN`, `CURSOR_LEFT`, `CURSOR_MOVE`, `CURSOR_RIGHT`, `CURSOR_UP`
  - `DEX2 [015255]–[015256]`: `Func_CursorLeft`, `Func_CursorRight`
  - `DEX2 [030043]–[030048]`: `MOVE_CURSOR_AFTER`, `MOVE_CURSOR_AFTER_BY_WORD`, `MOVE_CURSOR_BEFORE`, `MOVE_CURSOR_BEFORE_BY_WORD`, `MOVE_CURSOR_TO_BACK`, `MOVE_CURSOR_TO_FRONT`
  - `DEX2 [002158]`, `[053907]`, `[070256]`, `[073460]`: ` mIsAvailableCursorControl: `, `isCursorControlShowing`, `showCursorControl: Density changed, mCachedDensity(`, `updateNormalSplitPointerCount() - mIsAvailableCursorControl: `
- **Передача сдвигов курсора и взаимодействие с `InputConnection` (`HBIC` / `CACHEDIC`):**
  - `DEX2 [065646]`: `sendCursorMoveEvent: keyEventCode - `
  - `DEX2 [039456]–[039457]`: `[SendDownUpKeyEventDecorator] sendDownUpKeyEvents()`, `[SendDownUpKeyEventDecorator] sendDownUpWithShiftKeyEvents()`
  - `DEX1 [034565]–[034567]`: `[HBIC] requestCursorUpdates `, `[HBIC] sendKeyEvent, `, `[HBIC] setSelection, , `
  - `DEX1 [007229]`, `[007236]–[007237]`, `[034505]`: `CACHEDIC cursorLocation : `, `CACHEDIC onUpdateSelection isFinishComposing: `, `CACHEDIC onUpdateSelection selectionStart: `, `[CACHEDIC] updateEditorText selStart: `
  - `DEX2 [039563]`, `[039628]`: `[clearBufferOnViewClicked] finishAndInitByCursorMove`, `[notifyCursorChangedByUpdateSelection] finishComposing(true)`

#### Косвенные признаки
- Управление курсором с пробела выделено в самостоятельный UI-компонент `SpaceCursorControlLayout` и имеет отдельный экран калибровки скорости в developer options (`SpaceCursorControlSpeedTuningTestActivity`), что указывает на выделенный режим поверх клавиатуры, а не простой линейный перехват внутри клавиши.
- Наличие `space_launch_cursor_control`, `space_launch_voice_ime` и `space_no_action` в паре с `TouchAndHoldSpaceBarSettings` указывает, что долгое нажатие на пробел — конфигурируемое действие, где режим курсора является одним из вариантов.
- Наличие `sendCursorMoveEvent: keyEventCode - `, `[SendDownUpKeyEventDecorator] sendDownUpKeyEvents()` и `[HBIC] sendKeyEvent, ` в сочетании с `CURSOR_LEFT`/`CURSOR_RIGHT`/`CURSOR_UP`/`CURSOR_DOWN` указывает на доставку перемещений курсора через `KeyEvent`-команды поверх обёртки `HBIC`.
- Строки `finishAndInitByCursorMove` и `finishComposing(true)` указывают на явное завершение composing-текста при смещении курсора.

#### Гипотезы
- При удержании пробела в течение `getTouchAndHoldDelayValue()` без превышения порога свайпа вызывается `sendSpaceLongPress`, который при настройке `space_launch_cursor_control` и активном флаге `mIsAvailableCursorControl` показывает `SpaceCursorControlLayout` (`isCursorControlShowing = true`).
- Дальнейшее перемещение пальца в пределах клавиатуры (вероятно по 2 осям — X и Y, с учётом `CURSOR_UP`/`CURSOR_DOWN`, но требует проверки) транслируется через `CursorControlA` в вызовы `sendCursorMoveEvent(keyEventCode)` → `SendDownUpKeyEventDecorator.sendDownUpKeyEvents()` → `HBIC.sendKeyEvent(...)` (предположительно `KEYCODE_DPAD_LEFT/RIGHT/UP/DOWN`).

#### Не установлено
- Конкретные значения задержек `TouchAndHoldDelay` (короткая/средняя/длинная/пользовательская в миллисекундах) и точный механизм отмены таймера при начале свайпа.
- Поддерживает ли именно `SpaceCursorControlLayout` 2D-перемещение (вверх/вниз) или только горизонтальное, и какая математика шага/ускорения используется (калибровка из `SpaceCursorControlSpeedTuningTestActivity`).
- Какие именно `keyEventCode` передаются в `sendCursorMoveEvent`, используется ли `HBIC.setSelection(...)` как основной или резервный путь, и вызывается ли `finishComposingText()` до первого шага курсора.
- Какие визуальные эффекты и виброотклик (haptic feedback) срабатывают при входе в `SpaceCursorControlLayout` и на каждом шаге курсора.
- Условия, при которых `mIsAvailableCursorControl` становится `false` (например, multi-touch в split-режиме — наводка `updateNormalSplitPointerCount()`, тип поля ввода, пароли и т. п.).

---

### 5.4. Механизм получения списка языков и переключения активной раскладки

#### Подтверждённые факты (строки и дескрипторы в DEX)
- **Модели данных языков:**
  - `DEX1 [019617]`, `DEX2 [019356]`, `DEX3 [006047]`: `Lcom/samsung/android/honeyboard/base/languagepack/language/Language;`
  - `DEX1 [019618]`, `DEX3 [006048]`, `DEX1 [002446]`, `[058838]`: `Lcom/samsung/android/honeyboard/base/languagepack/selectedlanguage/SelectedLanguage;` (присутствует сигнатура метода/конструктора `(IZLjava/lang/String;Ljava/lang/String;[Ljava/lang/String;I)Lcom/samsung/android/honeyboard/base/languagepack/selectedlanguage/SelectedLanguage;`)
  - `DEX1 [019619]`: `Lcom/samsung/android/honeyboard/base/languagepack/selectedlanguage/SelectedLanguageInfo;`
  - `DEX2 [034034]`: `SelectedLanguageItem`
- **Репозиторий и доступ к списку/порядку языков:**
  - `DEX1 [039436]`, `[044573]`, `[053572]`: `clear BaseLanguageRepo`, `get BaseLanguageRepo`, `load BaseLanguageRepo`
  - `DEX1 [074160]–[074161]`: `updateSelectedLanguageCache is failed.`, `updateSelectedLanguageCache is succeeded. `
  - `DEX1 [045607]`: `getCurrentLang()Lcom/samsung/android/honeyboard/base/languagepack/language/Language;`
  - `DEX1 [045608]–[045609]`, `DEX2 [049413]`: `getCurrentLanguage(...)`, `getCurrentLanguageOrder`
  - `DEX1 [048281]–[048284]`, `DEX2 [051411]–[051412]`: `getSelectedLanguageId`, `getSelectedLanguageList`, `getSelectedLanguages()Ljava/util/List;`
  - `DEX1 [066729]–[066730]`, `[035225]`: `setCurrentLanguage`, `setCurrentLanguageOrder`, `[setCurrentLanguage] language is null`
  - `DEX1 [068503]–[068504]`, `DEX2 [069611]`: `setSelectedLanguageId`, `setSelectedLanguageList`
  - `DEX1 [026633]`, `[026665]`, `[061369]`: `Next language is `, `No language found for Index `, `prevLanguage`
  - `DEX1 [032627]`, `[032629]`: `Update currentLanguage: `, `Update selected language list `
  - `DEX2 [064538]–[064539]`: `restoreCoverSelectedLanguages cover `, `restoreCoverSelectedLanguages main `
- **События переключения, перестройка раскладки и синхронизация с IME/движками:**
  - `DEX1 [008850]`, `DEX2 [046995]–[046996]`: `CurrentLanguageChanged`, `emitEvent: CurrentLanguageChanged`, `emitEvent: SelectedLanguageChanged`
  - `DEX2 [038850]`: `[LanguagePackDecorator] updateSelectedLanguage()`
  - `DEX2 [030057]`: `MSG_REQUEST_SWITCH_LANGUAGES`
  - `DEX2 [073364]`: `updateCurrentLanguageCommand execute : `
  - `DEX2 [065668]`: `sendLanguageChangeToAction: inputText = `
  - `DEX2 [011546]`: `Change keyboard language to : `
  - `DEX2 [011692]`: `Clear keymap on language change`
  - `DEX2 [036516]`: `UPDATE_KEYBOARD_VIEW`
  - `DEX1 [063198]–[063200]`: `saveInputMethodSubtypeList: `, `saveInputMethodSubtypeList: skipped due to currentInputMethodId=`, `saveInputMethodSubtypeList: skipped due to writing toolkit process.`
  - `DEX2 [019915]`, `DEX1 [040598]`, `[040602]`, `DEX2 [044788]–[044789]`: `KeyboardSettingsProvider` (`.../current_language`, `.../selected_language_list`, `.../keyboard_language_input_type`, `.../keys_cafe_language_update`)
  - `DEX2 [013312]–[013316]`, `[060123]`: `ET9AWLdbSetLanguage`, `nativeSetActiveLanguage`

#### Косвенные признаки
- Samsung Keyboard не опирается исключительно на системный `InputMethodManager.switchToNextInputMethod`; список активных языков и текущий индекс хранятся во внутреннем репозитории HoneyBoard (`BaseLanguageRepo`, `SelectedLanguage`, `selectedLanguageList`, `currentLanguageOrder`) и дополнительно публикуются/синхронизируются через `KeyboardSettingsProvider` и `saveInputMethodSubtypeList`.
- Переключение активного языка проходит через команду/сообщение (`MSG_REQUEST_SWITCH_LANGUAGES`, `updateCurrentLanguageCommand`, `LanguagePackDecorator`), публикацию события `CurrentLanguageChanged`, сброс текущей таблицы клавиш (`Clear keymap on language change`), обновление движка предиктивного ввода (`ET9AWLdbSetLanguage` / `nativeSetActiveLanguage`) и перерисовку клавиатуры (`UPDATE_KEYBOARD_VIEW`).

#### Гипотезы
- При получении `space_lang_change_next` / `space_lang_change_prev` обработчик читает упорядоченный список из `getSelectedLanguageList()` / `getSelectedLanguages()`, вычисляет следующий или предыдущий индекс относительно `getCurrentLanguageOrder()` (с циклическим переходом по модулю размера списка — наводки `Next language is `, `prevLanguage`, `No language found for Index `), обновляет текущий язык (`setCurrentLanguage`, `setCurrentLanguageOrder`) и инициирует `CurrentLanguageChanged` + `UPDATE_KEYBOARD_VIEW`.

#### Не установлено
- Как именно формируется порядок языков в `selectedLanguageList` (фиксированный порядок из настроек или MRU — наиболее недавно использованные).
- Отфильтровываются ли при свайпе по пробелу неалфавитные/рукописные/эмодзи-раскладки.
- Обработка крайних случаев: `size <= 1`, несовпадение индекса (`No language found for Index `), смена языка при незавершённом composing-слове (`sendLanguageChangeToAction: inputText = `).
- Является ли `switchToLastInputMethod` (`DEX3 [027756]`) частью переключения между разными IME Android или используется только отдельной кнопкой глобуса/навигации.

---

## 6. Связь обнаруженных компонентов с проектом `GboardSamsung`

> **Важно:** сопоставление ниже описывает архитектурную аналогию между наводками Samsung Keyboard `5.9.50.10` и ранее проведённым аудитом `GboardSamsung`. Оно **не** является основанием для немедленного изменения `docs/SPACEBAR_LANGUAGE_SWITCH_DESIGN.md` или написания кода до подтверждения деталей по байткоду обоих APK (Samsung и целевого Gboard).

| Задача в `GboardSamsung` | Наводки в Samsung Keyboard `5.9.50.10` (не доказаны кодом) | Соответствующий узел в `GboardSamsung` (по `TECHNICAL_AUDIT.md`) | Что требуется проверить до реализации |
|---|---|---|---|
| Перехват и арбитраж касаний на пробеле (`TAP` / `SWIPE` / `LONG_PRESS`) | `PresenterContainerImpl` + `honeyBoardTouchLayer` + `touchLogicManager` + `TouchTicket` | `KeyboardViewHolder.dispatchTouchEvent(MotionEvent)` + `GboardPointerOwnerTransformation.kt` + композиция touch-диспетчера | Точный порядок вызовов и арбитраж в `touchLogicManager` Samsung; совместимость с touch-пайплайном Gboard `18.5.4.993608717` |
| Двунаправленный свайп по пробелу для смены языка | `space_lang_change_next` / `space_lang_change_prev`, `spaceLanguageThresholdDefaultValue`, `SpaceBubble`, `language changed by space last diff = ` | Новый runtime-обработчик пробела + визуальная подпись/отклик (смежно с `GboardSpacebarLogoRuntime.java`) | Числовой порог свайпа, момент срабатывания (`MOVE` vs `UP`), мульти-переключение за один свайп, RTL-инверсия |
| Удержание пробела и перемещение курсора (вместо штатного Gboard Trackpad) | `TouchAndHoldSpaceBarSettings`, `sendSpaceLongPress`, `space_launch_cursor_control`, `SpaceCursorControlLayout`, `CursorControlA`, `sendCursorMoveEvent`, `SendDownUpKeyEventDecorator`, `[HBIC] sendKeyEvent`, `finishAndInitByCursorMove` | Пользовательский контроллер курсора через `InputConnection` (`finishComposingText()` + `KEYCODE_DPAD_*`) при отключении штатного `enable_scrub_move` / `free_cursor` Gboard | Точный `keyEventCode`, 1D vs 2D движение, кривая чувствительности/скорости, условия отключения режима курсора |
| Получение списка языков и переключение активной раскладки | `BaseLanguageRepo`, `SelectedLanguage`, `getSelectedLanguageList`, `getCurrentLanguageOrder`, `setCurrentLanguage`, `CurrentLanguageChanged`, `UPDATE_KEYBOARD_VIEW` | Внутренний менеджер раскладок Gboard (`InputMethodEntryManager` / обработчик `-0x271b` в целевом APK Gboard) | **Критично:** в Gboard собственный менеджер раскладок, отличный от HoneyBoard — необходима декомпиляция **Google Gboard `18.5.4.993608717-release-arm64-v8a`** для точных обфусцированных дескрипторов |

---

## 7. Сводка ограничений анализа и перечень того, что установить не удалось

На текущем этапе **не установлено**:

1. **Ни одного декомпилированного тела метода** Samsung Keyboard `5.9.50.10` (Java/Kotlin/Smali).
2. **Точные имена обфусцированных классов и сигнатуры методов**, вызывающих найденные строки (`space_lang_change_next/prev`, `sendSpaceLongPress`, `sendCursorMoveEvent`, `onTouchMove: Space bubble show`).
3. **Точные числовые константы и пороги жестов:**
   - значение `spaceLanguageThresholdDefaultValue`;
   - значения `TouchAndHoldDelay` (в мс);
   - шаг перемещения пальца на один сдвиг курсора и кривая ускорения из `SpaceCursorControlSpeedTuningTestActivity`;
   - значение `mTouchSlop` / `mTouchSlop2` для отмены тапа и long-press.
4. **Точная машина состояний пробела:**
   - как арбитрируется конфликт между началом свайпа и таймером долгого удержания;
   - переключается ли язык в `ACTION_MOVE` или в `ACTION_UP`, и допускается ли переключение нескольких языков за одно касание;
   - работает ли `SpaceCursorControlLayout` по двум осям (X+Y) или только по горизонтали;
   - каково поведение при composing-тексте перед свайпом языка и перед входом в режим курсора.
5. **Точные параметры взаимодействия с `InputConnection`:** какие `KeyEvent`-коды отправляются в `sendCursorMoveEvent` и когда применяется `setSelection` вместо `sendKeyEvent`.
6. **Точная логика списка языков:** порядок обхода (фиксированный vs MRU), фильтрация специальных раскладок, обработка RTL-направления.
7. **Ресурсы и манифест APK:** содержимое `AndroidManifest.xml`, `res/xml/*`, `res/values/*` и роль 37 нативных `.so` библиотек в обработке касаний/языков.
8. **Целевые обфусцированные символы Google Gboard `18.5.4.993608717-release-arm64-v8a`:** в рамках этого этапа анализировались только индексы Samsung Keyboard; сам APK целевой версии Gboard для этапа 4 ещё не декомпилировался.

---

## 8. Приоритетные якоря для следующего шага (локальная выгрузка из JADX / baksmali)

Чтобы перевести перечисленные гипотезы в проверяемые факты и получить право обновить `docs/SPACEBAR_LANGUAGE_SWITCH_DESIGN.md`, достаточно выполнить текстовый поиск (`Text Search` в JADX) по `Клавиатура_Samsung_v5.9.50.10_c87b(1).apk` и выгрузить исходники классов, ссылающихся на следующие строки:

1. **Свайп по пробелу (смена языка):**
   - `"space_lang_change_next"` и `"space_lang_change_prev"`
   - `"language changed by space last diff = "`
   - `"onTouchMove: Space bubble show, cause by absDiff("`
   - `"spaceLanguageThresholdDefaultValue"`
   - `"ChangeLanguageGestureA"`
2. **Долгое удержание и управление курсором:**
   - `"sendSpaceLongPress: keyCode = "`
   - `"space_launch_cursor_control"`
   - `"sendCursorMoveEvent: keyEventCode - "`
   - `com.samsung.android.honeyboard.textboard.keyboard.view.SpaceCursorControlLayout`
   - `com.samsung.android.honeyboard.settings.developeroptions.SpaceCursorControlSpeedTuningTestActivity`
   - `"CursorControlA"` и `"[SendDownUpKeyEventDecorator] sendDownUpKeyEvents()"`
3. **Короткое нажатие пробела и touch-конвейер:**
   - `"SpaceKeyA"` и `"ClickSpace"`
   - `"touchLogicManager"` и `PresenterContainerImpl`
4. **Список языков и переключение раскладки:**
   - `"Next language is "` и `"prevLanguage"`
   - `"[LanguagePackDecorator] updateSelectedLanguage()"` и `"MSG_REQUEST_SWITCH_LANGUAGES"`
   - `"updateCurrentLanguageCommand execute : "` и методы `getSelectedLanguageList` / `getCurrentLanguageOrder` / `setCurrentLanguage`

---

## 9. Протокол выполненных проверок

- Проверены метаданные и ограничения из `00_QUICK_INDEX.txt` и `00_README_AND_LIMITATIONS.txt`.
- Выполнен сквозной текстовый поиск и выборочная дословная верификация индексов `[xxxxxx]` по `DEX1_KEYWORD_CANDIDATES.txt`, `DEX2_KEYWORD_CANDIDATES.txt` и полный просмотр `DEX3_KEYWORD_CANDIDATES.txt`.
- Проверена структура рабочего каталога и отсутствие бинарных `.apk`/`.dex` файлов, а также отсутствие локальных декомпиляторов DEX.
- Подтверждено, что исходный код `GboardSamsung`, патчи, `RuntimeAbi`, Gradle/workflows и `docs/SPACEBAR_LANGUAGE_SWITCH_DESIGN.md` не затрагивались.
