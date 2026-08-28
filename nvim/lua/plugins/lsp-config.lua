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
          "harper_ls",    -- grammar and style, prose only (filetypes below)
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

      -- harper: prose-only grammar. Baseline rules off here; rules you switch off
      -- with <leader>hd persist in harper-disabled.json next to this config.
      local harper_disabled_path = vim.fn.stdpath("config") .. "/harper-disabled.json"
      local function harper_disabled()
        local ok, data = pcall(function()
          return vim.json.decode(table.concat(vim.fn.readfile(harper_disabled_path), "\n"))
        end)
        return (ok and type(data) == "table") and data or {}
      end
      local function harper_linters()
        local linters = {
          SpellCheck = false,  -- vim's spell owns spelling
          SplitWords = false,  -- tech compounds are canon: frontmatter, keymap, changelog
          UseTitleCase = false, -- expo house style is sentence-case headings
          Matcher = false,      -- the "use X instead of Y" table; config/docs/repo are house register
        }
        for _, rule in ipairs(harper_disabled()) do
          linters[rule] = false
        end
        return linters
      end
      vim.lsp.config("harper_ls", {
        filetypes = { "markdown", "mdx", "gitcommit" },
        settings = { ["harper-ls"] = { linters = harper_linters() } },
      })

      -- switch off the harper rule under the cursor, permanently and live
      vim.keymap.set("n", "<leader>hd", function()
        local rule
        local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
        for _, d in ipairs(vim.diagnostic.get(0, { lnum = lnum })) do
          if (d.source or ""):lower():find("harper") then
            rule = (type(d.code) == "string" and d.code) or d.message:match("^(%a+):")
            if rule then break end
          end
        end
        if not rule then
          vim.notify("No harper finding on this line", vim.log.levels.WARN)
          return
        end
        local list = harper_disabled()
        if not vim.tbl_contains(list, rule) then
          table.insert(list, rule)
          vim.fn.writefile({ vim.json.encode(list) }, harper_disabled_path)
        end
        for _, client in ipairs(vim.lsp.get_clients({ name = "harper_ls" })) do
          client.settings = vim.tbl_deep_extend("force", client.settings or {}, {
            ["harper-ls"] = { linters = { [rule] = false } },
          })
          client.notify("workspace/didChangeConfiguration", { settings = client.settings })
        end
        vim.notify("Harper rule '" .. rule .. "' switched off", vim.log.levels.INFO)
      end, { desc = "disable harper rule under cursor" })

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
