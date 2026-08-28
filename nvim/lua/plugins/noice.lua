return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim", -- already on disk, neo-tree brought it
		{
			"rcarriga/nvim-notify",
			opts = {
				timeout = 3000,              -- toasts linger 3s instead of 5
				render = "wrapped-compact",  -- tidy multi-line messages
				background_colour = "#0a0c10",  -- needed with a transparent theme; editor-dark from the palette
			},
		},
	},
	opts = {
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
			},
		},
		presets = {
			command_palette = true, -- ':' opens the centered palette
			bottom_search = true, -- '/' stays classic, at the bottom
			long_message_to_split = true, -- big outputs get a real split, not a flash
			lsp_doc_border = true, -- borders on hover/signature docs
		},
		views = {
			cmdline_popup = {
				position = { row = "40%", col = "50%" }, -- dead center; tweak row to taste
			},
			cmdline_popupmenu = {
				position = { row = "57%", col = "50%" }, -- completion menu just below the box
			},
		},
		routes = {
			-- drop the useless "No information available" hover notifications
			{
				filter = { event = "notify", find = "No information available" },
				opts = { skip = true },
			},
		},
	},
}
