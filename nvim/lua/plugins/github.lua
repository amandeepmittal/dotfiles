return {
  'projekt0n/github-nvim-theme',
  name = 'github-theme',
  lazy = false,
  priority = 1000,
  config = function()
    require("github-theme").setup({
      options = {
        transparent = true, -- disables setting the background color, use Ghostty's settings
      },
      groups = {
        all = {
          NeoTreeCursorLine = { bg = "sel0", style = "bold" },
        },
      },
    })
    vim.cmd.colorscheme "github_dark_high_contrast"
  end,
}