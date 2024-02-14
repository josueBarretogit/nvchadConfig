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



  vim.cmd([[
  let @c = "i/**\<enter>@type {}\<enter>*/\<Esc>kf{a"
  ]])

  vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('highlight_yank', {}),
    desc = 'Hightlight selection on yank',
    pattern = '*',
    callback = function()
      vim.highlight.on_yank {  timeout = 300 }
    end,
  })
end
