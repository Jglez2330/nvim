local harpoon = require("harpoon")

-- Comment everyline explaning what it does
-- Can you add comment explaning what the code does?
--

vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>hu", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>hh", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>hj", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>hk", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>hl", function() harpoon:list():select(4) end)


-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-j>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-k>", function() harpoon:list():next() end)

