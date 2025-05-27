-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
require "nvchad.options"

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "ruff", "ts_ls", "tailwindcss", "clangd" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    single_file_support = true,
  }
end

vim.diagnostic.config { virtual_text = false }

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
