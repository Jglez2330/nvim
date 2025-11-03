-- =============================================
-- ========== Plugin Loading
-- =============================================
local telescope_builtins_ok, telescope_builtins = pcall(require, "telescope.builtin")
if not telescope_builtins_ok then vim_utils.load_plugin_error("telescope.builtin") return end


vim.keymap.set('n', '<leader>ff', telescope_builtins.find_files, {desc = "Find Files"})
vim.keymap.set('n', '<leader>fg', telescope_builtins.live_grep, {desc = "Find with grep"})
vim.keymap.set('n', '<leader>fb', telescope_builtins.buffers, {desc = "Find in buffer"})
vim.keymap.set('n', '<leader>fh', telescope_builtins.help_tags, {desc = "Find on help"})
vim.api.nvim_set_hl(0,"TelescopeNormal",{ctermbg="none"})
vim.api.nvim_set_hl(0,"TelescopeBorder",{ctermbg="none"})
vim.api.nvim_set_hl(0,"TelescopePreviewBorder",{ctermbg="none"})
vim.api.nvim_set_hl(0,"NormalFloat",{bg="none"})
vim.api.nvim_set_hl(0,"TelescopeNormal",{bg="none"})
vim.api.nvim_set_hl(0,"TelescopeNormal",{bg="none"})
vim.api.nvim_set_hl(0,"TelescopeNormal",{bg="none"})


mappings = {}

return mappings

