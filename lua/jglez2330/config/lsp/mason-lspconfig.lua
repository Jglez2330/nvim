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
    ["hdl_checker"] = function()
        require 'lspconfig'.hdl_checker.setup {
            cmd = { "hdl_checker", "--lsp" },
            filetypes = { "vhdl" },
            root_dir = util.root_pattern('.hdl_checker.config'),
        }
    end,
    ["svlangserver"] = function()
        require 'lspconfig'.svlangserver.setup {
            default_config = {
                cmd = { 'svlangserver' },
                filetypes = { 'verilog', 'systemverilog' },
                root_dir = function(fname)
                    return util.root_pattern '.svlangserver' (fname)
                        or vim.fs.dirname(vim.fs.find('.git', { path = fname, upward = true })[1])
                end,
                single_file_support = true,
                settings = {
                    systemverilog = {
                        includeIndexing = { '*.{v,vh,sv,svh}', '**/*.{v,vh,sv,svh}', '~/Documents/uvm-1.2/**/*.{v,vh,sv,svh}' },
                    },
                },
            },
            docs = {
                description = [[
                                https://github.com/imc-trading/svlangserver

                                Language server for SystemVerilog.

                                `svlangserver` can be installed via `npm`:

                                ```sh
                                $ npm install -g @imc-trading/svlangserver
                                ```
                                ]],
            },
        }
    end,
}
local config = {
    ensure_installed = { "lua_ls", "vhdl_ls", "verible", },
    --automatic_installation = false,
    handlers = handlers,
}


mlspconfig.setup(config)
