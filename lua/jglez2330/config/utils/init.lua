-- =============================================
-- ========== Initialization
-- =============================================
require "jglez2330.config.utils.options"
require "jglez2330.config.utils.keymaps"
require "jglez2330.config.utils.config"
--

-- =============================================
-- ========== Extension
-- =============================================
jglez2330.icons     = require "jglez2330.config.utils.icons"
jglez2330.functions = require "jglez2330.config.utils.functions"
---jglez2330.functions.ColorMyPencils()
-- =============================================
-- ========== Startup Neovim
-- =============================================
require "jglez2330.lazy"
