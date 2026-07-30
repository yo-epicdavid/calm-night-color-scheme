-- calmnight.lua — low-eye-strain dark colorscheme
-- Off-white text on dark gray, desaturated accents. Matches the
-- Ghostty terminal palette and the JetBrains "Calm Night" theme.
-- Base is the Tomorrow Night family, tuned to reduce halation
-- (no pure white) and chromatic aberration (no neon/saturated hues).

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.o.background = "dark"
vim.g.colors_name = "calmnight"

local c = {
  bg      = "#282c34", -- editor background
  bg_dim  = "#21252b", -- sidebars / floats / chrome
  bg_dark = "#1b1d23", -- deepest wells
  line    = "#2c313a", -- current line / hover
  sel     = "#373b41", -- visual selection
  sel_lst = "#3d4350", -- list/tree selection
  fg      = "#c5c8c6", -- default text
  fg_dim  = "#969896", -- comments / secondary
  faint   = "#5c6370", -- line numbers / inactive
  border  = "#181a1f",

  red     = "#cc6666",
  orange  = "#de935f",
  yellow  = "#f0c674",
  green   = "#b5bd68",
  cyan    = "#8abeb7",
  blue    = "#81a2be",
  purple  = "#b294bb",

  br_red    = "#d54e53",
  br_green  = "#b9ca4a",
  br_yellow = "#e7c547",
  br_blue   = "#7aa6da",
  br_purple = "#c397d8",
  br_cyan   = "#70c0b1",
  white     = "#eaeaea",
  black     = "#1d1f21",
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ============================================================
-- Editor / UI chrome
-- ============================================================
hi("Normal",        { fg = c.fg, bg = c.bg })
hi("NormalNC",      { fg = c.fg, bg = c.bg })
hi("NormalFloat",   { fg = c.fg, bg = c.bg_dim })
hi("FloatBorder",   { fg = c.border, bg = c.bg_dim })
hi("FloatTitle",    { fg = c.yellow, bg = c.bg_dim, bold = true })
hi("ColorColumn",   { bg = c.bg_dim })
hi("Cursor",        { fg = c.bg, bg = c.yellow })
hi("lCursor",       { fg = c.bg, bg = c.yellow })
hi("CursorIM",      { fg = c.bg, bg = c.yellow })
hi("TermCursor",    { fg = c.bg, bg = c.yellow })
hi("CursorLine",    { bg = c.line })
hi("CursorColumn",  { bg = c.line })
hi("CursorLineNr",  { fg = c.yellow, bg = c.line, bold = true })
hi("LineNr",        { fg = c.faint })
hi("LineNrAbove",   { fg = c.faint })
hi("LineNrBelow",   { fg = c.faint })
hi("SignColumn",    { fg = c.faint, bg = c.bg })
hi("FoldColumn",    { fg = c.faint, bg = c.bg })
hi("Folded",        { fg = c.fg_dim, bg = c.line })
hi("VertSplit",     { fg = c.border })
hi("WinSeparator",  { fg = c.border })
hi("EndOfBuffer",   { fg = c.bg })
hi("NonText",       { fg = "#3a3f4b" })
hi("Whitespace",    { fg = "#3a3f4b" })
hi("SpecialKey",    { fg = "#3a3f4b" })
hi("Conceal",       { fg = c.faint })
hi("Directory",     { fg = c.blue })
hi("Title",         { fg = c.yellow, bold = true })
hi("MatchParen",    { fg = c.yellow, bg = "#3a3f4b", bold = true })
hi("Visual",        { bg = c.sel })
hi("VisualNOS",     { bg = c.sel })
hi("Search",        { fg = c.bg, bg = c.yellow })
hi("IncSearch",     { fg = c.bg, bg = c.orange })
hi("CurSearch",     { fg = c.bg, bg = c.orange })
hi("QuickFixLine",  { bg = c.line })
hi("WinBar",        { fg = c.fg, bg = c.bg })
hi("WinBarNC",      { fg = c.fg_dim, bg = c.bg })

-- Statusline / tabs
hi("StatusLine",    { fg = c.fg, bg = c.bg_dim })
hi("StatusLineNC",  { fg = c.fg_dim, bg = c.bg_dim })
hi("TabLine",       { fg = c.fg_dim, bg = c.bg_dim })
hi("TabLineFill",   { bg = c.bg_dim })
hi("TabLineSel",    { fg = c.white, bg = c.bg })
hi("WildMenu",      { fg = c.bg, bg = c.yellow })

-- Popup menu (completion / cmdline)
hi("Pmenu",         { fg = c.fg, bg = c.bg_dim })
hi("PmenuSel",      { fg = c.white, bg = c.sel_lst })
hi("PmenuKind",     { fg = c.blue, bg = c.bg_dim })
hi("PmenuKindSel",  { fg = c.blue, bg = c.sel_lst })
hi("PmenuExtra",    { fg = c.fg_dim, bg = c.bg_dim })
hi("PmenuExtraSel", { fg = c.fg_dim, bg = c.sel_lst })
hi("PmenuSbar",     { bg = c.bg_dim })
hi("PmenuThumb",    { bg = "#4a505c" })

-- Messages
hi("ModeMsg",       { fg = c.fg_dim })
hi("MsgArea",       { fg = c.fg })
hi("MoreMsg",       { fg = c.green })
hi("Question",      { fg = c.green })
hi("WarningMsg",    { fg = c.yellow })
hi("ErrorMsg",      { fg = c.red })
hi("Error",         { fg = c.red })
hi("Todo",          { fg = c.bg, bg = c.yellow, bold = true })

-- ============================================================
-- Syntax (legacy groups)
-- ============================================================
hi("Comment",       { fg = c.fg_dim, italic = true })
hi("Constant",      { fg = c.orange })
hi("String",        { fg = c.green })
hi("Character",     { fg = c.green })
hi("Number",        { fg = c.orange })
hi("Boolean",       { fg = c.orange })
hi("Float",         { fg = c.orange })
hi("Identifier",    { fg = c.fg })
hi("Function",      { fg = c.blue })
hi("Statement",     { fg = c.purple })
hi("Conditional",   { fg = c.purple })
hi("Repeat",        { fg = c.purple })
hi("Label",         { fg = c.purple })
hi("Operator",      { fg = c.fg_dim })
hi("Keyword",       { fg = c.purple })
hi("Exception",     { fg = c.purple })
hi("PreProc",       { fg = c.cyan })
hi("Include",       { fg = c.purple })
hi("Define",        { fg = c.purple })
hi("Macro",         { fg = c.cyan })
hi("PreCondit",     { fg = c.cyan })
hi("Type",          { fg = c.yellow })
hi("StorageClass",  { fg = c.yellow })
hi("Structure",     { fg = c.yellow })
hi("Typedef",       { fg = c.yellow })
hi("Special",       { fg = c.cyan })
hi("SpecialChar",   { fg = c.orange })
hi("Tag",           { fg = c.red })
hi("Delimiter",     { fg = c.fg })
hi("SpecialComment",{ fg = c.fg_dim, italic = true })
hi("Debug",         { fg = c.red })
hi("Underlined",    { fg = c.br_blue, underline = true })
hi("Ignore",        { fg = c.faint })

-- ============================================================
-- Treesitter (@ captures — 0.9/0.10+)
-- ============================================================
hi("@variable",              { fg = c.fg })
hi("@variable.builtin",      { fg = c.red })
hi("@variable.parameter",    { fg = c.fg })
hi("@variable.member",       { fg = c.red })
hi("@constant",              { fg = c.orange })
hi("@constant.builtin",      { fg = c.orange })
hi("@constant.macro",        { fg = c.cyan })
hi("@module",                { fg = c.yellow })
hi("@label",                 { fg = c.purple })
hi("@string",                { fg = c.green })
hi("@string.escape",         { fg = c.cyan })
hi("@string.special",        { fg = c.orange })
hi("@string.regexp",         { fg = c.cyan })
hi("@character",             { fg = c.green })
hi("@character.special",     { fg = c.orange })
hi("@number",                { fg = c.orange })
hi("@number.float",          { fg = c.orange })
hi("@boolean",               { fg = c.orange })
hi("@function",              { fg = c.blue })
hi("@function.builtin",      { fg = c.cyan })
hi("@function.call",         { fg = c.blue })
hi("@function.method",       { fg = c.blue })
hi("@function.method.call",  { fg = c.blue })
hi("@function.macro",        { fg = c.cyan })
hi("@constructor",           { fg = c.yellow })
hi("@keyword",               { fg = c.purple })
hi("@keyword.function",      { fg = c.purple })
hi("@keyword.operator",      { fg = c.purple })
hi("@keyword.return",        { fg = c.purple })
hi("@keyword.import",        { fg = c.purple })
hi("@keyword.conditional",   { fg = c.purple })
hi("@keyword.repeat",        { fg = c.purple })
hi("@keyword.exception",     { fg = c.purple })
hi("@operator",              { fg = c.fg_dim })
hi("@type",                  { fg = c.yellow })
hi("@type.builtin",          { fg = c.yellow })
hi("@type.definition",       { fg = c.yellow })
hi("@attribute",             { fg = c.orange })
hi("@property",              { fg = c.red })
hi("@field",                 { fg = c.red })
hi("@comment",               { fg = c.fg_dim, italic = true })
hi("@comment.documentation", { fg = "#8a9199", italic = true })
hi("@comment.error",         { fg = c.bg, bg = c.red })
hi("@comment.warning",       { fg = c.bg, bg = c.yellow })
hi("@comment.todo",          { fg = c.bg, bg = c.yellow, bold = true })
hi("@comment.note",          { fg = c.bg, bg = c.cyan })
hi("@punctuation.delimiter", { fg = c.fg_dim })
hi("@punctuation.bracket",   { fg = c.fg })
hi("@punctuation.special",   { fg = c.cyan })
hi("@tag",                   { fg = c.red })
hi("@tag.builtin",           { fg = c.red })
hi("@tag.attribute",         { fg = c.yellow })
hi("@tag.delimiter",         { fg = c.fg_dim })
hi("@namespace",             { fg = c.yellow })

-- Markup (markdown, help) — @text.* (0.9) and @markup.* (0.10+)
hi("@text",                  { fg = c.fg })
hi("@text.strong",           { fg = c.fg, bold = true })
hi("@text.emphasis",         { fg = c.fg, italic = true })
hi("@text.title",            { fg = c.yellow, bold = true })
hi("@text.literal",          { fg = c.green })
hi("@text.uri",              { fg = c.br_blue, underline = true })
hi("@text.reference",        { fg = c.blue })
hi("@markup.strong",         { fg = c.fg, bold = true })
hi("@markup.italic",         { fg = c.fg, italic = true })
hi("@markup.heading",        { fg = c.yellow, bold = true })
hi("@markup.link",           { fg = c.blue })
hi("@markup.link.url",       { fg = c.br_blue, underline = true })
hi("@markup.raw",            { fg = c.green })
hi("@markup.list",           { fg = c.red })
hi("@markup.quote",          { fg = c.fg_dim, italic = true })
hi("@diff.plus",             { fg = c.green })
hi("@diff.minus",            { fg = c.red })
hi("@diff.delta",            { fg = c.blue })

-- ============================================================
-- LSP semantic tokens
-- ============================================================
hi("@lsp.type.class",         { link = "@type" })
hi("@lsp.type.interface",     { link = "@type" })
hi("@lsp.type.enum",          { link = "@type" })
hi("@lsp.type.struct",        { link = "@type" })
hi("@lsp.type.typeParameter", { link = "@type" })
hi("@lsp.type.namespace",     { link = "@namespace" })
hi("@lsp.type.function",      { link = "@function" })
hi("@lsp.type.method",        { link = "@function.method" })
hi("@lsp.type.property",      { link = "@property" })
hi("@lsp.type.variable",      { link = "@variable" })
hi("@lsp.type.parameter",     { link = "@variable.parameter" })
hi("@lsp.type.enumMember",    { link = "@constant" })
hi("@lsp.type.keyword",       { link = "@keyword" })
hi("@lsp.type.comment",       { link = "@comment" })
hi("@lsp.type.string",        { link = "@string" })
hi("@lsp.type.number",        { link = "@number" })
hi("@lsp.type.decorator",     { link = "@attribute" })
hi("@lsp.type.macro",         { link = "@constant.macro" })
hi("@lsp.mod.deprecated",     { strikethrough = true })

-- ============================================================
-- Diagnostics (LSP)
-- ============================================================
hi("DiagnosticError",            { fg = c.red })
hi("DiagnosticWarn",             { fg = c.yellow })
hi("DiagnosticInfo",             { fg = c.blue })
hi("DiagnosticHint",             { fg = c.cyan })
hi("DiagnosticOk",               { fg = c.green })
hi("DiagnosticVirtualTextError", { fg = c.red, bg = "#33282a" })
hi("DiagnosticVirtualTextWarn",  { fg = c.yellow, bg = "#332f28" })
hi("DiagnosticVirtualTextInfo",  { fg = c.blue, bg = "#28303a" })
hi("DiagnosticVirtualTextHint",  { fg = c.cyan, bg = "#283432" })
hi("DiagnosticUnderlineError",   { undercurl = true, sp = c.br_red })
hi("DiagnosticUnderlineWarn",    { undercurl = true, sp = c.br_yellow })
hi("DiagnosticUnderlineInfo",    { undercurl = true, sp = c.br_blue })
hi("DiagnosticUnderlineHint",    { undercurl = true, sp = c.br_cyan })
hi("DiagnosticUnnecessary",      { fg = c.faint, undercurl = true, sp = c.faint })
hi("DiagnosticDeprecated",       { strikethrough = true, sp = c.faint })

-- LSP reference highlight (cursorhold)
hi("LspReferenceText",  { bg = "#3a3f4b" })
hi("LspReferenceRead",  { bg = "#3a3f4b" })
hi("LspReferenceWrite", { bg = "#4a3a3a" })
hi("LspSignatureActiveParameter", { fg = c.orange, bold = true })
hi("LspInlayHint",      { fg = c.faint, bg = c.bg_dim, italic = true })
hi("LspCodeLens",       { fg = c.faint, italic = true })

-- ============================================================
-- Diff / git
-- ============================================================
hi("DiffAdd",     { bg = "#2e3a2e" })
hi("DiffChange",  { bg = "#2e343f" })
hi("DiffDelete",  { fg = c.red, bg = "#3a2e2e" })
hi("DiffText",    { bg = "#3a4a3a" })
hi("diffAdded",   { fg = c.green })
hi("diffRemoved", { fg = c.red })
hi("diffChanged", { fg = c.blue })
hi("diffFile",    { fg = c.yellow })
hi("diffLine",    { fg = c.cyan })

hi("GitSignsAdd",          { fg = c.green })
hi("GitSignsChange",       { fg = c.blue })
hi("GitSignsDelete",       { fg = c.red })
hi("GitSignsAddNr",        { fg = c.green })
hi("GitSignsChangeNr",     { fg = c.blue })
hi("GitSignsDeleteNr",     { fg = c.red })
hi("GitSignsCurrentLineBlame", { fg = c.faint, italic = true })

-- ============================================================
-- Plugin: neo-tree (file navigation)
-- ============================================================
hi("NeoTreeNormal",        { fg = c.fg, bg = c.bg_dim })
hi("NeoTreeNormalNC",      { fg = c.fg, bg = c.bg_dim })
hi("NeoTreeEndOfBuffer",   { fg = c.bg_dim, bg = c.bg_dim })
hi("NeoTreeCursorLine",    { bg = c.line })
hi("NeoTreeDirectoryName", { fg = c.blue })
hi("NeoTreeDirectoryIcon", { fg = c.blue })
hi("NeoTreeRootName",      { fg = c.yellow, bold = true })
hi("NeoTreeFileName",      { fg = c.fg })
hi("NeoTreeFileNameOpened",{ fg = c.white })
hi("NeoTreeIndentMarker",  { fg = "#3a3f4b" })
hi("NeoTreeExpander",      { fg = c.fg_dim })
hi("NeoTreeTitleBar",      { fg = c.bg, bg = c.blue })
hi("NeoTreeFloatBorder",   { fg = c.border, bg = c.bg_dim })
hi("NeoTreeFloatTitle",    { fg = c.yellow, bg = c.bg_dim })
hi("NeoTreeGitAdded",      { fg = c.green })
hi("NeoTreeGitModified",   { fg = c.yellow })
hi("NeoTreeGitDeleted",    { fg = c.red })
hi("NeoTreeGitUntracked",  { fg = c.orange })
hi("NeoTreeGitConflict",   { fg = c.br_red, bold = true })
hi("NeoTreeGitIgnored",    { fg = c.faint })
hi("NeoTreeTabActive",     { fg = c.white, bg = c.bg_dim })
hi("NeoTreeTabInactive",   { fg = c.faint, bg = c.bg_dark })
hi("NeoTreeTabSeparatorActive",   { fg = c.bg_dim, bg = c.bg_dim })
hi("NeoTreeTabSeparatorInactive", { fg = c.bg_dark, bg = c.bg_dark })

-- ============================================================
-- Plugin: telescope
-- ============================================================
hi("TelescopeNormal",        { fg = c.fg, bg = c.bg_dim })
hi("TelescopeBorder",        { fg = c.border, bg = c.bg_dim })
hi("TelescopePromptNormal",  { fg = c.fg, bg = c.bg_dark })
hi("TelescopePromptBorder",  { fg = c.bg_dark, bg = c.bg_dark })
hi("TelescopePromptTitle",   { fg = c.bg, bg = c.yellow, bold = true })
hi("TelescopePromptPrefix",  { fg = c.yellow, bg = c.bg_dark })
hi("TelescopePromptCounter", { fg = c.fg_dim, bg = c.bg_dark })
hi("TelescopeResultsNormal", { fg = c.fg, bg = c.bg_dim })
hi("TelescopeResultsBorder", { fg = c.bg_dim, bg = c.bg_dim })
hi("TelescopeResultsTitle",  { fg = c.bg_dim, bg = c.bg_dim })
hi("TelescopePreviewNormal", { fg = c.fg, bg = c.bg_dark })
hi("TelescopePreviewBorder", { fg = c.bg_dark, bg = c.bg_dark })
hi("TelescopePreviewTitle",  { fg = c.bg, bg = c.green, bold = true })
hi("TelescopeSelection",     { fg = c.white, bg = c.sel_lst })
hi("TelescopeSelectionCaret",{ fg = c.yellow, bg = c.sel_lst })
hi("TelescopeMultiSelection",{ fg = c.orange })
hi("TelescopeMatching",      { fg = c.yellow, bold = true })

-- ============================================================
-- Plugin: nvim-cmp
-- ============================================================
hi("CmpItemAbbr",             { fg = c.fg })
hi("CmpItemAbbrDeprecated",   { fg = c.faint, strikethrough = true })
hi("CmpItemAbbrMatch",        { fg = c.yellow, bold = true })
hi("CmpItemAbbrMatchFuzzy",   { fg = c.yellow, bold = true })
hi("CmpItemMenu",             { fg = c.fg_dim, italic = true })
hi("CmpItemKindDefault",      { fg = c.fg_dim })
hi("CmpItemKindText",         { fg = c.green })
hi("CmpItemKindMethod",       { fg = c.blue })
hi("CmpItemKindFunction",     { fg = c.blue })
hi("CmpItemKindConstructor",  { fg = c.yellow })
hi("CmpItemKindField",        { fg = c.red })
hi("CmpItemKindVariable",     { fg = c.fg })
hi("CmpItemKindClass",        { fg = c.yellow })
hi("CmpItemKindInterface",    { fg = c.yellow })
hi("CmpItemKindModule",       { fg = c.yellow })
hi("CmpItemKindProperty",     { fg = c.red })
hi("CmpItemKindKeyword",      { fg = c.purple })
hi("CmpItemKindSnippet",      { fg = c.cyan })
hi("CmpItemKindConstant",     { fg = c.orange })
hi("CmpItemKindEnum",         { fg = c.yellow })
hi("CmpItemKindEnumMember",   { fg = c.orange })

-- ============================================================
-- Plugin: which-key
-- ============================================================
hi("WhichKey",          { fg = c.blue })
hi("WhichKeyGroup",     { fg = c.yellow })
hi("WhichKeyDesc",      { fg = c.fg })
hi("WhichKeySeparator", { fg = c.fg_dim })
hi("WhichKeyValue",     { fg = c.fg_dim })
hi("WhichKeyFloat",     { bg = c.bg_dim })
hi("WhichKeyBorder",    { fg = c.border, bg = c.bg_dim })
hi("WhichKeyTitle",     { fg = c.yellow, bg = c.bg_dim })

-- ============================================================
-- Plugin: treesitter-context / misc
-- ============================================================
hi("TreesitterContext",           { bg = c.bg_dim })
hi("TreesitterContextLineNumber", { fg = c.faint, bg = c.bg_dim })
hi("IndentBlanklineChar",         { fg = "#3a3f4b" })
hi("IblIndent",                   { fg = "#30343c" })
hi("IblScope",                    { fg = c.faint })

-- ============================================================
-- :terminal ANSI palette (matches Ghostty)
-- ============================================================
vim.g.terminal_color_0  = c.black
vim.g.terminal_color_1  = c.red
vim.g.terminal_color_2  = c.green
vim.g.terminal_color_3  = c.yellow
vim.g.terminal_color_4  = c.blue
vim.g.terminal_color_5  = c.purple
vim.g.terminal_color_6  = c.cyan
vim.g.terminal_color_7  = c.fg
vim.g.terminal_color_8  = c.fg_dim
vim.g.terminal_color_9  = c.br_red
vim.g.terminal_color_10 = c.br_green
vim.g.terminal_color_11 = c.br_yellow
vim.g.terminal_color_12 = c.br_blue
vim.g.terminal_color_13 = c.br_purple
vim.g.terminal_color_14 = c.br_cyan
vim.g.terminal_color_15 = c.white
