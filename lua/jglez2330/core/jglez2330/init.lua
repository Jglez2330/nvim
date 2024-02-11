-- =============================================
-- ========== Initialization
-- =============================================
require "jglez2330.core.jglez2330.options"
require "jglez2330.core.jglez2330.keymaps"
require "jglez2330.core.jglez2330.config"
--

-- =============================================
-- ========== Extension
-- =============================================
jglez2330.icons     = require "jglez2330.core.jglez2330.icons"
jglez2330.functions = require "jglez2330.core.jglez2330.functions"
---jglez2330.functions.ColorMyPencils()
-- =============================================
-- ========== Startup Neovim
-- =============================================
require "jglez2330.lazy"
