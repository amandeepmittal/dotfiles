return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",        -- the artist formerly known as tsserver
          "astro",        -- the blog
          "marksman",     -- markdown + mdx (filetypes extended below)
          "yamlls",       -- frontmatter, GitHub workflows
          "jsonls",       -- app.json, tsconfig, with schemas
          "cssls",
          "html",
          "tailwindcss",  -- expo docs styling
          "eslint",       -- project lint + fix-all code action
          "oxlint",       -- oxc linter, fast diagnostics
          "mdx_analyzer", -- type errors inside MDX (uses the project's typescript)
          "typos_lsp",    -- transposition insurance, everywhere
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    config = function()
      -- every server advertises blink's completion capabilities (snippets etc.)
      vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities() })
      vim.keymap.set('n', 'K', function()
        vim.lsp.buf.hover({ border = "rounded" })
      end, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n' }, '<leader>ca', vim.lsp.buf.code_action, {})
      -- marksman ships for markdown only; extend it to our invented mdx filetype
      vim.lsp.config("marksman", {
        filetypes = { "markdown", "markdown.mdx", "mdx" },
      })

      -- per-server settings, layered onto lspconfig's database (0.12 native API)
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },  -- lua_ls, meet Neovim
            hint = { enable = true },               -- emit inlay hints
          },
        },
      })

      vim.lsp.config("ts_ls", {
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "literals",  -- label only literal args
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",       -- JS gets chattier labels
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
            },
          },
        },
      })

      -- inlay hints: off by default, <leader>i toggles them for the current buffer
      vim.keymap.set("n", "<leader>i", function()
        local buf = vim.api.nvim_get_current_buf()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }), { bufnr = buf })
      end, {})
    end
  },
}
