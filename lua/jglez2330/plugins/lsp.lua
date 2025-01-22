-- NOTE: This module is for language server protocol, will be loaded in `BufReadPost` and `BufNewFile` events.

---@type LazySpec[]
local lsp = {
    -- =============================================
    -- ========== LSP Manager
    -- =============================================
    {
        -- DESC: quickstart config LSP in Neovim.
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            --require("Fau.config.lsp.diagnostics_config")
            require("jglez2330.config.lsp.lspconfig")
        end,

    },

    {
        -- DESC: a bridge between lspconfig and mason.nvim for making things easier.
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            {
                -- DESC: a powerful manager for LSP, DAP, Linter and Formatter.
                "williamboman/mason.nvim",
                config = function() require("jglez2330.config.lsp.mason") end,
                cmd = "Mason",
            },
        },
        config = function() require("jglez2330.config.lsp.mason-lspconfig") end,
        lazy = true, -- loaded by nvim-lspconfig
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
    { "onsails/lspkind.nvim" },
    -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    }

}


return lsp
