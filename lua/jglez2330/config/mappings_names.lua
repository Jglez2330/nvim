local M = {}



function M.config(opts)
    local default = {
        plugins = { spelling = true },
        disable = { filetypes = { "TelescopePrompt" } },

        icons = {
            breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
            separator = "➜", -- symbol used between a key and it's label
            group = "  ", -- symbol prepended to a group
        },
        defaults = {
            mode = { "n", "x" },
            ["<leader>f"] = { name = " " .. "file/find" },
            ["<leader>h"] = { name = "󱇯 " .. "harpoon" },
            ["<leader>x"] = { name = "󰓆 " .. "trouble" },
            ["<leader>l"] = { name = " " .. "lsp" },
            ["<leader>s"] = "which_key_ignore",
            ["<leader>k"] = "which_key_ignore",
            ["<leader>j"] = "which_key_ignore",

        },
    }
    opts = opts or {}
    return default and vim.tbl_deep_extend("force", default, opts) or opts
end

return M
