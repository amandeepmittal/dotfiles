return {
	-- Code::Stats: XP per keystroke. Lua client; the official plugin needs a
	-- python provider this setup doesn't have. Key comes from the environment,
	-- never from this repo.
	{
		"liljaylj/codestats.nvim",
		event = "VeryLazy",
		config = function()
			local key = os.getenv("CODESTATS_API_KEY")
			if not key or key == "" then
				vim.notify("CODESTATS_API_KEY not set; Code::Stats idle", vim.log.levels.WARN)
				return
			end
			require("codestats").setup({ api_key = key })
		end,
	},

	-- WakaTime: prompts for its API key on first launch, stores it in ~/.wakatime.cfg
	{ "wakatime/vim-wakatime", event = "VeryLazy" },
}
