return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                config = function()
                    require("telescope").load_extension("fzf")
                end,
            },
            { "debugloop/telescope-undo.nvim" },
        },
        opts = function ()
            return require("jglez2330.config.telescope")
        end


    }
}
