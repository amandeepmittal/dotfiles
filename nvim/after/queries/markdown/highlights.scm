; extends
; Companion to the MDX injections: no spell checking on code-like lines.

((inline) @_inline
  (#lua-match? @_inline "^%s*import")) @nospell

((inline) @_inline
  (#lua-match? @_inline "^%s*export")) @nospell

((inline) @_inline
  (#lua-match? @_inline "^%s*<")) @nospell
