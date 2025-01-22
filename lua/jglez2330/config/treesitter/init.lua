-- =============================================
-- ========== Plugin Loading
-- =============================================
local treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_ok then jglez2330.load_plugin_error("nvim-treesitter.configs") return end



-- =============================================
-- ========== Configuration
-- =============================================
---@type TSConfig
local config = {
  -- A list of parser names, or "all"
  ensure_installed = {
    "vim",
    "c", "cpp", "lua", "python",
    "regex", "bash", "markdown", "markdown_inline",
    "gitignore", "gitcommit",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = {},

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = function(_, bufnr) return vim.api.nvim_buf_line_count(bufnr) > 10000 end,

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
    disable = function(_, bufnr) return vim.api.nvim_buf_line_count(bufnr) > 10000 end,
  },

  -- nvim-ts-autotag plugin
  autotag = {
    enable = true,
  },

  -- nvim-treesitter-endwise plugin
  -- endwise = { enable = true },

  -- nvim-treesitter-textobjects plugin
  textobjects = require("jglez2330.config.treesitter.textobjects"),

  -- playground plugin
  playground = require("jglez2330.config.treesitter.playground"),

}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.vhdl = {
  install_info = {
    url = "https://github.com/alemuller/tree-sitter-vhdl.git", -- local path or git repo
    files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    branch = "main", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = "vhdl", -- if filetype does not match the parser name
}
treesitter.setup(config)
