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
			"nvim-telescope/telescope.nvim",
		},
	},
	{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		opts = { use_diagnostic_signs = true },
		enabled = true,
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bigfile = { enabled = true },
			dashboard = { enabled = true },
			explorer = { enabled = false },
			indent = { enabled = true },
			input = {
				enabled = true,
				icon = " ",
				icon_hl = "SnacksInputIcon",
				icon_pos = "left",
				prompt_pos = "title",
				win = { style = "input" },
				expand = true,
			},
			picker = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
			win = {
				enabled = true,
				show = true,
				fixbuf = true,
				relative = "editor",
				position = "float",
				minimal = true,
				wo = {
					winhighlight = "Normal:SnacksNormal,NormalNC:SnacksNormalNC,WinBar:SnacksWinBar,WinBarNC:SnacksWinBarNC,FloatTitle:SnacksTitle,FloatFooter:SnacksFooter,WinSeparator:SnacksWinSeparator",
				},
				bo = {},
				title_pos = "center",
				keys = {
					q = "close",
				},
				footer_pos = "center",
				footer_keys = false,
				border = "rounded",
			},
		},
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
