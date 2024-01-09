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

"let g:airline_theme='base16_flatlite'
"let g:airline_theme='solarized'

" Custom plugin shortcuts
" _______________________

" map :NT to :NERDTree
:command NT NERDTree
" map :NTF to :NERDTreeFind
:command NTF NERDTreeFind

" Open snippets file
:command Snip :tabedit ~/.vim/after/snippets/_.snippets
:imap <C-J> <Plug>snipMateNextOrTrigger
:smap <C-J> <Plug>snipMateNextOrTrigger
let g:snipMate = { 'snippet_version' : 1 }

" :command Notes e ~/Sites/dev-log
:command Daily e ~/Documents/projects/journal/daily.txt

" Save Daily
:command SD !cd ~/Documents/projects/journal && git add . && git commit -m 'Update' && git push && cd -

" Follow symlinks
"command! FollowSymLink execute "file " . resolve(expand("%")) | edit
"au BufReadPost ./pub/static/* silent! FollowSymLink

" Reload file when changed on disk
" ________________________________

set autoread
"au CursorHold * checktime

" Syntax highlighting
" ___________________

syntax on
" limit to first 4096 chars in line for performance
set synmaxcol=4096

" for black on white terminals
" https://github.com/john2x/flatui.vim
" colorscheme flatui
" highlight Normal ctermfg=black ctermbg=white

"highlight Normal ctermfg=white ctermbg=black

" for white on black terminals
" https://github.com/altercation/vim-colors-solarized
set background=dark
" comment out the following line in case of https://github.com/tomislav/osx-terminal.app-colors-solarized
let g:solarized_termcolors=16
let g:solarized_termtrans=1
colorscheme solarized

"highlight Normal ctermfg=white ctermbg=black

" lite colorscheme to work with https://github.com/Quinten/flatlite-osx-terminal-profile
"colorscheme flatlite

" http://vimcasts.org/episodes/creating-colorschemes-for-vim/
" Show syntax highlighting groups for word under cursor on control-k
nmap <C-K> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
     echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

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
" 2 spaces for json
autocmd FileType json setlocal shiftwidth=2 tabstop=2

" F8 to disable indenting for file
nnoremap <F8> :setl noai nocin nosi inde=<CR>
inoremap <F8> <ESC>:setl noai nocin nosi inde=<CR>

" When pasting from the register with ctrl-r also do not mangle the indent
imap <C-R> <C-R><C-O>

" Shortcut for pasting and keeping the register
vmap <C-P> pgvy

" Auto-completion
" _______________

" Consider hyphens '-' when completing words
:set iskeyword+=\-

" File and window navigation
" __________________________

" move to next line when reaching the end of line with left and right keys
set whichwrap+=<,>,h,l,[,]

" switch between windows with shift + left arrow and shift + right arrow (in normal mode)
" nnoremap <S-Right> <C-W><C-W>
" nnoremap <S-Left> <C-W>W
" tnoremap <S-Right> <C-W><C-W>
" tnoremap <S-Left> <C-W>W

" cycle between tabs with tab-key (forward) and shift + tab-key (backward) (in normal mode)
" nmap <tab> :tabnext<CR>
" nmap <S-tab> :tabprevious<CR>
" nmap <S-Up> :tabnext<CR>
" nmap <S-Down> :tabprevious<CR>
" tmap <S-Up> <C-W>:tabnext<CR>
" tmap <S-Down> <C-W>:tabprevious<CR>

" switch tabs from terminal
" tnoremap <C-W><tab> <C-W>:tabnext<CR>

" set height of terminal to 24 (not to high but we can still play rogue)
" set termwinsize=24x0

" show long lines completly (handy for clunky svg's)
set display+=lastline

" some vimdiff settings (ignore whitespace, vertical split)
set diffopt=filler,iwhite,vertical

" avoid problems with backspace in vim 7.4
set backspace=2

" map control-a and control-e to go to the beginning and end of the line respectivly
" inoremap <C-e> <C-o>$
" inoremap <C-a> <C-o>0

" map tab in visual mode to indenting
" vnoremap <tab> >
" vnoremap <S-tab> <

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

" Proper wordwrapping
" ___________________

set wrap linebreak nolist
:let &colorcolumn=join(range(101,1024),",")

" Usefull commands
" ________________

" map :RW to :%s/\s\+$//
" this removes all whitespace from the end of the lines
:command RW :%s/\s\+$//

" map :RV to :%s/?v[0-9]*//g
" this removes patterns like '?v20170309'
:command RV :%s/?v[0-9]*//g

" command to copy all lines to system clipboard
:command CF :%y*

" shortcut for opening a sourced shell
:command SH :!bash -l

" shortcut for opening a new tab
" :command -nargs=? -complete=file T tabedit <args>

" csscomb on the current file
:command Comb :%!csscomb

" when opening certain files do certain stuff
" au BufReadPost,BufNewFile *.scss silent! Comb
au BufReadPost,BufNewFile *.scss,*.less,*.css,*.js,*.php,*.html,*.phtml,*.svg,*.xml silent! RW
au BufReadPost,BufNewFile *.scss,*.less,*.css,*.js,*.php,*.html,*.phtml,*.svg,*.xml silent! retab

" Search commands
" _______________

" find the word under the cursor in the current file
" command FCF :execute 'vimgrep /'.expand('<cword>').'/gj '.expand('%') | copen
" find the word under the cursor in the current working directory
" command FCD :execute 'vimgrep /'.expand('<cword>').'/gj **' | copen

" find the word from the system clipboard in the current file
" command FSF :execute 'vimgrep /'.escape(@*, '/').'/gj '.expand('%') | copen
" find the word from the system clipboard in the current working directory
" command FSD :execute 'vimgrep /'.escape(@*, '/').'/gj **' | copen

" find the word from default register in the current file
" command FYF :execute 'vimgrep /'.escape(@", '/').'/gj '.expand('%') | copen
" find the word from the default register in the current working directory
" command FYD :execute 'vimgrep /'.escape(@", '/').'/gj **' | copen

" find by argument -> :FFF needle ./path/to/dir/**
" function! s:FindByArguments(fword, fdir)
"     :execute 'vimgrep /'.a:fword.'/gj '.a:fdir | copen
" endfunction
" command -nargs=* -complete=file FFF call s:FindByArguments(<f-args>)

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


" Session
" _______

function! MakeSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  exe "mksession! " . b:filename
endfunction

function! LoadSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction

" Adding automatons for when entering or leaving Vim
if (argc() == 0)
    au VimEnter * nested :call LoadSession()
    au VimLeave * :call NERDTreeTabsClose()
    au VimLeave * :call MakeSession()
endif

" Close other buffers
" ___________________

:command CO :%bd|e#

" write log message
" _________________
":command QM !cd ~/Sites/dev-log && printf '\nwhat happens on f stays on f\n' >> README.md && git add . && git commit && cd -

" no line numbers in terminal normal mode
" _______________________________________
autocmd TerminalOpen * setlocal nonu
