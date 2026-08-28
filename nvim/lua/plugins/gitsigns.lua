return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      current_line_blame_opts = { delay = 500 },
    })

    local gs = require("gitsigns")
    vim.keymap.set("n", "]h", function() gs.nav_hunk("next") end, {})  -- jump to next change
    vim.keymap.set("n", "[h", function() gs.nav_hunk("prev") end, {})  -- jump to previous change
    vim.keymap.set("n", "<leader>gp", gs.preview_hunk, {})             -- float showing the diff under cursor
    vim.keymap.set("n", "<leader>gr", gs.reset_hunk, {})               -- restore hunk from the index (u undoes)
    vim.keymap.set("n", "<leader>gb", gs.toggle_current_line_blame, {})-- who-wrote-this ghost text, on a switch
  end,
}
