return {

    -- tokyonight
    {
        "folke/tokyonight.nvim",
        name = "tokyonight",
        lazy = true,
        opts = {
            style = "moon",
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            }
        },
        priority = 1000
    },

    -- catppuccin
    {
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin",
        opts = {
            integrations = {
                alpha = true,
                cmp = true,
                flash = true,
                gitsigns = true,
                illuminate = true,
                indent_blankline = { enabled = true },
                lsp_trouble = true,
                mason = true,
                mini = true,
                native_lsp = {
                    enabled = true,
                    underlines = {
                        errors = { "undercurl" },
                        hints = { "undercurl" },
                        warnings = { "undercurl" },
                        information = { "undercurl" },
                    },
                },
                navic = { enabled = true, custom_bg = "lualine" },
                neotest = true,
                noice = true,
                notify = true,
                neotree = true,
                semantic_tokens = true,
                telescope = true,
                treesitter = true,
                which_key = true,
            },
        },
    },
    {
        "AstroNvim/astrotheme",
        name = "astrotheme",
        priority = 1000,
        config = function()
            require("astrotheme").setup({
                palette = "astrodark", -- String of the default palette to use when calling `:colorscheme astrotheme`
                background = {         -- :h background, palettes to use when using the core vim background colors
                    light = "astrolight",
                    dark = "astrodark",
                },

                style = {
                    transparent = true,         -- Bool value, toggles transparency.
                    inactive = true,             -- Bool value, toggles inactive window color.
                    float = true,                -- Bool value, toggles floating windows background colors.
                    popup = true,                -- Bool value, toggles popup background color.
                    neotree = true,              -- Bool value, toggles neo-trees background color.
                    border = true,               -- Bool value, toggles borders.
                    title_invert = true,         -- Bool value, swaps text and background colors.
                    italic_comments = true,      -- Bool value, toggles italic comments.
                },


                termguicolors = true,    -- Bool value, toggles if termguicolors are set by AstroTheme.

                terminal_color = true,   -- Bool value, toggles if terminal_colors are set by AstroTheme.

                plugin_default = "auto", -- Sets how all plugins will be loaded
                -- "auto": Uses lazy / packer enabled plugins to load highlights.
                -- true: Enables all plugins highlights.
                -- false: Disables all plugins.

                plugins = { -- Allows for individual plugin overrides using plugin name and value from above.
                    ["bufferline.nvim"] = false,
                },

                
            })
        end
        -- opts = { plugins = { ["dashboard-nvim"] = true } },
    },
}
