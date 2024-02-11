-- =============================================
-- ========== Plugin Loading
-- =============================================
local alpha_ok, alpha = pcall(require, "alpha")
if not alpha_ok then jglez2330.load_plugin_error("alpha") return end



-- =============================================
-- ========== Configuration
-- =============================================
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
    "       __    _______  __       _______  ________  ____    ____  __  .___  ___.",
    "      |  |  /  _____||  |     |   ____||       /  \\   \\  /   / |  | |   \\/   |",
    "      |  | |  |  __  |  |     |  |__   `---/  /    \\   \\/   /  |  | |  \\  /  |",
    ".--.  |  | |  | |_ | |  |     |   __|     /  /      \\      /   |  | |  |\\/|  |",
    "|  `--'  | |  |__| | |  `----.|  |____   /  /----.   \\    /    |  | |  |  |  |",
    " \\______/   \\______| |_______||_______| /________|    \\__/     |__| |__|  |__|",
}
dashboard.section.header.opts.hl = "DashboardHeader"


dashboard.section.buttons.val = {
  dashboard.button("n", jglez2330.icons.ui.File .. "  New File", "<SPACE>e%<CR>"),

  dashboard.button("p", jglez2330.icons.ui.Project  .. "  Projects",     "<SPACE>Telescope projects layout_strategy=center sorting_strategy=ascending initial_mode=normal<CR>"),
  dashboard.button("f", jglez2330.icons.ui.FindFile .. "  Find Files",   "<SPACE>Telescope find_files<CR>"),
  dashboard.button("r", jglez2330.icons.ui.History  .. "  Recent Files", "<SPACE>Telescope oldfiles<CR>"),
  dashboard.button("s", jglez2330.icons.ui.FindText .. "  Search Text",  "<SPACE>Telescope live_grep<CR>"),


  dashboard.button("q", jglez2330.icons.ui.Exit .. "  Quit", "<SPACE>qa<CR>"),
}

alpha.setup(dashboard.opts)
