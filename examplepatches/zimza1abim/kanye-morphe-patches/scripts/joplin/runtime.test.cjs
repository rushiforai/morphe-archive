const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const app = path.resolve(process.argv[2], 'packages/app-mobile');
const React = require(path.join(app, 'node_modules/react'));
const { create, act } = require(path.join(app, 'node_modules/react-test-renderer'));
global.IS_REACT_ACT_ENVIRONMENT = true;
let metadata = { revision: 1, enabled: true, fontPath: '/files/joplin-custom-font/font-1.ttf' };
let appActive;
const RN = { Platform: { OS: 'android' }, AppState: { addEventListener: (_, fn) => { appActive = fn; } },
    StyleSheet: { flatten: style => Array.isArray(style) ? Object.assign({}, ...style.map(RN.StyleSheet.flatten)) : style } };
const FS = { DocumentDirectoryPath: '/files', exists: async () => true, readFile: async () => JSON.stringify(metadata) };
const context = { module: { exports: {} }, console, Set, WeakMap, setTimeout, clearTimeout,
    require: name => ({ react: React, 'react-native': RN, '@dr.pogodin/react-native-fs': FS })[name] };
vm.runInNewContext(fs.readFileSync(path.join(app, 'utils/morpheFont.js'), 'utf8'), context);
const runtime = context.module.exports;

async function htmlCase(mode) {
    const html = runtime.prepareHtml('<html><head></head><body>한글 😀</body></html>', {
        enabled: true, family: 'JoplinCustomFont_1', fontUrl: 'https://morphe-font.invalid/font-1.ttf',
    });
    assert(html.indexOf('morphe-font-style') < html.indexOf('<body>'));
    assert(!html.includes('base64') && !html.includes('*{font-family'));
    let hidden = false, removed = false, timeout, complete;
    const scope = {
        document: {
            documentElement: { setAttribute: () => { hidden = true; }, removeAttribute: () => { hidden = false; } },
            getElementById: () => ({ remove: () => { removed = true; } }),
            fonts: { load: () => new Promise(resolve => { complete = resolve; }) },
        },
        setTimeout: fn => { timeout = fn; return 1; }, clearTimeout: () => {}, console: { warn: () => {} },
    };
    vm.runInNewContext(html.match(/<script>([\s\S]*?)<\/script>/)[1], scope);
    assert(hidden);
    if (mode === 'timeout') { timeout(); complete([{}]); }
    else complete(mode === 'success' ? [{}] : []);
    await Promise.resolve();
    assert(!hidden);
    assert.equal(removed, mode !== 'success');
}
(async () => {
    await runtime.refresh();
    const NativeText = React.forwardRef((props, ref) => React.createElement('text', { ...props, ref }));
    NativeText.State = { current: true };
    const Text = runtime.wrapText(NativeText);
    assert.equal(runtime.wrapText(NativeText), Text);
    assert.equal(Text.State, NativeText.State);
    let tree;
    await act(async () => { tree = create(React.createElement(Text, { style: { fontSize: 18 } }, 'title')); });
    assert.equal(RN.StyleSheet.flatten(tree.toJSON().props.style).fontFamily, 'JoplinCustomFont_1');
    metadata = { ...metadata, revision: 2, fontPath: '/files/joplin-custom-font/font-2.ttf' };
    await act(async () => { appActive('active'); await runtime.refresh(); });
    assert.equal(RN.StyleSheet.flatten(tree.toJSON().props.style).fontFamily, 'JoplinCustomFont_2');
    await act(async () => { tree.update(React.createElement(Text, { style: { fontFamily: 'Ionicons' } }, React.createElement(Text, null, '\ue001'))); });
    assert.equal(RN.StyleSheet.flatten(tree.toJSON().props.style).fontFamily, 'Ionicons');
    assert(!tree.toJSON().children[0].props.style);
    metadata = { ...metadata, enabled: false, revision: 3 };
    await act(async () => { await runtime.refresh(); tree.update(React.createElement(Text, null, 'default')); });
    assert(!tree.toJSON().props.style);
    await act(async () => { tree.unmount(); });
    assert(runtime.ordinaryFamily('monospace'));
    assert(!runtime.ordinaryFamily('MaterialDesignIcons'));
    await htmlCase('success'); await htmlCase('failure'); await htmlCase('timeout');
    console.log('PASS: React 19 render, font revision update, reset, inherited icon exclusion, TextInput statics, pre-head injection, font-ready/failure/timeout-late-success gates');
})().catch(error => { console.error(error); process.exitCode = 1; });
