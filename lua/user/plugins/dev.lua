return {
  {
    "https://codeberg.org/esensar/nvim-dev-container",
    name = "devcontainer",
    config = function ()
     require("devcontainer").setup{
          generate_commands = true,
  -- By default no autocommands are generated
  -- This option can be used to configure automatic starting and cleaning of containers
  autocommands = {
    -- can be set to true to automatically start containers when devcontainer.json is available
    init = false,
    -- can be set to true to automatically remove any started containers and any built images when exiting vim
    clean = false,
    -- can be set to true to automatically restart containers when devcontainer.json file is updated
    update = false,
  },
      }
    end,
  },
  {
    "ThePrimeagen/harpoon",
    name = "harpoon",
    config = function ()
      require("harpoonn").setup{}
    end,
    priority = 1000,
  },
}
