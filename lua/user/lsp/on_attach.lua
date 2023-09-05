local utils = require "astronvim.utils"
return function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set(
    "n",
    "gd",
    function() vim.lsp.buf.definition() end,
    { buffer = bufnr, remap = false, desc = "Go to Definition" }
  )

  vim.keymap.set(
    "n",
    "K",
    function() vim.lsp.buf.hover() end,
    { buffer = bufnr, remap = false, desc = "Element Information" }
  )

  vim.keymap.set(
    "n",
    "<leader>lws",
    function() vim.lsp.buf.workspace_symbol() end,
    { buffer = bufnr, remap = false, desc = "Workspace Symbol" }
  )
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end
