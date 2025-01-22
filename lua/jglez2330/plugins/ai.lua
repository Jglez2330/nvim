-- NOTE: This module is for AI code completion

---@type LazySpec[]
local cmp = {
    -- {
    --     "https://github.com/github/copilot.vim",
    --     config = function()
    --         require("jglez2330.core.ai.copilot")
    --     end
    -- },
    {
        "zbirenbaum/copilot.lua",
        config = function()
            require("copilot").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end,

    },
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup()
        end
    }
}


return cmp
