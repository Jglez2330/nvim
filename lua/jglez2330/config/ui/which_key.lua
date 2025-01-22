-- =============================================
-- ========== Plugin Loading
-- =============================================
local wkey_ok, wkey = pcall(require, "which-key")
if not wkey_ok then
    jglez2330.load_plugin_error("wkey")
    return
end



-- =============================================
-- ========== Configuration
-- =============================================
vim.o.timeout = true
vim.o.timeoutlen = 300
local config = {

}

wkey.setup(config)
