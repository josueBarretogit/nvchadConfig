---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "oxocarbon",
  theme_toggle = { "oxocarbon", "one_light" },
  transparency = true,
  hl_override = highlights.override,
  hl_add = highlights.add,
  lsp_semantic_tokens = true, -- needs nvim v0.9, just adds highlight groups for lsp semantic tokens

  telescope = { style = "bordered" }, -- borderless / bordered

  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "arrow",
    overriden_modules = nil,
  },

cmp = {
    icons = true,
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    border_color = "nord_blue", -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = "colored", -- colored / simple
  },

 
  lsp = {
    -- show function signatures i.e args as you type
    signature = {
      disabled = true,
      silent = false, -- silences 'no signature help available' message from appearing
    },
  },


  

}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

if vim.g.vscode then
 
  M.ui = nil
end

return M
