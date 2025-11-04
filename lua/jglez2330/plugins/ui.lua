return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		config = function()
			require("jglez2330.config.ui.noice")
		end,
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		opts = { use_diagnostic_signs = true },
		enabled = true,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			require("jglez2330.config.ui.lualine")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("jglez2330.config.ui.indent")
		end,
	},
}
