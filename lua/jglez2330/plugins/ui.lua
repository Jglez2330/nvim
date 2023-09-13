return {
    {
        'goolord/alpha-nvim',
        config = function()
            require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
        end,
        opts = function()
            local dashboard = require "alpha.themes.dashboard"
            dashboard.section.header.val = {
                "       __    _______  __       _______  ________  ____    ____  __  .___  ___.",
                "      |  |  /  _____||  |     |   ____||       /  \\   \\  /   / |  | |   \\/   |",
                "      |  | |  |  __  |  |     |  |__   `---/  /    \\   \\/   /  |  | |  \\  /  |",
                ".--.  |  | |  | |_ | |  |     |   __|     /  /      \\      /   |  | |  |\\/|  |",
                "|  `--'  | |  |__| | |  `----.|  |____   /  /----.   \\    /    |  | |  |  |  |",
                " \\______/   \\______| |_______||_______| /________|    \\__/     |__| |__|  |__|",
            }
            dashboard.section.header.opts.hl = "DashboardHeader"


            return dashboard
        end,
    },
    {
        'stevearc/aerial.nvim',
        opts = {
            buftype_exclude = {
                "nofile",
                "terminal",
            },
            filetype_exclude = {
                "help",
                "startify",
                "aerial",
                "alpha",
                "dashboard",
                "lazy",
                "neogitstatus",
                "NvimTree",
                "neo-tree",
                "Trouble",
            },
            context_patterns = {
                "class",
                "return",
                "function",
                "method",
                "^if",
                "^while",
                "jsx_element",
                "^for",
                "^object",
                "^table",
                "block",
                "arguments",
                "if_statement",
                "else_clause",
                "jsx_element",
                "jsx_self_closing_element",
                "try_statement",
                "catch_clause",
                "import_statement",
                "operation_type",
            },
            show_trailing_blankline_indent = false,
            use_treesitter = true,
            char = "▏",
            context_char = "▏",
            show_current_context = true,
        },
        -- Optional dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
    },
    {
        'stevearc/dressing.nvim',
        opts = {
            input = {
                default_prompt = "➤ ",
                win_options = { winhighlight = "Normal:Normal,NormalNC:Normal" },
            },
            select = {
                backend = { "telescope", "builtin" },
                builtin = { win_options = { winhighlight = "Normal:Normal,NormalNC:Normal" } },
            },
        }
    },
    { "rcarriga/nvim-notify" },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
    },
}
