-- =============================================
-- ========== Plugin Loading
-- =============================================
local bufferline_ok, bufferline = pcall(require, "bufferline")
if not bufferline_ok then Fau_vim.load_plugin_error("bufferline") return end



-- =============================================
-- ========== Configuration
-- =============================================
---@type bufferline.UserConfig
local config = {
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    style_preset = bufferline.style_preset.minimal,
    themable = true, -- allows highlight groups to be overriden i.e. sets highlights as defaultq

    numbers = "none", -- values: "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string

    close_command        = Fau_vim.functions.utils.buf_remove, -- can be a string | function, see "Mouse actions"
    right_mouse_command  = Fau_vim.functions.utils.buf_remove, -- can be a string | function, see "Mouse actions"
    left_mouse_command   = "buffer %d",  -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"

    indicator = {
      icon = "▎",     -- this should be omitted if indicator style is not 'icon'
      style = "icon", -- values: 'icon' | 'underline' | 'none'
    },
    -- TODO: add these kinds to icons
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",

    left_trunc_marker = "",  -- if too long
    right_trunc_marker = "", -- if too long

    always_show_bufferline = true,  -- whether or not to show the bufferline if only one tab
    enforce_regular_tabs = false,   -- prevent beyond the tab size and all tabs will be the same length

    tab_size = 10,                -- the tab length
    max_name_length = 15,
    max_prefix_length = 12,       -- prefix used when a buffer is de-duplicated
    show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
    truncate_names = true,        -- whether or not tab names should be truncated

    ---@diagnostic disable-next-line: unused-local
    custom_filter = function(buf_number, buf_numbers)
      if vim.fn.bufname(buf_number) ~= "" then return true end
      return false
    end,

    diagnostics = "nvim_lsp", -- values: false | "nvim_lsp" | "coc"
    diagnostics_update_in_insert = false,
    -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
    ---@diagnostic disable-next-line: unused-local
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      --- count is an integer representing total count of errors
      --- level is a string "error" | "warning"
      --- this should return a string
      --- Don't get too fancy as this function will be executed a lot
      local show = ""
      for diagnostics, cou in pairs(diagnostics_dict) do
        local icon = (diagnostics == "error" and Fau_vim.icons.diagnostics.Error) or
            (diagnostics == "warning" and Fau_vim.icons.diagnostics.Warning)
        if icon then show = show .. icon .. " " .. cou .. " " end
      end
      return show
    end,

    offsets = {
      {
        filetype = "NvimTree",
        text = " Workspace",    -- values: string | function
        text_align = "center", -- values: "left" | "center" | "right"
        separator = true
      }
    },

    color_icons = true,              -- whether or not to add the filetype icon highlights
    show_buffer_icons = true,        -- whether or not to disable filetype icons for buffers
    show_buffer_close_icons = true,
    get_element_icon = function(element)
      -- element consists of {filetype: string, path: string, extension: string, directory: string}
      -- This can be used to change how bufferline fetches the icon for an element e.g. a buffer or a tab.
      local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
      return icon, hl
    end,
    show_close_icon = true,

    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position

    -- can also be a table containing 2 custom separators [focused and unfocused]. eg: { '|', '|' }
    separator_style = { "", "" }, -- "slant" | "padded_slant" | "thick" | "thin" | "slope" | "padded_slope" | { 'any', 'any' },

    hover = { enabled = true, delay = 50, reveal = { "close" } },
    sort_by = "insert_after_current", -- values: 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b) return buffer_a.modified > buffer_b.modified end

    groups = {
      options = {
        toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
      },
      items = {
        {
          name = "Docs",
          highlight = { undercurl = true, sp = "green" },
          priority = 2, -- determines where it will appear relative to other groups (Optional)
          icon = Fau_vim.icons.ui.File, -- Optional
          auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
          -- matcher = function(buf) return buf.filename:match("%.md") or buf.filename:match("%.txt") end,
          separator = { -- Optional
            style = require("bufferline.groups").separator.tab
          },
        }
      }
    }
  },

  highlights = {
    -- selected filename in curlycue
    buffer_selected     = { fg = Fau_vim.colors.cobalt, bold = false },
    numbers_selected    = { fg = Fau_vim.colors.cobalt, bold = false },
    diagnostic_selected = { bold = false },
    hint_selected    = { bold = false },
    info_selected    = { bold = false },
    warning_selected = { bold = false },
    error_selected   = { bold = false },


    -- the path name in italic
    duplicate          = { bold = true, italic = true },
    duplicate_visible  = { bold = true, italic = true },
    duplicate_selected = { bold = true, italic = true },

  }
}


bufferline.setup(config)