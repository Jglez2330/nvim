local M = {}



function M.config(opts)
    local default = {
        plugins = { spelling = true },
        defaults = {
            mode = { "n", "x" },
            ["<leader>f"] = { name = "󱇯 " .. "file/find" },
 
        },
    }
    opts = opts or {}
    return default and vim.tbl_deep_extend("force", default, opts) or opts
end

return M
