local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities


local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "intelephense", "emmet_ls" , "gopls" , "jsonls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.volar.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    documentFormatting = {
      defaultPrintWidth = 100,
    },
  },
  filetypes = { "vue", },
}

lspconfig.powershell_es.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  bundle_path = vim.fn.stdpath "data" .. "/mason/packages/powershell-editor-services/",
}
