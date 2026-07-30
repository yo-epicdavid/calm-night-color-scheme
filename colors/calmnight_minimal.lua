-- calmnight_minimal.lua — 3-hue low-load variant of calmnight.
-- Reuses all of calmnight's UI / plugin / terminal work, then collapses
-- the syntax palette: strings=green, numbers/constants/types=amber,
-- comments=gray italic, EVERYTHING else off-white. Cursor stays yellow.

vim.cmd("runtime colors/calmnight.lua") -- load the full base first
vim.g.colors_name = "calmnight_minimal"

local fg, dim, green, amber = "#c5c8c6", "#969896", "#b5bd68", "#de935f"
local function set(groups, opts)
  for _, g in ipairs(groups) do
    vim.api.nvim_set_hl(0, g, opts)
  end
end

-- Neutral off-white: keywords, functions, variables, tags, everything structural
set({
  "Keyword", "Statement", "Conditional", "Repeat", "Label", "Exception",
  "Include", "Define", "Function", "PreProc", "Macro", "PreCondit",
  "Special", "Tag", "Identifier", "Delimiter", "StorageClass",
  "@keyword", "@keyword.function", "@keyword.operator", "@keyword.return",
  "@keyword.import", "@keyword.conditional", "@keyword.repeat", "@keyword.exception",
  "@function", "@function.builtin", "@function.call", "@function.method",
  "@function.method.call", "@function.macro", "@constant.macro",
  "@variable", "@variable.builtin", "@variable.parameter", "@variable.member",
  "@property", "@field", "@label", "@tag", "@tag.builtin", "@tag.attribute",
  "@punctuation.special", "@constructor.tag",
}, { fg = fg })

-- Amber: numbers, constants, booleans, types
set({
  "Type", "Structure", "Typedef", "Number", "Boolean", "Float", "Constant",
  "@type", "@type.builtin", "@type.definition", "@constructor", "@module",
  "@namespace", "@attribute", "@number", "@number.float", "@boolean",
  "@constant", "@constant.builtin", "@string.escape",
}, { fg = amber })

-- Strings: green (reassert)
set({ "String", "Character", "@string", "@character", "@string.regexp" }, { fg = green })

-- Comments: dim gray italic (reassert)
set({ "Comment", "@comment", "@comment.documentation" }, { fg = dim, italic = true })

-- Operators / punctuation: dim, so they recede
set({ "Operator", "@operator", "@punctuation.delimiter", "@punctuation.bracket" }, { fg = dim })
