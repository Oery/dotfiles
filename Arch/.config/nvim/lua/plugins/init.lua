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

}
