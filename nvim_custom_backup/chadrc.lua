---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"
M.ui = {
  theme = "gruvbox",
  theme_toggle = { "gruvbox", "gruvbox" },

  hl_override = highlights.override,
  hl_add = highlights.add,
  transparency = true,
  telescope = { style = "bordered" },
  statusline = { separator_style = "round" },

  -- nvdash (dashboard)
  nvdash = {
    load_on_startup = true,

    header = {
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
    },

    buttons = {
      { " Find File", "Spc f f", "Telescope find_files" },
      { "󰈚 Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭 Find Word", "Spc f w", "Telescope live_grep" },
      { " Bookmarks", "Spc m a", "Telescope marks" },
      { " Themes", "Spc t h", "Telescope themes" },
      { " Mappings", "Spc c h", "NvCheatsheet" },
    },
  },

  cheatsheet = { theme = "simple" }, -- simple/grid
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
