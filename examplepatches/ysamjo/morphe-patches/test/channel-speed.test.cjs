const { test } = require('node:test');
const assert = require('node:assert/strict');
const api = require('../extensions/extension/src/main/js/channel-speed.js');
const SPORT = 'UCE0RhriywrL8XhXbo87tMKQ';
const NFL = 'UCDVYQ4Zhbm3S2dlz7P1GBDg';
const RTL = 'UC8WYi3XQXsf-6FNvqoEvxag';
const NORMAL = 'UC1234567890123456789012';
function target() {
    const listeners = {};
    return { addEventListener(type, fn) { (listeners[type] ||= new Set()).add(fn); },
        emit(type, event = {}) { event.type = type; event.target ||= this; event.currentTarget = this; for (const fn of listeners[type] || []) fn(event); }, listeners };
}
function fixture({ channel = SPORT, speed = 2.5, saved, kids = false, readyState = 'complete' } = {}) {
    let now = 0, seq = 0, videoId = 'first', channelId = channel, author = 'sportstudio', playerResponse = {}, failWrites = false;
    const tasks = new Map(), intervals = [], commands = [], writes = [];
    function timeout(fn, delay = 0) { tasks.set(++seq, { fn, at: now + delay }); return seq; }
    function flush(ms = 0) {
        const end = now + ms; let count = 0;
        while (true) {
            const next = [...tasks].filter(([, t]) => t.at <= end).sort((a, b) => a[1].at - b[1].at)[0];
            if (!next) break;
            assert.ok(++count < 300, 'Keine unbeschränkte Timer-/Ratechange-Schleife');
            tasks.delete(next[0]); now = next[1].at; next[1].fn();
        }
        now = end;
    }
    const values = new Map([['ytaf-configuration', JSON.stringify({ videoSpeed: speed, unrelated: 'erhalten' })]]);
    if (saved !== undefined) values.set(api.key, JSON.stringify(saved));
    const storage = { getItem: k => values.get(k) ?? null, setItem(k, value) { if (failWrites) throw new Error('voll'); writes.push(k); values.set(k, value); } };
    const video = Object.assign(target(), { tagName: 'VIDEO', currentSrc: 'blob:first' });
    let rate = 1, defaultRate = 1;
    for (const prop of ['playbackRate', 'defaultPlaybackRate']) Object.defineProperty(video, prop, {
        get() { return prop === 'playbackRate' ? rate : defaultRate; },
        set(value) { if (this[prop] === value) return; if (prop === 'playbackRate') rate = value; else defaultRate = value; timeout(() => video.emit('ratechange'), 0); }
    });
    const player = { getVideoData: () => ({ video_id: videoId, channel_id: channelId, author }), getPlayerResponse: () => playerResponse };
    const doc = Object.assign(target(), { readyState, body: { textContent: '' }, querySelector: s => s === 'video' ? video : s === '.html5-video-player' ? player : null });
    const router = { resolveCommand(command) {
        commands.push(command);
        if (command.commandExecutorCommand) for (const child of command.commandExecutorCommand.commands) {
            if (child.customAction) {
                if (child.customAction.action === 'SET_PLAYER_SPEED') video.playbackRate = Number(child.customAction.parameters);
            } else router.resolveCommand(child);
        }
        if (command.customAction?.action === 'SET_PLAYER_SPEED') video.playbackRate = Number(command.customAction.parameters);
        if (command.setClientSettingEndpoint) for (const setting of command.setClientSettingEndpoint.settingDatas) {
            const cfg = JSON.parse(storage.getItem('ytaf-configuration')); cfg[setting.clientSettingEnum.item] = Number(setting.intValue); storage.setItem('ytaf-configuration', JSON.stringify(cfg));
        }
    } };
    const root = Object.assign(target(), { document: doc, localStorage: storage, JSON: { parse: JSON.parse, stringify: JSON.stringify }, Date: { now: () => now },
        location: { hostname: kids ? 'www.youtubekids.com' : 'www.youtube.com', pathname: '/tv', hash: '#/watch?v=first' },
        console: { log() {} }, setTimeout: timeout, setInterval: fn => intervals.push(fn), _yttv: { nativeRouter: { instance: router } } });
    const control = api.install(root); flush();
    return { root, doc, video, player, router, control, storage, commands, writes, flush, intervals,
        nativeSpeed(value) { router.resolveCommand({ commandExecutorCommand: { commands: [
            { setClientSettingEndpoint: { settingDatas: [{ clientSettingEnum: { item: 'videoSpeed' }, intValue: String(value) }] } },
            { customAction: { action: 'SET_PLAYER_SPEED', parameters: String(value) } }
        ] } }); flush(); },
        next(id = 'second', channelValue = channel) { videoId = id; channelId = channelValue; root.location.hash = '#/watch?v=' + id; doc.emit('loadeddata', { target: video }); flush(); },
        media(type) { doc.emit(type, { target: video }); flush(); },
        key(key, extra = {}) { const event = { key, target: { tagName: 'DIV' }, preventDefault() { this.prevented = true; }, stopImmediatePropagation() {}, ...extra }; doc.emit('keydown', event); flush(); return event; },
        action(action, parameters) { router.resolveCommand({ customAction: { action, parameters } }); flush(); },
        response(value) { playerResponse = value; },
        noVideoId() { videoId = ''; channelId = ''; },
        identify(id, chan) { videoId = id; channelId = chan; },
        failStorage() { failWrites = true; }
    };
}
function items(command) { return command.openPopupAction.popup.overlaySectionRenderer.overlay.overlayTwoPanelRenderer.actionPanel.overlayPanelRenderer.content.overlayPanelItemListRenderer.items; }
function settingsMenu(id = 'tt-settings') { return api.modal('Einstellungen', '', [api.button('Vorhanden', '', 'UNCHANGED')], id); }

test('Alle 22 Sport-Kanäle starten mit 1,0×', () => {
    for (const channel of [SPORT, 'UCRFsyeKu07-LnHDG44O6uCA', 'UCAvNr5DMVncoJnJAotXOjOQ', 'UCuOwl-VgqBHOzR8hWnonBcA', 'UC5dCegXiWjE57wKrhWnCo0g', 'UCdi3n18zcIZeTk_x9qvSgZw', 'UC-XArLCeEw91r9gmaDi-Ajw', 'UClBFnQJMlinWDCvfSXj60CA', RTL, 'UCK2izXoHvraUFaPMU5B7vMQ', 'UCk452F_ypT9Q8b1S38-Ok8A', 'UCPj_Vtw0hKnhJapQuATBUrA', 'UCiMAc_TN1kSO3ErMtxUXfMA', 'UCQEHrmmI8kKJ6kAiQdQUjgg', 'UChr7ZXDFiPOEl543HM4Aj8g', NFL, 'UCWJ2lWNubArHWmf3FIHbfcQ', 'UC8pYaQzbBBXg9GIOHRvTmDQ', 'UCB_qr75-ydFVKSF9Dmo6izg', 'UC6UL29enLNe4mqwTfAyeNuw', 'UCfMo0xj-sbdzHuzxvKdu1hw', 'UCyGa1YEx9ST66rYrJTGIKOw']) assert.equal(fixture({ channel }).video.playbackRate, 1);
});
test('D/S/R überschreiben sportstudio temporär, neue Video-ID setzt zurück', () => {
    const env = fixture(); env.key('d'); assert.equal(env.video.playbackRate, 1.1); env.key('s'); assert.equal(env.video.playbackRate, 1);
    env.key('d'); env.key('r'); assert.equal(env.video.playbackRate, 1); env.key('r'); assert.equal(env.video.playbackRate, 1.1);
    env.next(); assert.equal(env.video.playbackRate, 1); assert.equal(env.control.getSettings().globalSpeed, 2.5);
});
test('Native Speed-Befehle funktionieren sofort, auch 1,0×', () => {
    const env = fixture(); env.nativeSpeed(1.5); assert.equal(env.video.playbackRate, 1.5);
    env.nativeSpeed(1); assert.equal(env.video.playbackRate, 1);
    env.nativeSpeed(1.75); env.next(); assert.equal(env.video.playbackRate, 1);
    assert.equal(env.control.getSettings().globalSpeed, 2.5);
});
test('Nicht konfigurierte Kanäle verwenden unverändert das bisherige TV-Standardtempo', () => {
    const env = fixture({ channel: 'UC1234567890123456789012' }); assert.equal(env.video.playbackRate, 2.5);
    env.nativeSpeed(1.25); env.next('second', 'UC1234567890123456789012'); assert.equal(env.video.playbackRate, 1.25);
});
test('Pause, Spulen und späte automatische Resets behalten manuelles Tempo', () => {
    const env = fixture(); env.nativeSpeed(1.5);
    for (const event of ['play', 'playing', 'canplay', 'seeking', 'seeked']) { env.media(event); env.video.playbackRate = 1; env.flush(1200); assert.equal(env.video.playbackRate, 1.5, event); }
    env.flush(8000); env.video.playbackRate = 1; env.flush(); assert.equal(env.video.playbackRate, 1.5);
});
test('Veraltete verzögerte Callbacks können nächstes Video nicht überschreiben', () => {
    const env = fixture(); env.nativeSpeed(1.75); env.media('loadeddata'); env.next('second', NFL); env.flush(1200); assert.equal(env.video.playbackRate, 1);
});
test('Gespeicherte individuelle Regeln und Dritt-Konfiguration bleiben erhalten', () => {
    const saved = { version: 2, globalSpeed: 1.8, kidsNormalSpeed: false, channels: [{ id: NFL, name: 'Eigene NFL-Regel', speed: 1.6 }] };
    const env = fixture({ channel: NFL, saved }); assert.equal(env.video.playbackRate, 1.6); env.nativeSpeed(2);
    assert.deepEqual(env.control.getSettings().channels, [{ id: NFL, name: 'Eigene NFL-Regel', handle: '', speed: 1.6 }]);
    assert.equal(JSON.parse(env.storage.getItem('ytaf-configuration')).unrelated, 'erhalten');
});
test('YouTube Kids pro neuem Video 1,0× und manuell überschreibbar', () => {
    const saved = { version: 2, globalSpeed: 1.8, kidsNormalSpeed: true, channels: [{ id: NFL, name: 'NFL', speed: 1.1 }] };
    const env = fixture({ kids: true, channel: NFL, saved }); assert.equal(env.video.playbackRate, 1); env.key('d'); assert.equal(env.video.playbackRate, 1.1);
    env.next(); assert.equal(env.video.playbackRate, 1); env.action('YSAMJO_SPEED_KIDS'); assert.equal(env.video.playbackRate, 1.1);
});
test('Kinderfreundliche normale Videos werden nicht mit Kids-Modus verwechselt', () => {
    const env = fixture({ channel: 'UC1234567890123456789012' }); env.response({ videoDetails: { videoId: 'first', channelId: 'UC1234567890123456789012', isMadeForKids: true } });
    env.control.sync(env.video); assert.equal(env.video.playbackRate, 2.5);
});
test('Aktuelle Player-Antwort gewinnt, vorab geladene nächste Antwort nicht', () => {
    const env = fixture({ channel: 'UC1234567890123456789012' }); env.response({ videoDetails: { videoId: 'first', channelId: SPORT, author: 'sportstudio' } });
    env.control.sync(env.video); assert.equal(env.video.playbackRate, 1);
    env.response({ videoDetails: { videoId: 'next', channelId: NFL } }); env.control.sync(env.video); assert.equal(env.video.playbackRate, 2.5);
});
test('JSON-Metadaten werden nur auf die tatsächlich laufende Video-ID angewendet', () => {
    const env = fixture({ channel: '' }); env.control.captureMetadata({ videoDetails: { videoId: 'next', channelId: NFL } }); env.flush(); assert.equal(env.video.playbackRate, 2.5);
    env.root.JSON.parse(JSON.stringify({ videoDetails: { videoId: 'first', channelId: SPORT } })); env.flush(); assert.equal(env.video.playbackRate, 1);
});
test('Spät erkannte Identität desselben Videos behält manuelle Auswahl', () => {
    const env = fixture({ channel: '' }); env.noVideoId(); env.control.sync(env.video); env.nativeSpeed(1.5);
    env.identify('known', SPORT); env.control.sync(env.video); env.flush(); assert.equal(env.video.playbackRate, 1.5);
});
test('Kanalmenü wird einmalig an native Einstellungen und Speed-Menü angefügt', () => {
    const env = fixture(); for (const id of ['tt-settings', 'tt-speed', 'playback-settings']) {
        const cmd = settingsMenu(id); env.router.resolveCommand(cmd); env.router.resolveCommand(cmd);
        assert.equal(items(cmd).length, 2); assert.equal(items(cmd)[0].compactLinkRenderer.title.simpleText, 'Vorhanden');
        assert.equal(items(cmd)[1].compactLinkRenderer.title.simpleText, 'Kanalgeschwindigkeiten');
    }
});
test('Fernbedienbare Kanalverwaltung speichert, bearbeitet und entfernt aktuelle Kanäle', () => {
    const env = fixture({ channel: 'UC1234567890123456789012' }); env.action('YSAMJO_SPEED_MENU');
    const menu = env.commands.at(-1); assert.equal(menu.openPopupAction.popupType, 'MODAL'); assert.equal(items(menu)[0].compactLinkRenderer.title.simpleText.startsWith('Aktueller Kanal:'), true);
    const info = { channelId: 'UC1234567890123456789012', name: 'Neuer Kanal', handle: '@neu' };
    env.action('YSAMJO_SPEED_SAVE', { info, speed: 1.3 }); assert.equal(env.video.playbackRate, 1.3);
    assert.equal(env.control.getSettings().channels.find(r => r.id === info.channelId).speed, 1.3);
    env.action('YSAMJO_SPEED_REMOVE', info); assert.equal(env.video.playbackRate, 2.5);
});
test('Andere Kanalregeln löschen manuelle Auswahl nicht', () => {
    const env = fixture(); env.nativeSpeed(1.5); env.action('YSAMJO_SPEED_SAVE', { info: { channelId: NFL, name: 'NFL' }, speed: 1.6 }); assert.equal(env.video.playbackRate, 1.5);
});
test('Persistente Standardänderung gilt sofort und beim nächsten Video', () => {
    const env = fixture({ channel: '' }); env.action('YSAMJO_SPEED_SAVE', { global: true, speed: 1.8 }); assert.equal(env.video.playbackRate, 1.8);
    env.key('d'); env.next(); assert.equal(env.video.playbackRate, 1.8);
});
test('Speicherfehler und ungültige Tempowerte verändern Vorgaben nicht', () => {
    const env = fixture(); const before = env.control.getSettings(); env.failStorage();
    env.action('YSAMJO_SPEED_SAVE', { global: true, speed: 4 }); assert.deepEqual(env.control.getSettings(), before);
    env.control.manual(0); env.control.manual(Infinity); env.control.manual(8); assert.equal(env.video.playbackRate, 1);
});
test('Eingaben und Fernbedienungs-Navigation werden nicht abgefangen', () => {
    const env = fixture(); for (const [key, extra] of [['d', { target: { tagName: 'INPUT' } }], ['d', { ctrlKey: true }], ['ArrowDown', {}], ['Escape', {}]]) assert.equal(env.key(key, extra).prevented, undefined);
    env.root.location.hash = '#/search?';
    for (const key of ['d', 's', 'r']) assert.equal(env.key(key).prevented, undefined);
    assert.equal(env.video.playbackRate, 1);
});
test('Später neu gesetzter nativer Router wird wieder eingebunden', () => {
    const env = fixture(); const seen = []; env.router.resolveCommand = cmd => seen.push(cmd);
    env.intervals[0](); env.action('YSAMJO_SPEED_MENU'); assert.ok(seen.some(c => c.openPopupAction?.uniqueId === 'ysamjo-channel-speeds'));
});
test('Initialisierung wartet auf die Seite und braucht keine Chrome-APIs', () => {
    const env = fixture({ readyState: 'loading' }); assert.equal(env.video.playbackRate, 1); env.doc.readyState = 'complete'; env.doc.emit('DOMContentLoaded'); env.flush();
    assert.ok(env.doc.listeners.loadedmetadata); assert.equal(env.root.chrome, undefined);
});

test('Fernbedienung öffnet das Kanalmenü über den nativen Command Executor', () => {
    const env = fixture(), menu = settingsMenu('tt-speed');
    env.router.resolveCommand(menu);
    const channelEntry = items(menu).at(-1).compactLinkRenderer;
    env.router.resolveCommand(channelEntry.serviceEndpoint);
    const list = env.commands.at(-1);
    assert.equal(list.openPopupAction.uniqueId, 'ysamjo-channel-speeds');
    env.router.resolveCommand(items(list)[0].compactLinkRenderer.serviceEndpoint);
    assert.equal(env.commands.at(-1).openPopupAction.uniqueId, 'ysamjo-speed-editor');
});

test('Ein automatischer Reset bei offenem Tempomenü überschreibt keine Auswahl', () => {
    const saved = { version: 2, globalSpeed: 1, kidsNormalSpeed: true, channels: [{ id: NFL, name: 'NFL', speed: 1.1 }] };
    const env = fixture({ channel: NFL, saved });
    env.doc.body.textContent = 'Wiedergabegeschwindigkeit';
    env.video.playbackRate = 1;
    env.flush();
    assert.equal(env.video.playbackRate, 1.1);
    env.nativeSpeed(1.5);
    env.video.playbackRate = 1;
    env.flush();
    assert.equal(env.video.playbackRate, 1.5);
});

test('Die native TizenTube-Schrittweite erlaubt auch Tempo unter 0,25×', () => {
    const env = fixture({ speed: 0.2, channel: 'UC1234567890123456789012' });
    assert.equal(env.video.playbackRate, 0.2);
    env.nativeSpeed(0.05);
    assert.equal(env.video.playbackRate, 0.05);
    env.next();
    assert.equal(env.video.playbackRate, 0.05);
});


test('Standardtempo bleibt nach RTL, sportstudio, NFL und einem Neustart gespeichert', () => {
    const env = fixture({ channel: NORMAL });
    env.nativeSpeed(1.75);
    for (const channel of [RTL, SPORT, NFL]) {
        env.next('special-' + channel, channel);
        assert.equal(env.video.playbackRate, 1);
        env.nativeSpeed(1.25);
        assert.equal(env.video.playbackRate, 1.25);
        env.next('normal-' + channel, NORMAL);
        assert.equal(env.video.playbackRate, 1.75);
    }
    const saved = JSON.parse(env.storage.getItem(api.key));
    assert.equal(saved.globalSpeed, 1.75);
    const restart = fixture({ channel: NORMAL, speed: 1.25, saved });
    assert.equal(restart.video.playbackRate, 1.75);
});

test('Kids und D/S/R überschreiben ein gespeichertes Standardtempo nur vorübergehend', () => {
    const env = fixture({ channel: NORMAL });
    env.nativeSpeed(1.75);
    env.key('d');
    assert.equal(env.video.playbackRate, 1.85);
    env.next();
    assert.equal(env.video.playbackRate, 1.75);
    env.root.location.hostname = 'www.youtubekids.com';
    env.next('kids');
    env.nativeSpeed(1.5);
    env.root.location.hostname = 'www.youtube.com';
    env.next('normal');
    assert.equal(env.video.playbackRate, 1.75);
});

test('Alte Installation übernimmt zuletzt gewähltes natives Tempo und RTL genau einmal', () => {
    const saved = { version: 1, globalSpeed: 1, kidsNormalSpeed: true, channels: [{ id: SPORT, name: 'sportstudio', speed: 1 }] };
    const env = fixture({ channel: NORMAL, speed: 1.75, saved });
    assert.equal(env.video.playbackRate, 1.75);
    const migrated = JSON.parse(env.storage.getItem(api.key));
    assert.equal(migrated.version, 4);
    assert.equal(migrated.channels.filter(r => r.id === RTL).length, 1);
    env.action('YSAMJO_SPEED_REMOVE', { channelId: RTL });
    const restart = fixture({ channel: NORMAL, speed: 1.25, saved: JSON.parse(env.storage.getItem(api.key)) });
    assert.equal(restart.video.playbackRate, 1.75);
    assert.equal(restart.control.getSettings().channels.some(r => r.id === RTL), false);
});

test('Migration bewahrt ein bewusst gesetztes Standardtempo und individuelle RTL-Regeln', () => {
    const env = fixture({ channel: NORMAL, speed: 1.25, saved: { version: 1, globalSpeed: 1.8, channels: [{ id: RTL, name: 'RTL', speed: 1.1 }] } });
    assert.equal(env.video.playbackRate, 1.8);
    env.next('rtl', RTL);
    assert.equal(env.video.playbackRate, 1.1);
    assert.equal(env.control.getSettings().channels.length, 1);
});

test('Unveränderte Altinstallation erhält den neuen Sport-Kanalsatz', () => {
    const saved = { version: 2, globalSpeed: 1.75, kidsNormalSpeed: true, channels: [
        { id: SPORT, name: 'sportstudio', speed: 1 },
        { id: 'UCRFsyeKu07-LnHDG44O6uCA', name: 'Sportschau', speed: 1 },
        { id: NFL, name: 'NFL', speed: 1.1 },
        { id: 'UCK2izXoHvraUFaPMU5B7vMQ', name: 'Prime Video Sport', speed: 1 },
        { id: RTL, name: 'RTL Sport', speed: 1 }
    ] };
    const env = fixture({ channel: 'UCWJ2lWNubArHWmf3FIHbfcQ', saved });
    assert.equal(env.video.playbackRate, 1);
    const migrated = JSON.parse(env.storage.getItem(api.key));
    assert.equal(migrated.version, 4);
    assert.deepEqual(migrated.channels.map(r => r.id), [SPORT, 'UCRFsyeKu07-LnHDG44O6uCA', 'UCAvNr5DMVncoJnJAotXOjOQ', 'UCuOwl-VgqBHOzR8hWnonBcA', 'UC5dCegXiWjE57wKrhWnCo0g', 'UCdi3n18zcIZeTk_x9qvSgZw', 'UC-XArLCeEw91r9gmaDi-Ajw', 'UClBFnQJMlinWDCvfSXj60CA', RTL, 'UCK2izXoHvraUFaPMU5B7vMQ', 'UCk452F_ypT9Q8b1S38-Ok8A', 'UCPj_Vtw0hKnhJapQuATBUrA', 'UCiMAc_TN1kSO3ErMtxUXfMA', 'UCQEHrmmI8kKJ6kAiQdQUjgg', 'UChr7ZXDFiPOEl543HM4Aj8g', NFL, 'UCWJ2lWNubArHWmf3FIHbfcQ', 'UC8pYaQzbBBXg9GIOHRvTmDQ', 'UCB_qr75-ydFVKSF9Dmo6izg', 'UC6UL29enLNe4mqwTfAyeNuw', 'UCfMo0xj-sbdzHuzxvKdu1hw', 'UCyGa1YEx9ST66rYrJTGIKOw']);
});

test('Version-3-Installation übernimmt die zusätzlichen Sport-Kanäle', () => {
    const saved = { version: 3, globalSpeed: 1.75, kidsNormalSpeed: true, channels: [
        { id: SPORT, name: 'sportstudio', speed: 1 },
        { id: 'UCAvNr5DMVncoJnJAotXOjOQ', name: 'Sky Sport', speed: 1 },
        { id: 'UCuOwl-VgqBHOzR8hWnonBcA', name: 'Sky Sport DE', speed: 1 },
        { id: 'UCdi3n18zcIZeTk_x9qvSgZw', name: 'DAZN', speed: 1 },
        { id: 'UC-XArLCeEw91r9gmaDi-Ajw', name: 'DAZN DE', speed: 1 },
        { id: RTL, name: 'RTL Sport', speed: 1 },
        { id: NFL, name: 'NFL', speed: 1 },
        { id: 'UCWJ2lWNubArHWmf3FIHbfcQ', name: 'NBA', speed: 1 }
    ] };
    const env = fixture({ channel: 'UCk452F_ypT9Q8b1S38-Ok8A', saved });
    assert.equal(env.video.playbackRate, 1);
    assert.equal(env.control.getSettings().channels.length, 22);
});

test('Fehlende Kanalidentität speichert keine irrtümliche Standardänderung', () => {
    const env = fixture({ channel: '' });
    env.nativeSpeed(1.5);
    assert.equal(env.control.getSettings().globalSpeed, 2.5);
    env.identify('first', RTL);
    env.next('normal', NORMAL);
    assert.equal(env.video.playbackRate, 2.5);
});


test('Kids-Auswahl bleibt auch bei ausgeschalteter 1,0×-Vorgabe vorübergehend', () => {
    const env = fixture({ channel: NORMAL, kids: true, saved: { version: 2, globalSpeed: 1.75, kidsNormalSpeed: false, channels: [] } });
    env.nativeSpeed(1.25);
    assert.equal(env.video.playbackRate, 1.25);
    assert.equal(env.control.getSettings().globalSpeed, 1.75);
    env.root.location.hostname = 'www.youtube.com';
    env.next();
    assert.equal(env.video.playbackRate, 1.75);
});
