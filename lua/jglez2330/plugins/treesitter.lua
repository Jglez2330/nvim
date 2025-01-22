-- NOTE: This module is for treesitter, will be loaded in `BufReadPost` and `BufNewFile` event.
-- for playground, will be loaded by its specific commands.

---@type LazySpec[]
local treesitter = {
  {
    -- DESC: a parser generator tool and an incremental parsing library.
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() require("jglez2330.config.treesitter") end,
  },

  {
    -- DESC: a viewer for treesitter, which can show treesitter information directly in Neovim.
    "nvim-treesitter/playground",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },

  {
    -- DESC: a plugin to show the context of the current buffer contents.
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },

  {
    -- DESC: a plugin to enhance textobjects.
    "nvim-treesitter/nvim-treesitter-textobjects",
    requires = "nvim-treesitter/nvim-treesitter",

  },
    {
        "nvim-treesitter/nvim-treesitter-context",
        name = "nvim-treesitter-context",
    },

}


return treesitter
