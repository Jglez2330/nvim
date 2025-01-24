-- =============================================
-- ========== Plugin Loading
-- =============================================
local mlspconfig_ok, mlspconfig = pcall(require, "mason-lspconfig")
if not mlspconfig_ok then
    jglez2330.load_plugin_error("mason-lspconfig")
    return
end
local util = require 'lspconfig.util'



-- =============================================
-- ========== Configuration
-- =============================================
---@type MasonLspconfigSettings
local handlers = {
    -- The first entry (without key) will be used as the default handler
    -- and will be called on each installed server that does not have
    -- a dedicated config
    --
    function(server_name) -- default handler
        require 'lspconfig'[server_name].setup {}
    end,
    -- Configure verible to format correctly SystermVerilog
    -- Verible is given by the Mason registry
    ["verible"] = function()
        require 'lspconfig'.verible.setup {
            cmd = { "verible-verilog-ls", "--rules=+line-length=length:150,-no-tabs", },
            filetypes = { "verilog", "systemverilog" },
            root_dir = util.find_git_ancestor,
        }
    end,
    ["hdl_checker"] = function ()
        require 'lspconfig'.hdl_checker.setup {
            cmd = { "hdl_checker", "--lsp", },
            filetypes = { "vhdl", "verilog", "systemverilog" },
            root_dir = util.root_pattern('.hdl_checker.config') or util.find_git_ancestor(fname) or util.path.dirname(fname),
        }
    end,
}
local config = {
    ensure_installed = { "lua_ls", "hdl_checker", "vhdl_ls", "verible", },
    --automatic_installation = false,
    handlers = handlers,
}


mlspconfig.setup(config)
