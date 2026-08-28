return {
  'projekt0n/github-nvim-theme',
  name = 'github-theme',
  lazy = false,
  priority = 1000,
  config = function()
    require("github-theme").setup({
      options = {
        transparent = true,  -- let Ghostty's opacity + blur show through the editor
      },
    })
    vim.cmd.colorscheme "github_dark_high_contrast"
  end,
}
