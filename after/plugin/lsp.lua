local lsp = require('lsp-zero').preset({})
lsp.preset("recommended")

lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})
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
-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
