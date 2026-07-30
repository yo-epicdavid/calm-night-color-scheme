" calmnight.vim — low-eye-strain dark colorscheme
" Off-white text on dark gray, desaturated accents. Matches the Ghostty
" terminal palette, the JetBrains "Calm Night" theme, and the Neovim scheme.
" Requires: set termguicolors (already on in your .vimrc).

hi clear
if exists('syntax_on')
  syntax reset
endif
set background=dark
let g:colors_name = 'calmnight'

" --- Palette ------------------------------------------------------------------
" gui hex + nearest ANSI index (so a non-truecolor terminal degrades to the
" matching Ghostty palette entry).
let s:bg      = '#282c34' | let s:c_bg      = 'NONE'
let s:bg_dim  = '#21252b'
let s:bg_dark = '#1b1d23'
let s:line    = '#2c313a'
let s:sel     = '#373b41'
let s:sel_lst = '#3d4350'
let s:fg      = '#c5c8c6' | let s:c_fg  = 7
let s:fg_dim  = '#969896' | let s:c_dim = 8
let s:faint   = '#5c6370' | let s:c_fnt = 8
let s:border  = '#181a1f'
let s:red     = '#cc6666' | let s:c_red = 1
let s:orange  = '#de935f' | let s:c_org = 3
let s:yellow  = '#f0c674' | let s:c_ylw = 3
let s:green   = '#b5bd68' | let s:c_grn = 2
let s:cyan    = '#8abeb7' | let s:c_cyn = 6
let s:blue    = '#81a2be' | let s:c_blu = 4
let s:purple  = '#b294bb' | let s:c_pur = 5
let s:br_blue = '#7aa6da'
let s:br_red  = '#d54e53'
let s:white   = '#eaeaea' | let s:c_wht = 15

" --- Helper -------------------------------------------------------------------
function! s:hi(group, fg, bg, cfg, cbg, attr) abort
  let l:cmd = 'hi ' . a:group
  let l:cmd .= ' guifg=' . (empty(a:fg) ? 'NONE' : a:fg)
  let l:cmd .= ' guibg=' . (empty(a:bg) ? 'NONE' : a:bg)
  let l:cmd .= ' ctermfg=' . (a:cfg is# '' ? 'NONE' : a:cfg)
  let l:cmd .= ' ctermbg=' . (a:cbg is# '' ? 'NONE' : a:cbg)
  let l:cmd .= ' gui=' . a:attr . ' cterm=' . a:attr
  execute l:cmd
endfunction

" =============================================================================
" Editor / UI
" =============================================================================
call s:hi('Normal',       s:fg,     s:bg,     s:c_fg,  s:c_bg, 'NONE')
call s:hi('NormalNC',     s:fg,     s:bg,     s:c_fg,  s:c_bg, 'NONE')
call s:hi('Cursor',       s:bg,     s:yellow, s:c_bg,  s:c_ylw,'NONE')
call s:hi('CursorLine',   '',       s:line,   '',      '',     'NONE')
call s:hi('CursorColumn', '',       s:line,   '',      '',     'NONE')
call s:hi('CursorLineNr', s:yellow, s:line,   s:c_ylw, '',     'bold')
call s:hi('LineNr',       s:faint,  s:bg,     s:c_fnt, s:c_bg, 'NONE')
call s:hi('LineNrAbove',  s:faint,  s:bg,     s:c_fnt, s:c_bg, 'NONE')
call s:hi('LineNrBelow',  s:faint,  s:bg,     s:c_fnt, s:c_bg, 'NONE')
call s:hi('SignColumn',   s:faint,  s:bg,     s:c_fnt, s:c_bg, 'NONE')
call s:hi('ColorColumn',  '',       s:bg_dim, '',      '',     'NONE')
call s:hi('VertSplit',    s:border, s:bg,     '',      s:c_bg, 'NONE')
call s:hi('Folded',       s:fg_dim, s:line,   s:c_dim, '',     'italic')
call s:hi('FoldColumn',   s:faint,  s:bg,     s:c_fnt, s:c_bg, 'NONE')
call s:hi('MatchParen',   s:yellow, '#3a3f4b',s:c_ylw, '',     'bold')
call s:hi('Visual',       '',       s:sel,    '',      '',     'NONE')
call s:hi('Search',       s:bg,     s:yellow, s:c_bg,  s:c_ylw,'NONE')
call s:hi('IncSearch',    s:bg,     s:orange, s:c_bg,  s:c_org,'NONE')
call s:hi('CurSearch',    s:bg,     s:orange, s:c_bg,  s:c_org,'NONE')
call s:hi('Title',        s:yellow, '',       s:c_ylw, '',     'bold')
call s:hi('Directory',    s:blue,   '',       s:c_blu, '',     'NONE')
call s:hi('NonText',      '#3a3f4b',s:bg,     s:c_fnt, s:c_bg, 'NONE')
call s:hi('SpecialKey',   '#3a3f4b','',       s:c_fnt, '',     'NONE')
call s:hi('EndOfBuffer',  s:bg,     s:bg,     s:c_bg,  s:c_bg, 'NONE')
call s:hi('Conceal',      s:faint,  '',       s:c_fnt, '',     'NONE')
call s:hi('Pmenu',        s:fg,     s:bg_dim, s:c_fg,  '',     'NONE')
call s:hi('PmenuSel',     s:white,  s:sel_lst,s:c_wht, '',     'bold')
call s:hi('PmenuSbar',    '',       s:bg_dim, '',      '',     'NONE')
call s:hi('PmenuThumb',   '',       '#4a505c','',      '',     'NONE')
call s:hi('StatusLine',   s:fg,     s:bg_dim, s:c_fg,  '',     'NONE')
call s:hi('StatusLineNC', s:fg_dim, s:bg_dim, s:c_dim, '',     'NONE')
call s:hi('TabLine',      s:fg_dim, s:bg_dim, s:c_dim, '',     'NONE')
call s:hi('TabLineFill',  '',       s:bg_dim, '',      '',     'NONE')
call s:hi('TabLineSel',   s:white,  s:bg,     s:c_wht, s:c_bg, 'bold')
call s:hi('WildMenu',     s:bg,     s:yellow, s:c_bg,  s:c_ylw,'NONE')
call s:hi('ModeMsg',      s:fg_dim, '',       s:c_dim, '',     'NONE')
call s:hi('MoreMsg',      s:green,  '',       s:c_grn, '',     'NONE')
call s:hi('Question',     s:green,  '',       s:c_grn, '',     'NONE')
call s:hi('WarningMsg',   s:yellow, '',       s:c_ylw, '',     'NONE')
call s:hi('ErrorMsg',     s:red,    '',       s:c_red, '',     'NONE')

" =============================================================================
" Syntax
" =============================================================================
call s:hi('Comment',      s:fg_dim, '', s:c_dim, '', 'italic')
call s:hi('Constant',     s:orange, '', s:c_org, '', 'NONE')
call s:hi('String',       s:green,  '', s:c_grn, '', 'NONE')
call s:hi('Character',    s:green,  '', s:c_grn, '', 'NONE')
call s:hi('Number',       s:orange, '', s:c_org, '', 'NONE')
call s:hi('Boolean',      s:orange, '', s:c_org, '', 'NONE')
call s:hi('Float',        s:orange, '', s:c_org, '', 'NONE')
call s:hi('Identifier',   s:fg,     '', s:c_fg,  '', 'NONE')
call s:hi('Function',     s:blue,   '', s:c_blu, '', 'NONE')
call s:hi('Statement',    s:purple, '', s:c_pur, '', 'NONE')
call s:hi('Conditional',  s:purple, '', s:c_pur, '', 'NONE')
call s:hi('Repeat',       s:purple, '', s:c_pur, '', 'NONE')
call s:hi('Label',        s:purple, '', s:c_pur, '', 'NONE')
call s:hi('Operator',     s:fg_dim, '', s:c_dim, '', 'NONE')
call s:hi('Keyword',      s:purple, '', s:c_pur, '', 'NONE')
call s:hi('Exception',    s:purple, '', s:c_pur, '', 'NONE')
call s:hi('PreProc',      s:cyan,   '', s:c_cyn, '', 'NONE')
call s:hi('Include',      s:purple, '', s:c_pur, '', 'NONE')
call s:hi('Define',       s:purple, '', s:c_pur, '', 'NONE')
call s:hi('Macro',        s:cyan,   '', s:c_cyn, '', 'NONE')
call s:hi('PreCondit',    s:cyan,   '', s:c_cyn, '', 'NONE')
call s:hi('Type',         s:yellow, '', s:c_ylw, '', 'NONE')
call s:hi('StorageClass', s:yellow, '', s:c_ylw, '', 'NONE')
call s:hi('Structure',    s:yellow, '', s:c_ylw, '', 'NONE')
call s:hi('Typedef',      s:yellow, '', s:c_ylw, '', 'NONE')
call s:hi('Special',      s:cyan,   '', s:c_cyn, '', 'NONE')
call s:hi('SpecialChar',  s:orange, '', s:c_org, '', 'NONE')
call s:hi('Tag',          s:red,    '', s:c_red, '', 'NONE')
call s:hi('Delimiter',    s:fg,     '', s:c_fg,  '', 'NONE')
call s:hi('SpecialComment',s:fg_dim,'', s:c_dim, '', 'italic')
call s:hi('Debug',        s:red,    '', s:c_red, '', 'NONE')
call s:hi('Underlined',   s:br_blue,'', s:c_blu, '', 'underline')
call s:hi('Ignore',       s:faint,  '', s:c_fnt, '', 'NONE')
call s:hi('Error',        s:red,    '', s:c_red, '', 'NONE')
call s:hi('Todo',         s:bg,     s:yellow, s:c_bg, s:c_ylw, 'bold')

" =============================================================================
" Diff / spell
" =============================================================================
call s:hi('DiffAdd',    '', '#2e3a2e', '', s:c_grn, 'NONE')
call s:hi('DiffChange', '', '#2e343f', '', s:c_blu, 'NONE')
call s:hi('DiffDelete', s:red, '#3a2e2e', s:c_red, '', 'NONE')
call s:hi('DiffText',   '', '#3a4a3a', '', s:c_grn, 'NONE')
call s:hi('SpellBad',   '', '', s:c_red, '', 'undercurl')
call s:hi('SpellCap',   '', '', s:c_ylw, '', 'undercurl')
call s:hi('SpellRare',  '', '', s:c_pur, '', 'undercurl')
call s:hi('SpellLocal', '', '', s:c_cyn, '', 'undercurl')

" =============================================================================
" Plugins: NERDTree, GitGutter, CoC, Startify
" =============================================================================
call s:hi('NERDTreeDir',      s:blue,   '', s:c_blu, '', 'NONE')
call s:hi('NERDTreeDirSlash', s:faint,  '', s:c_fnt, '', 'NONE')
call s:hi('NERDTreeCWD',      s:yellow, '', s:c_ylw, '', 'bold')
call s:hi('NERDTreeOpenable', s:fg_dim, '', s:c_dim, '', 'NONE')
call s:hi('NERDTreeClosable', s:fg_dim, '', s:c_dim, '', 'NONE')
call s:hi('NERDTreeFile',     s:fg,     '', s:c_fg,  '', 'NONE')
call s:hi('NERDTreeExecFile', s:green,  '', s:c_grn, '', 'NONE')
call s:hi('NERDTreeFlags',    s:faint,  '', s:c_fnt, '', 'NONE')

call s:hi('GitGutterAdd',          s:green,  s:bg, s:c_grn, s:c_bg, 'NONE')
call s:hi('GitGutterChange',       s:blue,   s:bg, s:c_blu, s:c_bg, 'NONE')
call s:hi('GitGutterDelete',       s:red,    s:bg, s:c_red, s:c_bg, 'NONE')
call s:hi('GitGutterChangeDelete', s:red,    s:bg, s:c_red, s:c_bg, 'NONE')

call s:hi('CocErrorSign',   s:red,    s:bg, s:c_red, s:c_bg, 'NONE')
call s:hi('CocWarningSign', s:yellow, s:bg, s:c_ylw, s:c_bg, 'NONE')
call s:hi('CocInfoSign',    s:blue,   s:bg, s:c_blu, s:c_bg, 'NONE')
call s:hi('CocHintSign',    s:cyan,   s:bg, s:c_cyn, s:c_bg, 'NONE')
call s:hi('CocErrorHighlight',   '', '', s:c_red, '', 'undercurl')
call s:hi('CocWarningHighlight', '', '', s:c_ylw, '', 'undercurl')
call s:hi('CocInfoHighlight',    '', '', s:c_blu, '', 'undercurl')
call s:hi('CocHintHighlight',    '', '', s:c_cyn, '', 'undercurl')
call s:hi('CocFloating',    s:fg,     s:bg_dim, s:c_fg, '', 'NONE')
call s:hi('CocMenuSel',     s:white,  s:sel_lst,s:c_wht,'', 'bold')
call s:hi('CocSearch',      s:yellow, '', s:c_ylw, '', 'bold')
call s:hi('CocPumSearch',   s:yellow, '', s:c_ylw, '', 'bold')
call s:hi('CocFadeOut',     s:faint,  '', s:c_fnt, '', 'NONE')
call s:hi('CocHighlightText','',   '#3a3f4b', '', '', 'NONE')

call s:hi('StartifyHeader',  s:yellow, '', s:c_ylw, '', 'NONE')
call s:hi('StartifySection', s:blue,   '', s:c_blu, '', 'bold')
call s:hi('StartifyPath',    s:fg_dim, '', s:c_dim, '', 'NONE')
call s:hi('StartifyFile',    s:fg,     '', s:c_fg,  '', 'NONE')
call s:hi('StartifyBracket', s:faint,  '', s:c_fnt, '', 'NONE')
call s:hi('StartifyNumber',  s:orange, '', s:c_org, '', 'NONE')
call s:hi('StartifySpecial', s:faint,  '', s:c_fnt, '', 'NONE')

" =============================================================================
" :terminal ANSI palette (matches Ghostty)
" =============================================================================
let g:terminal_ansi_colors = [
  \ '#1d1f21', '#cc6666', '#b5bd68', '#f0c674',
  \ '#81a2be', '#b294bb', '#8abeb7', '#c5c8c6',
  \ '#969896', '#d54e53', '#b9ca4a', '#e7c547',
  \ '#7aa6da', '#c397d8', '#70c0b1', '#eaeaea' ]

" Link common TS/JSX groups to the base scheme
hi link typescriptImport        Keyword
hi link typescriptExport        Keyword
hi link typescriptClassKeyword  Keyword
hi link typescriptFuncKeyword   Keyword
hi link typescriptDecorators     PreProc
hi link tsxTagName              Tag
hi link tsxAttrib               Type
hi link jsxTagName              Tag
hi link jsxAttrib               Type
