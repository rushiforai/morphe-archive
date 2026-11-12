const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const api = require('../extensions/extension/src/main/js/channel-speed.js');

const catalogPath = path.join(__dirname, '..', '..', 'video-speed-control-chrome', 'channels.json');
const catalog = fs.existsSync(catalogPath) ? JSON.parse(fs.readFileSync(catalogPath, 'utf8')) : null;

test('Standardkanäle entsprechen dem gemeinsamen Katalog', {
    skip: catalog ? false : 'Nachbar-Repo video-speed-control-chrome nicht vorhanden',
}, () => {
    assert.equal(api.defaultChannels.length, catalog.length);
    for (const entry of catalog) {
        const rule = api.defaultChannels.find(item => item.id === entry.id);
        assert.ok(rule, `Kanal ${entry.id} fehlt in DEFAULT_CHANNELS`);
        assert.equal(rule.speed, entry.speed, `Tempo für ${entry.handle}`);
        assert.equal(String(rule.handle).toLowerCase(), entry.handle.toLowerCase(), `Handle für ${entry.handle}`);
        assert.equal(rule.name, entry.name, `Name für ${entry.handle}`);
    }
});

test('Standardkanäle sind eindeutig und gültig', () => {
    const ids = api.defaultChannels.map(rule => rule.id);
    assert.equal(new Set(ids).size, ids.length);
    for (const rule of api.defaultChannels) {
        assert.match(rule.id, /^UC[\w-]{22}$/);
        assert.match(rule.handle, /^@[\w.-]+$/);
        assert.ok(rule.name.length > 0);
        assert.ok(rule.speed >= 0.05 && rule.speed <= 10);
    }
});
