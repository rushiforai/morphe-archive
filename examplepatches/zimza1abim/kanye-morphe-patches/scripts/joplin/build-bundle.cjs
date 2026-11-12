// Builds JavaScript/Hermes only. Does not build the Joplin Android application.
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const { execFileSync, spawnSync } = require('node:child_process');
const repo = path.resolve(__dirname, '../..');
const source = path.resolve(process.argv[2] || path.join(repo, 'build/joplin-source-3.7.8'));
const candidate = process.argv[3] ? JSON.parse(fs.readFileSync(process.argv[3], 'utf8')) : {
  version: '3.7.8', commit: '949d10476f1b88b3fe7277b7f1c8eaf5c574984b',
  originalSha256: 'fe2a5a92c3b2870c22d3023e42b8c53b31da3ebf20921b3f7a8a91dd11b0461c',
};
if (!/^\d+\.\d+\.\d+$/.test(candidate.version) || !/^[a-f0-9]{40}$/.test(candidate.commit)
    || !/^[a-f0-9]{64}$/.test(candidate.originalSha256)) throw Error('Invalid release target');
const commit = candidate.commit;
const run = (command, args, cwd = source) => execFileSync(command, args, { cwd, stdio: 'inherit' });
const head = execFileSync('git', ['rev-parse', 'HEAD'], { cwd: source, encoding: 'utf8' }).trim();
if (head !== commit) throw Error('Requires official Joplin android-v3.7.8 source commit ' + commit);
const patch = path.join(__dirname, 'source-3.7.8.patch');
const applyAppearance = require('./appearance-transform.cjs')(source);
const exclude = '--exclude=packages/app-mobile/components/screens/ConfigScreen/ConfigScreen.tsx';
if (spawnSync('git', ['apply', exclude, '--reverse', '--check', patch], { cwd: source }).status !== 0) {
  run('git', ['apply', exclude, '--check', patch]);
  run('git', ['apply', exclude, patch]);
}
applyAppearance();
require('./pink-themes.cjs')(source)();
// Exact guarded dependency edits; reinstalling dependencies is safe to repeat.
const rnEntry = path.join(source, 'packages/app-mobile/node_modules/react-native/index.js');
let entry = fs.readFileSync(rnEntry, 'utf8');
for (const file of ['./Libraries/Text/Text', './Libraries/Components/TextInput/TextInput']) {
  const before = `return require('${file}').default;`;
  const after = `return require('../../utils/morpheFont').wrapText(require('${file}').default);`;
  if (entry.includes(after)) continue;
  if (entry.split(before).length !== 2) throw Error('Unsupported React Native getter: ' + file);
  entry = entry.replace(before, after);
}
fs.writeFileSync(rnEntry, entry);
run('corepack', ['yarn', 'workspace', '@joplin/app-mobile', 'tsc']);
const temp = fs.mkdtempSync(path.join(os.tmpdir(), 'joplin-font-bundle-'));
const js = path.join(temp, 'index.js');
run('corepack', ['yarn', 'workspace', '@joplin/app-mobile', 'react-native', 'bundle',
  '--platform', 'android', '--dev', 'false', '--entry-file', 'packages/app-mobile/index.js',
  '--bundle-output', js, '--assets-dest', path.join(temp, 'assets'), '--max-workers', '4']);
const host = process.platform === 'darwin' ? 'osx-bin' : 'linux64-bin';
const hermesc = path.join(source, 'packages/app-mobile/node_modules/react-native/sdks/hermesc', host, 'hermesc');
run(hermesc, ['-O', '-w', '-emit-binary', '-out', path.join(repo, 'patches/src/main/resources/joplin/index.android.bundle'), js]);
fs.writeFileSync(path.join(repo, 'patches/src/main/resources/joplin/target.properties'),
  'version=' + candidate.version + '\ncommit=' + candidate.commit + '\noriginalSha256=' + candidate.originalSha256 + '\n');
console.log('Built pinned Joplin ' + candidate.version + ' Hermes bundle. Temporary artifacts: ' + temp);
