-- =============================================
-- ========== Plugin Loading
-- =============================================
local treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_ok then
	vim_utils.load_plugin_error("nvim-treesitter.configs")
	return
end

-- =============================================
-- ========== Configuration
-- =============================================
local config = {
	-- A list of parser names, or "all"
	ensure_installed = {
		"vim",
		"c",
		"cpp",
		"lua",
		"python",
		"regex",
		"bash",
		"markdown",
		"markdown_inline",
		"gitignore",
		"gitcommit",
	},
	highlight = {
		enable = true,

		-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
		-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
		-- the name of the parser)
		-- list of language that will be disabled
		disable = function(_, bufnr)
			return vim.api.nvim_buf_line_count(bufnr) > 10000
		end,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages

		additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
		enable = true,
	},

	indent = {
		enable = false,
		disable = function(_, bufnr)
			return vim.api.nvim_buf_line_count(bufnr) > 10000
		end,
	},

	-- nvim-ts-autotag plugin
	autotag = {
		enable = true,
	},
	-- nvim-treesitter-textobjects plugin
	textobjects = require("jglez2330.config.treesitter.textobjects"),

	-- playground plugin
	playground = require("jglez2330.config.treesitter.playground"),
    lazy = true,
}

treesitter.setup(config)
