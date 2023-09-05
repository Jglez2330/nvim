return {

  n = {

    ["<C-u>"] = { "<C-u>zz", desc = "Move up half page and middle it" },
    ["<C-d>"] = { "<C-d>zz", desc = "Move down half page and middle it" },

    ["<leader>h"] = { desc = require("astronvim.utils").get_icon("Harpoon", 1, true) .. "Harpoon" },
    ["<leader>ha"] = { function() require("harpoon.mark").add_file() end, desc = "Harpoon that MF file" },
    ["<leader>hu"] = { function() require("harpoon.ui").toggle_quick_menu() end, desc = "Harpoon List" },
    ["<leader>hh"] = { function() require("harpoon.ui").nav_file(1) end, desc = "Go To file 1" },
    ["<leader>hj"] = { function() require("harpoon.ui").nav_file(3) end, desc = "Go To file 3" },
    ["<leader>hl"] = { function() require("harpoon.ui").nav_file(4) end, desc = "Go To file 4" },
    ["<leader>hk"] = { function() require("harpoon.ui").nav_file(2) end, desc = "Go To file 2" },
  },
}
