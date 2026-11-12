/* Kanalvorgaben und Standardtempo für die offizielle Cobalt-TV-Oberfläche. */
(function (root, factory) {
    var api = factory();
    if (typeof module === 'object' && module.exports) module.exports = api;
    else if (root && root.document && !root.__ysamjoChannelSpeed) root.__ysamjoChannelSpeed = api.install(root);
}(typeof window !== 'undefined' ? window : null, function () {
    'use strict';
    var KEY = 'ysamjo-tv-channel-speeds';
    var SETTINGS_VERSION = 4;
    var RTL_SPORT = { id: 'UC8WYi3XQXsf-6FNvqoEvxag', handle: '@RTLSport', name: 'RTL Sport', speed: 1 };
    var DEFAULT_CHANNELS = [
        { id: 'UCE0RhriywrL8XhXbo87tMKQ', handle: '@sportstudio', name: 'sportstudio', speed: 1 },
        { id: 'UCRFsyeKu07-LnHDG44O6uCA', handle: '@sportschau', name: 'Sportschau', speed: 1 },
        { id: 'UCAvNr5DMVncoJnJAotXOjOQ', handle: '@skysport', name: 'Sky Sport', speed: 1 },
        { id: 'UCuOwl-VgqBHOzR8hWnonBcA', handle: '@skysportde', name: 'Sky Sport DE', speed: 1 },
        { id: 'UC5dCegXiWjE57wKrhWnCo0g', handle: '@skysportaustria', name: 'Sky Sport Austria', speed: 1 },
        { id: 'UCdi3n18zcIZeTk_x9qvSgZw', handle: '@dazn', name: 'DAZN', speed: 1 },
        { id: 'UC-XArLCeEw91r9gmaDi-Ajw', handle: '@daznde', name: 'DAZN DE', speed: 1 },
        RTL_SPORT,
        { id: 'UCK2izXoHvraUFaPMU5B7vMQ', handle: '@primevideosportde', name: 'Prime Video Sport', speed: 1 },
        { id: 'UCk452F_ypT9Q8b1S38-Ok8A', handle: '@eurosportdeutschland', name: 'Eurosport Deutschland', speed: 1 },
        { id: 'UCPj_Vtw0hKnhJapQuATBUrA', handle: '@sport1', name: 'SPORT1', speed: 1 },
        { id: 'UCiMAc_TN1kSO3ErMtxUXfMA', handle: '@ransport', name: 'ran', speed: 1 },
        { id: 'UCQEHrmmI8kKJ6kAiQdQUjgg', handle: '@kicker', name: 'kicker', speed: 1 },
        { id: 'UChr7ZXDFiPOEl543HM4Aj8g', handle: '@magentasport', name: 'Magenta Sport', speed: 1 },
        { id: 'UCDVYQ4Zhbm3S2dlz7P1GBDg', handle: '@nfl', name: 'NFL', speed: 1 },
        { id: 'UCWJ2lWNubArHWmf3FIHbfcQ', handle: '@nba', name: 'NBA', speed: 1 },
        { id: 'UC8pYaQzbBBXg9GIOHRvTmDQ', handle: '@motogp', name: 'MotoGP', speed: 1 },
        { id: 'UCB_qr75-ydFVKSF9Dmo6izg', handle: '@formula1', name: 'Formula 1', speed: 1 },
        { id: 'UC6UL29enLNe4mqwTfAyeNuw', handle: '@bundesliga', name: 'Bundesliga', speed: 1 },
        { id: 'UCfMo0xj-sbdzHuzxvKdu1hw', handle: '@dfb', name: 'DFB', speed: 1 },
        { id: 'UCyGa1YEx9ST66rYrJTGIKOw', handle: '@uefa', name: 'UEFA', speed: 1 }
    ];
    function copy(value) { return JSON.parse(JSON.stringify(value)); }
    // Regelsätze, die unveränderte Installationen bis Version 3 gespeichert hatten.
    var LEGACY_CHANNEL_SETS = [
        [
            { id: 'UCE0RhriywrL8XhXbo87tMKQ', speed: 1 },
            { id: 'UCRFsyeKu07-LnHDG44O6uCA', speed: 1 },
            { id: 'UCDVYQ4Zhbm3S2dlz7P1GBDg', speed: 1.1 },
            { id: 'UCK2izXoHvraUFaPMU5B7vMQ', speed: 1 },
            { id: RTL_SPORT.id, speed: 1 }
        ],
        [
            { id: 'UCE0RhriywrL8XhXbo87tMKQ', speed: 1 },
            { id: 'UCAvNr5DMVncoJnJAotXOjOQ', speed: 1 },
            { id: 'UCuOwl-VgqBHOzR8hWnonBcA', speed: 1 },
            { id: 'UCdi3n18zcIZeTk_x9qvSgZw', speed: 1 },
            { id: 'UC-XArLCeEw91r9gmaDi-Ajw', speed: 1 },
            { id: RTL_SPORT.id, speed: 1 },
            { id: 'UCDVYQ4Zhbm3S2dlz7P1GBDg', speed: 1 },
            { id: 'UCWJ2lWNubArHWmf3FIHbfcQ', speed: 1 }
        ]
    ];
    function isLegacyDefault(channels) {
        return LEGACY_CHANNEL_SETS.some(function (set) {
            return channels.length === set.length && set.every(function (legacy) {
                return channels.some(function (rule) { return rule.id === legacy.id && Math.abs(rule.speed - legacy.speed) <= 0.00005; });
            });
        });
    }
    function validSpeed(value) { var n = Number(value); return value !== '' && value !== null && isFinite(n) && n >= 0.05 && n <= 5 ? n : null; }
    function format(value) { return String(Math.round(value * 100) / 100).replace('.', ',') + '×'; }
    function channelId(value) { return /^UC[\w-]{22}$/.test(String(value || '')) ? value : ''; }
    function readObject(storage, key) {
        try { var obj = JSON.parse(storage.getItem(key) || 'null'); return obj && typeof obj === 'object' && !Array.isArray(obj) ? obj : null; }
        catch (_) { return null; }
    }
    function readSettings(storage) {
        var saved = readObject(storage, KEY), nativeConfig = readObject(storage, 'ytaf-configuration') || {};
        var version = saved ? Number(saved.version || 1) : SETTINGS_VERSION;
        var globalSpeed = saved && validSpeed(saved.globalSpeed) !== null ? Number(saved.globalSpeed) : validSpeed(nativeConfig.videoSpeed) || 1;
        var channels = (saved && Array.isArray(saved.channels) ? saved.channels : DEFAULT_CHANNELS).filter(function (r) {
            return r && channelId(r.id) && validSpeed(r.speed) !== null;
        }).map(function (r) { return { id: r.id, name: String(r.name || r.handle || r.id), handle: String(r.handle || ''), speed: Number(r.speed) }; });
        if (saved && version < 2) {
            if (!channels.some(function (r) { return r.id === RTL_SPORT.id; })) channels.push(copy(RTL_SPORT));
            // Version 1 froze the initial 1× default while the native menu saved later choices separately.
            if (globalSpeed === 1 && validSpeed(nativeConfig.videoSpeed) !== null) globalSpeed = Number(nativeConfig.videoSpeed);
        }
        // Unveränderte Altinstallationen erhalten den erweiterten Sport-Kanalsatz; eigene Regeln bleiben unangetastet.
        if (saved && version < 4 && isLegacyDefault(channels)) channels = copy(DEFAULT_CHANNELS);
        return { version: SETTINGS_VERSION, globalSpeed: globalSpeed, kidsNormalSpeed: !saved || saved.kidsNormalSpeed !== false, channels: channels };
    }

    function isKids(root) {
        var loc = root.location || {}, cfg = root.yt && root.yt.config_ || {};
        return /(^|\.)youtubekids\.com$/.test(loc.hostname || '') || /TVHTML5_KIDS|WEB_KIDS/.test(String(cfg.INNERTUBE_CLIENT_NAME || ''))
            || /^\/tv\/kids(?:\/|$)/.test(loc.pathname || '') || /^#\/?kids(?:[/?]|$)/.test(loc.hash || '');
    }
    function preset(settings, context, kids) {
        if (kids && settings.kidsNormalSpeed) return { key: 'kids', rate: 1 };
        for (var i = 0; i < settings.channels.length; i++) {
            var rule = settings.channels[i];
            if (context.channelId && context.channelId === rule.id) return { key: rule.id, rate: rule.speed };
        }
        return { key: 'global', rate: settings.globalSpeed };
    }
    function button(title, subtitle, action, parameters) {
        var renderer = { title: { simpleText: title }, serviceEndpoint: { commandExecutorCommand: { commands: [
            { customAction: { action: action, parameters: parameters || {} } }
        ] } } };
        if (subtitle) renderer.subtitle = { simpleText: subtitle };
        return { compactLinkRenderer: renderer };
    }
    function modal(title, subtitle, items, id, update) {
        var command = { openPopupAction: { popupType: 'MODAL', uniqueId: id, popup: { overlaySectionRenderer: {
            overlay: { overlayTwoPanelRenderer: {
                actionPanel: { overlayPanelRenderer: {
                    header: { overlayPanelHeaderRenderer: { title: { simpleText: title }, subtitle: { simpleText: subtitle || '' } } },
                    content: { overlayPanelItemListRenderer: { items: items, selectedIndex: 0 } }
                } },
                backButton: { buttonRenderer: { accessibilityData: { accessibilityData: { label: 'Zurück' } }, command: { signalAction: { signal: 'POPUP_BACK' } } } }
            } }, dismissalCommand: { signalAction: { signal: 'POPUP_BACK' } }
        } } } };
        if (update) { command.openPopupAction.shouldMatchUniqueId = true; command.openPopupAction.updateAction = true; }
        return command;
    }
    function install(root) {
        var doc = root.document, storage = root.localStorage, settings = readSettings(storage);
        var parse = root.JSON.parse;
        var states = [], metadata = Object.create(null), metadataOrder = [], router = null, timer = null, started = false;
        function log(message) { if (root.console) root.console.log('YSAMJO_CHANNEL_SPEED ' + message); }
        function player() { return doc.querySelector('.html5-video-player'); }
        function context() {
            var data = {}, response = {}, currentPlayer = player();
            try { if (currentPlayer && currentPlayer.getVideoData) data = currentPlayer.getVideoData() || {}; } catch (_) {}
            try { if (currentPlayer && currentPlayer.getPlayerResponse) response = currentPlayer.getPlayerResponse() || {}; if (typeof response === 'string') response = parse(response) || {}; } catch (_) {}
            var id = data.video_id || '', details = metadata[id] || {};
            if (response.videoDetails && response.videoDetails.videoId === id) details = response.videoDetails;
            return { videoId: id, channelId: channelId(details.channelId || data.channel_id || data.channelId), name: String(details.author || data.author || ''),
                handle: String(data.channel_url || '').replace(/^https?:\/\/(?:www\.)?youtube\.com\//, '') };
        }
        function stateFor(video) {
            for (var i = 0; i < states.length; i++) if (states[i].video === video) return states[i];
            var state = { video: video, id: null, source: '', rate: 1, stepRate: 1, manual: false, policyKey: '', policyRate: 1, retryAfter: 0, writes: 0 };
            states.push(state);
            if (states.length > 10) states.shift();
            video.addEventListener('ratechange', onRate, true);
            return state;
        }
        function writeRate(state) {
            if (Math.abs(state.video.defaultPlaybackRate - state.rate) <= 0.00005 && Math.abs(state.video.playbackRate - state.rate) <= 0.00005) return;
            var now = (root.Date || Date).now();
            if (now >= state.retryAfter) { state.retryAfter = now + 1500; state.writes = 0; }
            if (state.writes >= 10) return;
            state.writes++;
            try {
                if (Math.abs(state.video.defaultPlaybackRate - state.rate) > 0.00005) state.video.defaultPlaybackRate = state.rate;
                if (Math.abs(state.video.playbackRate - state.rate) > 0.00005) { state.video.playbackRate = state.rate; log('APPLY ' + state.rate); }
            } catch (error) { log('APPLY_FAIL ' + error.message); }
        }
        function sync(video, explicitSettingsChange) {
            if (!video) return null;
            var state = stateFor(video), info = context(), source = video.currentSrc || video.src || '';
            var id = info.videoId || 'source:' + source, choice = preset(settings, info, isKids(root));
            var resolvedInitialId = state.id && state.id.indexOf('source:') === 0 && info.videoId && state.source === source;
            var sameVideo = state.id === id || resolvedInitialId;
            var policyChanged = state.policyKey !== choice.key || Math.abs(state.policyRate - choice.rate) > 0.00005;
            if (!sameVideo || (!state.manual && policyChanged) || (explicitSettingsChange && policyChanged)) {
                state.rate = state.stepRate = choice.rate;
                state.manual = false; state.retryAfter = 0;
                log('VIDEO ' + id + ' PRESET ' + choice.rate);
            }
            state.id = id; state.source = source; state.policyKey = choice.key; state.policyRate = choice.rate;
            writeRate(state);
            return state;
        }
        function currentVideo() { return doc.querySelector('video'); }
        function manual(rate, saveDefault) {
            rate = validSpeed(rate);
            if (rate === null) return;
            var state = sync(currentVideo(), false);
            if (!state) return;
            if (saveDefault && !isKids(root) && state.policyKey === 'global' && context().channelId && settings.globalSpeed !== rate) {
                var next = copy(settings); next.globalSpeed = rate;
                persist(next);
            }
            state.manual = true; state.rate = state.stepRate = rate; state.retryAfter = 0;
            writeRate(state);
            log('MANUAL ' + rate);
        }
        function onRate(event) {
            sync(event.currentTarget || event.target, false);
        }
        function schedule() {
            if (timer) return;
            timer = root.setTimeout(function () { timer = null; sync(currentVideo(), false); attachRouter(); }, 0);
        }
        function persist(next) {
            try { storage.setItem(KEY, JSON.stringify(next)); settings = next; sync(currentVideo(), true); return true; }
            catch (_) { toast('Nicht gespeichert', 'Der Gerätespeicher konnte nicht beschrieben werden.'); return false; }
        }
        function send(command) {
            if (!router) return false;
            router.resolveCommand(command);
            return true;
        }
        function toast(title, subtitle) { send({ openPopupAction: { popupType: 'TOAST', popup: { overlayToastRenderer: { title: { simpleText: title }, subtitle: { simpleText: subtitle } } } } }); }
        function back() { send({ signalAction: { signal: 'POPUP_BACK' } }); }
        function showRules(update) {
            var info = context(), items = [];
            if (info.channelId) items.push(button('Aktueller Kanal: ' + (info.name || info.channelId), 'Vorgabe für diesen Kanal bearbeiten oder hinzufügen', 'YSAMJO_SPEED_EDIT', info));
            items.push(button('Standardtempo: ' + format(settings.globalSpeed), 'Gilt ohne passende Kanalvorgabe', 'YSAMJO_SPEED_GLOBAL'));
            items.push(button('YouTube Kids: ' + (settings.kidsNormalSpeed ? '1,0× je neuem Video' : 'Standardtempo'), 'Kids-Vorgabe ein- oder ausschalten', 'YSAMJO_SPEED_KIDS'));
            for (var i = 0; i < settings.channels.length; i++) {
                var rule = settings.channels[i];
                items.push(button(rule.name + ': ' + format(rule.speed), rule.handle || rule.id, 'YSAMJO_SPEED_EDIT', { channelId: rule.id, name: rule.name, handle: rule.handle }));
            }
            send(modal('Kanalgeschwindigkeiten', 'Sonderkanäle starten mit ihrer Vorgabe. Übrige Kanäle verwenden das gespeicherte Standardtempo.', items, 'ysamjo-channel-speeds', update));
        }
        function showEditor(info, global) {
            var value = settings.globalSpeed, found = null, items = [], title = global ? 'Standardtempo' : info.name || info.channelId;
            for (var i = 0; i < settings.channels.length; i++) if (settings.channels[i].id === info.channelId) found = settings.channels[i];
            if (!global) value = found ? found.speed : 1;
            var values = [0.05, 0.1, 0.15, 0.2, 0.25, 0.5, 0.75, 1, 1.1, 1.25, 1.5, 1.75, 2, 2.25, 2.5, 3, 3.5, 4, 4.5, 5];
            items.push(button('Tempo −0,1', 'Aktuell: ' + format(value), 'YSAMJO_SPEED_SAVE', { info: info, global: global, speed: Math.max(0.05, Math.round((value - 0.1) * 100) / 100) }));
            items.push(button('Tempo +0,1', 'Aktuell: ' + format(value), 'YSAMJO_SPEED_SAVE', { info: info, global: global, speed: Math.min(5, Math.round((value + 0.1) * 100) / 100) }));
            for (var j = 0; j < values.length; j++) items.push(button(format(values[j]), Math.abs(value - values[j]) < 0.00005 ? 'Aktuelle Vorgabe' : '', 'YSAMJO_SPEED_SAVE', { info: info, global: global, speed: values[j] }));
            if (!global && found) items.push(button('Kanalvorgabe entfernen', 'Für diesen Kanal gilt wieder das Standardtempo', 'YSAMJO_SPEED_REMOVE', info));
            send(modal(title, 'Dauerhafte Vorgabe wählen. Sonderkanäle lassen sich je Video manuell übersteuern.', items, 'ysamjo-speed-editor'));
        }
        function custom(action, args) {
            if (action.indexOf('YSAMJO_SPEED_') !== 0) return false;
            args = args || {};
            if (action === 'YSAMJO_SPEED_MENU') showRules(false);
            else if (action === 'YSAMJO_SPEED_EDIT' && channelId(args.channelId)) showEditor(args, false);
            else if (action === 'YSAMJO_SPEED_GLOBAL') showEditor({}, true);
            else if (action === 'YSAMJO_SPEED_KIDS') {
                var toggled = copy(settings); toggled.kidsNormalSpeed = !toggled.kidsNormalSpeed;
                if (persist(toggled)) showRules(true);
            } else if (action === 'YSAMJO_SPEED_SAVE' && validSpeed(args.speed) !== null && (args.global || channelId(args.info && args.info.channelId))) {
                var next = copy(settings);
                if (args.global) next.globalSpeed = Number(args.speed);
                else {
                    var info = args.info, rule = { id: info.channelId, name: String(info.name || info.channelId), handle: String(info.handle || ''), speed: Number(args.speed) };
                    next.channels = next.channels.filter(function (r) { return r.id !== rule.id; }); next.channels.push(rule);
                }
                if (persist(next)) { back(); showRules(true); }
            } else if (action === 'YSAMJO_SPEED_REMOVE' && channelId(args.channelId)) {
                var removed = copy(settings); removed.channels = removed.channels.filter(function (r) { return r.id !== args.channelId; });
                if (persist(removed)) { back(); showRules(true); }
            }
            return true;
        }
        function inspectCommand(command) {
            var children = command && command.commandExecutorCommand && command.commandExecutorCommand.commands;
            if (Array.isArray(children)) {
                // Native TizenTube executes nested custom actions inside its own router.
                if (children.length === 1) {
                    var own = children[0] && children[0].customAction;
                    if (own && typeof own.action === 'string' && custom(own.action, own.parameters)) return true;
                }
                children.forEach(inspectDirectCommand);
            }
            return inspectDirectCommand(command);
        }
        function inspectDirectCommand(command) {
            if (!command || typeof command !== 'object') return false;
            var action = command.customAction || command.signalAction && command.signalAction.customAction;
            if (action && typeof action.action === 'string' && custom(action.action, action.parameters)) return true;
            if (action && action.action === 'SET_PLAYER_SPEED') manual(action.parameters, true);
            var endpoint = command.setClientSettingEndpoint;
            if (endpoint && Array.isArray(endpoint.settingDatas)) endpoint.settingDatas.forEach(function (setting) {
                if (!setting) return;
                var item = setting.clientSettingEnum && setting.clientSettingEnum.item || '';
                if (item === 'videoSpeed' || /PLAYBACK.*(?:SPEED|RATE)/.test(item)) manual(setting.intValue === undefined ? setting.stringValue : setting.intValue, true);
            });
            var popup = command.openPopupAction;
            if (popup && ['tt-settings', 'tt-speed', 'playback-settings'].indexOf(popup.uniqueId) !== -1) {
                var panel = popup.popup && popup.popup.overlaySectionRenderer;
                panel = panel && panel.overlay && panel.overlay.overlayTwoPanelRenderer && panel.overlay.overlayTwoPanelRenderer.actionPanel;
                var list = panel && panel.overlayPanelRenderer && panel.overlayPanelRenderer.content && panel.overlayPanelRenderer.content.overlayPanelItemListRenderer;
                if (list && Array.isArray(list.items) && !list.items.some(function (entry) { return entry.compactLinkRenderer && entry.compactLinkRenderer.__ysamjoChannelEntry; })) {
                    var entry = button('Kanalgeschwindigkeiten', 'Vorgaben pro Kanal und für neue Videos', 'YSAMJO_SPEED_MENU');
                    entry.compactLinkRenderer.__ysamjoChannelEntry = true;
                    list.items.push(entry);
                }
            }
            return false;
        }
        function attachRouter() {
            var scope = root._yttv || {};
            for (var key in scope) {
                var instance;
                try { instance = scope[key] && scope[key].instance; } catch (_) { continue; }
                if (!instance || typeof instance.resolveCommand !== 'function') continue;
                router = instance;
                if (instance.resolveCommand.__ysamjoChannelSpeed) return;
                (function (target, original) {
                    var wrapped = function (command) {
                        try { if (inspectCommand(command)) return true; }
                        catch (error) { log('COMMAND_FAIL ' + error.message); }
                        return original.apply(this, arguments);
                    };
                    wrapped.__ysamjoChannelSpeed = true; target.resolveCommand = wrapped;
                }(instance, instance.resolveCommand));
                log('ROUTER_READY'); return;
            }
        }
        function captureMetadata(value) {
            var details = value && value.videoDetails;
            if (!details || !details.videoId || !channelId(details.channelId)) return;
            var cached = metadata[details.videoId];
            if (cached && cached.channelId === details.channelId && cached.author === String(details.author || '')) return;
            if (!cached) metadataOrder.push(details.videoId);
            metadata[details.videoId] = { videoId: details.videoId, channelId: details.channelId, author: String(details.author || '') };
            if (metadataOrder.length > 20) delete metadata[metadataOrder.shift()];
            schedule();
        }
        function installParseHook() {
            var original = root.JSON.parse;
            if (original.__ysamjoChannelMetadata) return;
            var wrapped = function () { var value = original.apply(this, arguments); try { captureMetadata(value); } catch (_) {} return value; };
            wrapped.__ysamjoChannelMetadata = true; root.JSON.parse = wrapped;
        }
        function keydown(event) {
            if (!/^#\/watch(?:[/?]|$)/.test(root.location.hash || '')) return;
            var target = event.target || {}, tag = String(target.tagName || '').toLowerCase();
            if (['input', 'textarea', 'select'].indexOf(tag) !== -1 || target.isContentEditable || event.ctrlKey || event.altKey || event.metaKey || event.shiftKey) return;
            var key = String(event.key || '').toLowerCase(), video = currentVideo();
            if (!video || ['s', 'd', 'r'].indexOf(key) === -1) return;
            var state = sync(video, false), next;
            if (key === 'r') next = Math.abs(state.rate - 1) < 0.00005 ? state.stepRate : 1;
            else next = Math.min(5, Math.max(0.05, Math.round((state.stepRate + (key === 'd' ? 0.1 : -0.1)) * 100) / 100));
            var previousStep = state.stepRate; manual(next); if (key === 'r') state.stepRate = previousStep;
            event.preventDefault(); event.stopImmediatePropagation();
        }
        function media(event) {
            if (!event.target || String(event.target.tagName).toUpperCase() !== 'VIDEO') return;
            sync(event.target, false);
            root.setTimeout(function () { sync(event.target, false); }, 0);
            root.setTimeout(function () { sync(event.target, false); }, 250);
            root.setTimeout(function () { sync(event.target, false); }, 1000);
        }
        function start() {
            if (started) return; started = true;
            var stored = readObject(storage, KEY);
            if (!stored || stored.version !== settings.version) persist(settings);
            installParseHook(); attachRouter(); sync(currentVideo(), false);
            ['loadedmetadata', 'loadeddata', 'canplay', 'play', 'playing', 'seeking', 'seeked'].forEach(function (type) { doc.addEventListener(type, media, true); });
            doc.addEventListener('keydown', keydown, true);
            root.addEventListener('hashchange', schedule, true);
            root.addEventListener('storage', function (event) { if (event.key === KEY) { settings = readSettings(storage); sync(currentVideo(), true); } });
            root.setInterval(function () { installParseHook(); attachRouter(); sync(currentVideo(), false); }, 2000);
            log('READY');
        }
        if (doc.readyState === 'loading') doc.addEventListener('DOMContentLoaded', start, { once: true }); else start();
        return { sync: sync, manual: manual, inspectCommand: inspectCommand, captureMetadata: captureMetadata, context: context,
            showRules: showRules, getSettings: function () { return copy(settings); } };
    }
    return { install: install, readSettings: readSettings, preset: preset, modal: modal, button: button, validSpeed: validSpeed, key: KEY, defaultChannels: copy(DEFAULT_CHANNELS) };
}));
