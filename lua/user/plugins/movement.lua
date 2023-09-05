return {

  {
    "ThePrimeagen/harpoon",
    name = "harpoon",
    dependencies = { "telescope" },
    config = function() require("harpoon").setup {} end,
  },
}
