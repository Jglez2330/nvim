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
            -- Flavour follows the desktop theme switcher (~/.config/theme/current).
            flavour = (function()
                local f = io.open(vim.fn.expand("~/.config/theme/current"))
                if f then
                    local fl = (f:read("l") or ""):match("^(%S+)")
                    f:close()
                    if fl == "latte" or fl == "frappe" or fl == "macchiato" or fl == "mocha" then
                        return fl
                    end
                end
                return "macchiato"
            end)(),
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
        config = function(_, opts)
            require("catppuccin").setup(opts)
            -- Live-follow the desktop theme: when ~/.config/theme/current changes,
            -- re-apply the flavour, but only if catppuccin is the active scheme.
            local path = vim.fn.expand("~/.config/theme/current")
            local uv = vim.uv or vim.loop
            local function reapply()
                local f = io.open(path)
                if not f then return end
                local fl = (f:read("l") or ""):match("^(%S+)")
                f:close()
                local valid = { latte = true, frappe = true, macchiato = true, mocha = true }
                if valid[fl] and (vim.g.colors_name or ""):match("^catppuccin") then
                    vim.g.catppuccin_flavour = fl
                    pcall(function()
                        require("catppuccin").compile()
                        vim.cmd.colorscheme("catppuccin-" .. fl)
                    end)
                end
            end
            local w = uv.new_fs_event()
            if w then
                local function arm()
                    w:start(path, {}, vim.schedule_wrap(function()
                        reapply()
                        pcall(function() w:stop() end)
                        arm() -- re-arm: editors replace the file, invalidating the watch
                    end))
                end
                arm()
            end
        end,
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
