return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
        -- lazy = true,
        -- event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
}
