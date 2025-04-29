---@type Base46Table
local M = {}

M.base_30 = {
  white = "#F7F1FF",
  black = "#222633",
  darker_black = "#171922",
  black2 = "#222633",
  one_bg = "#F7F1FF",
  one_bg2 = "#222633",
  one_bg3 = "#222633",
  grey = "#7e7d7e",
  dark_grey = "#555555",
  grey_fg = "#7e7d7e",
  grey_fg2 = "#7e7d7e",
  light_grey = "#7e7d7e",
  red = "#69676c",
  baby_pink = "#FAE4FC",
  pink = "#FCC5E9",
  line = "#222633",
  green = "#F7F1FF", -- Git: New Line
  vibrant_green = "#71bbab",
  nord_blue = "#91B4D5",
  blue = "#F7F1FF",
  seablue = "#ADD7FF",
  yellow = "#7e7d7e", -- Warn
  sun = "#7e7d7e",
  purple = "#F7F1FF", -- Default Text Color
  dark_purple = "#b6d7f4",
  teal = "#F7F1FF",
  orange = "#91B4D5",
  cyan = "#92e0ff",
  statusline_bg = "#222633",
  lightbg = "#222633",
  pmenu_bg = "#5FB3A1",
  folder_bg = "#f7f1ff",
}

M.base_16 = {
  base00 = M.base_30.black,
  base01 = M.base_30.one_bg,
  base02 = M.base_30.one_bg2,
  base03 = M.base_30.one_bg3,
  base04 = M.base_30.grey,
  base05 = M.base_30.purple,
  base06 = M.base_30.dark_purple,
  base07 = M.base_30.white,
  base08 = M.base_30.white,
  base09 = M.base_30.white,
  base0A = M.base_30.teal,
  base0B = M.base_30.teal,
  base0C = M.base_30.white,
  base0D = M.base_30.white,
  base0E = M.base_30.white,
  base0F = M.base_30.white,
}

M.polish_hl = {
  treesitter = {
    ["@variable"] = { fg = M.base_30.white },
    ["@variable.builtin"] = { fg = M.base_30.white },
    ["@variable.member"] = { fg = M.base_30.white },
    ["@variable.parameter"] = { fg = M.base_30.white },
    ["@function"] = { fg = M.base_30.white },
    ["@function.builtin"] = { fg = M.base_30.white },
    ["@function.call"] = { fg = M.base_30.white },
    ["@function.macro"] = { fg = M.base_30.white },
    ["@keyword"] = { fg = M.base_30.grey },
    ["@keyword.return"] = { fg = M.base_30.grey },
    ["@keyword.repeat"] = { fg = M.base_30.grey },
    ["@keyword.conditional"] = { fg = M.base_30.grey },
    ["@keyword.exception"] = { fg = M.base_30.white },
    ["@keyword.modifier"] = { fg = M.base_30.grey, italic = true },
    ["@keyword.type.rust"] = { fg = M.base_30.grey, italic = true },
    ["@operator"] = { fg = M.base_30.grey },
    ["@keyword.operator"] = { fg = M.base_30.grey },
    ["@keyword.function"] = { fg = M.base_30.white },
    ["@constant.builtin"] = { fg = M.base_30.white }, -- Ok / Some
    ["@constant"] = { fg = M.base_30.white },
    ["@constructor"] = { fg = M.base_30.grey },
    ["@property"] = { fg = M.base_30.white },
    ["@punctuation.delimiter"] = { fg = M.base_30.grey },
    ["@punctuation.special"] = { fg = M.base_30.grey },
    ["@markup.list"] = { fg = M.base_30.purple },
    ["@module.rust"] = { fg = M.base_30.white },
    ["@punctuation.bracket"] = { fg = M.base_30.grey },
    ["@type"] = { fg = M.base_30.white },
    ["@type.builtin"] = { fg = M.base_30.white },
    ["@tag.attribute"] = { fg = M.base_30.purple, italic = true, link = "" },
    ["@constructor.tsx"] = { link = "Tag" },
    ["@string"] = { fg = M.base_30.grey },
    ["@string.escape"] = { fg = M.base_30.dark_grey },
    ["@comment"] = { fg = M.base_30.dark_grey },
    ["@number"] = { fg = M.base_30.white },
    ["@number.float"] = { fg = M.base_30.white },
    ["@attribute"] = { fg = M.base_30.white },
    ["@tag.delimiter"] = { fg = M.base_30.grey },

    ["@boolean.toml"] = { fg = M.base_30.grey },

    -- Typescript
    ["@keyword.function.ts"] = { italic = true },
    ["@keyword.function.tsx"] = { italic = true },

    -- Python
    ["@keyword.exception.python"] = { fg = M.base_30.grey },

    -- Rust
    ["@variable.builtin.rust"] = { fg = M.base_30.light_grey, italic = true },

    -- C#
    ["@keyword.c_sharp"] = { fg = M.base_30.dark_grey, italic = true },
    ["@keyword.type.c_sharp"] = { fg = M.base_30.white, italic = true },
    ["@keyword.modifier.c_sharp"] = { fg = M.base_30.dark_grey, italic = true },
    ["@type.builtin.c_sharp"] = { fg = M.base_30.grey },
    ["@variable.builtin.c_sharp"] = { fg = M.base_30.grey, italic = true },
    ["@none.c_sharp"] = { fg = M.base_30.white },
  },

  lsp = {
    DiagnosticHint = { fg = "#FFEE8C" },
    DiagnosticWarn = { fg = "#FFC067" },
    DiagnosticError = { fg = "#FF746C" },

    LspInlayHint = {
      fg = M.base_30.grey,
      bg = "",
    },
  },

  telescope = {
    TelescopeMatching = { fg = M.base_30.teal },
  },

  cmp = {
    CmpItemAbbr = { fg = M.base_30.grey },
    CmpItemAbbrMatch = { fg = M.base_30.grey },
    CmpSel = { bg = M.base_30.one_bg2, link = "" },
  },

  blankline = {
    IblChar = { fg = "#292929" },
    IblScopeChar = { fg = "#292929" },
  },

  syntax = {
    Include = { fg = M.base_30.grey },
    Type = { fg = M.base_30.white },
    Label = { fg = M.base_30.white },
    String = { fg = M.base_30.grey },
    Title = { fg = M.base_30.white },
    Special = { fg = M.base_30.white },
    SpecialChar = { fg = M.base_30.grey },
    Boolean = { fg = M.base_30.white },
    Operator = { fg = M.base_30.grey },
    Keyword = { fg = M.base_30.grey },
    Repeat = { fg = M.base_30.grey },
    Conditional = { fg = M.base_30.grey },
    Statement = { fg = M.base_30.grey },
    Structure = { fg = M.base_30.white, italic = true },
    StorageClass = { fg = M.base_30.dark_grey, italic = true },

    -- C#
    csEndColon = { fg = M.base_30.grey },
    csBraces = { fg = M.base_30.grey },
    csParens = { fg = M.base_30.grey },
    csType = { fg = M.base_30.grey },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "hollow")

return M
