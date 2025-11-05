-- =============================================
-- ========== Plugin Loading
-- =============================================
local noice_ok, noice = pcall(require, "noice")
if not noice_ok then
	vim_utils.load_plugin_error("dressing")
	return
end

-- =============================================
-- ========== Configuration
-- =============================================
local config = {
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
	routes = {
		{
			filter = {
				event = "msg_show",
				any = {
					{ find = "%d+L, %d+B" },
					{ find = "; after #%d+" },
					{ find = "; before #%d+" },
				},
			},
			view = "mini",
		},
	},
	presets = {
		bottom_search = true,
		command_palette = true,
		long_message_to_split = true,
		inc_rename = true,
		lsp_doc_border = true,
	},
}

noice.setup(config)
-- =============================================
-- ========== Plugin Loading
-- =============================================
local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then
	vim_utils.load_plugin_error("telescope")
	return
end

telescope.load_extension('noice')
