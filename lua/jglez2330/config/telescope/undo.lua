-- =============================================
-- ========== Plugin Loading
-- =============================================
local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then vim_utils.load_plugin_error("telescope") return end

-- =============================================
-- ========== Configuration
-- =============================================

local config = {
    extensions = {
        undo = {
        use_delta = true,
        use_custom_command = nil,
        side_by_side = false,
        entry_format = "state #$ID, $STAT, $TIME",
        time_format = "",
        },
        mappings = {
            i = {
                -- ["<cr>"] = require("telescope-undo.actions").yank_additions,
                -- ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
                -- ["<C-cr>"] = require("telescope-undo.actions").restore,
            },
        },
    }

}

telescope.setup(config)
telescope.load_extension("undo")
