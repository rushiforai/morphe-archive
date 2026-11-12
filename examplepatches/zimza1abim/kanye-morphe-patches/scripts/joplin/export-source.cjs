const fs = require('node:fs');
const path = require('node:path');
const { execFileSync, spawnSync } = require('node:child_process');
const repo = path.resolve(__dirname, '../..');
const source = path.join(repo, 'build/joplin-source-3.7.8');
const tracked = [
  'packages/app-mobile/index.js',
  'packages/app-mobile/components/ExtendedWebView/index.tsx',
  'packages/app-mobile/components/screens/ConfigScreen/ConfigScreen.tsx',
  'packages/lib/models/Setting.ts', 'packages/lib/models/settings/builtInMetadata.ts', 'packages/lib/theme.ts',
];
let diff = execFileSync('git', ['diff', '--', ...tracked], { cwd: source, encoding: 'utf8' });
for (const file of ['packages/app-mobile/utils/morpheFont.js', 'packages/lib/themes/blushPink.ts']) {
  const result = spawnSync('git', ['diff', '--no-index', '--', '/dev/null', file], { cwd: source, encoding: 'utf8' });
  if (result.status !== 1) throw Error(result.stderr || 'Expected new-file diff');
  diff += result.stdout;
}
fs.writeFileSync(path.join(__dirname, 'source-3.7.8.patch'), diff);
console.log('Exported exact, reviewable source changes: source-3.7.8.patch');
