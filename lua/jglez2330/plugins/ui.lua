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
    {
        "rcarriga/nvim-notify",
        opts = {
            background_colour = "#000000",
        }
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            routes = {
                {
                    filter = {
                        event = "msg_show",
                        any = {
                            { find = "%d+L, %d+B" },
                            { find = "; after #%d+" },
                            { find = "; before #%d+" },
                        },
                    },
                    view = "mini",
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = true,
                lsp_doc_border =  true,
            },
        },
        -- stylua: ignore
        keys = {
            {
                "<S-Enter>",
                function() require("noice").redirect(vim.fn.getcmdline()) end,
                mode = "c",
                desc =
                "Redirect Cmdline"
            },
            {
                "<leader>snl",
                function() require("noice").cmd("last") end,
                desc =
                "Noice Last Message"
            },
            {
                "<leader>snh",
                function() require("noice").cmd("history") end,
                desc =
                "Noice History"
            },
            {
                "<leader>sna",
                function() require("noice").cmd("all") end,
                desc =
                "Noice All"
            },
            {
                "<leader>snd",
                function() require("noice").cmd("dismiss") end,
                desc =
                "Dismiss All"
            },
            {
                "<c-f>",
                function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end,
                silent = true,
                expr = true,
                desc =
                "Scroll forward",
                mode = {
                    "i", "n", "s" }
            },
            {
                "<c-b>",
                function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end,
                silent = true,
                expr = true,
                desc =
                "Scroll backward",
                mode = {
                    "i", "n", "s" }
            },
        },
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
        keys = {
            { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Document Diagnostics (Trouble)" },
            { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
            { "<leader>xL", "<cmd>TroubleToggle loclist<cr>",               desc = "Location List (Trouble)" },
            { "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>",              desc = "Quickfix List (Trouble)" },
            {
                "[q",
                function()
                    if require("trouble").is_open() then
                        require("trouble").previous({ skip_groups = true, jump = true })
                    else
                        local ok, err = pcall(vim.cmd.cprev)
                        if not ok then
                            vim.notify(err, vim.log.levels.ERROR)
                        end
                    end
                end,
                desc = "Previous trouble/quickfix item",
            },
            {
                "]q",
                function()
                    if require("trouble").is_open() then
                        require("trouble").next({ skip_groups = true, jump = true })
                    else
                        local ok, err = pcall(vim.cmd.cnext)
                        if not ok then
                            vim.notify(err, vim.log.levels.ERROR)
                        end
                    end
                end,
                desc = "Next trouble/quickfix item",
            },
        },
    },
    {"nvim-tree/nvim-web-devicons"},
    {"folke/lsp-colors.nvim"},
    
}
