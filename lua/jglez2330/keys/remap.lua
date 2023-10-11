local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", vim.cmd.Ex, {desc = "File tree"})

vim.keymap.set("n", "<leader>w",  "<cmd>w<cr>", {desc = "Save" })

vim.keymap.set("n", "<leader>c",  function () require "jglez2330.core".close() end, {desc = "Close" })

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", {desc = "tmux-sessionizer"})

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
-- vim.keymap.set("n", "<leader>w", vim.cm)
--
autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = augroup("highlightyank", { clear = true }),
  pattern = "*",
  callback = function() vim.highlight.on_yank() end,
})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = "Move code block down"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc = "Move code block up"})

vim.keymap.set("n", "J", "mzJ`z", {desc = " "})
vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc = "Move down"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc = "Move up"})
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], {desc = "Delete and paste"})

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], {desc = "Yank to CB"})
vim.keymap.set("n", "<leader>Y", [["+Y]], {desc = "Yank to CB Y"})

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], {desc = "Delete without yanking"})

-- This is going to get me cancelled

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {desc = "Format file"})



vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>r", "<cmd>!chmod +x %<CR>", { silent = true, desc="Make Executable" })


vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", {desc = "Undo"})
