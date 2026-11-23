# Stage 5 — реализация Samsung-подобных жестов пробела

**Перед началом:** синхронизировать AI Studio с актуальной веткой main. Главный источник анализа — docs/SPACEBAR_STAGE_4_2_APK_REANALYSIS.md. APK в репозиторий не добавлять.

## Цель

Реализовать на обычной Gboard-клавиатуре:

1. Короткое нажатие пробела — обычный пробел.
2. Свайп слева направо по пробелу — NEXT language.
3. Свайп справа налево по пробелу — PREVIOUS language.
4. Удержание пробела около 300 мс и последующее движение пальца — перемещение курсора влево/вправо.
5. Обычная клавиатура остаётся видимой. Никакого FreeCursorKeyboard, пустого Trackpad-экрана, Trackpad-кнопки или нового переключателя в настройках.

## Архитектурные ограничения

- Не добавлять второй независимый hook на KeyboardViewHolder.dispatchTouchEvent.
- Интегрировать обработку пробела в уже существующий hook GboardSwipeDismissBytecodePatch.kt, сохранив GboardSwipeDismissRuntime.onHeaderTouch().
- Не ломать GboardGlobeDragRuntime и Globe key.
- Не менять unrelated patches, Gradle, зависимости, версии и сборочные настройки.
- Не запускать сборку .mpp на этом этапе. Сначала предоставить diff и отчёт для проверки.

## 1. Spacebar gesture runtime

Создать отдельный runtime либо аккуратно расширить существующий runtime, но вызывать его из того же KeyboardViewHolder.dispatchTouchEvent hook.

### Определение пробела

- Находить SoftKeyView под pointer через существующие reflection handles/metadata.
- Определять SPACE по реальному keyCode 62, а не по одному resource ID: ID меняется между keyboard layouts.
- Использовать один активный pointer. При появлении второго pointer сбрасывать жест и отдавать события исходному Gboard.
- Не перехватывать другие клавиши.

### Состояния

Реализовать явную state machine:

- IDLE
- SPACE_TRACKING
- LANGUAGE_SWIPE_CONSUMED
- CURSOR_MODE

### Tap

- ACTION_DOWN на пробеле начинает пассивное отслеживание и сразу проходит в исходный Gboard.
- Если пользователь отпустил пробел до swipe threshold и до long-press timeout, не потреблять ни одно исходное событие. Должен вставиться ровно один обычный пробел.

### Language swipe

- Если горизонтальное перемещение превысило touch slop до long-press timeout:
  1. отправить ACTION_CANCEL дочернему SoftKeyboardView, чтобы не вставить пробел;
  2. выполнить переключение один раз;
  3. поглотить остаток текущего touch stream до ACTION_UP/ACTION_CANCEL.
- L→R: NEXT.
- R→L: PREVIOUS.
- Не запускать cursor mode после уже распознанного swipe.
- Не отправлять -10197 и не использовать -10011 как конечный runtime action.

### Long-press cursor

- Запустить main-thread Handler timeout примерно 300 мс.
- Если к моменту timeout pointer всё ещё удерживает пробел и language swipe не распознан:
  1. отправить ACTION_CANCEL дочернему SoftKeyboardView;
  2. получить service через существующий GboardSwipeDismissRuntime.resolveInputMethodService(View);
  3. получить текущий InputConnection;
  4. вызвать finishComposingText() один раз;
  5. перейти в CURSOR_MODE и поглощать оставшийся touch stream.
- В CURSOR_MODE переводить горизонтальное движение в DPAD_LEFT/DPAD_RIGHT.
- Отправлять сбалансированные KeyEvent ACTION_DOWN/ACTION_UP через InputConnection.sendKeyEvent(), используя тот же проверенный подход, который уже применяется в GboardGlobeDragRuntime для Ctrl+Z/Ctrl+Y.
- Не отправлять вертикальные DPAD.
- Добавить разумный порог по расстоянию и умеренное ускорение от скорости; не генерировать сотни событий на один MOVE.
- При ACTION_UP/ACTION_CANCEL, смене editor/focus, null InputConnection или втором pointer — корректно завершать режим.
- Если удержание началось, но движения не было, пробел не должен вставляться.

### ACTION_CANCEL и повторный вход

- Использовать reentrancy guard по образцу существующего SwipeDismiss runtime.
- Синтетический ACTION_CANCEL должен попасть в исходный child dispatch, не зацикливаться на новом runtime hook.
- Не отправлять CANCEL повторно на каждом MOVE.

## 2. Безопасный NEXT

Не вызывать Lpga.az() и не dispatch-ить -10011 напрямую: в Lpga.az есть TalkBack fallback на com.google.android.marvin.talkback, если switchToNextInputMethod не сработал и условие Ljcu.c() истинно.

Вместо этого:

- Получить IME token текущего InputMethodService.
- Получить InputMethodManager.
- Вызывать напрямую InputMethodManager.switchToNextInputMethod(token, true).
- true обязателен: он ограничивает переключение текущей IME.
- Никогда не вызывать switchToNextInputMethod(token, false), setInputMethod() для другой IME или -10197.
- Если token/manager недоступен — no-op, не делать fallback на внешний IME.

## 3. Безопасный PREVIOUS

Использовать внутренний порядок Gboard, а не угадывать порядок по locale:

- Получить менеджер Lpga через Lpga.F(Context).
- Получить текущий Lpev через Lpga.C().
- Получить динамический rotation list Lrek из поля Lpga.Y.
- Вызвать Lrek.j(current), чтобы получить текущий индекс.
- Взять предыдущий Lpev из того же списка, который Lrek.k использует для NEXT: поле Lrek.b, index - 1; при index == 0 перейти к последнему элементу.
- Получить InputMethodSubtype через previous.f().
- Разрешить только InputMethodInfo текущей Gboard IME; перед переключением обязательно проверить packageName текущего service и InputMethodInfo.
- Получить текущий IME token.
- Использовать проверяющий helper Gboard Lsex.k(InputMethodInfo, IBinder, InputMethodSubtype), либо эквивалентный setInputMethodAndSubtype с тем же Gboard info.getId().
- Не вызывать setInputMethod() и не менять IME ID.
- Если индекс не найден, список пуст, subtype не разрешён или reflection не удался — no-op с диагностическим логом.
- Не использовать Lrek.k как PREVIOUS: он всегда выбирает index + 1, boolean параметр не задаёт обратное направление.
- После смены subtype проверить, что onCurrentInputMethodSubtypeChanged обновляет внутреннее состояние Gboard.

Обязательно протестировать 2, 3 и 4 языка: предыдущий/следующий, переход через границу, повторный переход, возврат в исходную раскладку. Внешняя IME не должна активироваться ни при каких ошибках.

## 4. Удаление конфликтующего нативного поведения

Нативный FreeCursorKeyboard не использовать: его body layout — отдельный пустой экран с lock icon, без обычных клавиш.

Проверить и отключить только конфликтующие части:

- Убрать long-press SWITCH_KEYBOARD/free_cursor из res/IEX.xml и res/nB0.xml.
- Убрать fallback SHOW_SYSTEM_IME_PICKER для long-press space из res/IEX.xml, чтобы не появлялся language picker.
- Убрать ScrubMoveMotionEventHandler registration из res/bsB.xml.
- Убрать TriggerFreeCursorMotionEventHandler registration из res/bsB.xml, res/tER.xml и res/kgx.xml.
- Не добавлять FreeCursorKeyboard в обычную клавиатуру.
- Не использовать noScrubbing: общий ScrubMotionEventHandler проверяет его для обоих наследников — ScrubMove и ScrubDelete.

### Что обязательно сохранить

- Все отдельные регистрации ScrubDeleteMotionEventHandler (preference key 0x7f14096a).
- Не менять обработчик ScrubDelete и не трогать его preference.
- Сохранить InlineSuggestionScrubSpaceMotionEventHandler, пока тесты не докажут конкретный конфликт; новый spacebar gesture имеет приоритет только на самом пробеле.
- Сохранить SwipeDismiss, Globe Drag, Glide Typing, autocorrect, predictions, voice, emoji/GIF, clipboard, multitouch и обычный ввод.

## 5. Проверки и тесты

Добавить unit-тесты для state machine и language navigation, где это возможно без Android runtime.

Обязательный ручной checklist:
- tap: ровно один пробел;
- свайп L→R: NEXT;
- свайп R→L: PREVIOUS;
- 2/3/4 языка, wrap-around, повторные жесты;
- Gboard остаётся текущей IME; никакого TalkBack/другого IME;
- long-press без движения: нет пробела, picker и FreeCursor экрана;
- long-press + drag: курсор двигается, клавиатура не меняется;
- composing text корректно завершается;
- plain text, password, number, multiline, RTL и WebView;
- ACTION_CANCEL, быстрый tap, медленный swipe, второй pointer, смена поля, null InputConnection;
- ScrubDelete работает;
- Glide, autocorrect, suggestions, voice, clipboard, emoji/GIF, Globe и SwipeDismiss работают;
- проверить inline suggestion scrub и задокументировать приоритет.

## 6. Отчёт и commit

Создать docs/SPACEBAR_STAGE_5_IMPLEMENTATION_REPORT.md:
- список изменённых файлов;
- описание state machine;
- точный механизм NEXT/PREVIOUS;
- как гарантируется отсутствие внешней IME;
- как отправляются DPAD events;
- какие resource registrations удалены и какие сохранены;
- unit/manual tests и их результаты;
- оставшиеся риски.

Сделать commit в main. Не запускать сборку .mpp до проверки diff ChatGPT.
