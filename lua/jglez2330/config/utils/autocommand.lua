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
			vim.diagnostic.open_float({ border = "rounded" })
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

-- Float all :help buffers, every time you enter them
local grp = augroup("HelpInFloat", { clear = true })

autocmd("BufEnter", {
  group = grp,
  pattern = "*",
  callback = function(ev)
    if vim.bo[ev.buf].buftype ~= "help" then
      return
    end

    local curwin = vim.api.nvim_get_current_win()
    -- if already in a floating window, do nothing
    local cfg = vim.api.nvim_win_get_config(curwin)
    if cfg and cfg.relative ~= "" then
      return
    end

    -- geometry
    local columns = vim.o.columns
    local lines   = vim.o.lines - vim.o.cmdheight
    local width   = math.floor(columns * 0.85)
    local height  = math.floor(lines * 0.85)
    local row     = math.floor((lines - height) / 2)
    local col     = math.floor((columns - width) / 2)

    -- open the float for the help buffer
    local floatwin = vim.api.nvim_open_win(ev.buf, true, {
      relative  = "editor",
      width     = width,
      height    = height,
      row       = row,
      col       = col,
      style     = "minimal",
      border    = "rounded",
      noautocmd = true,   -- prevents re-trigger loops
    })

    -- close the original help split
    -- (safe even if it's the same window, thanks to the guard above)
    pcall(vim.api.nvim_win_close, curwin, true)

    -- cosmetics
    vim.wo[floatwin].number = false
    vim.wo[floatwin].relativenumber = false
    vim.wo[floatwin].signcolumn = "no"
    vim.wo[floatwin].wrap = true
    vim.wo[floatwin].cursorline = false
    vim.wo[floatwin].winblend = 10

    -- 'q' to close the help float
    vim.keymap.set("n", "q", function()
      if vim.api.nvim_win_is_valid(floatwin) then
        vim.api.nvim_win_close(floatwin, true)
      end
    end, { buffer = ev.buf, silent = true, nowait = true })
  end,
})

