return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>g", group = "git" },
      { "<leader>c", group = "code" },
      { "<leader>ca", desc = "code action" },
      { "<leader>f", desc = "format buffer" },
      { "<leader>fg", desc = "grep in files" },
      { "<leader>i", desc = "toggle inlay hints" },
      { "<leader>x", desc = "close tab" },
      { "<leader>;", desc = "pick breadcrumb" },
      { "<leader>gp", desc = "preview git hunk" },
      { "<leader>gr", desc = "reset git hunk" },
      { "<leader>gb", desc = "toggle git blame" },
      { "yy", desc = "copy (yank) line" },
      { "dd", desc = "cut (delete) line" },
      { "cc", desc = "change line" },
    },
  },
}
