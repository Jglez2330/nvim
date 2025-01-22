-- function alias
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local keymap  =  vim.keymap.set

-- Global variables
vim.g.mapleader = " "
vim.g.maplocalleader = " "


--Keymaps


keymap("n", "<leader>e", vim.cmd.Ex, {desc = "File tree"})

keymap("n", "<leader>w",  "<cmd>w<cr>", {desc = "Save" })

keymap("n", "<leader>c",  function () require "jglez2330.config".close() end, {desc = "Close" })

keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", {desc = "tmux-sessionizer"})

keymap("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap("n", "<leader>j", "<cmd>lprev<CR>zz")
-- keymap("n", "<leader>w", vim.cm)
--
autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = augroup("highlightyank", { clear = true }),
  pattern = "*",
  callback = function() vim.highlight.on_yank() end,
})

keymap("v", "J", ":m '>+1<CR>gv=gv", {desc = "Move code block down"})
keymap("v", "K", ":m '<-2<CR>gv=gv", {desc = "Move code block up"})

keymap("n", "J", "mzJ`z", {desc = " "})
keymap("n", "<C-d>", "<C-d>zz", {desc = "Move down"})
keymap("n", "<C-u>", "<C-u>zz", {desc = "Move up"})
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- greatest remap ever
keymap("x", "<leader>p", [["_dP]], {desc = "Delete and paste"})

-- next greatest remap ever : asbjornHaland
keymap({"n", "v"}, "<leader>y", [["+y]], {desc = "Yank to CB"})
keymap("n", "<leader>Y", [["+Y]], {desc = "Yank to CB Y"})

keymap({"n", "v"}, "<leader>d", [["_d]], {desc = "Delete without yanking"})

-- This is going to get me cancelled

keymap("n", "<leader>lf", vim.lsp.buf.format, {desc = "Format file"})



keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap("n", "<leader>r", "<cmd>!chmod +x %<CR>", { silent = true, desc="Make Executable" })


keymap("n", "<leader><leader>", function()
    vim.cmd("so")
end)

keymap("n", "<leader>u", "<cmd>Telescope undo<cr>", {desc = "Undo"})
