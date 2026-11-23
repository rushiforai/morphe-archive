# Stage 4.2 — повторный анализ оригинального APK Gboard 18.5.4

> **Статус:** бинарный APK получен и проверен; критические механизмы языка и курсора теперь исследованы непосредственно по DEX и ресурсам. Старый вывод «BLOCKED из-за отсутствия APK» ниже по истории Stage 4.2 больше не актуален.
>
> **APK:** Gboard-v18.5.4.993608717-release-arm64-v8a.apk  
> **SHA-256:** f47f44d33ab21d28aabfaec8292009c1173964ea238441734327a0a15ba32813  
> **Размер:** 95 577 506 байт  
> **DEX:** classes.dex 7 859 484; classes2.dex 8 465 652; classes3.dex 3 683 072; classes4.dex 680 452 байта  
> **Цель:** Samsung Galaxy S22 5G SM-S901U1, Android 16 / One UI 8  
> **Репозиторий:** vortexnode/GboardSamsung, ветка main

## 1. Итоговое решение

1. Встроенный FreeCursorKeyboard **не использовать**: он переключает Gboard на отдельную пустую клавиатуру/панель с фоном и кнопкой блокировки. Это не Samsung-подобное управление поверх обычной клавиатуры.
2. Выбран **OPTION B**: обычная клавиатура остаётся видимой; удержание пробела включает временное управление курсором; горизонтальное движение отправляет DPAD_LEFT/DPAD_RIGHT через текущий InputConnection.
3. NEXT и PREVIOUS делать напрямую через InputMethodManager, строго внутри текущей Gboard IME. Не отправлять -10197. Не использовать обработчик -10011 без обхода TalkBack fallback в Gboard.
4. Все жесты пробела должны быть частью **одного существующего** KeyboardViewHolder.dispatchTouchEvent hook, уже используемого SwipeDismissPatch. Второй независимый hook добавлять нельзя.
5. ScrubDelete сохранить. Для отключения ScrubMove нельзя использовать noScrubbing: оба обработчика наследуются от общего ScrubMotionEventHandler и проверяют этот флаг.

## 2. Переключение языков

### 2.1. Что реально делает NEXT

- Lqcm.<clinit>() не содержит SWITCH_TO_PREVIOUS_LANGUAGE.
- Lpvd.m(Lohe;)Z — code_item 0x32c4d4, 191 instruction units.
  - На смещении 0x00ae сравнивается -10011; вызов Lpvd.e(Lqbc;Z) передаёт boolean true.
  - На смещении 0x00b6 сравнивается -10197; вызов Lpvd.e(Lqbc;Z) передаёт boolean false.
- Lpvd.e(Lqbc;Z)V — code_item 0x517af4, 48 instruction units; на 0x0026 вызывает Lpex.t(Z,Lpfi;)Z.
- Lpex имеет 21 метод; отдельного метода PREVIOUS в интерфейсе нет. Единственная операция переключения направления — t(Z,Lpfi;)Z.
- Lpga — единственная найденная реализация Lpex. Lpga.t(Z,Lpfi;)Z — code_item 0x504ae0, 124 instruction units; вызывает Lrek.k(current, boolean), Lpga.az(boolean), а затем Lpga.l(next, source).
- Lrek.k(Lpev;Z)Lpev; — code_item 0x5309b4, 63 instruction units. Boolean не используется как направление: метод получает индекс текущего Lpev через Lrek.j и выбирает элемент index + 1 из внутреннего списка. Это NEXT, не PREVIOUS.
- Lrek.j(Lpev;)I — code_item 0x530b88, 56 instruction units; ищет текущую запись по Lpev.i() (locale) и Lpev.q() (идентификатору).

### 2.2. Важная ловушка: -10011 может иметь TalkBack fallback

Lpga.az(Z)Z — code_item 0x5049fc, 97 instruction units:
- 0x0021: InputMethodManager.switchToNextInputMethod(token, boolean).
- 0x0028: проверка Ljcu.c().
- 0x0033–0x0035: строка com.google.android.marvin.talkback и поиск соответствующего InputMethodInfo.
- 0x0045: InputMethodManager.setInputMethod(token, id).

То есть обычный путь с boolean true ограничивает переход текущей IME, но если switchToNextInputMethod не сработал и условие Ljcu.c() истинно, Gboard имеет отдельный fallback на TalkBack. Поэтому для строгой гарантии «не выходить из Gboard» новый runtime должен вызывать напрямую InputMethodManager.switchToNextInputMethod(token, true), не проходя через Lpga.az и его TalkBack fallback. -10197 запрещён: он передаёт false и разрешает внешние IME.

### 2.3. Подтверждённый путь для PREVIOUS

В оригинальном коде есть все необходимые части для безопасного выбора конкретного subtype:
- Lpev.f() возвращает InputMethodSubtype.
- Lrek.j(current) находит индекс текущей записи в динамическом порядке Gboard.
- Lrek.k(current, ...) использует тот же порядок и выбирает следующий элемент по index + 1. Для PREVIOUS нужно выбрать элемент index - 1 с циклическим переходом к последнему элементу.
- Lsex.k(InputMethodInfo, IBinder, InputMethodSubtype) — code_item 0x5414d4, 60 instruction units. Метод проверяет, что subtype входит в список разрешённых subtype этой InputMethodInfo, затем вызывает InputMethodManager.setInputMethodAndSubtype(token, info.getId(), subtype).
- Lpha.a() — code_item 0x506c14, 15 instruction units; получает IME token из Window.getAttributes().token.
- Lphr.onCurrentInputMethodSubtypeChanged(InputMethodSubtype) — code_item 0x31ba30, 7 instruction units; вызывает Lpeo.a(subtype), обновляющий текущее состояние Gboard. Lpeo.a — code_item 0x312178, 43 instruction units.

**Алгоритм PREVIOUS для реализации:**
1. Получить текущий InputMethodEntry (Lpev) и динамический rotation list Lrek из менеджера Lpga.
2. Получить index через Lrek.j(current).
3. Взять предыдущий Lpev из того же внутреннего списка, который Lrek.k использует для NEXT: index - 1, с wrap-around.
4. Получить subtype через previous.f().
5. Получить InputMethodInfo именно текущей Gboard IME и её token.
6. Передать subtype в проверяющий helper Lsex.k(info, token, subtype), либо эквивалентно вызвать setInputMethodAndSubtype с тем же Gboard info.getId().
7. Не менять package/IME ID на другой. Если индекс не найден, subtype не разрешён или список содержит один элемент — безопасно ничего не делать.

Это код-подтверждённый путь в рамках Gboard; обязательны runtime-тесты с 2, 3 и 4 языками, включая циклический переход и проверку, что активная IME всегда остаётся Gboard.

## 3. Курсор: почему OPTION A отклонён

### 3.1. Нативный long-press producer найден в ресурсах

res/IEX.xml:
- Если enable_free_cursor_by_long_press_space, enable_scrub_move и free_cursor истинны, LONG_PRESS отправляет SWITCH_KEYBOARD с data=free_cursor.
- Иначе отправляется SHOW_SYSTEM_IME_PICKER с data=space.

res/nB0.xml содержит такой же условный LONG_PRESS для Free Cursor, но без else-ветки.

res/Xyr.xml, res/US_.xml и res/OgP.xml:
- обычное действие пробела — SPACE/PRESS;
- базовый long_press_delay = 500 мс;
- при enable_free_cursor_by_long_press_space и free_cursor задержка становится 300 мс.

Lpvd.m(Lohe;)Z также читает preference space_long_press_ime_picker и обрабатывает -10022, открывая LanguagePicker. Для пользовательского поведения «удержание = курсор» этот системный picker должен быть исключён.

### 3.2. Встроенный FreeCursorKeyboard — отдельный экран

res/Hq_.xml регистрирует com.google.android.libraries.inputmethod.freecursor.FreeCursorKeyboard и FreeCursorMotionEventHandler.

Его body layout — res/UXX.xml (resource 0x7f0e01ff):
- фон FrameLayout;
- SoftKeyView с lock icon;
- два TextView с visibility=GONE;
- обычных клавиш стандартной клавиатуры в этом layout нет.

Следовательно, включение нативного FreeCursor меняет тело клавиатуры на отдельную пустую панель. Это не требуемое Samsung-подобное поведение. OPTION A отклонён.

### 3.3. Подтверждённый механизм отправки перемещения курсора

- FreeCursorMotionEventHandler.c(ILjava/lang/Long;ILjava/lang/Double;)V — code_item 0x5a1994; нативный FreeCursor использует DPAD keycodes 19–22.
- В текущем проекте GboardGlobeDragRuntime уже получает InputMethodService.getCurrentInputConnection() и отправляет KeyEvent ACTION_DOWN/ACTION_UP через InputConnection.sendKeyEvent() для Ctrl+Z/Ctrl+Y.
- GboardSwipeDismissRuntime.resolveInputMethodService(View) уже умеет получить InputMethodService через цепочку ContextWrapper.
- Поэтому OPTION B может отправлять KEYCODE_DPAD_LEFT/RIGHT напрямую через текущий InputConnection, не активируя FreeCursorKeyboard и не меняя вид обычной клавиатуры.
- Перед первым перемещением вызвать finishComposingText() один раз, затем отправлять сбалансированные пары ACTION_DOWN/ACTION_UP для DPAD_LEFT/RIGHT. Реализация должна проверять null InputConnection и сбрасывать состояние при смене editor/focus.

### 3.4. Разделение long-press и swipe Free Cursor

- TriggerFreeCursorMotionEventHandler создаёт Loob listener и регистрирует его в d(); g(MotionEvent) передаёт события в Looe — это swipe activation path.
- Loob.m(Lohe;)Z — code_item 0x5a2c6c, 188 instruction units; обрабатывает -10004 с payload Lomw.a (long-press action) и -10104 с payload Looc (space-swipe action).
- Looe.a(MotionEvent) — state machine для swipe activation, а не producer long-press.
- Для выбранного OPTION B не активировать ни FreeCursorKeyboard, ни TriggerFreeCursor swipe path. Нативные long-press actions FreeCursor/IME picker должны быть подавлены/удалены в соответствующих ресурсах; курсорный режим полностью контролирует новый runtime.

## 4. ScrubMove и ScrubDelete

### 4.1. Регистрация в ресурсах

- res/bsB.xml:
  - при free_cursor=false регистрирует ScrubMoveMotionEventHandler с preference_key 0x7f14096b;
  - при free_cursor=true регистрирует TriggerFreeCursorMotionEventHandler с тем же preference_key.
- res/tER.xml и res/kgx.xml также условно регистрируют TriggerFreeCursorMotionEventHandler при free_cursor=true.
- ScrubDeleteMotionEventHandler отдельно зарегистрирован в 28 ресурсах с preference_key 0x7f14096a.

### 4.2. Почему нельзя использовать noScrubbing

ScrubDeleteMotionEventHandler и ScrubMoveMotionEventHandler оба наследуются от ScrubMotionEventHandler.

ScrubMotionEventHandler.r(MotionEvent, boolean) — code_item 0x52184c, 219 instruction units; в начале метода проверяет Lobk.v(packageName, "noScrubbing", EditorInfo).

Следовательно, noScrubbing отключает общий scrub-путь для обоих обработчиков. Не использовать noScrubbing для отключения только ScrubMove.

**Требуемое изменение:** убрать только регистрацию ScrubMove/TriggerFreeCursor, не трогать отдельные регистрации ScrubDeleteMotionEventHandler и его preference 0x7f14096a.

InlineSuggestionScrubSpaceMotionEventHandler в res/kgx.xml — отдельный обработчик. Он может конфликтовать с перехватом свайпа по пробелу в режиме inline suggestion; проверить при тестировании. Приоритет требуемого жеста пробела — переключение языка.

## 5. Единый Touch Dispatcher

В текущем репозитории GboardSwipeDismissBytecodePatch.kt уже внедряет вызов GboardSwipeDismissRuntime.onHeaderTouch(p0, p1) в начало KeyboardViewHolder.dispatchTouchEvent.

Новый spacebar runtime должен быть добавлен **в этот же hook**:
- сначала проверить header gesture;
- затем keyboard-body/spacebar gesture;
- если любой runtime вернул consumed=true — вернуть true;
- иначе продолжить исходный dispatch.

Не добавлять второй независимый hook на KeyboardViewHolder.dispatchTouchEvent. Сохранить существующие SwipeDismiss и Globe Drag.

## 6. Требуемое поведение runtime

1. ACTION_DOWN на реальном SoftKeyView с keycode SPACE (62): начать отслеживание одного pointer; ничего не потреблять.
2. Короткое нажатие без swipe/long-press: полностью пропустить исходное событие — обычный пробел вставляется как раньше.
3. Горизонтальный swipe до long-press threshold:
   - отправить ACTION_CANCEL дочернему SoftKeyboardView;
   - L→R: прямой InputMethodManager.switchToNextInputMethod(token, true);
   - R→L: безопасный PREVIOUS через предыдущий Lpev subtype;
   - поглотить остаток touch stream до ACTION_UP.
4. Удержание примерно 300 мс без предварительного language swipe:
   - отменить исходное нажатие пробела через ACTION_CANCEL;
   - вызвать finishComposingText() один раз;
   - начать cursor mode без отдельного UI.
5. После входа в cursor mode горизонтальное движение отправляет DPAD_LEFT/RIGHT через InputConnection.sendKeyEvent(DOWN/UP); использовать умеренное ускорение по расстоянию/скорости.
6. ACTION_UP/ACTION_CANCEL, смена editor/focus или второй pointer: сбросить состояние; не вставлять пробел после активированного long-press/swipe.
7. Не добавлять Trackpad кнопку, отдельный режим в настройках или пользовательские переключатели.

## 7. Обязательные runtime-тесты

- Короткий tap: ровно один обычный пробел.
- L→R: NEXT, только внутри Gboard.
- R→L: PREVIOUS, только внутри Gboard.
- 2, 3 и 4 языка: полный цикл вперёд/назад и wrap-around.
- Long-press без движения: пробел не вставляется, picker/FreeCursor экран не появляется.
- Long-press + движение влево/вправо: курсор движется без смены клавиатуры.
- Composing text: composition корректно завершается перед первым DPAD.
- Plain text, password, number, multiline, RTL и WebView editors.
- ACTION_CANCEL, pointer down/up, быстрый переход между полями и null InputConnection.
- ScrubDelete остаётся рабочим; Glide Typing, autocorrect, predictions, voice, emoji/GIF, clipboard, Globe, multitouch и SwipeDismiss не регрессируют.
- Проверить inline suggestion scrub: новый spacebar swipe имеет приоритет и не должен запускать конкурирующий cursor/scrub handler.

## 8. Статусы

| Часть | Статус |
|---|---|
| NEXT внутри текущей IME через прямой InputMethodManager API | CODE-CONFIRMED; runtime test pending |
| Запрет внешних IME | CODE-CONFIRMED при прямом вызове switchToNextInputMethod(token, true); не использовать -10197 и не проходить через TalkBack fallback |
| PREVIOUS через Lrek index - 1 + Lpev.f() + setInputMethodAndSubtype | CODE-CONFIRMED; runtime test pending |
| Нативный FreeCursor long-press producer | CONFIRMED; OPTION A rejected because separate blank UI |
| OPTION B cursor movement via InputConnection DPAD | API path confirmed in existing project runtime; runtime test pending |
| ScrubDelete preservation | CONFIRMED by separate registrations and inheritance analysis |
| Unified dispatcher | Integration point confirmed; implementation pending |

**Следующий этап:** реализация OPTION B и безопасного NEXT/PREVIOUS в существующей архитектуре проекта. Сначала подготовить код и тесты/отчёт; не запускать сборку .mpp до отдельной проверки diff.
