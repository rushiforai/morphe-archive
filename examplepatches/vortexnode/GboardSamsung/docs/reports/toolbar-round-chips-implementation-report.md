# Отчёт: адаптивные круглые подложки значков верхнего тулбара

**Дата:** 2026-11-22  
**Репозиторий:** [vortexnode/GboardSamsung](https://github.com/vortexnode/GboardSamsung)  
**Базовый коммит:** `e73feb7` (`main`, релиз `v4.7.0`)

---

## 1. Подтверждённая структура Gboard 18.5.4 (по APK)

Анализ бинарных XML и `classes.dex` из `Gboard-v18.5.4.993608717-release-arm64-v8a.apk` подтвердил:
- Кнопки Access Points на верхней панели — это `AccessPointsBarItemSoftKeyView`, наследующий `SoftKeyView`, поэтому они проходят через существующий хук `SoftKeyView.s(SoftKeyDef, long)Z`.
- Внутри `AccessPointsBarItemSoftKeyView` (`res/0NQ.xml`) присутствует выделенный фоновый `View` с тегом `.access-point-bar-item-ripple-background.item-ripple`, расположенный **позади** иконки `NonLinearScaleImageView` (`.icon.for-access-point-icon.non-linear-scale`).
- Кнопка голосового ввода **Rambler** (`res/Gof.xml`) имеет тег `.background-icon.for-action-key.for-action-default-key` и не содержит `.access-point-bar-item-ripple-background`.
- Кнопка сетки/меню **`⊞`** (`res/3jz.xml`, `res/gPq.xml`) имеет теги `.access-point-entry-menu-icon.item-ripple` / `.access-point-menu-icon` и исключена на данном этапе для минимизации рисков.

---

## 2. Архитектура и адаптивность

- **Пассивная отрисовка под иконкой:** `RoundChipOverlayDrawable` вешается на `ViewOverlay` фонового `View` (`.access-point-bar-item-ripple-background`), поэтому круг рисуется **позади** оригинальной иконки Google без изменения `background`, ripple-эффекта, кликов и drag-and-drop.
- **Адаптивный диаметр (3–8 элементов и One-handed):** вычисляется динамически от фактического размера каждого слота (`clamp(min(w, h) - 4dp, 24dp, 36dp)`), скрывается при ширине `< 24dp` или вытянутых пропорциях (`width/height > 1.6`, отсекая чипы буфера обмена).
- **Адаптивный цвет:** берётся RGB-цвет активной иконки (`.icon.for-access-point-icon` через `getImageTintList()`, с фолбэком по `UI_MODE_NIGHT_MASK`) и применяется с мягкой прозрачностью (`alpha = 24` на светлой теме, `alpha = 34` на тёмной) — автоматически поддерживает светлую, тёмную, Custom Theme и динамические цвета системы (Material You).
- **Независимая настройка:** добавлен экран `GboardToolbarRoundChipsSettingsFeature` в группе «Клавиши, макет и символы» рядом с `Top Toolbar Item Count` (`pref_toolbar_round_chips_enabled`, по умолчанию `false`, без перезапуска).

---

## 3. Изменённые и добавленные файлы

1. `extensions/extension/src/main/java/dev/jason/gboardpatches/extension/toolbarroundchips/GboardToolbarRoundChipsSettings.java` (новый)
2. `extensions/extension/src/main/java/dev/jason/gboardpatches/extension/toolbarroundchips/GboardToolbarRoundChipsSettingsFeature.java` (новый)
3. `extensions/extension/src/main/java/dev/jason/gboardpatches/extension/toolbarroundchips/GboardToolbarRoundChipsRuntime.java` (новый)
4. `extensions/extension/src/main/java/dev/jason/gboardpatches/extension/keyboard/GboardKeyboardLayoutSettingsGroupFeature.java`
5. `extensions/extension/src/main/settings-text/gboard_settings_text.xml`
6. `extensions/extension/src/main/java/dev/jason/gboardpatches/extension/settings/search/GboardSettingsSearchIndexData.java`
7. `patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/shared/runtimeabi/RuntimeAbi.kt`
8. `patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/shared/GboardSoftKeyFamilyComposer.kt`
9. `patches/src/main/resources/gboard/gboard-port-product-catalog.json` и `.sha256`
10. `patches/src/test/kotlin/dev/jason/gboardpatches/patches/gboard/shared/GboardSoftKeyFamilySelectionStoreTest.kt`
11. `extensions/extension/src/test/java/dev/jason/gboardpatches/extension/toolbarroundchips/GboardToolbarRoundChipsSettingsTest.java` (новый)
12. `extensions/extension/src/test/java/dev/jason/gboardpatches/extension/toolbarroundchips/GboardToolbarRoundChipsRuntimeTest.java` (новый)

---

## 4. Сохранённые границы и статус проверок

- Не затрагивались: шевроны пробела, глобус, свайпы, курсор, Rambler, кнопка `⊞`, `Custom Theme`, `Frosted Glass`, `AccessPointCount`, `.releaserc`, CI/CD и релизы.
- Локальная сборка Gradle в песочнице не выполнялась (отсутствует `MORPHE_PACKAGES_TOKEN`); требуется прогон `./gradlew :patches:test :extensions:extension:testDebugUnitTest :extensions:calculator:testDebugUnitTest` в CI.
