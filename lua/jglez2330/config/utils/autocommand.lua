local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
autocmd("FileType", {
	command = "set formatoptions-=cro",
})

autocmd("LspAttach", {
	callback = function(args)
		local opts = { buffer = args.buf, remap = false }

		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, vim.tbl_extend("force", opts, { desc = "Go To Definition" }))
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, vim.tbl_extend("force", opts, { desc = "Symbol Information" }))
		vim.keymap.set("n", "<leader>lw", function()
			vim.lsp.buf.workspace_symbol()
		end, vim.tbl_extend("force", opts, { desc = "Workspace Symbol" }))
		vim.keymap.set("n", "<leader>ld", function()
			vim.diagnostic.open_float({border = 'rounded',})
		end, vim.tbl_extend("force", opts, { desc = "Float diagnostic" }))
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_next()
		end, vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_prev()
		end, vim.tbl_extend("force", opts, { desc = "Previous diagnostic" }))
		vim.keymap.set("n", "<leader>la", function()
			vim.lsp.buf.code_action()
		end, vim.tbl_extend("force", opts, { desc = "Code Action" }))
		vim.keymap.set("n", "<leader>lp", function()
			vim.lsp.buf.references()
		end, vim.tbl_extend("force", opts, { desc = "Symbol references" }))
		vim.keymap.set("n", "<leader>lr", function()
			vim.lsp.buf.rename()
		end, vim.tbl_extend("force", opts, { desc = "Symbol Rename" }))
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, vim.tbl_extend("force", opts, { desc = "Signature Help" }))
	end,
})

autocmd("TextYankPost", {
	desc = "Highlight yanked text",
	group = augroup("highlightyank", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
})
