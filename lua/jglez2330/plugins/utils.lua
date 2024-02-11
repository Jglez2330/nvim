return {
      


    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        -- your configuration comes here
        -- or leave it empty to use the default settings
        config = function(_, opts)
            opts = require "jglez2330.config.mappings_names".config(opts)
            local wk = require("which-key")
            wk.setup(opts)
            wk.register(opts.defaults)
        end, -- refer to the configuration section belo,
    },
}
