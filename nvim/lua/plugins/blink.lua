return {
  {
    "saghen/blink.cmp",
    version = "1.*",  -- release tags ship a prebuilt matcher binary, no Rust needed
    dependencies = { "rafamadriz/friendly-snippets" },
    -- opts is lazy.nvim shorthand: it calls require("blink.cmp").setup(opts)
    opts = {
      keymap = { preset = "enter" },  -- Enter accepts, Tab/S-Tab move through the list
      cmdline = { enabled = false },  -- Enter must execute :lua commands, not accept completions
      appearance = { nerd_font_variant = "mono" },
      completion = {
        documentation = { auto_show = true },  -- docs float beside the menu
      },
      signature = { enabled = true },  -- parameter hints while typing a call
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "lazydev" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,  -- rank Neovim API results above plain lsp
          },
        },
      },
    },
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",  -- only loads for lua buffers
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}
