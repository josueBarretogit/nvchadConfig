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

  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

-- more keybinds!

return M
