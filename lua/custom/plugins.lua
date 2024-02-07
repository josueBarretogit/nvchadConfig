local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
    cond = function()
      if vim.g.vscode then
        return false
      end
      return true
    end,
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
    cond = function()
      if vim.g.vscode then
        return false
      end
      return true
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
    cond = function()
      if vim.g.vscode then
        return false
      end
      return true
    end,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
    cond = function()
      if vim.g.vscode then
        return false
      end
      return true
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "custom.configs.conform"
    end,
    cond = function()
      if vim.g.vscode then
        return false
      end
      return true
    end,
  },

  {
    "jbyuki/instant.nvim",
    lazy = false,
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  --
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  {
    "ggandor/leap.nvim",
    dependencies = {
      "tpope/vim-repeat",
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "NvChad/nvcommunity",
    { import = "nvcommunity.git.lazygit" },
  },
}

return plugins
