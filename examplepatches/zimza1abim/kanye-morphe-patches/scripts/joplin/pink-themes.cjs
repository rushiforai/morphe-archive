// Additional pink themes beside Blush Pink. Guarded, repeatable source edits:
// each anchor must exist exactly once; already-applied edits are skipped.
const fs = require('node:fs');
const path = require('node:path');

// Baby pink (#F8C8DC family) is the brand color. It is used for surfaces
// (header, primary button, highlights) with deep plum ink on top; text-level
// accents use a deeper rose of the same hue so every pair meets WCAG AA.
// contrast.test.cjs enforces the ratios.
const BABY = '#f8c8dc', BABY_DEEP = '#f3b3cf', INK = '#3e2433';
const themes = [
  { id: 24, constant: 'THEME_BABY_PINK', module: 'babyPink', label: 'Baby Pink', base: 'light', colors: {
    backgroundColor: '#fffafc', backgroundColorTransparent: 'rgba(255,250,252,0.94)', oddBackgroundColor: '#fff1f6',
    color: '#3b2732', colorFaded: '#7d5f6e', dividerColor: '#f5dbe6', selectedColor: '#fde3ee',
    colorError: '#c62828', colorErrorSelected: '#b71c1c', colorCorrect: '#2e7d32', colorWarn: '#b45309',
    urlColor: '#b0336a', colorWarnUrl: '#b0336a', shadowColor: 'rgba(176,51,106,0.16)',
    backgroundColor2: BABY, color2: INK, colorBright2: INK, selectedColor2: BABY_DEEP,
    colorPublished2: '#8f2556', colorWarn2: '#8a4500', colorWarn3: '#b45309', colorError2: '#a61b1b',
    backgroundColorTransparent2: 'rgba(62,36,51,0.14)',
    backgroundColor3: '#fff4f8', backgroundColorHover3: '#fcdcea', color3: '#74505f',
    backgroundColor4: '#fffafc', color4: '#b0336a', backgroundColor4Dimmed: '#fde2ee',
    backgroundColor5: BABY_DEEP, color5: INK,
    raisedBackgroundColor: '#fce4ef', raisedColor: '#3b2732',
    searchMarkerBackgroundColor: '#ffb0d0', searchMarkerColor: '#2b1520',
    warningBackgroundColor: '#ffe3c4', destructiveColor: '#c62828',
    tableBackgroundColor: '#fff5f9', codeBackgroundColor: '#fdf0f5', codeBorderColor: '#f5dbe6', codeColor: '#6b2747',
    headerBackgroundColor: '#ffeef5', textSelectionColor: '#d9578f',
  } },
  { id: 25, constant: 'THEME_BABY_PINK_NIGHT', module: 'babyPinkNight', label: 'Baby Pink Night', base: 'dark', colors: {
    backgroundColor: '#1f1a1d', backgroundColorTransparent: 'rgba(31,26,29,0.92)', oddBackgroundColor: '#191518',
    color: '#f4eaef', colorFaded: '#b9a2ad', dividerColor: '#3d3138', selectedColor: '#46313c',
    colorError: '#ff8a80', colorErrorSelected: '#ffd6d6', colorCorrect: '#8fd19e', colorWarn: '#ffb86b',
    urlColor: BABY, colorWarnUrl: '#ffe3ee', shadowColor: 'rgba(0,0,0,0.45)',
    backgroundColor2: '#2a2126', color2: '#f4eaef', colorBright2: BABY, selectedColor2: '#4c3341',
    colorPublished2: BABY, colorWarn2: '#ffcb8f', colorWarn3: '#ffcb8f', colorError2: '#ff9a9a',
    backgroundColorTransparent2: 'rgba(248,200,220,0.10)',
    backgroundColor3: '#272024', backgroundColorHover3: '#3e2d36', color3: '#e7d4dd',
    backgroundColor4: '#1f1a1d', color4: BABY, backgroundColor4Dimmed: '#3b2b34',
    backgroundColor5: BABY, color5: INK,
    raisedBackgroundColor: '#34282f', raisedColor: '#fde6f0',
    searchMarkerBackgroundColor: BABY, searchMarkerColor: '#2b1520',
    warningBackgroundColor: '#5a2e44', destructiveColor: '#ff8a80',
    tableBackgroundColor: '#251f23', codeBackgroundColor: '#2b2328', codeBorderColor: '#3d3138', codeColor: '#fbd5e5',
    headerBackgroundColor: '#272025', textSelectionColor: BABY,
  } },
  { id: 26, constant: 'THEME_BABY_PINK_OLED', module: 'babyPinkOled', label: 'Baby Pink OLED', base: 'dark', colors: {
    backgroundColor: '#000000', backgroundColorTransparent: 'rgba(0,0,0,0.92)', oddBackgroundColor: '#0a0709',
    color: '#f4eaef', colorFaded: '#a8919c', dividerColor: '#2e2228', selectedColor: '#301c27',
    colorError: '#ff8a80', colorErrorSelected: '#ffd6d6', colorCorrect: '#8fd19e', colorWarn: '#ffb86b',
    urlColor: BABY, colorWarnUrl: '#ffe3ee', shadowColor: 'rgba(0,0,0,0.6)',
    backgroundColor2: '#000000', color2: '#f4eaef', colorBright2: BABY, selectedColor2: '#3a2130',
    colorPublished2: BABY, colorWarn2: '#ffcb8f', colorWarn3: '#ffcb8f', colorError2: '#ff9a9a',
    backgroundColorTransparent2: 'rgba(248,200,220,0.10)',
    backgroundColor3: '#0c090b', backgroundColorHover3: '#2a1822', color3: '#e7d4dd',
    backgroundColor4: '#000000', color4: BABY, backgroundColor4Dimmed: '#26141e',
    backgroundColor5: BABY, color5: INK,
    raisedBackgroundColor: '#1c1218', raisedColor: '#fde6f0',
    searchMarkerBackgroundColor: BABY, searchMarkerColor: '#2b1520',
    warningBackgroundColor: '#4a2338', destructiveColor: '#ff8a80',
    tableBackgroundColor: '#000000', codeBackgroundColor: '#130d11', codeBorderColor: '#2e2228', codeColor: '#fbd5e5',
    headerBackgroundColor: '#0c090b', textSelectionColor: BABY,
  } },
];

module.exports = function planPinkThemes(source) {
  const lib = path.join(source, 'packages/lib');
  const edits = new Map();
  const read = file => edits.has(file) ? edits.get(file) : fs.readFileSync(file, 'utf8');
  function insertAfter(file, anchor, lines) {
    let text = read(file);
    const missing = lines.filter(line => !text.includes(line.trim()));
    if (!missing.length) return;
    if (missing.length !== lines.length) throw Error('Partially applied pink themes in ' + path.basename(file));
    const at = text.indexOf(anchor);
    if (at < 0 || text.indexOf(anchor, at + 1) >= 0) throw Error('Pink theme anchor not unique in ' + path.basename(file) + ': ' + anchor);
    const lineStart = text.lastIndexOf('\n', at) + 1;
    const indent = /^[\t ]*/.exec(text.slice(lineStart))[0];
    const end = text.indexOf('\n', at) + 1;
    edits.set(file, text.slice(0, end) + lines.map(line => indent + line + '\n').join('') + text.slice(end));
  }
  const setting = path.join(lib, 'models/Setting.ts');
  const used = new Set([...read(setting).matchAll(/public static THEME_[A-Z_]+ = (\d+);/g)].map(m => +m[1]));
  for (const t of themes) {
    if (used.has(t.id) && !read(setting).includes(`THEME_${t.constant.slice(6)} = ${t.id};`))
      throw Error('Theme id ' + t.id + ' already used upstream');
  }
  insertAfter(setting, 'public static THEME_BLUSH_PINK = 23;',
    themes.map(t => `public static ${t.constant} = ${t.id};`));
  insertAfter(path.join(lib, 'models/settings/builtInMetadata.ts'), "output[Setting.THEME_BLUSH_PINK] = 'Blush Pink';",
    themes.map(t => `output[Setting.${t.constant}] = '${t.label}';`));
  const themeFile = path.join(lib, 'theme.ts');
  insertAfter(themeFile, "import theme_blushPink from './themes/blushPink';",
    themes.map(t => `import theme_${t.module} from './themes/${t.module}';`));
  insertAfter(themeFile, '[Setting.THEME_BLUSH_PINK]: theme_blushPink,',
    themes.map(t => `[Setting.${t.constant}]: theme_${t.module},`));
  // Status bar icons were always white; follow the header luminance instead so
  // a baby pink header keeps readable (dark) icons. Other themes are unchanged.
  const root = path.join(source, 'packages/app-mobile/root.tsx');
  const before = "const statusBarStyle = 'light-content';";
  const after = "const statusBarStyle = morpheIsLightColor(theme.backgroundColor2) ? 'dark-content' : 'light-content';";
  const helper = 'const morpheIsLightColor = (hex: string) => { const m = /^#([0-9a-f]{6})$/i.exec(hex || \'\'); if (!m) return false;'
    + ' const [r, g, b] = [0, 2, 4].map(i => { const c = parseInt(m[1].slice(i, i + 2), 16) / 255;'
    + ' return c <= 0.03928 ? c / 12.92 : Math.pow((c + 0.055) / 1.055, 2.4); });'
    + ' return 0.2126 * r + 0.7152 * g + 0.0722 * b > 0.4; };';
  let rootText = read(root);
  if (!rootText.includes(after)) {
    if (rootText.split(before).length !== 2) throw Error('Unsupported status bar layout in root.tsx');
    const firstImport = rootText.search(/^const logger = /m);
    if (firstImport < 0) throw Error('Unsupported root.tsx layout');
    rootText = rootText.replace(before, after);
    rootText = rootText.slice(0, firstImport) + helper + '\n' + rootText.slice(firstImport);
    edits.set(root, rootText);
  }
  for (const t of themes) {
    const body = Object.entries(t.colors).map(([k, v]) => `\t${k}: '${v}',`).join('\n');
    edits.set(path.join(lib, 'themes', t.module + '.ts'),
      `import base from './${t.base}';\nimport { Theme } from './type';\n\n// Morphe pink theme.\n`
      + `const theme: Theme = {\n\t...base,\n${body}\n};\nexport default theme;\n`);
  }
  return () => { for (const [file, text] of edits) fs.writeFileSync(file, text); };
};
module.exports.themes = themes;
module.exports.statusBarThreshold = 0.4;
