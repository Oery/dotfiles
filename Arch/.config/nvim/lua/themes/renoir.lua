---@type Base46Table
local M = {}

-- Need a dark color for highlight fg and TelescopeSelection
--
-- Colors
-- white -> primary color #F7F1FF
-- light grey -> secondary color #7E7D7E
-- dark grey -> comments #555555
-- yellow -> warnings #FFC067
-- orange / red -> errors #FF746C
-- green ?
-- background color ->

M.base_30 = {
  white = "#F7F1FF", -- Primary
  light_grey = "#7E7D7E", -- Secondary
  grey = "#555555", -- Comments
  black = "#292929", -- Indent Lines / Selection FG

  green = "#F7F1FF", -- Git: New Line
  orange = "#FFC067", -- Warn
  red = "#FF746C", -- Errors

  darker_black = "#171922",
  black2 = "#292929",
  one_bg = "#F7F1FF",
  one_bg2 = "#292929", -- Lines, statusline_bg
  one_bg3 = "#292929",
  grey_fg = "#7e7d7e",
  grey_fg2 = "#7e7d7e",
  line = "#292929",
  vibrant_green = "#71bbab",
  nord_blue = "#91B4D5",
  blue = "#F7F1FF",
  seablue = "#ADD7FF",
  yellow = "#7e7d7e", -- Hint
  sun = "#7e7d7e",
  purple = "#F7F1FF", -- Default Text Color
  dark_purple = "#b6d7f4",
  teal = "#F7F1FF",
  cyan = "#92e0ff",
  statusline_bg = "#292929",
  lightbg = "#292929",
  pmenu_bg = "#5FB3A1",
  folder_bg = "#f7f1ff",

  pink = "#F7F1FF",
  baby_pink = "#F7F1FF",
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
    ["@keyword"] = { fg = M.base_30.light_grey },
    ["@keyword.return"] = { fg = M.base_30.light_grey },
    ["@keyword.repeat"] = { fg = M.base_30.light_grey },
    ["@keyword.conditional"] = { fg = M.base_30.light_grey },
    ["@keyword.exception"] = { fg = M.base_30.white },
    ["@keyword.modifier"] = { fg = M.base_30.light_grey, italic = true },
    ["@keyword.type.rust"] = { fg = M.base_30.light_grey, italic = true },
    ["@operator"] = { fg = M.base_30.light_grey },
    ["@keyword.operator"] = { fg = M.base_30.light_grey },
    ["@keyword.function"] = { fg = M.base_30.white },
    ["@constant.builtin"] = { fg = M.base_30.white }, -- Ok / Some
    ["@constant"] = { fg = M.base_30.white },
    ["@constructor"] = { fg = M.base_30.light_grey },
    ["@property"] = { fg = M.base_30.white },
    ["@punctuation.delimiter"] = { fg = M.base_30.light_grey },
    ["@punctuation.special"] = { fg = M.base_30.light_grey },
    ["@markup.list"] = { fg = M.base_30.purple },
    ["@module.rust"] = { fg = M.base_30.white },
    ["@punctuation.bracket"] = { fg = M.base_30.light_grey },
    ["@type"] = { fg = M.base_30.white },
    ["@type.builtin"] = { fg = M.base_30.white },
    ["@tag.attribute"] = { fg = M.base_30.purple, italic = true, link = "" },
    ["@constructor.tsx"] = { link = "Tag" },
    ["@string"] = { fg = M.base_30.light_grey },
    ["@string.escape"] = { fg = M.base_30.grey },
    ["@comment"] = { fg = M.base_30.grey, italic = true },
    ["@number"] = { fg = M.base_30.white },
    ["@number.float"] = { fg = M.base_30.white },
    ["@attribute"] = { fg = M.base_30.white },
    ["@tag.delimiter"] = { fg = M.base_30.light_grey },

    ["@boolean.toml"] = { fg = M.base_30.light_grey },

    -- Typescript
    ["@keyword.function.ts"] = { italic = true },
    ["@keyword.function.tsx"] = { italic = true },

    -- Python
    ["@keyword.exception.python"] = { fg = M.base_30.light_grey },

    -- Rust
    ["@variable.builtin.rust"] = { fg = M.base_30.light_grey, italic = true },

    -- C#
    ["@keyword.c_sharp"] = { fg = M.base_30.grey, italic = true },
    ["@keyword.type.c_sharp"] = { fg = M.base_30.white, italic = true },
    ["@keyword.modifier.c_sharp"] = { fg = M.base_30.grey, italic = true },
    ["@type.builtin.c_sharp"] = { fg = M.base_30.light_grey },
    ["@variable.builtin.c_sharp"] = { fg = M.base_30.light_grey, italic = true },
    ["@none.c_sharp"] = { fg = M.base_30.white },
  },

  lsp = {
    DiagnosticInfo = { fg = M.base_30.white },
    DiagnosticHint = { fg = "#FFEE8C" },
    DiagnosticWarn = { fg = M.base_30.orange },
    DiagnosticError = { fg = M.base_30.red },

    LspInlayHint = { bg = "" },
  },

  telescope = {
    TelescopeMatching = { bg = M.base_30.white, fg = M.base_30.black },
    TelescopePromptTitle = { bg = M.base_30.white, fg = M.base_30.black },
    TelescopePromptPrefix = { fg = M.base_30.white },
  },

  cmp = {
    CmpItemAbbr = { fg = M.base_30.light_grey },
    CmpItemAbbrMatch = { fg = M.base_30.light_grey },
    CmpSel = { bg = M.base_30.one_bg2, link = "" },
  },

  blankline = {
    IblChar = { fg = "#292929" },
    IblScopeChar = { fg = "#292929" },
  },

  syntax = {
    Include = { fg = M.base_30.light_grey },
    Type = { fg = M.base_30.white },
    Label = { fg = M.base_30.white },
    String = { fg = M.base_30.grey },
    Title = { fg = M.base_30.white },
    Special = { fg = M.base_30.white },
    SpecialChar = { fg = M.base_30.light_grey },
    Boolean = { fg = M.base_30.white },
    Operator = { fg = M.base_30.light_grey },
    Keyword = { fg = M.base_30.light_grey },
    Repeat = { fg = M.base_30.light_grey },
    Conditional = { fg = M.base_30.light_grey },
    Statement = { fg = M.base_30.light_grey },
    Structure = { fg = M.base_30.white, italic = true },
    StorageClass = { fg = M.base_30.grey, italic = true },
    Comment = { fg = M.base_30.grey, italic = true },

    -- C#
    csEndColon = { fg = M.base_30.light_grey },
    csBraces = { fg = M.base_30.light_grey },
    csParens = { fg = M.base_30.light_grey },
    csType = { fg = M.base_30.light_grey },

    DiagnosticInfo = { fg = M.base_30.white },
    DiagnosticHint = { fg = "#FFEE8C" },
    DiagnosticWarn = { fg = M.base_30.orange },
    DiagnosticError = { fg = M.base_30.red },
  },

  devicons = {
    DevIcondefault = { fg = M.base_30.white },
  },

  defaults = {
    NvDashFooter = { fg = M.base_30.white },
  },

  todo = {
    DiagnosticInfo = { fg = M.base_30.white },
    DiagnosticHint = { fg = "#FFEE8C" },
    DiagnosticWarn = { fg = M.base_30.orange },
    DiagnosticError = { fg = M.base_30.red },
  },

  tbline = {
    TbBufOnClose = { fg = M.base_30.white },
    TbBufOffModified = { fg = M.base_30.white },
    Tabline = { bg = "" },
    TbFill = { bg = "" },
  },

  -- St_Lsp = { fg = "#FFEE8C" },
}

M.type = "dark"

M = require("base46").override_theme(M, "renoir")

return M
