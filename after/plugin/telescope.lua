local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Find Files"})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "Find with grep"})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "Find in buffer"})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Find on help"})

-- vim.cmd 'highlight TelescopeBorder guibg=none'
-- vim.cmd 'highlight TelescopeNormal guibg=none'
-- vim.cmd 'highlight TelescopePreviewBorder guibg=none'
--
-- vim.cmd 'highlight TelescopePreviewNormal guibg=none'
-- vim.cmd 'highlight TelescopePreviewTitle guibg=none'
-- vim.cmd 'highlight TelescopePromptBorder guibg=none'
--
-- vim.cmd 'highlight TelescopePromptNormal guibg=none'
-- vim.cmd 'highlight TelescopePromptPrefix guibg=none'
-- vim.cmd 'highlight TelescopePromptTitle guibg=none'
--
-- vim.cmd 'highlight TelescopeResultsBorder guibg=none'
-- vim.cmd 'highlight TelescopeResultsNormal guibg=none'
-- vim.cmd 'highlight TelescopeResultsTitle guibg=none'
--

vim.api.nvim_set_hl(0,"TelescopeNormal",{ctermbg="none"})
vim.api.nvim_set_hl(0,"TelescopeBorder",{ctermbg="none"})
vim.api.nvim_set_hl(0,"TelescopePreviewBorder",{ctermbg="none"})
vim.api.nvim_set_hl(0,"NormalFloat",{bg="none"})
vim.api.nvim_set_hl(0,"TelescopeNormal",{bg="none"})
vim.api.nvim_set_hl(0,"TelescopeNormal",{bg="none"})
vim.api.nvim_set_hl(0,"TelescopeNormal",{bg="none"})

require("telescope").load_extension('harpoon')
require("telescope").load_extension("notify")
require("telescope").load_extension("noice")
-- require("telescope").load_extension("fzf")
