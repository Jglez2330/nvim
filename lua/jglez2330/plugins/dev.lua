return {
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	{
		"Theprimeagen/harpoon",
		branch = "harpoon2",
		config = function()
			require("jglez2330.config.dev.harpoon")
		end,
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("jglez2330.config.dev.gitsigns")
		end,
	},
}
