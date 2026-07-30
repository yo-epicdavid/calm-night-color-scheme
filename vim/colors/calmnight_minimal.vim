" calmnight_minimal.vim — 3-hue low-load variant of calmnight.
" Reuses calmnight's UI/terminal work, then collapses the syntax palette:
" strings=green, numbers/constants/types=amber, comments=gray, rest neutral.

runtime colors/calmnight.vim
let g:colors_name = 'calmnight_minimal'

" Neutral off-white: keywords, functions, and other structural tokens
for s:g in ['Keyword','Statement','Conditional','Repeat','Label','Exception',
      \ 'Include','Define','Function','PreProc','Macro','PreCondit',
      \ 'Special','Tag','Identifier','Delimiter']
  execute 'hi! ' . s:g . ' guifg=#c5c8c6 ctermfg=7 gui=NONE cterm=NONE'
endfor

" Amber: numbers/constants already amber in base; recolor types to match
for s:g in ['Type','StorageClass','Structure','Typedef']
  execute 'hi! ' . s:g . ' guifg=#de935f ctermfg=3 gui=NONE cterm=NONE'
endfor

" Strings stay green, comments stay gray italic, operators stay dim (from base).
