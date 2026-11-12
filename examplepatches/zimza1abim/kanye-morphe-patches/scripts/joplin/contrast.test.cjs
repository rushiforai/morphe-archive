// WCAG contrast gate for the Morphe pink themes. Run: node scripts/joplin/contrast.test.cjs
const assert = require('node:assert');
const { themes, statusBarThreshold } = require('./pink-themes.cjs');

const lum = hex => {
  const m = /^#([0-9a-f]{6})$/i.exec(hex);
  assert(m, 'not a hex color: ' + hex);
  const [r, g, b] = [0, 2, 4].map(i => {
    const c = parseInt(m[1].slice(i, i + 2), 16) / 255;
    return c <= 0.03928 ? c / 12.92 : Math.pow((c + 0.055) / 1.055, 2.4);
  });
  return 0.2126 * r + 0.7152 * g + 0.0722 * b;
};
const ratio = (a, b) => { const [x, y] = [lum(a), lum(b)].sort((p, q) => q - p); return (x + 0.05) / (y + 0.05); };

// [foreground, background, minimum]. 4.5 = AA body text, 3 = AA large text/icons.
const pairs = [
  ['color', 'backgroundColor', 7], ['color', 'oddBackgroundColor', 7], ['color', 'selectedColor', 7],
  ['colorFaded', 'backgroundColor', 4.5], ['urlColor', 'backgroundColor', 4.5], ['urlColor', 'tableBackgroundColor', 4.5],
  ['colorError', 'backgroundColor', 4.5], ['colorCorrect', 'backgroundColor', 4.5], ['colorWarn', 'backgroundColor', 4.5],
  ['color2', 'backgroundColor2', 7], ['colorBright2', 'backgroundColor2', 4.5], ['colorBright2', 'selectedColor2', 4.5],
  ['colorPublished2', 'backgroundColor2', 4.5], ['colorWarn2', 'backgroundColor2', 4.5], ['colorError2', 'backgroundColor2', 4.5],
  ['color3', 'backgroundColor3', 4.5], ['color3', 'backgroundColorHover3', 4.5],
  ['color4', 'backgroundColor4', 4.5], ['color4', 'backgroundColor4Dimmed', 4.5],
  ['color5', 'backgroundColor5', 7], ['raisedColor', 'raisedBackgroundColor', 7],
  ['searchMarkerColor', 'searchMarkerBackgroundColor', 7],
  ['codeColor', 'codeBackgroundColor', 7], ['color', 'codeBackgroundColor', 7], ['color', 'headerBackgroundColor', 7],
  ['color', 'warningBackgroundColor', 4.5], ['destructiveColor', 'backgroundColor', 4.5],
  ['textSelectionColor', 'backgroundColor', 3],
];
let failures = 0;
for (const t of themes) {
  const rows = [];
  for (const [fg, bg, min] of pairs) {
    const a = t.colors[fg], b = t.colors[bg];
    assert(a && b, `${t.label}: missing ${fg}/${bg}`);
    const r = ratio(a, b);
    if (r < min) failures++;
    rows.push(`${r < min ? 'FAIL' : ' ok '} ${r.toFixed(2).padStart(5)} >= ${min}  ${fg} on ${bg}`);
  }
  // Status bar icons must be dark on a light header and light on a dark one.
  const light = lum(t.colors.backgroundColor2) > statusBarThreshold;
  const icon = light ? '#000000' : '#ffffff';
  const r = ratio(icon, t.colors.backgroundColor2);
  if (r < 3) failures++;
  rows.push(`${r < 3 ? 'FAIL' : ' ok '} ${r.toFixed(2).padStart(5)} >= 3  status bar ${light ? 'dark' : 'light'} icons`);
  console.log(`\n${t.label}\n` + rows.join('\n'));
}
assert.equal(failures, 0, failures + ' contrast pair(s) below WCAG target');
console.log('\nAll pink theme contrast pairs pass.');
