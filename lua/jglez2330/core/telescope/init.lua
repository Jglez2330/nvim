local telescope = require("telescope")


local opts = {
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
                extensions = {
                    undo = {
                        use_delta = true,
                        use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
                        side_by_side = false,
                        diff_context_lines = vim.o.scrolloff,
                        entry_format = "state #$ID, $STAT, $TIME",
                        time_format = "",
                        mappings = {
                            i = {
                                -- IMPORTANT: Note that telescope-undo must be available when telescope is configured if
                                -- you want to replicate these defaults and use the following actions. This means
                                -- installing as a dependency of telescope in it's `requirements` and loading this
                                -- extension from there instead of having the separate plugin definition as outlined
                                -- above.
                                ["<cr>"] = require("telescope-undo.actions").yank_additions,
                                ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
                                ["<C-cr>"] = require("telescope-undo.actions").restore,
                            },
                        },
                    },
                },
            };

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Find Files"})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "Find with grep"})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "Find in buffer"})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Find on help"})
vim.api.nvim_set_hl(0,"TelescopeNormal",{ctermbg="none"})
vim.api.nvim_set_hl(0,"TelescopeBorder",{ctermbg="none"})
vim.api.nvim_set_hl(0,"TelescopePreviewBorder",{ctermbg="none"})
vim.api.nvim_set_hl(0,"NormalFloat",{bg="none"})
vim.api.nvim_set_hl(0,"TelescopeNormal",{bg="none"})
vim.api.nvim_set_hl(0,"TelescopeNormal",{bg="none"})
vim.api.nvim_set_hl(0,"TelescopeNormal",{bg="none"})



telescope.load_extension('harpoon')
telescope.load_extension("notify")
telescope.load_extension("noice")
telescope.load_extension("undo")
return opts
