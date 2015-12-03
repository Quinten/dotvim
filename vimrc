" https://github.com/tpope/vim-pathogen
execute pathogen#infect()
" https://github.com/scrooloose/nerdtree
let g:NERDTreeDirArrows=0
" https://github.com/bling/vim-airline
set laststatus=2
" in case you have powerline fonts from https://github.com/powerline/fonts
"let g:airline_powerline_fonts=1
" syntax highlighting
syntax on
" https://github.com/john2x/flatui.vim
" colorscheme flatui
" highlight Normal ctermfg=black ctermbg=white
" https://github.com/altercation/vim-colors-solarized
set background=dark
" uncomment the following line in case of https://github.com/tomislav/osx-terminal.app-colors-solarized
let g:solarized_termcolors=256
colorscheme solarized
" move to next line when reaching the end of line with left and right keys
set whichwrap+=<,>,h,l,[,]
" linenumbers
set nu
"set nonu
set ruler
" tabs to 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4
" switch between windows with shift + left arrow and shift + right arrow (in normal mode)
nnoremap <S-Right> <C-W><C-W>
nnoremap <S-Left> <C-W>W
" cycle between tabs with tab-key (forward) and shift + tab-key (backward) (in normal mode)
nmap <tab> :tabnext<CR>
nmap <S-tab> :tabprevious<CR>
" an attampt to speed up vim
set synmaxcol=256
set ttyfast
set ttyscroll=3
set lazyredraw
" more attempts to speed up vim
set nocursorcolumn
set nocursorline
" map :nt to :NERDTree
:command NT NERDTree
" some vimdiff settings (ignore whitespace, vertical split)
set diffopt=filler,iwhite,vertical
" map :RW to :%s/\s\+$//
" this removes all whitespace from the end of the lines
:command RW :%s/\s\+$//
