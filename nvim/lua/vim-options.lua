-- Custom vim options for Neovim
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.title = true
vim.opt.titlestring = "%t"
vim.opt.keymodel = "startsel,stopsel"
vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.opt.wildignore:append("*/node_modules/*")
vim.opt.scrolloff = 10
vim.opt.autoindent = true 
vim.opt.shiftround = true

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.keymap.set("v", "<D-c>", '"+y')
vim.keymap.set("v", "<D-x>", '"+d')
vim.keymap.set({ "n", "v" }, "<D-v>", '"+p')
vim.keymap.set("i", "<D-v>", "<C-r>+")
-- visual mode: Tab / Shift-Tab indent and keep the selection (tap repeatedly)
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- floating windows (hover, diagnostics): elevated background + visible border
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1c2128" })
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#71b7ff", bg = "#1c2128" })
    -- diagnostic severity as heat: amber hint → orange info → deep-orange warn → red error
    vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#e3b166" })
    vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#e89a5c" })
    vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#e0764f" })
    vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#f85149" })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = "#e3b166" })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = "#e89a5c" })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "#e0764f" })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#f85149" })
    -- the theme defines VirtualText groups itself, so the ramp must claim them explicitly
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#e3b166" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#e89a5c" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#e0764f" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#f85149" })
  end,
})

vim.diagnostic.config({
  -- always-visible inline text, truncated so it never clips at the screen edge;
  -- the full message is one Ctrl-W d float away
  virtual_text = {
    format = function(d)
      if #d.message > 60 then
        return d.message:sub(1, 57) .. "…"
      end
      return d.message
    end,
  },
  float = { border = "rounded" },
})
