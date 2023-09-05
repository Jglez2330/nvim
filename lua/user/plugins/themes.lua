return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup {}
    end,
  },
  { "ellisonleao/gruvbox.nvim", priority = 1000 }
}
