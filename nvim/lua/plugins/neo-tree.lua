return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
  },
  lazy = false, -- neo-tree will lazily load itself

  config = function()
    require("neo-tree").setup({
      filesystem = {
        follow_current_file = {
          enabled = true,          -- tree highlights + reveals whatever buffer is active
          leave_dirs_open = false, -- collapse folders you navigate away from
        },
        use_libuv_file_watcher = true,  -- refresh the tree when files change on disk
        commands = {
          -- d sends to macOS Trash (put back from Finder) instead of deleting forever
          delete = function(state)
            local inputs = require("neo-tree.ui.inputs")
            local node = state.tree:get_node()
            inputs.confirm("Trash " .. node.name .. "?", function(confirmed)
              if not confirmed then return end
              vim.fn.system({ "trash", node.path })
              require("neo-tree.sources.manager").refresh(state.name)
            end)
          end,
          delete_visual = function(state, selected_nodes)
            local inputs = require("neo-tree.ui.inputs")
            inputs.confirm("Trash " .. #selected_nodes .. " items?", function(confirmed)
              if not confirmed then return end
              for _, node in ipairs(selected_nodes) do
                vim.fn.system({ "trash", node.path })
              end
              require("neo-tree.sources.manager").refresh(state.name)
            end)
          end,
        },
        filtered_items = {
          visible = true,         -- show filtered files, dimmed
          hide_dotfiles = false,  -- .zshrc, .gitignore, .config
          hide_gitignored = false,
        },
      },
    })
    vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})
    vim.keymap.set('n', '<C-b>', ':Neotree toggle<CR>', {})  -- sidebar on/off, VS Code style
    vim.keymap.set('n', '<leader>gs', ':Neotree git_status<CR>', { desc = 'git status tree' })
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        if vim.fn.argc() == 0 then return end  -- bare launch belongs to the alpha dashboard
        vim.cmd("Neotree show")
      end,
    })
  end,
}

