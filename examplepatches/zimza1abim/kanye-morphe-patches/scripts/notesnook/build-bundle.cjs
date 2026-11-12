// Builds the Notesnook Hermes bundle with the Appearance → Font entry and
// registers it as a release adapter. Does not build the Android app.
// Usage: node scripts/notesnook/build-bundle.cjs <version> <source checkout> <original apk>
// The checkout must be the official `<version>-android` tag, bootstrapped like CI:
//   npm ci --ignore-scripts && npm run bootstrap -- --scope=mobile && npm run tx mobile:build
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const crypto = require('node:crypto');
const { execFileSync } = require('node:child_process');

const [version, sourceArg, apkArg] = process.argv.slice(2);
if (!/^\d+\.\d+\.\d+$/.test(version || '') || !sourceArg || !apkArg) throw Error('Supply version, source checkout and original APK');
const repo = path.resolve(__dirname, '../..');
const source = path.resolve(sourceArg), apk = path.resolve(apkArg);
const mobile = path.join(source, 'apps/mobile');
const sha256 = bytes => crypto.createHash('sha256').update(bytes).digest('hex');
const git = args => execFileSync('git', args, { cwd: source, encoding: 'utf8' }).trim();

const commit = git(['rev-parse', 'HEAD']);
let tagCommit;
try { tagCommit = git(['rev-parse', `refs/tags/${version}-android^{commit}`]); }
catch { tagCommit = git(['ls-remote', 'origin', `refs/tags/${version}-android`]).split(/\s/)[0]; }
if (commit !== tagCommit) throw Error(`Source must be the official ${version}-android tag`);

const original = execFileSync('unzip', ['-p', apk, 'assets/index.android.bundle'], { maxBuffer: 256 * 1024 * 1024 });
const originalSha256 = sha256(original);

require('./appearance-font.cjs')(source)();

const temp = fs.mkdtempSync(path.join(os.tmpdir(), 'notesnook-font-bundle-'));
const js = path.join(temp, 'index.android.bundle');
fs.rmSync(path.join(mobile, 'build/generated'), { recursive: true, force: true });
execFileSync('npx', ['react-native', 'webpack-bundle', '--platform', 'android', '--dev', 'false',
  '--entry-file', 'index.js', '--bundle-output', js, '--assets-dest', path.join(temp, 'assets'),
  '--sourcemap-output', js + '.map', '--minify', 'false'],
  { cwd: mobile, stdio: 'inherit', env: { ...process.env, NODE_ENV: 'production' } });
if (!fs.existsSync(js)) throw Error('Bundler produced no output (check bootstrapped packages)');

const host = process.platform === 'darwin' ? 'osx-bin' : 'linux64-bin';
const hermesc = path.join(mobile, 'node_modules/react-native/sdks/hermesc', host, 'hermesc');
const hbc = path.join(temp, 'index.android.hbc');
// Same flags as the React Native Gradle plugin uses for release builds.
execFileSync(hermesc, ['-w', '-emit-binary', '-max-diagnostic-width=80', '-out', hbc, js, '-O', '-output-source-map'], { stdio: 'inherit' });
const patched = fs.readFileSync(hbc);
if (patched.readUInt32LE(8) !== original.readUInt32LE(8)) throw Error('Hermes bytecode version differs from the APK');
if (!patched.includes(Buffer.from('notesnook-font://settings'))) throw Error('Font menu missing from built bundle');

const adapters = path.join(repo, 'patches/src/main/resources/notesnook/adapters');
fs.mkdirSync(adapters, { recursive: true });
fs.writeFileSync(path.join(adapters, version + '.bundle'), patched);
fs.writeFileSync(path.join(adapters, version + '.properties'), [
  'version=' + version, 'commit=' + commit, 'originalSha256=' + originalSha256, 'patchedSha256=' + sha256(patched), '',
].join('\n'));
const versions = fs.readdirSync(adapters).filter(n => /^\d+\.\d+\.\d+\.properties$/.test(n)).map(n => n.slice(0, -11))
  .sort((a, b) => a.localeCompare(b, undefined, { numeric: true }));
fs.writeFileSync(path.join(adapters, 'index.properties'), 'versions=' + versions.join(',') + '\n');
console.log('Registered Notesnook UI adapters: ' + versions.join(', ') + '. Temporary artifacts: ' + temp);
