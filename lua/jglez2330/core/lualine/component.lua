-- =============================================
-- ========== source
-- =============================================
local source = {
  diff = function() -- use gitsigns plugin to update lualine
    ---@diagnostic disable-next-line: undefined-field
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then return { added = gitsigns.added, modified = gitsigns.changed, removed = gitsigns.removed } end
  end,
}



-- =============================================
-- ========== on_click
-- =============================================
local on_click = {
  -- takes a function that is called when component is clicked with mouse.
  -- the function receives several arguments
  -- - number of clicks incase of multiple clicks
  -- - mouse button used (l(left)/r(right)/m(middle)/...)
  -- - modifiers pressed (s(shift)/c(ctrl)/a(alt)/m(meta)...)
  treesitter = function()
    vim.api.nvim_command("TSBufToggle highlight")
    require("lualine").refresh()
  end,

  indent = function()
    Fau_vim.functions.indent.toggle_indent_width()
    require("lualine").refresh()
  end,
}



-- =============================================
-- ========== conditions
-- =============================================
local conditions = {
  hide_in_width = function(window_width_limit)
    window_width_limit = window_width_limit or 100
    return vim.o.columns >= window_width_limit
  end,
}



-- =============================================
-- ========== utils
-- =============================================
local utils = {
  env_cleanup = function(venv)
    if string.find(venv, "/") then
      local final_venv = venv
      for w in venv:gmatch "([^/]+)" do final_venv = w end
      venv = final_venv
    end
    return venv
  end,
}



-- =============================================
-- ========== colors
-- =============================================
local colors = {
  bg       = "#202328",
  fg       = "#bbc2cf",
  yellow   = "#ECBE7B",
  cyan     = "#008080",
  darkblue = "#081633",
  green    = "#98be65",
  orange   = "#FF8800",
  violet   = "#a9a1e1",
  magenta  = "#c678dd",
  purple   = "#c678dd",
  blue     = "#51afef",
  red      = "#ec5f67",
}



-- =============================================
-- ========== component
-- =============================================
return {
  -- =============================================
  -- ========== basic
  -- =============================================
  mode = {
    function() return " " .. Fau_vim.icons.ui.Target .. " " end,
    -- "mode",
    -- icon = Fau_vim.icons.ui.Target
  },

  filename = "filename",
  filetype = "filetype",
  fileformat = { "fileformat", cond = conditions.hide_in_width }, -- win / linux / mac
  encoding = {
    "encoding",
    fmt = string.upper,
    cond = conditions.hide_in_width,
  },

  buffers = "buffers",
  tabs = "tabs",
  windows = "windows",

  progress = "progress",
  location = "location",

  datetime = {
    "datetime",
    -- options: default, us, uk, iso, or your own format string ("%H:%M", etc..)
    style = "default"
  },

  searchcount = {
    "searchcount",
    maxcount = 999,
    timeout = 500,
  },
  selectioncount = { "selectioncount" },


  indent = { -- detect the indenttype and check whether occur mixed indent
    -- TODO: Check indent except comment lines
    function()
      if Fau_vim.functions.utils.is_large_file() then return "LF" end

      local TIMEOUT = 5

      -- get the indent width and indent type
      local indent_width = vim.api.nvim_buf_get_option(0, "tabstop")
      local indent_type  = vim.api.nvim_buf_get_option(0, "expandtab")  -- true: space, false: tab


      -- check unexpected indent type
      local space_pat, tab_pat = [[\v^  +]], [[\v^\t+]]
      local space_indent_cnt = vim.fn.searchcount({ pattern=space_pat, max_count=5E2, timeout=TIMEOUT }).total
      local tab_indent_cnt   = vim.fn.searchcount({ pattern=tab_pat,   max_count=5E2, timeout=TIMEOUT }).total

      local file_indent_type = space_indent_cnt > tab_indent_cnt  -- same as indent_type
      if space_indent_cnt == tab_indent_cnt then file_indent_type = indent_type end

      local indent_icon = file_indent_type and Fau_vim.icons.ui.Space or Fau_vim.icons.ui.Tab
      local indent_show = indent_icon .. " " .. indent_width  -- show
      if file_indent_type ~= indent_type then indent_show = "*" .. indent_show end -- unexpected indent type


      -- check mixed indent
      local mixed_line = 0
      if space_indent_cnt > 0 and tab_indent_cnt > 0 then -- get the mixed_line
        if file_indent_type then mixed_line = vim.fn.search(tab_pat, "nwc")
        else mixed_line = vim.fn.search(space_pat, "nwc", nil, TIMEOUT) end
      else -- check whether mixed in the same line, if true: get the line number
        mixed_line = vim.fn.search([[\v^(\t+  |  +\t)]], "nwc", nil, TIMEOUT)
      end

      if mixed_line > 0 then indent_show = indent_show .. " (MI:" .. mixed_line .. ")" end

      return indent_show
    end,

    on_click = on_click.indent,
  },


  -- =============================================
  -- ========== git
  -- =============================================
  branch = {
    "branch",
    icon = Fau_vim.icons.git.Branch,
    color = { gui = "bold" },
  },
  diff = {
    "diff",
    source = source.diff,
    symbols = {
      added    = Fau_vim.icons.git.LineAdded    .. " ",
      modified = Fau_vim.icons.git.LineModified .. " ",
      removed  = Fau_vim.icons.git.LineRemoved  .. " ",
    },
    -- padding = { left = 2, right = 1 },
    diff_color = {
      added = { fg = colors.green },
      modified = { fg = colors.yellow },
      removed = { fg = colors.red },
    },
  },



  -- =============================================
  -- ========== lsp
  -- =============================================
  lsp = {
    function()
      local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })

      if next(buf_clients) == nil then return "LS Inactive" end

      local buf_ft = vim.bo.filetype
      local copilot_active = false

      local buf_client_names = {}


      -- add client
      for _, client in pairs(buf_clients) do
        if client.name == "copilot" then copilot_active = true
        elseif client.name ~= "null-ls" then table.insert(buf_client_names, client.name) end
      end


      local sources_ok, sources = pcall(require, "null-ls.sources")
      if not sources_ok then sources = nil end
      if sources ~= nil then
        local clients = sources.get_available(buf_ft)
        for _, client in pairs(clients) do
          if client.name ~= "gitsigns" then table.insert(buf_client_names, client.name) end
        end
      end

      -- combine
      local unique_client_names = vim.fn.uniq(buf_client_names)
      local language_servers = "[" .. table.concat(unique_client_names, ", ") .. "]"

      if copilot_active then
        language_servers = language_servers .. "%#SLCopilot#" .. " " .. Fau_vim.icons.kind.Copilot .. "%*"
      end

      -- if empty
      if language_servers == "[]" then language_servers = "LS Empty" end

      return language_servers
    end,
    color = { gui = "bold" },
    cond = conditions.hide_in_width,
  },


  diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = {
      error = Fau_vim.icons.diagnostics.Error       .. " ",
      warn  = Fau_vim.icons.diagnostics.Warning     .. " ",
      info  = Fau_vim.icons.diagnostics.Information .. " ",
      hint  = Fau_vim.icons.diagnostics.Hint        .. " ",
    },
  },


  treesitter = {
    function() return Fau_vim.icons.ui.Tree end,
    color = function()
      local buf = vim.api.nvim_get_current_buf()
      local ts = vim.treesitter.highlighter.active[buf]
      return { fg = ts and not vim.tbl_isempty(ts) and colors.green or colors.red }
    end,
    on_click = on_click.treesitter,
  },


  -- TEST: Copied from Lunarvim.
  python_env = {
    function()
      if vim.bo.filetype == "python" then
        local venv = os.getenv("CONDA_DEFAULT_ENV") or os.getenv("VIRTUAL_ENV")
        if venv then
          local icons = require("nvim-web-devicons")
          local py_icon, _ = icons.get_icon(".py")
          return string.format(" " .. py_icon .. " (%s)", utils.env_cleanup(venv))
        end
      end
      return ""
    end,
    color = { fg = colors.green },
    cond = conditions.hide_in_width,
  },


  lazy = {
    require("lazy.status").updates,
    cond = require("lazy.status").has_updates,
    -- color = { fg = "#ff9e64" },
    padding = { right = 1 },
  },
}