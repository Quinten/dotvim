" Quinten's vim configuration
" https://github.com/Quinten/dotvim
" _________________________________

" Plugin settings
" _______________

" https://github.com/tpope/vim-pathogen
execute pathogen#infect()

" generate help for plugins
call pathogen#helptags()

" https://github.com/scrooloose/nerdtree
let g:NERDTreeDirArrows=0

" https://github.com/bling/vim-airline
set laststatus=2
" in case you have powerline fonts from https://github.com/powerline/fonts
let g:airline_powerline_fonts=1
" airline also the tabs
let g:airline#extensions#tabline#enabled = 1
" we do the tmuxline manually (see https://github.com/Quinten/dottmux)
let g:airline#extensions#tmuxline#enabled = 0

let g:airline_theme='base16_flatlite'

" Custom plugin shortcuts
" _______________________

" map :NT to :NERDTree
:command NT NERDTree
" map :NTF to :NERDTreeFind
:command NTF NERDTreeFind

" visual selection split shortcuts
" https://github.com/wellle/visual-split.vim
command! -range VS <line2>,<line2>VSSplit
command! -range VR <line2>,<line2>VSResize

" Reload file when changed on disk
" ________________________________

set autoread
"au CursorHold * checktime

" Syntax highlighting
" ___________________

syntax on
" limit to first 1024 chars in line for performance
set synmaxcol=1024

" for black on white terminals
" https://github.com/john2x/flatui.vim
" colorscheme flatui
" highlight Normal ctermfg=black ctermbg=white
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


" for white on black terminals
" https://github.com/altercation/vim-colors-solarized
" set background=dark
" comment out the following line in case of https://github.com/tomislav/osx-terminal.app-colors-solarized
" let g:solarized_termcolors=256
" colorscheme solarized


" Various visual clues
" ____________________

" linenumbers
set nu
"set nonu
" line and column number in status line
set ruler


" Indentation
" ___________

" filetype
filetype on
filetype plugin on
filetype indent on
" tabs to 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4

" Don't mangle formatting when pasting in insert mode (osx terminal)
" http://stackoverflow.com/a/7053522/4458135
if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    vmap <expr> <Esc>[200~ XTermPasteBegin("c")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif

" When pasting from the register with ctrl-r also do not mangle the indent
imap <C-R> <C-R><C-O>

" Auto-completion
" _______________

" Consider hyphens '-' when completing words
:set iskeyword+=\-

" File and window navigation
" __________________________

" move to next line when reaching the end of line with left and right keys
set whichwrap+=<,>,h,l,[,]

" switch between windows with shift + left arrow and shift + right arrow (in normal mode)
nnoremap <S-Right> <C-W><C-W>
nnoremap <S-Left> <C-W>W

" cycle between tabs with tab-key (forward) and shift + tab-key (backward) (in normal mode)
nmap <tab> :tabnext<CR>
nmap <S-tab> :tabprevious<CR>

" show long lines completly (handy for clunky svg's)
set display+=lastline

" some vimdiff settings (ignore whitespace, vertical split)
set diffopt=filler,iwhite,vertical

" avoid problems with backspace in vim 7.4
set backspace=2

" map control-a and control-e to go to the beginning and end of the line respectivly
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0

" map tab in visual mode to indenting
vnoremap <tab> >
vnoremap <S-tab> <

" Settings for performance
" ________________________

" an attampt to speed up vim
set ttyfast
set ttyscroll=3
set lazyredraw
" more attempts to speed up vim
set nocursorcolumn
set nocursorline

" Encoding
" ________

" fileformat stuff
set fileformats=unix,dos
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,cp1250,iso-8859-1


" Usefull commands
" ________________

" map :RW to :%s/\s\+$//
" this removes all whitespace from the end of the lines
:command RW :%s/\s\+$//

" command to copy all lines to system clipboard
:command CF :%y*

" shortcut for opening a sourced shell
:command SH :!bash -l

" shortcut for opening a new tab
:command -nargs=? -complete=file T tabedit <args>

" Search commands
" _______________

" find the word under the cursor in the current file
command FCF :execute 'vimgrep /'.expand('<cword>').'/gj '.expand('%') | copen
" find the word under the cursor in the current working directory
command FCD :execute 'vimgrep /'.expand('<cword>').'/gj **' | copen

" find the word from the system clipboard in the current file
command FSF :execute 'vimgrep /'.escape(@*, '/').'/gj '.expand('%') | copen
" find the word from the system clipboard in the current working directory
command FSD :execute 'vimgrep /'.escape(@*, '/').'/gj **' | copen

" find the word from default register in the current file
command FYF :execute 'vimgrep /'.escape(@", '/').'/gj '.expand('%') | copen
" find the word from the default register in the current working directory
command FYD :execute 'vimgrep /'.escape(@", '/').'/gj **' | copen

" find by argument -> :FFF needle ./path/to/dir/**
function! s:FindByArguments(fword, fdir)
    :execute 'vimgrep /'.a:fword.'/gj '.a:fdir | copen
endfunction
command -nargs=* FFF call s:FindByArguments(<f-args>)

" find files by filename and populate the quickfix list -> :FF filename
function s:FindFilesBy(filename)
  let errorfile = tempname()
  execute '!find . -name "'.a:filename.'" | xargs file | sed "s/:/:1:/" > '.errorfile
  set errorformat=%f:%l:%m
  exe "cfile ". errorfile
  copen
  call delete(errorfile)
endfunction
command! -nargs=1 FF call s:FindFilesBy(<f-args>)


" Html escape
" ___________

" Escape/unescape & < > HTML entities in range (default current line).
" http://vim.wikia.com/wiki/HTML_entities
" Escape:
" <range> EH
" Unescape:
" <range> UH

function! HtmlEntities(line1, line2, action)
  let search = @/
  let range = 'silent ' . a:line1 . ',' . a:line2
  if a:action == 0  " must convert &amp; last
    execute range . 'sno/&lt;/</eg'
    execute range . 'sno/&gt;/>/eg'
    execute range . 'sno/&amp;/&/eg'
  else              " must convert & first
    execute range . 'sno/&/&amp;/eg'
    execute range . 'sno/</&lt;/eg'
    execute range . 'sno/>/&gt;/eg'
  endif
  nohl
  let @/ = search
endfunction
command! -range EH call HtmlEntities(<line1>, <line2>, 1)
command! -range UH call HtmlEntities(<line1>, <line2>, 0)


" Beautifier
" __________
" https://github.com/maksimr/vim-jsbeautify

" maps control-f
map <C-f> :call JsBeautify()<cr>
autocmd FileType javascript noremap <buffer> <C-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <C-f> :call JsonBeautify()<cr>
autocmd FileType jsx noremap <buffer> <C-f> :call JsxBeautify()<cr>
autocmd FileType html noremap <buffer> <C-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <C-f> :call CSSBeautify()<cr>
