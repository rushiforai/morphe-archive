// Adds "Font" to Settings → Customization → Appearance in the official source.
// Guarded and repeatable: the anchor must match exactly once, already-applied
// sources are left unchanged, and unknown layouts stop the build.
const fs = require('node:fs');
const path = require('node:path');

const MARKER = 'id: "morphe-custom-font"';

module.exports = function planAppearanceFont(source) {
  const file = path.join(source, 'apps/mobile/app/screens/settings/settings-data.tsx');
  const text = fs.readFileSync(file, 'utf8');
  if (text.includes(MARKER)) return () => {};
  if (!/import \{[^}]*\bLinking\b[^}]*\} from "react-native";/.test(text)) throw Error('settings-data.tsx no longer imports Linking');
  // The Appearance screen's item list ends with the dark mode switch.
  const section = text.indexOf('id: "personalization"');
  const dark = text.indexOf('id: "enable-dark-mode"', section);
  if (section < 0 || dark < 0 || text.indexOf('id: "personalization"', section + 1) >= 0)
    throw Error('Appearance settings structure changed; refusing an ambiguous insertion');
  const close = /\n( *)\}\n( *)\]/g;
  close.lastIndex = dark;
  const match = close.exec(text);
  if (!match || text.slice(dark + 1, match.index).includes('id: "')) throw Error('Dark mode item end not found');
  const indent = match[1];
  const item = [
    '{',
    '  id: "morphe-custom-font",',
    '  name: "Font",',
    '  description: "Use a device font or a font file across Notesnook",',
    '  icon: "format-font",',
    '  modifer: () => {',
    '    Linking.openURL("notesnook-font://settings").catch(() => {});',
    '  }',
    '}',
  ].map(line => indent + line).join('\n');
  const at = match.index + 1 + indent.length + 1; // after the dark mode item's "}"
  const next = text.slice(0, at) + ',\n' + item + text.slice(at);
  return () => fs.writeFileSync(file, next);
};
