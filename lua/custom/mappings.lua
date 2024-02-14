---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
    ["rpl"] = {":%s//g"},

    ["<leader>fe"] = { "<cmd> Telescope diagnostics <CR>", "Find Errores" },
    ["<leader>s"] = { "<CMD> HopWord <CR>", "Hint all words" },
    ["<leader><leader>t"] = { "<CMD> HopNodes <CR>", "Hint Tree" },
    ["<leader><leader>c"] = { "<CMD> HopLineStart<CR>", "Hint Columns" },
    ["<leader><leader>l"] = { "<CMD> HopWordCurrentLine<CR>", "Hint Line" },
    ["<c-d>"] = { "<C-d>zz", "Better ctrl d" },
    ["<c-u>"] = { "<C-u>zz", "Better ctrl u" },
    ["<leader>g"] = { "<CMD> Lazygit <CR>", "Open lazygit" },

  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

-- more keybinds!

return M
