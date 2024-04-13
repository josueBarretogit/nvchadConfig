require "core"

if not vim.g.vscode then
  local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

  if custom_init_path then
    dofile(custom_init_path)
  end

  require("core.utils").load_mappings()

  local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

  -- bootstrap lazy.nvim!
  if not vim.loop.fs_stat(lazypath) then
    require("core.bootstrap").gen_chadrc_template()
    require("core.bootstrap").lazy(lazypath)
  end

  dofile(vim.g.base46_cache .. "defaults")
  vim.opt.rtp:prepend(lazypath)
  require "plugins"
  local harpoon = require("harpoon")
  harpoon:setup()

  if vim.g.neovide then

    vim.g.neovide_cursor_vfx_mode = "sonicboom"
    vim.g.neovide_transparency = 0.7 
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_cursor_animation_length = 0.05
    vim.g.neovide_cursor_animate_in_insert_mode = true
    vim.g.neovide_cursor_animate_command_line = true
    vim.g.neovide_cursor_smooth_blink = true
    -- Put anything you want to happen only in Neovide here
  end

  vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
  vim.keymap.set("n", "<s-l>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

  vim.cmd([[
  let @c = "i/**\<enter>*@type {}\<enter>*/\<Esc>kf{a"
  ]])

  vim.cmd([[
  let @d = "i/**\<enter>*@description {}\<enter>*/\<Esc>kf{a"
  ]])

  vim.cmd(":abbreviate c console.log('probando')")
  vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('highlight_yank', {}),
    desc = 'Hightlight selection on yank',
    pattern = '*',
    callback = function()
      vim.highlight.on_yank {  timeout = 300 }
    end,
  })
end
