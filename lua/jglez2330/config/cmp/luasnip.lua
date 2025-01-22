-- =============================================
-- ========== Plugin Loading
-- =============================================
local luasnip_ok, luasnip = pcall(require, "luasnip")
if not luasnip_ok then jglez2330.load_plugin_error("luasnip") return end



-- =============================================
-- ========== Configuration
-- =============================================
local config = {

}

luasnip.setup(config)
