-- =============================================
-- ========== Plugin Loading
-- =============================================
local copilot_ok, copilot = pcall(require, "copilot")
if not copilot_ok then
    jglez2330.load_plugin_error("copilot")
    return
end



-- =============================================
-- ========== Configuration
-- =============================================
-- NOTE: This module is for AI code completion
-- vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
--     expr = true,
--     replace_keycodes = false
-- })
vim.g.copilot_no_tab_map = true
