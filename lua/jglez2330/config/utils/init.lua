-- =============================================
-- -- ========== Initialization
-- -- =============================================
require "jglez2330.config.utils.options"
require "jglez2330.config.utils.keymaps"
require "jglez2330.config.utils.autocommand"
require "jglez2330.config.utils.config"
--

-- =============================================
-- ========== Extension
-- =============================================
-- utils.icons     = require "jglez2330.config.utils.icons"
vim_utils.functions = require "jglez2330.config.utils.functions"
---utils.functions.ColorMyPencils()
-- =============================================
-- ========== Startup Neovim
-- =============================================
require "jglez2330.lazy"
vim_utils.ColorMyPencils()

