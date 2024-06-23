--[[
                                                  __   
        ______     ______   __     __   ______   |  |  
       /  __  \   / ____ \ '  '   '  ' / ____ \  |  |  
      '  '  '  ' ' '    ' ' \  \ /  / '  ______' |  |  
      |  |  |  | ' '____' '  \  '  /  ' '______  |  '_ 
      '__'  '__'  \______/    '___'    \_______' '____'

--]]

vim.opt.background = "dark"
vim.opt.termguicolors = true

vim.cmd.highlight("clear")

vim.g.colors_name = "novel"

local P = {
  White     = "#ffffff",
  LightGrey = "#a8a8a8",
  DarkGrey  = "#1c1c1c",
  Black     = "#000000",
  Red       = "#ff0000",
  Bronze    = "#af8700",
  Orange    = "#ffaf5f",
  Yellow    = "#ffffaf",
  Pink      = "#ffafff",
  Green     = "#5fff5f",
  Salmon    = "#ff8787",
  Blue      = "#87ffff"
}

local G = {
  CmpItemAbbrDefault = { fg = P.White },
  CmpItemAbbrDeprecatedDefault = { fg = P.Orange },
  CmpItemAbbrMatchDefault = { fg = P.White },
  CmpItemAbbrMatchFuzzyDefault = { fg = P.White },
  CmpItemKindDefault = { fg = P.White },
  CmpItemMenuDefault = { fg = P.White },
  ColorColumn = { bg = P.DarkGrey },
  Comment = { fg = P.LightGrey },
  Conceal = { fg = P.LightGrey },
  Constant = { fg = P.Orange },
  Cursor = { bg = P.White },
  CursorColumn = { bg = P.DarkGrey },
  CursorLine = { bg = P.DarkGrey },
  CursorLineNr = { fg = P.LightGrey, bg = P.DarkGrey, bold = true },
  Delimiter = { fg = P.White },
  DiagnosticDeprecated = { fg = P.White, sp = P.Orange, strikethrough = true },
  DiagnosticError = { fg = P.Red },
  DiagnosticHint = { fg = P.Green },
  DiagnosticInfo = { fg = P.Blue },
  DiagnosticOk = { fg = P.White },
  DiagnosticUnderlineError = { sp = P.Red, underline = true },
  DiagnosticUnderlineHint = { sp = P.Green, underline = true },
  DiagnosticUnderlineInfo = { sp = P.Blue, underline = true },
  DiagnosticUnderlineOk = { sp = P.White, underline = true },
  DiagnosticUnderlineWarn = { sp = P.Orange, underline = true },
  DiagnosticWarn = { fg = P.Orange },
  DiffAdd = { fg = P.Black, bg = P.Green },
  DiffChange = { fg = P.Black, bg = P.Blue },
  DiffDelete = { fg = P.Black, bg = P.Red },
  DiffText = { fg = P.Black, bg = P.LightGrey },
  Directory = { fg = P.White },
  EndOfBuffer = { fg = P.LightGrey, bold = true },
  Error = { fg = P.White },
  ErrorMsg = { fg = P.White },
  FloatShadow = { bg = P.DarkGrey },
  FloatShadowThrough = { bg = P.DarkGrey },
  FoldColumn = { bg = P.DarkGrey },
  Folded = { fg = P.White },
  Function = { fg = P.Yellow },
  Identifier = { fg = P.Green },
  IncSearch = { fg = P.Black, bg = P.Yellow },
  LineNr = { fg = P.LightGrey, bold = true },
  MatchParen = { fg = P.Yellow, bg = P.Bronze },
  ModeMsg = { fg = P.White },
  MoreMsg = { fg = P.White },
  NonText = { fg = P.Black, bg = P.Pink },
  Normal = { fg = P.White },
  NvimInternalError = { fg = P.White },
  Pmenu = { fg = P.White, bg = P.DarkGrey },
  PmenuSbar = { bg = P.DarkGrey },
  PmenuSel = { fg = P.Black, bg = P.LightGrey },
  PmenuThumb = { bg = P.LightGrey },
  PreProc = { fg = P.Pink },
  Question = { fg = P.Blue, bold = true },
  QuickFixLine = { fg = P.Black, bg = P.Blue },
  RedrawDebugClear = { fg = P.Black, bg = P.Yellow },
  RedrawDebugComposed = { fg = P.Black, bg = P.Green },
  RedrawDebugNormal = { fg = P.Black, bg = P.Blue },
  RedrawDebugRecompose = { fg = P.Black, bg = P.Red },
  Search = { fg = P.Black, bg = P.Yellow },
  Special = { fg = P.White },
  SpecialKey = { fg = P.White },
  SpellBad = { fg = P.White, sp = P.Red, undercurl = true },
  SpellCap = { fg = P.White, sp = P.Yellow, undercurl = true },
  SpellLocal = { fg = P.White, sp = P.Green, undercurl = true },
  SpellRare = { fg = P.White, sp = P.Orange, undercurl = true },
  Statement = { fg = P.Salmon },
  StatusLine = { fg = P.White, bg = P.DarkGrey, bold = true },
  StatusLineNC = { fg = P.White, bg = P.DarkGrey },
  StatusLineTerm = { fg = P.White, bg = P.DarkGrey, bold = true },
  StatusLineTermNC = { fg = P.White, bg = P.DarkGrey },
  TabLine = { fg = P.White, bg = P.DarkGrey },
  TabLineFill = { bg = P.DarkGrey },
  TabLineSel = { fg = P.Black, bg = P.LightGrey },
  TermCursor = { bg = P.White },
  Title = { fg = P.White },
  Todo = { fg = P.Black, bg = P.Blue },
  ToolbarButton = { fg = P.Black, bg = P.LightGrey },
  ToolbarLine = { bg = P.DarkGrey },
  Type = { fg = P.Blue },
  Underlined = { fg = P.White, underline = true },
  VertSplit = { fg = P.DarkGrey, bg = P.DarkGrey },
  Visual = { fg = P.Black, bg = P.LightGrey },
  VisualNOS = { fg = P.Black, bg = P.LightGrey },
  WarningMsg = { fg = P.Orange },
  WildMenu = { fg = P.Black, bg = P.LightGrey, bold = true },
  WinBar = { bg = P.DarkGrey },
  lCursor = { bg = P.White },
  CurSearch = { link = "Search" },
  CursorLineFold = { link = "CursorLine" },
  CursorLineSign = { link = "CursorLine" },
  LineNrAbove = { link = "LineNr" },
  LineNrBelow = { link = "LineNr" },
  MessageWindow = { link = "Pmenu" },
  PopupNotification = { link = "Todo" },
  Terminal = { link = "Normal" }
}

for name, val in pairs(G) do
  vim.api.nvim_set_hl(0, name, val)
end
