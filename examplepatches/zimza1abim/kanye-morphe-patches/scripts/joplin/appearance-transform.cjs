// Locate the settings-section AST, not adjacent lines or bytecode offsets.
const fs = require('node:fs');
const path = require('node:path');
module.exports = function planAppearance(source) {
  const ts = require(path.join(source, 'node_modules/typescript'));
  const file = path.join(source, 'packages/app-mobile/components/screens/ConfigScreen/ConfigScreen.tsx');
  const text = fs.readFileSync(file, 'utf8');
  const tree = ts.createSourceFile(file, text, ts.ScriptTarget.Latest, true, ts.ScriptKind.TSX);
  if (tree.parseDiagnostics.length) throw Error('Settings source has syntax errors');
  const matches = [], existing = [];
  function walk(node) {
    if (ts.isCallExpression(node) && node.arguments.some(a => ts.isStringLiteral(a) && a.text === 'morphe_custom_font')) existing.push(node);
    if (ts.isIfStatement(node) && ts.isBinaryExpression(node.expression)) {
      const e = node.expression;
      if (e.operatorToken.kind === ts.SyntaxKind.EqualsEqualsEqualsToken && ts.isPropertyAccessExpression(e.left)
          && e.left.name.text === 'name' && ts.isIdentifier(e.left.expression)
          && ts.isStringLiteral(e.right) && e.right.text === 'sync'
          && ts.isBlock(node.parent) && node.parent.statements.some(s => ts.isVariableStatement(s)
            && s.declarationList.declarations.some(d => ts.isIdentifier(d.name) && d.name.text === 'addSettingButton'))) matches.push(node);
    }
    ts.forEachChild(node, walk);
  }
  walk(tree);
  if (existing.length === 1) return () => {};
  if (existing.length || matches.length !== 1) throw Error('Appearance section structure changed; refusing an ambiguous insertion');
  const node = matches[0];
  const start = text.lastIndexOf('\n', node.getStart(tree)) + 1;
  const indent = text.slice(start, node.getStart(tree));
  const section = node.expression.left.expression.text;
  const lines = [
    `if (${section}.name === 'appearance') {`,
    `\taddSettingButton('morphe_custom_font', 'Custom font', () => {`,
    `\t\tvoid Linking.openURL('joplin-font://settings').catch(error => Alert.alert('Font settings unavailable', String(error)));`,
    `\t}, { description: 'Font for all Joplin text. Icons and emoji keep theirs.' });`,
    `}`, '',
  ];
  const next = text.slice(0, start) + lines.map(x => indent + x + '\n').join('') + text.slice(start);
  return () => fs.writeFileSync(file, next);
};
