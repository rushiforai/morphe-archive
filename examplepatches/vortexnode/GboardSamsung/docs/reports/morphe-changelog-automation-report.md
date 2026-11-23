# Отчёт: автоматизация changelog и описаний обновлений Morphe

**Дата:** 2026-11-22  
**Репозиторий:** [vortexnode/GboardSamsung](https://github.com/vortexnode/GboardSamsung)  
**Базовый коммит:** `564e125296ba059f85c980c935d02a157df01680` (`main`, `v4.5.0`)

## 1. Исходная схема

Публикация Morphe сохранена в существующей цепочке:

1. `.github/workflows/ci.yml` запускает тесты, проверку `patches-list.json`, сборку MPP и загрузку артефакта.
2. `.github/workflows/publish-morphe-source.yml` запускается после успешного CI на `main`, проверяет, что CI относится к текущему HEAD, затем вызывает `npx semantic-release`.
3. `semantic-release` анализирует Conventional Commits, формирует release notes, обновляет `CHANGELOG.md` и `patches-bundle.json`, затем публикует GitHub Release и MPP.

На момент базового коммита правила `docs -> patch` уже отсутствовали, а `remove -> patch` присутствовало. Незавершённая реализация шевронов была отменена коммитом `09c3394`.

## 2. Как Morphe получает описание

`@MorpheApp/changelog` переносит `nextRelease.notes` в поле `description` файла `patches-bundle.json`. Morphe Manager загружает этот файл и разбирает Markdown через `ChangelogParser.kt`. В отчёте Gemini отмечено, что стандартные заголовки разделов Morphe распознаются отдельно, а неизвестный заголовок `Removed` отображается как нейтральный раздел `OTHER`.

## 3. Изменённые файлы

- `.releaserc` — сохранены правила версионирования и плагины; технические типы скрыты из пользовательских release notes; добавлена проверка `patches-bundle.json` в `prepareCmd`.
- `scripts/validate-release-notes.mjs` — проверяет обязательные поля bundle, заголовки разделов, наличие пунктов, заглушки и дубликаты.
- `scripts/validate-release-notes.test.mjs` — проверяет конфигурацию, интеграцию валидатора и граничные случаи.
- `.github/workflows/publish-morphe-source.yml` — перед `semantic-release` добавлен запуск `node --test scripts/validate-release-notes.test.mjs`.
- `docs/reports/morphe-changelog-automation-report.md` — этот отчёт.

## 4. Новая последовательность публикации

После успешного CI workflow проверяет актуальность исходного коммита, устанавливает release tooling и запускает тесты валидатора. Затем `semantic-release` генерирует метаданные. На этапе `prepareCmd` валидатор проверяет `patches-bundle.json`; ошибка останавливает публикацию до коммита release metadata, создания тега и GitHub Release.

## 5. Формат release notes

Заголовки разделов остаются на английском языке с привычными Morphe-эмодзи, а тексты пунктов могут быть русскими. Пример формата:

```markdown
### ✨ New Features

* **example:** Краткое описание добавленной функции (пример)

### 🐛 Bug Fixes

* **example:** Краткое описание исправленной ошибки (пример)

### 🔧 Improvements

* **example:** Краткое описание улучшения (пример)

### 🗑 Removed

* **example:** Краткое описание удалённой функции (пример)
```

## 6. Правила типов коммитов

| Тип | Раздел | Выпуск |
|---|---|---|
| `feat` | ✨ New Features | `minor` |
| `fix` | 🐛 Bug Fixes | `patch` |
| `perf` | 🔧 Improvements | `patch` |
| `remove` | 🗑 Removed | `patch` |
| `bump` | 🚀 Updated App Support | `patch` |
| `build(morphe-source)` | скрыт | `patch` |
| `docs`, `chore`, `ci`, `test`, `refactor`, `style` | скрыты | без релиза |
| `BREAKING CHANGE` / `!` | по содержанию | `major` |

`remove:` следует использовать для удаления пользовательских функций или настроек, а не документации и технических файлов.

## 7. Проверки и ограничения

- Локальные тесты `node --test scripts/validate-release-notes.test.mjs`: **5/5 успешно**.
- Валидатор принял текущий `patches-bundle.json` версии `v4.5.0` по структурным правилам.
- Workflow YAML и `.releaserc` JSON прошли синтаксическую проверку.
- Совместимость с интерфейсом Morphe Manager проверялась анализом его исходного кода; физический тест отображения на устройстве не выполнялся.

**Важное ограничение:** валидатор не сопоставляет смысл пунктов changelog с исходным кодом или историей коммитов. При аудите обнаружено, что опубликованное описание `v4.5.0` содержит пункт `add spacebar language chevrons toggle` (коммит `73deea6`), хотя реализация была отменена коммитом `09c3394` до публикации релиза. Исторический релиз, тег, `CHANGELOG.md` и `patches-bundle.json` не изменялись. Перед будущей публикацией нужна отдельная проверка фактической достоверности пунктов.

## 8. Что осталось нетронутым

Существующая схема CI → `publish-morphe-source.yml` → `semantic-release` сохранена. `ci.yml`, `release.yml`, package ID, namespace `dev.jason.gboardpatches`, каталоги `extensions/` и `patches/`, опубликованные релизы и PR #7/#8 не менялись. Новые параллельные release workflows не создавались.
