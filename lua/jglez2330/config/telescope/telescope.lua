-- =============================================
-- -- ========== Plugin Loading
-- -- =============================================
local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then vim_utils.load_plugin_error("telescope") return end

-- =============================================
-- ========== Configuration
-- =============================================
mappings = require "jglez2330.config.telescope.keymaps"
local telescope_config = {
    defaults = {
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
    },
    }

telescope.setup(telescope_config)
