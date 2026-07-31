" calmnight lightline theme — matches colors/calmnight.vim
" [guihex, cterm256]
let s:fg     = ['#c5c8c6', 251]
let s:bg     = ['#282c34', 236]
let s:dim    = ['#969896', 245]
let s:mid    = ['#21252b', 235]
let s:sel    = ['#373b41', 237]
let s:blue   = ['#81a2be', 110]
let s:green  = ['#b5bd68', 143]
let s:yellow = ['#f0c674', 179]
let s:red    = ['#cc6666', 167]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left   = [ [s:bg, s:blue], [s:fg, s:sel] ]
let s:p.normal.right  = [ [s:bg, s:blue], [s:fg, s:sel] ]
let s:p.normal.middle = [ [s:dim, s:mid] ]
let s:p.normal.error  = [ [s:bg, s:red] ]
let s:p.normal.warning = [ [s:bg, s:yellow] ]

let s:p.insert.left   = [ [s:bg, s:green], [s:fg, s:sel] ]
let s:p.insert.right  = [ [s:bg, s:green], [s:fg, s:sel] ]
let s:p.insert.middle = [ [s:dim, s:mid] ]

let s:p.replace.left   = [ [s:bg, s:red], [s:fg, s:sel] ]
let s:p.replace.right  = [ [s:bg, s:red], [s:fg, s:sel] ]
let s:p.replace.middle = [ [s:dim, s:mid] ]

let s:p.visual.left   = [ [s:bg, s:yellow], [s:fg, s:sel] ]
let s:p.visual.right  = [ [s:bg, s:yellow], [s:fg, s:sel] ]
let s:p.visual.middle = [ [s:dim, s:mid] ]

let s:p.inactive.left   = [ [s:dim, s:mid], [s:dim, s:mid] ]
let s:p.inactive.right  = [ [s:dim, s:mid], [s:dim, s:mid] ]
let s:p.inactive.middle = [ [s:dim, s:mid] ]

let s:p.tabline.left   = [ [s:fg, s:mid] ]
let s:p.tabline.tabsel = [ [s:bg, s:blue] ]
let s:p.tabline.middle = [ [s:dim, s:mid] ]
let s:p.tabline.right  = [ [s:fg, s:mid] ]

let g:lightline#colorscheme#calmnight#palette = lightline#colorscheme#flatten(s:p)
