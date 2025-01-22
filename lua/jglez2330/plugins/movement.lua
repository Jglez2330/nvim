return {

    {
        "Theprimeagen/harpoon",
        branch = "harpoon2",
        config = function()
            require("jglez2330.config.harpoon")
        end,
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    { "Theprimeagen/vim-be-good" }
}
