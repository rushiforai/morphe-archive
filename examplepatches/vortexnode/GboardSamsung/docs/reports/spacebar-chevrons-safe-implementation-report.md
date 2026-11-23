# Отчёт: безопасная реализация визуальных шевронов пробела

Дата: 2026-11-22  
Базовый коммит: ce6f182 (main, v4.5.1)

## Реализация
- Добавлена независимая настройка pref_spacebar_language_chevrons_enabled, по умолчанию false, с Direct Boot-safe чтением и отдельным кэшем.
- В экран «Переключение языка» добавлен отдельный переключатель рядом с переключением свайпом по пробелу.
- Добавлены английский и русский заголовок/описание; запись настройки включена в поисковый индекс.
- Новый GboardSpacebarChevronRuntime использует только существующий TextView клавиши, определённой через GboardSpacebarKeyHitTester.isSpaceSoftKeyView.
- Шевроны рисуются как левые/правые CompoundDrawables; цвет берётся из текущего цвета текста.
- Шевроны скрываются при недостатке места, пустой подписи, отключении настройки, смене типа клавиши или конфликте со штатными боковыми drawable. Текст не уменьшается ради декорации.
- Проверка ширины учитывает измеренную ширину клавиши и TextView, горизонтальные padding, ширину текста, compound drawable padding и отступы. Неизвестные размеры обрабатываются fail-closed.

## Точка подключения
- Добавлен отдельный RuntimeCallId для GboardSpacebarChevronRuntime.afterSoftKeyBind(View).
- Оба независимых вызова подключены через GboardSoftKeyFamilyComposer.kt в after_stock для SAMSUNG_SPACEBAR_GESTURES: сначала существующий globe runtime, затем шевроны.
- Учёт размера after-chain обновлён для двух вызовов; добавлен тест порядка и наличия обоих вызовов.
- Контрактный каталог Gboard обновлён: after_stock inventory содержит отдельный runtime-вызов, RuntimeAbi.kt добавлен в consumer_files, SHA-256 digest пересчитан.
- GboardSpacebarGlobeKeyRuntime.java не изменялся.

## Границы
Не изменялись обработчики жестов, IMMS, MotionEvent, навигация языка, DPAD, globe runtime, меню ⊞, Rambler, Access Point Count, Custom Theme, Frosted Glass, package ID, namespace, .releaserc и workflows.

## Проверки
Добавлены Robolectric-тесты настроек и runtime: default-off, независимость переключателей, цвет текста, пустая подпись, узкая клавиша, recycling, восстановление штатных drawable и учёт padding. Добавлен тест независимых after_stock вызовов.
XML проверен на корректный синтаксис; RU/EN строки и поисковая запись проверены статически. Полноценная Gradle-сборка и GitHub Actions не заявляются до фактического запуска после коммита.
