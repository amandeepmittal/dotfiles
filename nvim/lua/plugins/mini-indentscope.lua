return {
	"echasnovski/mini.indentscope",
	config = function()
		require("mini.indentscope").setup({
			symbol = "│",
			options = { try_as_border = true },
		})

		-- no scope line in UI buffers where it looks broken
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "help", "neo-tree", "lazy", "mason" },
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
}
