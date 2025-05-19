require "nvchad.options"

vim.o.cmdheight = 0
vim.o.scrolloff = 10

-- Indent
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smarttab = true

-- vim.o.shell = "fish"
vim.o.breakindent = true
vim.o.linebreak = true

vim.lsp.inlay_hint.enable(true)
local autocmd = vim.api.nvim_create_autocmd

autocmd("VimEnter", {
  command = ":silent !kitty @ set-spacing padding=0 margin=0",
})

autocmd("VimLeavePre", {
  command = ":silent !kitty @ set-spacing padding=15 margin=0",
})

-- Show Nvdash when all buffers are closed
vim.api.nvim_create_autocmd("BufDelete", {
  callback = function()
    local bufs = vim.t.bufs
    if #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == "" then
      vim.cmd "Nvdash"
    end
  end,
})

vim.g.rustaceanvim = {
  server = {
    default_settings = {
      ["rust-analyzer"] = {
        inlayHints = {
          typeHints = { enable = false },
          closingBraceHints = { enable = false },
          parameterHints = { enable = true },
        },
      },
    },
  },
}
