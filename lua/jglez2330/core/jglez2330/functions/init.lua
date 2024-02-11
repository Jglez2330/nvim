-- =============================================
-- ========== Utils (Initialzation)
-- =============================================
-- -----------------------------------
-- -------- show no plugin message
-- -----------------------------------
---@param plugin string
jglez2330.load_plugin_error = function(plugin)
  vim.notify(plugin .. " not found!", "ERROR", { title = "Fau_vim: Plugin Not Found" })
end

