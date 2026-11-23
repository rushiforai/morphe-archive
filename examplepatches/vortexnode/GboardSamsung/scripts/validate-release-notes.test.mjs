import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { resolve } from 'node:path';
import {
  validateReleaseNotesText,
  validatePatchesBundleObject,
} from './validate-release-notes.mjs';

const releasersPath = resolve(process.cwd(), '.releaserc');

test('.releaserc disables docs/chore releases and configures expected sections', () => {
  const config = JSON.parse(readFileSync(releasersPath, 'utf8'));
  const analyzer = config.plugins.find(
    (p) => Array.isArray(p) && p[0] === '@semantic-release/commit-analyzer',
  )?.[1];
  const notesGen = config.plugins.find(
    (p) => Array.isArray(p) && p[0] === '@semantic-release/release-notes-generator',
  )?.[1];

  assert.ok(analyzer, 'commit-analyzer plugin must exist');
  assert.ok(notesGen, 'release-notes-generator plugin must exist');

  const releaseTypes = new Map(
    analyzer.releaseRules.map((r) => [r.type ?? (r.breaking ? 'breaking' : ''), r.release]),
  );

  assert.equal(releaseTypes.has('docs'), false, 'docs must NOT trigger a release');
  assert.equal(releaseTypes.has('chore'), false, 'chore must NOT trigger a release');
  assert.equal(releaseTypes.get('feat'), 'minor');
  assert.equal(releaseTypes.get('fix'), 'patch');
  assert.equal(releaseTypes.get('perf'), 'patch');
  assert.equal(releaseTypes.get('remove'), 'patch');
  assert.equal(releaseTypes.get('bump'), 'patch');
  assert.equal(releaseTypes.get('build'), 'patch');
  assert.equal(analyzer.releaseRules.filter((r) => r.type === 'build').length, 1);
  assert.ok(analyzer.releaseRules.some((r) => r.type === 'build' && r.scope === 'morphe-source' && r.release === 'patch'));

  const sectionByType = new Map(
    notesGen.presetConfig.types.map((t) => [t.type, t]),
  );

  assert.equal(sectionByType.get('feat')?.section, '✨ New Features');
  assert.equal(sectionByType.get('fix')?.section, '🐛 Bug Fixes');
  assert.equal(sectionByType.get('perf')?.section, '🔧 Improvements');
  assert.equal(sectionByType.get('remove')?.section, '🗑 Removed');
  for (const type of ['build', 'docs', 'chore', 'ci', 'test', 'refactor', 'style']) {
    assert.equal(sectionByType.get(type)?.hidden, true, `${type} must be hidden from user-facing release notes`);
  }

  const execPlugin = config.plugins.find(
    (p) => Array.isArray(p) && p[0] === '@semantic-release/exec',
  )?.[1];
  assert.ok(execPlugin?.prepareCmd.includes('node scripts/validate-release-notes.mjs patches-bundle.json'));

  const gitPlugin = config.plugins.find(
    (p) => Array.isArray(p) && p[0] === '@semantic-release/git',
  )?.[1];
  assert.ok(gitPlugin?.message.includes('\n\n'), 'release commit message must contain real line breaks');
});

test('accepts valid Russian release notes with standard Morphe English sections', () => {
  const sample = `## [0.0.0](https://example.invalid/compare/v0.0.0...v0.0.0) (2026-11-22)

### ✨ New Features

* **example:** Тестовая запись для проверки формата раздела новых функций

### 🐛 Bug Fixes

* **example:** Тестовая запись для проверки формата раздела исправлений

### 🔧 Improvements

* **example:** Тестовая запись для проверки формата раздела улучшений

### 🗑 Removed

* **example:** Тестовая запись для проверки формата раздела удалений`;

  const errors = validatePatchesBundleObject({
    version: '0.0.0',
    created_at: '2026-11-22T12:00:00',
    download_url: 'https://example.invalid/releases/download/v0.0.0/patches-0.0.0.mpp',
    signature_download_url: '',
    description: sample,
  });

  assert.deepEqual(errors, []);
});

test('rejects empty description without bullets (v4.4.5 regression)', () => {
  const errors = validateReleaseNotesText(
    '## [4.4.5](https://github.com/vortexnode/GboardSamsung/compare/v4.4.4...v4.4.5) (2026-11-21)',
  );
  assert.ok(errors.some((e) => e.includes('no user-facing change bullets')));
});

test('rejects forbidden generic phrases and duplicate bullets', () => {
  const errors = validateReleaseNotesText(`### 🐛 Bug Fixes

* update source
* Исправлено отображение тестового элемента
* Исправлено отображение тестового элемента`);

  assert.ok(errors.some((e) => e.includes('Forbidden generic')));
  assert.ok(errors.some((e) => e.includes('Duplicate release note')));
});

test('rejects empty sections without bullets', () => {
  const errors = validateReleaseNotesText(`### ✨ New Features

### 🐛 Bug Fixes

* Исправлено отображение тестового элемента`);

  assert.ok(errors.some((e) => e.includes('Empty changelog section')));
});
