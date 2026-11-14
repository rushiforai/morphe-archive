const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

const root = path.join(__dirname, '..');
const staticPayload = path.join(root,
    'extensions/extension/src/main/java/app/ysamjo/extension/youtubetv/ChannelSpeedPayload.java');
const buildScript = path.join(root, 'extensions/extension/build.gradle.kts');

test('ChannelSpeedPayload wird nur zur Build-Zeit erzeugt', () => {
    assert.equal(fs.existsSync(staticPayload), false,
        'Statische Kopie wurde wieder eingecheckt; die Klasse entsteht in GenerateChannelSpeedPayload.');
});

test('Build bindet die generierte Payload-Quelle ein', () => {
    const build = fs.readFileSync(buildScript, 'utf8');
    assert.match(build, /GenerateChannelSpeedPayload/);
    assert.match(build, /addGeneratedSourceDirectory/);
    assert.match(build, /src\/main\/js\/channel-speed\.js/);
});
