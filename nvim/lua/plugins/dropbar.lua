return {
  "Bekaboo/dropbar.nvim",
  config = function()
    require("dropbar").setup({})

    -- jump via the breadcrumb: opens a picker on the trail segments
    vim.keymap.set("n", "<leader>;", function()
      require("dropbar.api").pick()
    end, {})
  end,
}
