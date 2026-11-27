const fs = require('node:fs');
const path = require('node:path');
const crypto = require('node:crypto');
const repo = path.resolve(__dirname, '../..');
const resources = path.join(repo, 'patches/src/main/resources/joplin');
const props = Object.fromEntries(fs.readFileSync(path.join(resources, 'target.properties'), 'utf8').trim().split(/\r?\n/).map(line => { const i=line.indexOf('=');return [line.slice(0,i),line.slice(i+1)]; }));
if (!/^\d+\.\d+\.\d+$/.test(props.version) || !/^[a-f0-9]{64}$/.test(props.originalSha256)) throw Error('Invalid target metadata');
const adapters = path.join(resources, 'adapters');
fs.mkdirSync(adapters, { recursive: true });
// The adapter is stored as a delta against the APK's own bundle.
const apk = process.argv[2];
if (!apk) throw Error('Supply the original APK');
const original = require('node:child_process').execFileSync('unzip', ['-p', path.resolve(apk), 'assets/index.android.bundle'], { maxBuffer: 256 * 1024 * 1024 });
if (crypto.createHash('sha256').update(original).digest('hex') !== props.originalSha256) throw Error('APK bundle does not match target.properties');
const bytes = fs.readFileSync(path.join(resources, 'index.android.bundle'));
const patchedSha256 = crypto.createHash('sha256').update(bytes).digest('hex');
const target = path.join(adapters, props.version);
const deltaSha256 = require('../delta/adapter.cjs').writeDelta(original, bytes, target);
fs.writeFileSync(target + '.properties', Object.entries({ ...props, patchedSha256, deltaSha256 }).map(([k,v]) => k+'='+v).join('\n')+'\n');
const versions = fs.readdirSync(adapters).filter(x=>/^\d+\.\d+\.\d+\.properties$/.test(x)).map(x=>x.slice(0,-11)).sort((a,b)=>a.localeCompare(b,undefined,{numeric:true}));
fs.writeFileSync(path.join(adapters, 'index.properties'), 'versions='+versions.join(',')+'\n');
// Support scope: the three newest versions; older adapters are deleted with their index entries.
require('node:child_process').execFileSync('python3', ['-I', path.join(repo, 'scripts/compat/prune_versions.py'), 'joplin'], { stdio: 'inherit' });
console.log('Registered UI ' + fs.readFileSync(path.join(adapters, 'index.properties'), 'utf8').trim());
