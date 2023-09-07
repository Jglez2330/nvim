return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
      integrations = {
        telescope = true,
        harpoon = true,
        mason = true,
        dashboard = true,
        aerial = true,
        neotree = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
        notify = true,
        which_key = true,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme "catppuccin-mocha"
    end,
  },
  {
    "AstroNvim/astrotheme",
    name = "astrotheme",
    config = function()
      require("astrotheme").setup {
        palette = "astrodark", -- String of the default palette to use when calling `:colorscheme astrotheme`
        background = { -- :h background, palettes to use when using the core vim background colors
          light = "astrolight",
          dark = "astrodark",
        },

        style = {
          transparent = false, -- Bool value, toggles transparency.
          inactive = true, -- Bool value, toggles inactive window color.
          float = true, -- Bool value, toggles floating windows background colors.
          popup = true, -- Bool value, toggles popup background color.
          neotree = true, -- Bool value, toggles neo-trees background color.
          border = true, -- Bool value, toggles borders.
          title_invert = true, -- Bool value, swaps text and background colors.
          italic_comments = true, -- Bool value, toggles italic comments.
          simple_syntax_colors = true, -- Bool value, simplifies the amounts of colors used for syntax highlighting.
        },
      }
    end,
  },
  { "ellisonleao/gruvbox.nvim", priority = 1000 },
}
