-- =============================================
-- ========== Plugin Loading
-- =============================================
local neodev_ok, neodev = pcall(require, "neodev")
if not neodev_ok then Fau_vim.load_plugin_error("neodev") return end



-- =============================================
-- ========== Configuration
-- =============================================
---@type LuaDevOptions
local config = {
  library = {
    enabled = true,  -- when not enabled, neodev will not change any settings to the LSP server
    runtime = true,  -- runtime path
    types   = true,  -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others [nice!]
    plugins = true,  -- installed opt or start plugins in packpath
    -- plugins = { "nvim-lspconfig", "null-ls.nvim", "telescope" },
  },
  setup_jsonls = false, -- configures jsonls to provide completion for project specific .luarc.json files
  -- override = function(root_dir, library)
  --  library.enabled = true
  --  library.plugins = true
  -- end,
  lspconfig = true, -- if true, Neodev will automatically setup your lua-language-server
  pathStrict = true,
}


neodev.setup(config)