// Adds the font picker UI to an Orca android source copy before bundle export.
// Usage: node orca/prepare-source.cjs <source checkout>
// Plans every edit first. Unknown source layouts stop without writing any file.
const fs = require('node:fs')
const path = require('node:path')

function prepareSource(sourceArg) {
  const source = path.resolve(sourceArg)
  const mobile = path.join(source, 'mobile')
  const appJson = JSON.parse(fs.readFileSync(path.join(mobile, 'app.json'), 'utf8'))
  const version = appJson.expo && appJson.expo.version
  if (typeof version !== 'string' || version.length === 0)
    throw Error('mobile/app.json: no expo.version to report')
  const changes = new Map()
  const read = (relative) => changes.get(path.join(source, relative)) ?? fs.readFileSync(path.join(source, relative), 'utf8')
  const set = (relative, text) => changes.set(path.join(source, relative), text)

  // Marker-guarded: an applied edit is skipped, a missing anchor fails with its file name,
  // so re-running on a prepared tree is a no-op and an unexpected source stops before any write.
  function edit(relative, marker, anchor, replacement) {
    const text = read(relative)
    if (text.includes(marker)) return
    if (text.split(anchor).length !== 2)
      throw Error(`${relative}: expected exactly one insertion anchor for ${JSON.stringify(marker)}`)
    set(relative, text.replace(anchor, replacement))
  }

  const appearance = 'mobile/src/settings/appearance-settings-screen.tsx'
  const appearanceImport = 'import { MorpheFontSection } from \'./morphe-font-section\''
  const appearanceMarker = '      <MorpheFontSection />'
  const appearanceText = read(appearance)
  if (appearanceText.includes(appearanceImport) !== appearanceText.includes(appearanceMarker))
    throw Error(`${appearance}: partially applied font entry`)
  edit(appearance, appearanceImport,
    'import { UiLanguageSettingsSection } from \'./ui-language-settings-section\'',
    'import { UiLanguageSettingsSection } from \'./ui-language-settings-section\'\n' + appearanceImport)
  edit(appearance, appearanceMarker,
    '      <UiLanguageSettingsSection />',
    appearanceMarker + '\n      <UiLanguageSettingsSection />')

  const layout = 'mobile/app/_layout.tsx'
  edit(layout, 'import { loadMorpheFont } from \'../src/settings/morphe-font\'',
    'import { startMobileAppearance } from \'../src/theme/mobile-appearance\'',
    'import { startMobileAppearance } from \'../src/theme/mobile-appearance\'\nimport { loadMorpheFont } from \'../src/settings/morphe-font\'')
  // The saved selection lands under the splash like the appearance and language choices.
  edit(layout, 'const morpheFontReady = loadMorpheFont()',
    'const languageReady = startMobileUiLanguage()',
    'const languageReady = startMobileUiLanguage()\nconst morpheFontReady = loadMorpheFont().catch(() => undefined)')
  edit(layout, 'appearanceReady, languageReady, morpheFontReady',
    'await Promise.all([appearanceReady, languageReady])',
    'await Promise.all([appearanceReady, languageReady, morpheFontReady])')
  edit(layout, 'name="morphe-font"',
    '                <Stack.Screen name="appearance-settings" options={{ headerShown: false }} />',
    '                <Stack.Screen name="appearance-settings" options={{ headerShown: false }} />\n' +
    '                <Stack.Screen name="morphe-font" options={{ headerShown: false }} />')

  // Terminal: a separate WebView whose page is an HTML string. The selected face is
  // inlined, leads every terminal family stack, and joins the startup font probe so
  // xterm measures its cells with the face already loaded.
  const terminalHtml = 'mobile/src/terminal/document/native-terminal-html.ts'
  edit(terminalHtml, 'morpheTerminalFontCss',
    "import { terminalBundledFontCss } from '../fonts/terminal-bundled-font-css'",
    "import { terminalBundledFontCss } from '../fonts/terminal-bundled-font-css'\n" +
    "import { morpheTerminalFontCss } from '../../settings/morphe-font-terminal'")
  edit(terminalHtml, '__morpheOrcaFont',
    '    `window.__orcaTerminalShown = ${JSON.stringify(start.shown)};\\n`\n' +
    '  const fontCss = terminalBundledFontCss(start.fontStyle.font)\n' +
    '  const shell = fontCss\n' +
    "    ? TERMINAL_HTML_DOCUMENT_SHELL.replace('</head>', () => `<style>${fontCss}</style>\\n</head>`)\n" +
    '    : TERMINAL_HTML_DOCUMENT_SHELL\n',
    '    `window.__orcaTerminalShown = ${JSON.stringify(start.shown)};\\n` +\n' +
    '    (morpheTerminalFontCss() ? \'window.__morpheOrcaFont = true;\\n\' : \'\')\n' +
    '  const fontCss = terminalBundledFontCss(start.fontStyle.font)\n' +
    '  const morpheCss = morpheTerminalFontCss()\n' +
    '  const inlineCss = (fontCss ?? \'\') + morpheCss\n' +
    '  const shell = inlineCss\n' +
    "    ? TERMINAL_HTML_DOCUMENT_SHELL.replace('</head>', () => `<style>${inlineCss}</style>\\n</head>`)\n" +
    '    : TERMINAL_HTML_DOCUMENT_SHELL\n')
  const terminalStyle = 'mobile/src/terminal/preferences/terminal-font-style.ts'
  edit(terminalStyle, 'morpheTerminalLead',
    '/** CSS font-family for a font id; every stack ends in the system mono stack for missing glyphs. */\n' +
    'export function terminalFontFamilyCss(font: TerminalFontId, ios: boolean): string {\n',
    '// Set by the page source when a Morphe font is selected; RN-side callers never see it.\n' +
    'function morpheTerminalLead(): string {\n' +
    "  return (globalThis as { __morpheOrcaFont?: boolean }).__morpheOrcaFont === true ? '\"MorpheOrcaText\", ' : ''\n" +
    '}\n\n' +
    '/** CSS font-family for a font id; every stack ends in the system mono stack for missing glyphs. */\n' +
    'export function terminalFontFamilyCss(font: TerminalFontId, ios: boolean): string {\n')
  edit(terminalStyle, 'morpheTerminalLead() + lead',
    '  return lead + systemMonoStack(ios)\n}',
    '  return morpheTerminalLead() + lead + systemMonoStack(ios)\n}')
  const bridge = 'mobile/src/terminal/document/host-bridge/message-bridge.ts'
  edit(bridge, 'MorpheOrcaText',
    "const TERMINAL_FONT_PROBE = [\n  '13px \"Orca Nerd Font Symbols\", \"Orca Terminal Symbols\"',\n  '\\ue0b0\\u23f5'\n] as const",
    "const TERMINAL_FONT_PROBE: readonly [string, string] =\n  (globalThis as { __morpheOrcaFont?: boolean }).__morpheOrcaFont === true\n" +
    "    ? ['13px \"MorpheOrcaText\", \"Orca Nerd Font Symbols\", \"Orca Terminal Symbols\"', 'A\\ue0b0\\u23f5']\n" +
    "    : ['13px \"Orca Nerd Font Symbols\", \"Orca Terminal Symbols\"', '\\ue0b0\\u23f5']")

  const templates = {
    'morphe-font-store.ts': 'mobile/src/settings/morphe-font-store.ts',
    'morphe-font-terminal.ts': 'mobile/src/settings/morphe-font-terminal.ts',
    'morphe-font.ts': 'mobile/src/settings/morphe-font.ts',
    'morphe-font-section.tsx': 'mobile/src/settings/morphe-font-section.tsx',
    'morphe-font-screen.tsx': 'mobile/src/settings/morphe-font-screen.tsx',
    'morphe-font-route.tsx': 'mobile/app/morphe-font.tsx'
  }
  for (const [template, destination] of Object.entries(templates))
    set(destination, fs.readFileSync(path.join(__dirname, 'ui', template), 'utf8'))

  for (const [file, contents] of changes) {
    fs.mkdirSync(path.dirname(file), { recursive: true })
    if (!fs.existsSync(file) || fs.readFileSync(file, 'utf8') !== contents) fs.writeFileSync(file, contents)
  }
  // The terminal page script is generated from the sources edited above.
  require('node:child_process').execFileSync(process.execPath, ['scripts/build-terminal-document-script.mjs'],
    { cwd: mobile, stdio: 'inherit' })
  const generated = fs.readFileSync(path.join(mobile, 'src/terminal/document/terminal-webview-document-script.generated.ts'), 'utf8')
  if (!generated.includes('MorpheOrcaText')) throw Error('terminal document script was not regenerated with the font')

  // Home's bot rows draw the uploaded picture, not its initial: the same bundle carries it.
  const avatars = require('./bot-avatars.cjs')(source)
  return {
    version,
    files: [...changes.keys(), ...avatars.files.map((file) => path.join(source, file))]
      .map((file) => path.relative(source, file))
  }
}

module.exports = prepareSource
if (require.main === module) {
  if (process.argv.length !== 3) throw Error('Supply the Orca android source checkout')
  const result = prepareSource(process.argv[2])
  process.stdout.write(`Prepared Orca ${result.version} font UI (${result.files.length} files).\n`)
}
