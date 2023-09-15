return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { 'nvim-lua/plenary.nvim', {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            config = function()
                require("telescope").load_extension("fzf")
            end,
        }, },
        opts = function()
            return {
                defaults = {
                    path_display = { "truncate" },
                    sorting_strategy = "ascending",
                    layout_config = {
                        horizontal = {
                            prompt_position = "top",
                            preview_width = 0.55,
                        },
                        vertical = {
                            mirror = false,
                        },
                        width = 0.87,
                        height = 0.80,
                        preview_cutoff = 120,
                    },

                },
            }
        end,
    },
    {
        "williamboman/mason.nvim",
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        name = "nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup {}
        end,
    },
    { "nvim-treesitter/playground" },
    {
        "nvim-treesitter/nvim-treesitter",
        name = "nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup {
                autotag = { enable = true },
                context_commentstring = { enable = true, enable_autocmd = false },
                highlight = {
                    enable = true,
                    disable = function(_, bufnr) return vim.api.nvim_buf_line_count(bufnr) > 10000 end,
                },
                incremental_selection = { enable = true },
                indent = { enable = true },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["ak"] = { query = "@block.outer", desc = "around block" },
                            ["ik"] = { query = "@block.inner", desc = "inside block" },
                            ["ac"] = { query = "@class.outer", desc = "around class" },
                            ["ic"] = { query = "@class.inner", desc = "inside class" },
                            ["a?"] = { query = "@conditional.outer", desc = "around conditional" },
                            ["i?"] = { query = "@conditional.inner", desc = "inside conditional" },
                            ["af"] = { query = "@function.outer", desc = "around function " },
                            ["if"] = { query = "@function.inner", desc = "inside function " },
                            ["al"] = { query = "@loop.outer", desc = "around loop" },
                            ["il"] = { query = "@loop.inner", desc = "inside loop" },
                            ["aa"] = { query = "@parameter.outer", desc = "around argument" },
                            ["ia"] = { query = "@parameter.inner", desc = "inside argument" },
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = {
                            ["]k"] = { query = "@block.outer", desc = "Next block start" },
                            ["]f"] = { query = "@function.outer", desc = "Next function start" },
                            ["]a"] = { query = "@parameter.inner", desc = "Next argument start" },
                        },
                        goto_next_end = {
                            ["]K"] = { query = "@block.outer", desc = "Next block end" },
                            ["]F"] = { query = "@function.outer", desc = "Next function end" },
                            ["]A"] = { query = "@parameter.inner", desc = "Next argument end" },
                        },
                        goto_previous_start = {
                            ["[k"] = { query = "@block.outer", desc = "Previous block start" },
                            ["[f"] = { query = "@function.outer", desc = "Previous function start" },
                            ["[a"] = { query = "@parameter.inner", desc = "Previous argument start" },
                        },
                        goto_previous_end = {
                            ["[K"] = { query = "@block.outer", desc = "Previous block end" },
                            ["[F"] = { query = "@function.outer", desc = "Previous function end" },
                            ["[A"] = { query = "@parameter.inner", desc = "Previous argument end" },
                        },
                    },
                    swap = {
                        enable = true,
                        swap_next = {
                            [">K"] = { query = "@block.outer", desc = "Swap next block" },
                            [">F"] = { query = "@function.outer", desc = "Swap next function" },
                            [">A"] = { query = "@parameter.inner", desc = "Swap next argument" },
                        },
                        swap_previous = {
                            ["<K"] = { query = "@block.outer", desc = "Swap previous block" },
                            ["<F"] = { query = "@function.outer", desc = "Swap previous function" },
                            ["<A"] = { query = "@parameter.inner", desc = "Swap previous argument" },
                        },
                    },
                },
            }
        end,

    },
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }

    },
    {
        "stevearc/dressing.nvim",
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
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function

    },

    { "onsails/lspkind.nvim" }
}
