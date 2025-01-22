return {
    {
        'goolord/alpha-nvim',
        config = function()
            require("jglez2330.config.ui.alpha-nvim")
        end,
    },
    {
        'stevearc/dressing.nvim',
        config = function()
            require("jglez2330.config.ui.dressing")
        end,
        enabled = true,
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
            require("jglez2330.config.ui.lualine")
        end
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = function()
            require("jglez2330.config.ui.noice_opts")
        end,
        -- stylua: ignore
        keys = function()
            require("jglez2330.config.ui.noice_keys")
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
            require("jglez2330.config.ui.trouble_keys")
        end,
        enabled = true,
    },
    { "nvim-tree/nvim-web-devicons" },
    { "folke/lsp-colors.nvim" },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("jglez2330.config.ui.indent")
        end
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function ()
            require("jglez2330.config.ui.which_key")
        end,
        enabled = true,
    },
}
