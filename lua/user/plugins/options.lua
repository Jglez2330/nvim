return {

  {
    "rcarriga/nvim-notify",
    name = "notify",
    config = function()
      require("notify").setup {
        stages = "fade",
        background_colour = "#000000",
      }
    end,
  },
}
