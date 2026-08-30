return {
  'projekt0n/github-nvim-theme',
  name = 'github-theme',
  lazy = false,
  priority = 1000,
  config = function()
    require("github-theme").setup({
      options = {
        transparent = true,
      },
      groups = {
        all = {
          NeoTreeCursorLine = { bg = "sel0", style = "bold" },
          NeoTreeTabActive = { fg = "fg1", bg = "sel0", style = "bold" },
          NeoTreeTabInactive = { fg = "fg3", bg = "bg1" },
          NeoTreeTabSeparatorActive = { fg = "sel0", bg = "sel0" },
          NeoTreeTabSeparatorInactive = { fg = "bg1", bg = "bg1" },
        },
      },
    })
    vim.cmd.colorscheme "github_dark_high_contrast"
  end,
}