return {
  "brenoprata10/nvim-highlight-colors",
  config = function()
    require("nvim-highlight-colors").setup({
      render = "virtual",      -- a swatch square beside the color instead of painting it
      virtual_symbol = "■",
      enable_tailwind = true,  -- bg-slate-900 and friends get their real color
    })
  end,
}
