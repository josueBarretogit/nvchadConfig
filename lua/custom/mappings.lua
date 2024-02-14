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
    ["rpl"] = {":%s//g<left><left>"},

    ["<leader>fe"] = { "<cmd> Telescope diagnostics <CR>", "Find Errores" },
    ["<leader>s"] = { "<CMD> HopWord <CR>", "Hint all words" },
    ["<leader><leader>t"] = { "<CMD> HopNodes <CR>", "Hint Tree" },
    ["<leader><leader>c"] = { "<CMD> HopLineStart<CR>", "Hint Columns" },
    ["<leader><leader>l"] = { "<CMD> HopWordCurrentLine<CR>", "Hint Line" },
    ["<c-d>"] = { "<C-d>zz", "Better ctrl d" },
    ["<c-u>"] = { "<C-u>zz", "Better ctrl u" },

    ["<C-s>"] = { "<cmd> w <CR>gg=G<c-o>", "Save file and format" },
    ["<leader>m"] = { ":lua require('harpoon.mark').add_file() <CR>", "Bookmark file" },
    ["<s-l>"] = { ":lua require('harpoon.ui').toggle_quick_menu()<CR>", "Open bookmarks" },
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

-- more keybinds!

return M
