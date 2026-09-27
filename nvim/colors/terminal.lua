-- Palette slots 0-15, matching Vim's :hi numbers. Color names are avoided
-- because Nvim rewrites them to fixed 256-color indexes.

vim.opt.termguicolors = false
vim.cmd.highlight('clear')
if vim.fn.exists('syntax_on') == 1 then
  vim.cmd('syntax reset')
end
vim.g.colors_name = 'terminal'

local dark = {
  Comment = { ctermfg = 11 },
  Constant = { ctermfg = 13 },
  Special = { ctermfg = 12 },
  Identifier = { ctermfg = 11, bold = true },
  Statement = { ctermfg = 14 },
  PreProc = { ctermfg = 9 },
  Type = { ctermfg = 10 },
  Underlined = { ctermfg = 9, underline = true },
  Ignore = { ctermfg = 0 },
  Added = { ctermfg = 10 },
  Changed = { ctermfg = 9 },
  Removed = { ctermfg = 12 },
  LineNr = { ctermfg = 14 },
  CursorLineNr = { ctermfg = 14, underline = true },
  NonText = { ctermfg = 9 },
  Search = { ctermfg = 0, ctermbg = 14 },
  Pmenu = { ctermfg = 0, ctermbg = 13 },
  PmenuSel = { ctermfg = 8, ctermbg = 0 },
  Directory = { ctermfg = 11 },
  SpecialKey = { ctermfg = 9 },
  Folded = { ctermfg = 11, ctermbg = 8 },
  FoldColumn = { ctermfg = 11, ctermbg = 8 },
  SignColumn = { ctermfg = 11, ctermbg = 8 },
  MatchParen = { ctermbg = 3 },
  WarningMsg = { ctermfg = 12 },
  Title = { ctermfg = 13 },
  MoreMsg = { ctermfg = 10 },
  Question = { ctermfg = 10 },
  ColorColumn = { ctermbg = 4 },
  DiffAdd = { ctermbg = 1 },
  DiffChange = { ctermbg = 5 },
  DiffDelete = { ctermfg = 9, ctermbg = 3 },
  ErrorMsg = { ctermfg = 15, ctermbg = 4 },
  WildMenu = { ctermfg = 0, ctermbg = 14 },
  TabLine = { ctermfg = 15, ctermbg = 8, underline = true },
  Conceal = { ctermfg = 7, ctermbg = 8 },
}

local light = {
  Comment = { ctermfg = 1 },
  Constant = { ctermfg = 4 },
  Special = { ctermfg = 5 },
  Identifier = { ctermfg = 3 },
  Statement = { ctermfg = 6 },
  PreProc = { ctermfg = 5 },
  Type = { ctermfg = 2 },
  Underlined = { ctermfg = 5, underline = true },
  Ignore = { ctermfg = 15 },
  Added = { ctermfg = 2 },
  Changed = { ctermfg = 9 },
  Removed = { ctermfg = 12 },
  LineNr = { ctermfg = 6 },
  CursorLineNr = { ctermfg = 6, underline = true },
  NonText = { ctermfg = 9 },
  Search = { ctermfg = 0, ctermbg = 14 },
  Pmenu = { ctermfg = 0, ctermbg = 13 },
  PmenuSel = { ctermfg = 0, ctermbg = 7 },
  Directory = { ctermfg = 1 },
  SpecialKey = { ctermfg = 1 },
  Folded = { ctermfg = 1, ctermbg = 7 },
  FoldColumn = { ctermfg = 1, ctermbg = 7 },
  SignColumn = { ctermfg = 1, ctermbg = 7 },
  MatchParen = { ctermbg = 11 },
  WarningMsg = { ctermfg = 4 },
  Title = { ctermfg = 5 },
  MoreMsg = { ctermfg = 2 },
  Question = { ctermfg = 2 },
  ColorColumn = { ctermbg = 12 },
  DiffAdd = { ctermbg = 9 },
  DiffChange = { ctermbg = 13 },
  DiffDelete = { ctermfg = 9, ctermbg = 11 },
  ErrorMsg = { ctermfg = 15, ctermbg = 4 },
  WildMenu = { ctermfg = 0, ctermbg = 14 },
  TabLine = { ctermfg = 0, ctermbg = 7, underline = true },
  Conceal = { ctermfg = 7, ctermbg = 8 },
}

local shared = {
  Error = { ctermfg = 15, ctermbg = 12 },
  Todo = { ctermfg = 0, ctermbg = 14 },
  Bold = { bold = true },
  Italic = { italic = true },
  BoldItalic = { bold = true, italic = true },
  StatusLine = { bold = true, reverse = true },
  StatusLineNC = { reverse = true },
  IncSearch = { reverse = true },
  Visual = { reverse = true },
  ModeMsg = { bold = true },
  VertSplit = { reverse = true },
}

local groups = vim.o.background == 'light' and light or dark
for name, val in pairs(shared) do
  groups[name] = val
end

for name, val in pairs(groups) do
  vim.api.nvim_set_hl(0, name, val)
end

-- Unset so the terminal foreground and background are used.
vim.api.nvim_set_hl(0, 'Normal', {})
vim.api.nvim_set_hl(0, 'NormalNC', {})
vim.api.nvim_set_hl(0, 'NormalFloat', {})
vim.api.nvim_set_hl(0, 'MsgArea', {})

local links = {
  String = 'Constant',
  Character = 'Constant',
  Number = 'Constant',
  Boolean = 'Constant',
  Float = 'Number',
  Function = 'Identifier',
  Conditional = 'Statement',
  Repeat = 'Statement',
  Label = 'Statement',
  Operator = 'Statement',
  Keyword = 'Statement',
  Exception = 'Statement',
  Include = 'PreProc',
  Define = 'PreProc',
  Macro = 'PreProc',
  PreCondit = 'PreProc',
  StorageClass = 'Type',
  Structure = 'Type',
  Typedef = 'Type',
  Tag = 'Special',
  SpecialChar = 'Special',
  Delimiter = 'Special',
  SpecialComment = 'Special',
  Debug = 'Special',
  EndOfBuffer = 'NonText',
  LineNrAbove = 'LineNr',
  LineNrBelow = 'LineNr',
  StatusLineTerm = 'StatusLine',
  StatusLineTermNC = 'StatusLineNC',
  WinSeparator = 'VertSplit',
  CurSearch = 'Search',
  Whitespace = 'NonText',
}

for from, to in pairs(links) do
  vim.api.nvim_set_hl(0, from, { link = to })
end
