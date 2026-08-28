; Full replacement for the runtime markdown injections (deliberately NOT
; using "; extends"). With extends, code-like inline nodes were injected
; as BOTH markdown_inline and tsx, and markdown_inline rendered Expo's
; "~/ui/..." import paths as strikethrough (tilde pairs = GFM strikethrough).
; Base stanzas copied from nvim-treesitter runtime/queries/markdown/injections.scm.
; MDX idea: https://phelipetls.github.io/posts/mdx-syntax-highlight-treesitter-nvim/

(fenced_code_block
  (info_string
    (language) @injection.language)
  (code_fence_content) @injection.content)

((html_block) @injection.content
  (#set! injection.language "html")
  (#set! injection.combined)
  (#set! injection.include-children))

((minus_metadata) @injection.content
  (#set! injection.language "yaml")
  (#offset! @injection.content 1 0 -1 0)
  (#set! injection.include-children))

((plus_metadata) @injection.content
  (#set! injection.language "toml")
  (#offset! @injection.content 1 0 -1 0)
  (#set! injection.include-children))

((pipe_table_cell) @injection.content
  (#set! injection.language "markdown_inline"))

; prose: every inline that does not look like MDX code
((inline) @injection.content
  (#not-lua-match? @injection.content "^%s*import")
  (#not-lua-match? @injection.content "^%s*export")
  (#not-lua-match? @injection.content "^%s*<")
  (#set! injection.language "markdown_inline"))

; MDX: ESM import/export lines and JSX blocks are tsx, and only tsx
((inline) @injection.content
  (#lua-match? @injection.content "^%s*import")
  (#set! injection.language "tsx"))

((inline) @injection.content
  (#lua-match? @injection.content "^%s*export")
  (#set! injection.language "tsx"))

((inline) @injection.content
  (#lua-match? @injection.content "^%s*<")
  (#set! injection.language "tsx"))
