-- =============================================
-- ========== Plugin Loading
-- =============================================
local dressing_ok, dressing = pcall(require, "dressing")
if not dressing_ok then
    jglez2330.load_plugin_error("dressing")
    return
end



-- =============================================
-- ========== Configuration
-- =============================================
local conf = {
    input = {
        default_prompt = "➤ ",
        win_options = { winhighlight = "Normal:Normal,NormalNC:Normal" },
    },
    select = {
        backend = { "telescope", "builtin" },
        builtin = { win_options = { winhighlight = "Normal:Normal,NormalNC:Normal" } },
    },
}


dressing.setup(conf)
