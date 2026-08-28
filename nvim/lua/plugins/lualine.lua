return {
  "nvim-lualine/lualine.nvim",
  config = function()
    -- word count for prose buffers; counts the selection while one is active
    local function wordcount()
      local ft = vim.bo.filetype
      if ft ~= "markdown" and ft ~= "mdx" then
        return ""
      end
      local wc = vim.fn.wordcount()
      return (wc.visual_words or wc.words) .. " words"
    end

    -- commits ahead/behind upstream (↑ to push, ↓ to pull)
    local git_ab = ""
    local function update_git_ab()
      vim.system(
        { "git", "rev-list", "--count", "--left-right", "@{upstream}...HEAD" },
        { text = true },
        function(out)
          if out.code ~= 0 then
            git_ab = ""
            return
          end
          local behind, ahead = out.stdout:match("(%d+)%s+(%d+)")
          local parts = {}
          if ahead and ahead ~= "0" then table.insert(parts, "↑" .. ahead) end
          if behind and behind ~= "0" then table.insert(parts, "↓" .. behind) end
          git_ab = table.concat(parts, " ")
        end
      )
    end
    vim.api.nvim_create_autocmd({ "FocusGained", "BufWritePost", "BufEnter" }, {
      callback = update_git_ab,
    })
    update_git_ab()

    require("lualine").setup({
      options = {
        theme = "jellybeans",
        globalstatus = true,  -- one bar for the whole editor, neo-tree included
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", function() return git_ab end, "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1, symbols = { modified = "●", readonly = "󰌾" } } },  -- dot = unsaved, lock = readonly
        lualine_x = { "filetype" },                -- drops encoding + fileformat clutter
        lualine_y = { wordcount, "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
