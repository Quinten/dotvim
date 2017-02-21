"hi clear
"if exists("syntax_on")
"	syntax reset
"endif

" Declare theme name
let g:colors_name="flatlite"

highlight Normal ctermfg=8 ctermbg=15
highlight Visual ctermfg=0 ctermbg=3

highlight LineNr ctermfg=15 ctermbg=7
highlight VertSplit ctermfg=7 ctermbg=15
highlight CursorLine ctermfg=8 ctermbg=3 cterm=NONE

highlight Pmenu ctermfg=0 ctermbg=7
highlight PmenuSel ctermfg=0 ctermbg=3 cterm=BOLD

highlight DiffAdd ctermfg=15 ctermbg=10
highlight DiffChange ctermfg=1 ctermbg=7
highlight DiffDelete ctermfg=15 ctermbg=9
highlight DiffText ctermfg=15 ctermbg=9

highlight Comment ctermfg=7
highlight String ctermfg=2
highlight Type ctermfg=4 cterm=BOLD
highlight Operator ctermfg=0 cterm=BOLD
highlight Special ctermfg=0 cterm=BOLD
highlight Conditional ctermfg=5 cterm=BOLD
highlight Repeat ctermfg=5 cterm=BOLD
highlight Label ctermfg=5
highlight Keyword ctermfg=5
highlight Statement ctermfg=12
" highlight StorageClass ctermfg=5
" highlight Structure ctermfg=5
" highlight Typedef ctermfg=5
highlight Constant ctermfg=13
highlight Function ctermfg=8
highlight Number ctermfg=12
highlight Boolean ctermfg=12
highlight Float ctermfg=12

highlight Error ctermfg=15 ctermbg=1
