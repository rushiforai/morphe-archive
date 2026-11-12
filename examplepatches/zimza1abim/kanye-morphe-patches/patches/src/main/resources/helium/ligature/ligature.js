// Keeps web-font ligature logos/icons (e.g. Google Play's "google_logo") in
// their original web font. The custom-font engine preserves families whose
// names look like icon fonts, so each such word gets an icon-named alias of
// the page's own font. Only words that the web font really shapes into fewer
// glyphs are touched; all other text keeps the custom-font rules.
(() => {
  if (window.__fontismLigature) return;
  window.__fontismLigature = true;

  const TOKEN = /[A-Za-z][A-Za-z0-9]*(?:_[A-Za-z0-9]+)+/g;
  const ZWNJ = '‌';
  const MARK = 'data-fontism-ligature';
  const aliases = new Map(); // web family -> Promise<alias family | null>
  const canvas = document.createElement('canvas').getContext('2d');
  let aliasCount = 0;

  // Families the native engine already keeps in their web font.
  const NATIVELY_PRESERVED = /material icons|material symbols|glyphicons/i;
  const unquote = (name) => name.trim().replace(/^["']|["']$/g, '');

  function fontFaceRules(family) {
    const rules = [];
    const visit = (list) => {
      for (const rule of list) {
        if (rule instanceof CSSFontFaceRule) {
          if (unquote(rule.style.getPropertyValue('font-family')) === family) rules.push(rule);
        } else if (rule.cssRules) {
          visit(rule.cssRules);
        }
      }
    };
    for (const sheet of document.styleSheets) {
      try { visit(sheet.cssRules); } catch (e) { /* cross-origin sheet */ }
    }
    return rules;
  }

  function aliasFor(family) {
    if (aliases.has(family)) return aliases.get(family);
    const promise = (async () => {
      const rules = fontFaceRules(family);
      if (!rules.length) return null;
      const alias = `Material Symbols Fontism ${++aliasCount}`;
      const faces = [];
      for (const rule of rules) {
        const style = rule.style;
        const descriptors = {};
        for (const key of ['weight', 'style', 'stretch', 'unicodeRange', 'featureSettings']) {
          const value = style.getPropertyValue(`font-${key.replace(/[A-Z]/g, (c) => '-' + c.toLowerCase())}`) ||
            (key === 'unicodeRange' ? style.getPropertyValue('unicode-range') : '');
          if (value) descriptors[key] = value;
        }
        try {
          const face = new FontFace(alias, style.getPropertyValue('src'), descriptors);
          document.fonts.add(face);
          faces.push(face);
        } catch (e) { /* unsupported descriptor */ }
      }
      return faces.length ? alias : null;
    })();
    aliases.set(family, promise);
    return promise;
  }

  async function shapesAsLigature(alias, token, style) {
    const font = `${style.fontStyle} ${style.fontWeight} 32px "${alias}"`;
    try { await document.fonts.load(font, token); } catch (e) { return false; }
    canvas.font = font;
    const joined = canvas.measureText(token).width;
    const broken = canvas.measureText(token.split('').join(ZWNJ)).width;
    return Math.abs(joined - broken) > 1;
  }

  function webFamilyOf(element) {
    for (const name of getComputedStyle(element).fontFamily.split(',')) {
      const family = unquote(name);
      if (!family) continue;
      for (const face of document.fonts) {
        if (unquote(face.family) === family) {
          return NATIVELY_PRESERVED.test(family) ? null : family;
        }
      }
      return null; // first family is not a web font
    }
    return null;
  }

  async function processTextNode(node) {
    const parent = node.parentElement;
    if (!parent || parent.closest(`[${MARK}],script,style,textarea,input,code,pre,[contenteditable]`)) return;
    const text = node.nodeValue;
    TOKEN.lastIndex = 0;
    const tokens = [...text.matchAll(TOKEN)];
    if (!tokens.length) return;
    const family = webFamilyOf(parent);
    if (!family) return;
    const alias = await aliasFor(family);
    if (!alias) return;
    const style = getComputedStyle(parent);
    const hits = [];
    for (const match of tokens) {
      if (await shapesAsLigature(alias, match[0], style)) hits.push(match);
    }
    if (!hits.length || node.nodeValue !== text || !node.parentNode) return;
    const fragment = document.createDocumentFragment();
    let cursor = 0;
    for (const match of hits) {
      fragment.append(text.slice(cursor, match.index));
      const span = document.createElement('span');
      span.setAttribute(MARK, '');
      span.style.fontFamily = `"${alias}", ${style.fontFamily}`;
      span.textContent = match[0];
      fragment.append(span);
      cursor = match.index + match[0].length;
    }
    fragment.append(text.slice(cursor));
    node.replaceWith(fragment);
  }

  function scan(root) {
    const walker = document.createTreeWalker(root, NodeFilter.SHOW_TEXT, {
      acceptNode: (n) => (n.nodeValue.includes('_') ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_REJECT),
    });
    const nodes = [];
    while (walker.nextNode()) nodes.push(walker.currentNode);
    nodes.forEach((n) => processTextNode(n).catch(() => {}));
  }

  let pending = [];
  let timer = 0;
  const flush = () => {
    timer = 0;
    const roots = pending;
    pending = [];
    roots.forEach((r) => r.isConnected && scan(r));
  };
  new MutationObserver((records) => {
    for (const record of records) {
      for (const added of record.addedNodes) {
        if (added.nodeType === Node.ELEMENT_NODE || added.nodeType === Node.TEXT_NODE) {
          pending.push(added.nodeType === Node.TEXT_NODE ? added.parentNode : added);
        }
      }
      if (record.type === 'characterData' && record.target.parentNode) pending.push(record.target.parentNode);
    }
    if (pending.length && !timer) timer = setTimeout(flush, 200);
  }).observe(document.documentElement, { childList: true, subtree: true, characterData: true });

  const start = () => document.fonts.ready.then(() => scan(document.body || document.documentElement));
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', start, { once: true });
  else start();
})();
