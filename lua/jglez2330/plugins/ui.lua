return {
    {
        'goolord/alpha-nvim',
        config = function()
            require("jglez2330.core.ui.alpha-nvim")
        end,
    },
    {
        'stevearc/dressing.nvim',
        config = function()
            require("jglez2330.core.ui.dressing")
        end,
    },
    {
        "rcarriga/nvim-notify",
        opts = {
            background_colour = "#000000",
        }
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        config = function()
            require("jglez2330.core.ui.lualine")
        end
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = function()
            require("jglez2330.core.ui.noice_opts")
        end,
        -- stylua: ignore
        keys = function()
            require("jglez2330.core.ui.noice_keys")
        end,
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },
    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
        opts = { use_diagnostic_signs = true },
        keys = function()
            require("jglez2330.core.ui.trouble_keys")
        end
    },
    { "nvim-tree/nvim-web-devicons" },
    { "folke/lsp-colors.nvim" },

}
