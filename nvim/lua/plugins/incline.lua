return {
  "b0o/incline.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local devicons = require("nvim-web-devicons")
    require("incline").setup({
      hide = { only_win = true },  -- badges only when there are splits; bufferline covers the rest
      ignore = {
        filetypes = { "neo-tree", "alpha" },  -- no badges on the sidebar or dashboard
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if filename == "" then
          filename = "[No Name]"
        end
        local icon, color = devicons.get_icon_color(filename)
        return {
          icon and { " ", icon, " ", guifg = color } or " ",
          filename,
          vim.bo[props.buf].modified and { " ●", guifg = "#d29922" } or "",
          " ",
        }
      end,
    })
  end,
}
