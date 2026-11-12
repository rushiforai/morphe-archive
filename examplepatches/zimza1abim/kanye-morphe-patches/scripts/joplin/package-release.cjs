const fs = require('node:fs');
const path = require('node:path');
const os = require('node:os');
const crypto = require('node:crypto');
const { execFileSync } = require('node:child_process');
const repo = path.resolve(__dirname, '../..');
const out = path.join(repo, 'releases/joplin-v9');
fs.mkdirSync(out, { recursive: true });
const sourceMpp = path.join(repo, 'patches/build/libs/patches-1.1.3-joplin9.mpp');
const dex = execFileSync('unzip', ['-p', sourceMpp, 'classes.dex'], { maxBuffer: 8 * 1024 * 1024 });
if (!dex.subarray(0, 4).equals(Buffer.from('dex\n'))) throw Error('Missing Android patch DEX. Run buildAndroid last.');
const mpp = path.join(out, 'joplin-custom-font-v9-3.7.8.mpp');
fs.copyFileSync(sourceMpp, mpp);
const stage = fs.mkdtempSync(path.join(os.tmpdir(), 'joplin-font-source-'));
for (const relative of [
  'extensions/extension/src/main/java/app/fontism/extension/joplin',
  'patches/src/main/kotlin/app/template/patches/joplin',
  'patches/src/main/resources/joplin',
  'scripts/joplin',
]) fs.cpSync(path.join(repo, relative), path.join(stage, relative), { recursive: true });
fs.copyFileSync(path.join(repo, 'build/joplin-source-3.7.8/LICENSE'), path.join(stage, 'UPSTREAM-JOPLIN-LICENSE'));
fs.copyFileSync(path.join(out, '수정내용과-검증.md'), path.join(stage, '수정내용과-검증.md'));
const zip = path.join(out, 'joplin-custom-font-v9-source.zip');
execFileSync('zip', ['-q', '-r', zip, '.'], { cwd: stage });
execFileSync('unzip', ['-tq', zip]);
const hashes = [mpp, zip].map(file => crypto.createHash('sha256').update(fs.readFileSync(file)).digest('hex') + '  ' + path.basename(file));
fs.writeFileSync(path.join(out, 'SHA256SUMS.txt'), hashes.join('\n') + '\n');
console.log(hashes.join('\n'));
console.log('Source staging retained at ' + stage);
