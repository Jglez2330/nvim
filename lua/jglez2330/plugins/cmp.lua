-- NOTE: This module is for code completion, will be loaded in `InsertEnter` event.

---@type LazySpec[]
local cmp = {
	-- =============================================
	-- ========== Completion
	-- =============================================
	{
		-- DESC: neovim code completion config plugin.
		"hrsh7th/nvim-cmp",
		dependencies = {
			-- -----------------------------------
			-- -------- Completion Sources
			-- -----------------------------------
			-- DESC: buffer completion source for nvim-cmp.
			"hrsh7th/cmp-buffer",
			-- DESC: language server protocol completion source for nvim-cmp.
			"hrsh7th/cmp-nvim-lsp",
			-- DESC: path completion source for nvim-cmp.
			"hrsh7th/cmp-path",
			-- DESC: command line completion source for nvim-cmp.
			"hrsh7th/cmp-cmdline",
			{
				-- DESC: L3MON4D3/LuaSnip plugin completion source for nvim-cmp.
				"saadparwaiz1/cmp_luasnip",
				dependencies = { "L3MON4D3/LuaSnip" },
			},
			-- DESC: zsh completion source for nvim-cmp.
			"tamago324/cmp-zsh",
			-- DESC: calculation source for nvim-cmp.
			"hrsh7th/cmp-calc",
			-- -----------------------------------
			-- -------- Snippets
			-- -----------------------------------
			{
				-- DESC: a powerful code snippets engine.
				"L3MON4D3/LuaSnip",
				dependencies = {
					{
						-- DESC: an abundant code snippet repository (can be loaded into LuaSnip).
						"rafamadriz/friendly-snippets",
						enabled = true,
					},
				},
			},
		},
		config = function()
			require("jglez2330.config.cmp.nvm_cmp")
		end,
	},
	{
		-- DESC: show signature help in a small pop window.
		"echasnovski/mini.completion",
		config = function()
			require("jglez2330.config.mini.completion")
		end,
		event = { "InsertEnter" },
	},
}

return cmp
