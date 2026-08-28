return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons", "echasnovski/mini.bufremove" },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",           -- one tab per open file, VS Code style
        diagnostics = "nvim_lsp",   -- error/warning dot on a tab with problems
        offsets = {
          {
            filetype = "neo-tree",  -- tab strip starts after the sidebar, not over it
            text = "Files",
            text_align = "left",
            separator = true,
          },
        },
      },
      highlights = {
        fill = { bg = "#0a0c10" },                        -- strip background, editor-dark
        background = { fg = "#7d8590", bg = "#0a0c10" },  -- inactive tabs, dimmed
        buffer_selected = { fg = "#f0f3f6", bg = "#1c2128", bold = true, italic = false },
        close_button = { fg = "#7d8590", bg = "#0a0c10" },
        close_button_selected = { bg = "#1c2128" },
        modified = { bg = "#0a0c10" },
        modified_selected = { bg = "#1c2128" },
        indicator_selected = { fg = "#71b7ff", bg = "#1c2128" },  -- blue edge on the active tab
        separator = { fg = "#0a0c10", bg = "#0a0c10" },
      },
    })

    -- cycle through the tabs
    vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", {})
    vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", {})
    vim.keymap.set("n", "<leader>x", function()
      require("mini.bufremove").delete(0, false)
    end, {})  -- close the current tab, keep the window layout
  end,
}
