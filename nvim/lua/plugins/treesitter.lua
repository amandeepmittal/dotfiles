return {
  'nvim-treesitter/nvim-treesitter',
  branch = "main",
  lazy = false,
  build = ':TSUpdate',
  config = function()
    -- .mdx has no grammar of its own: invent the filetype, borrow markdown's parser
    vim.filetype.add({ extension = { mdx = "mdx" } })
    vim.treesitter.language.register("markdown", "mdx")

    -- parser names (tree-sitter vocabulary)
    -- markdown + markdown_inline ship with Neovim, so they are not listed
    require("nvim-treesitter").install({
      "lua",
      "javascript",  -- .js and .jsx, the grammar includes JSX
      "typescript",  -- .ts only
      "tsx",         -- .tsx, separate grammar from typescript
      "json",        -- app.json, package.json; also covers the jsonc filetype
      "yaml",        -- frontmatter, GitHub workflows
      "toml",        -- starship.toml and friends
      "css",
      "bash",        -- shell snippets
      "html",
      "astro",       -- blog; injects typescript and css internally
      "kotlin",      -- expo docs native code samples
      "swift",       -- expo docs native code samples
    })

    -- filetype names (Vim vocabulary), not the same words as above
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "lua",
        "javascript", "javascriptreact",
        "typescript", "typescriptreact",
        "json", "jsonc",
        "yaml", "toml",
        "css",
        "sh", "bash",
        "html",
        "markdown", "mdx",
        "astro",
        "kotlin", "swift",
      },
      callback = function()
        vim.treesitter.start()  --highlight
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"  --indent
      end,
    })
  end,
}
