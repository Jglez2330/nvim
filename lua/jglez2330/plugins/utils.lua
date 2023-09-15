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
        dependencies = { {
            "nvim-treesitter/nvim-treesitter-textobjects",
        } },
        opts = require"jglez2330.config.treesitter".config(),
        -- config = function()
        --     require("nvim-treesitter.configs").setup require("jglez2330.config.treesitter").config()
        -- end,
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

    { "onsails/lspkind.nvim" },
}
