// No native imports: the terminal page builder reads this synchronously while it
// assembles the terminal WebView's HTML string.

let fontCss = ''

/** The selected face as an inline @font-face for the terminal page; empty for the system default. */
export function morpheTerminalFontCss(): string {
  return fontCss
}

export function setMorpheTerminalFontCss(next: string): void {
  fontCss = next
}
