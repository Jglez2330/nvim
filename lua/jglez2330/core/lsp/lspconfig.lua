-- =============================================
-- ========== Plugin Loading
-- =============================================
-- -----------------------------------
-- -------- Necessary
-- -----------------------------------
local lsp = require('lsp-zero').preset({})
lsp.preset("recommended")


lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
        vim.tbl_extend("force", opts, { desc = "Go To Definition" }))
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
        vim.tbl_extend("force", opts, { desc = "Symbol Information" }))
    vim.keymap.set("n", "<leader>lw", function() vim.lsp.buf.workspace_symbol() end,
        vim.tbl_extend("force", opts, { desc = "Workspace Symbol" }))
    vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end,
        vim.tbl_extend("force", opts, { desc = "Float diagnostic" }))
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end,
        vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end,
        vim.tbl_extend("force", opts, { desc = "Previous diagnostic" }))
    vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end,
        vim.tbl_extend("force", opts, { desc = "Code Action" }))
    vim.keymap.set("n", "<leader>lp", function() vim.lsp.buf.references() end,
        vim.tbl_extend("force", opts, { desc = "Symbol references" }))
    vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end,
        vim.tbl_extend("force", opts, { desc = "Symbol Rename" }))
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
        vim.tbl_extend("force", opts, { desc = "Signature Help" }))
end)


-- -- Only define once
if not require'lspconfig.configs'.hdl_checker then
  require'lspconfig.configs'.hdl_checker = {
    default_config = {
    cmd = {"hdl_checker", "--lsp", };
    filetypes = {"vhdl", "verilog", "systemverilog"};
      root_dir = function(fname)
        -- will look for the .hdl_checker.config file in parent directory, a
        -- .git directory, or else use the current directory, in that order.
        local util = require'lspconfig'.util
        return util.root_pattern('.hdl_checker.config.json')(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
      end;
      settings = {};
    };
  }
end

require'lspconfig'.hdl_checker.setup{}
require'lspconfig'.jedi_language_server.setup{}
require'lspconfig'.sourcekit.setup{cmd = {'/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp'}}

-- (Optional) Configure lua language server for neovim
-- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
--
-- -- Only define once
-- local lspconfig = require 'lspconfig'
-- local configs = require 'lspconfig.configs'
--
-- -- Manual add rust_hdl server
-- if not configs.rust_hdl then
--   configs.rust_hdl = {
--     default_config = {
--       cmd = {'vhdl_ls'};
--       filetypes = { "vhdl" };
--       root_dir = function(fname)
--         return lspconfig.util.root_pattern('vhdl_ls.toml')(fname)
--       end;
--       settings = {};
--     };
--   }
-- end
--
-- require 'lspconfig'.rust_hdl.setup{}
--
-- return 'lspconfig'.rust_hdl.setup{}

lsp.setup()
