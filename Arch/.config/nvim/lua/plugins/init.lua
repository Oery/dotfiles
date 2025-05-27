local colors = require("base46").get_theme_tb "base_30"

return {
  { -- Code Formatter
    "stevearc/conform.nvim",
    event = "BufWritePre", -- format on save
    opts = require "configs.conform",
  },

  { -- LSP Client
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  { import = "nvchad.blink.lazyspec" },

  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
      require("tiny-inline-diagnostic").setup {
        preset = "classic",
        transparent_bg = true,

        options = {
          multilines = {
            enabled = true,
            always_show = true,
          },
          use_icons_from_diagnostic = true,
          show_all_diags_on_cursorline = false,
        },
      }
    end,
  },

  {
    "folke/trouble.nvim",
    event = "LspAttach",
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },

  {
    "mrcjkb/rustaceanvim",
    lazy = false,
  },

  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },

  { -- Discord Rich Presence
    "vyfor/cord.nvim",
    lazy = false,
    build = ":Cord update",
  },

  { -- Wakatime
    "wakatime/vim-wakatime",
    lazy = false,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      extensions = {
        repo = {
          list = {
            tail_path = true,
            search_dirs = {
              "~/Documents/GitHub",
              "~/Documents/Code",
              "~/Downloads",
            },
          },
        },
      },
    },
  },

  { -- Telescope extension for Git repos
    "cljoly/telescope-repo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    lazy = false,
    keys = {
      { "<leader>fr", "<cmd>Telescope repo list<cr>", desc = "Find Repositories" },
    },
    config = function()
      require("telescope").load_extension "repo"
    end,
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
    lazy = false,
    config = function()
      require("telescope").load_extension "ui-select"
    end,
  },

  { -- Automatically change current working directory
    "notjedi/nvim-rooter.lua",
    lazy = false,
    opts = {},
  },

  {
    "nanotee/zoxide.vim",
    lazy = false,
  },

  {
    "stevearc/oil.nvim",
    dependencies = { { "echasnovski/mini.icons" } },
    lazy = false,
  },

  { -- Display updates for Rust crates inside cargo.toml
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "python",
        "rust",
        "toml",
        "c_sharp",
        "desktop",
        "go",
        "typescript",
        "tsx",
        "json",
        "jsonc",
      },
    },
  },

  {
    "karb94/neoscroll.nvim",
    opts = {},
    lazy = false,
  },

  {
    "folke/which-key.nvim",
    lazy = false,
    opts = {},
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      scope = {
        enabled = false,
      },
    },
  },

  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      default = true,
      color_icons = false,
    },
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    opts = {
      TODO = {
        color = "info",
      },
      colors = {
        info = { colors.white },
        error = { colors.red },
        warning = { colors.orange },
        hint = { colors.light_grey },
      },
    },
  },

  {
    "nmac427/guess-indent.nvim",
    lazy = false,
    opts = {},
  },
}
