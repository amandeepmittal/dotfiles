return {
  "stevearc/conform.nvim",
  config = function()
    -- prose formats are hand-styled (expo docs pages, the blog vault):
    -- never auto-format them on save; <leader>f still formats on demand
    local no_autoformat_ft = { markdown = true, mdx = true }

    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "oxfmt" },
        javascriptreact = { "oxfmt" },
        typescript = { "oxfmt" },
        typescriptreact = { "oxfmt" },
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        markdown = { "prettier" },
        mdx = { "prettier" },
        astro = { "prettier" },  -- needs prettier-plugin-astro in the project
      },
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        if no_autoformat_ft[vim.bo[bufnr].filetype] then
          return
        end
        return { timeout_ms = 1000, lsp_format = "fallback" }
      end,
    })

    -- manual format: whole buffer in normal mode, selection in visual mode
    vim.keymap.set({ "n", "v" }, "<leader>f", function()
      require("conform").format({ lsp_format = "fallback" })
    end, {})

    -- kill switch: :FormatDisable for everywhere, :FormatDisable! for this buffer
    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, { bang = true })
    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {})
  end,
}
