vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.number = true      -- line numbers in the gutter
vim.opt.signcolumn = "yes" -- gutter always reserved; no text shift when signs appear
vim.opt.title = true       -- terminal tab title shows the file being edited
vim.opt.breakindent = true -- wrapped lines keep their indentation
vim.opt.wildignore:append("*/node_modules/*")  -- keep :find and completion out of the pit
vim.opt.scrolloff = 10          -- keep 10 lines of context above/below the cursor
vim.opt.inccommand = "split"    -- :%s preview panel shows every affected line live
vim.opt.autoindent = true  -- new lines inherit the current indent
vim.opt.shiftround = true  -- > and < snap indents to multiples of shiftwidth
-- visual mode: Tab / Shift-Tab indent and keep the selection (tap repeatedly)
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

vim.opt.keymodel = "startsel,stopsel"  -- shift+arrows start/stop selection, VS Code style
vim.opt.clipboard = "unnamedplus"      -- yank/delete/paste talk to the macOS clipboard
vim.g.mapleader = " "

-- Cmd-key copy/cut/paste. These only fire if the terminal passes Cmd through
-- (Ghostty owns cmd+c/v by default; see keybind = super+c=unbind).
vim.keymap.set("v", "<D-c>", '"+y')
vim.keymap.set("v", "<D-x>", '"+d')
vim.keymap.set({ "n", "v" }, "<D-v>", '"+p')
vim.keymap.set("i", "<D-v>", "<C-r>+")

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
-- add the word under cursor to the dictionary (the one memory all prose tools defer to)
vim.keymap.set("n", "<leader>a", function()
  local word = vim.fn.expand("<cword>")
  vim.cmd("normal! zg")
  vim.notify("Added '" .. word .. "' to the dictionary", vim.log.levels.INFO)
end, { desc = "add word to dictionary" })

-- one dictionary, versioned with the config; zg / <leader>a append here
vim.opt.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"

-- spell checking for prose; the @nospell queries keep it out of code-ish lines
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "mdx", "gitcommit" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_us"
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
