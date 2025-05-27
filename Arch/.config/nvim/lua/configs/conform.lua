local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    rust = { "rustfmt", lsp_format = "fallback" },
    csharp = { "csharpier" },
    css = { "biome" },
    html = { "biome" },
    jsx = { "biome" },
    tsx = { "biome" },
    c = { "clang-format" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
