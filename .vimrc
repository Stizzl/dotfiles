"    __              __        _
"   / / __   ___  ___\ \__   _(_)_ __ ___       _ __ ___
"  | | '_ \ / _ \/ _ \| \ \ / / | '_ ` _ \ ____| '__/ __|
"  | | | | |  __/ (_) | |\ V /| | | | | | |____| | | (__
"  | |_| |_|\___|\___/| | \_/ |_|_| |_| |_|    |_|  \___|
"   \_\              /_/

" set-commands {{{

set encoding=utf-8
set relativenumber number
set expandtab
set tabstop=4
set shiftwidth=4
"set noswapfile
"set nobackup
set splitbelow splitright
set cursorline
set cursorcolumn
"set nowrap
set updatetime=1000
set path+=**	"find will find subfolders outside your working tree
set wildmenu	"tabmenu
set lazyredraw  "doesn't update screen when executing a macro or script

" }}}

" plugins {{{

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-fugitive'
    Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
    Plugin 'airblade/vim-gitgutter'
    Plugin 'junegunn/goyo.vim'
    Plugin 'junegunn/limelight.vim'
	Plugin 'junegunn/fzf.vim'
    Plugin 'chase/focuspoint-vim'
    Plugin 'jiangmiao/auto-pairs'
    Plugin 'PotatoesMaster/i3-vim-syntax'
    Plugin 'xuhdev/vim-latex-live-preview'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'mhinz/vim-startify'
    Plugin 'scrooloose/nerdtree'
    Plugin 'axvr/photon.vim'
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'
    Plugin 'Shougo/deoplete.nvim'
    Plugin 'tomtom/tcomment_vim'
	Plugin 'easymotion/vim-easymotion'
call vundle#end()


" }}}

"plugin-options{{{

" vim-startify
let g:startify_custom_header = [
    \ '                _                         _             _   _  __           ',
    \ '     _ ____   _(_)_ __ ___            ___| |_ __ _ _ __| |_(_)/ _|_   _     ',
    \ '    | `_ \ \ / / | `_ ` _ \   _____  / __| __/ _` | `__| __| | |_| | | |    ',
    \ '    | | | \ V /| | | | | | | |_____| \__ \ || (_| | |  | |_| |  _| |_| |    ',
    \ '    |_| |_|\_/ |_|_| |_| |_|         |___/\__\__,_|_|   \__|_|_|  \__, |    ',
    \ '                                                                  |___/     ',
    \ ]

let g:startify_files_number = 5                                                                      
let g:startify_lists = [                                                                            
  \ { 'type': 'dir',       'header': ['   Most recently used files in the current directory:'] },
  \ { 'type': 'files',     'header': ['   Most recently used files:'] },                          
  \ { 'type': 'sessions',  'header': ['   Saved sessions:'] },                                      
  \ ]                       

let g:startify_update_oldfiles = 1                                                                   


" nerdtree
let g:sidebar_direction = ''
let g:NERDTreeWinPos=get(g:,'NERDTreeWinPos',sidebar_direction)
let g:NERDTreeShowHidden = 1

" limelight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_default_coefficient = 0.7

" auto-pairs
"let g:AutoPairsFlyMode = 1
"let g:AutoPairsShortcutBackInsert = '<M-b>'

" latex-live-preview
let g:livepreview_previewer = 'zathura'
let g:livepreview_cursorhold_recompile = 0

" airline
let g:airline_theme = 'bubblegum'
let g:airline_powerline_fonts = 1
let g:airline_section_y = 'BN: %{bufnr("%")}'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail'

" ultisnips
let g:UltiSnipsExpandTrigger="<C-b>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
let g:UltiSnipsEditSplit="vertical"

" deoplete
let g:deoplete#enable_at_startup = 1

" fzf
let g:fzf_layout = { 'down': '~33%' }

" easymotion
let g:EasyMotion_keys = "asdfghjkl"

"}}}

" color-scheme{{{

colorscheme magala

" }}}

" keybindings & autocmd {{{

let mapleader=" "

map <leader>m :!echo yo
nmap s <Plug>(easymotion-s)

" Change split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
tmap <C-h> <Esc><C-w>h
tmap <C-j> <Esc><C-w>j
tmap <C-k> <Esc><C-w>k
tmap <C-l> <Esc><C-w>l

" function keys
map <F1> :Goyo<CR>:Limelight<CR>
map <F2> :LLPStartPreview<CR>
map <F3> :NERDTreeToggle<CR>
map <F6> :setlocal spell! spelllang=de_de<CR>
map <F7> :setlocal spell! spelllang=en_us<CR>
map <F9> :colorscheme focuspoint<CR>
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
map <F11> :set foldmethod=indent<CR>
map <F12> :bd!<CR>:find ~/.vimrc<CR>
tmap <F12> <Esc>:bd!<CR>:find ~/.vimrc<CR>
map <F13> :Goyo!<CR>:Limelight!<CR>

" essential settings
"altgr + l
map <M-v> <Esc>"+pa
map <C-t> :vs term://bash<CR>a

map <C-s> :wq<CR>
map <C-S> :q!<CR>
tmap <Esc> <C-\><C-n><Esc><CR>

vmap <silent> < <gv
vmap <silent> > >gv
nmap <silent> <Esc> :noh<CR>

noremap <silent> <S-j> <Esc>:m +1<CR>
noremap <silent> <S-k> <Esc>:m -2<CR>
vnoremap <silent> <S-j> dp<CR>k1v
vnoremap <silent> <S-k> :m -2<CR>gv

noremap <silent> j gj
noremap <silent> k gk

" When I accidentally type :Q
cmap Q quit

noremap <leader>u :UltiSnipsEdit<CR>G

"autocmd BufEnter *.tex silent! !pdflatex %
autocmd BufWritePost *vimisgreat.gg silent! !echo % | sed "s/\.gg//" > ~/yoyoma
autocmd BufWritePost *.sh silent! !chmod +x %
autocmd BufWritePost *.bashrc silent! !source ~/.bashrc
"autocmd BufEnter *.tex LLPStartPreview 
"autocmd BufEnter *.tex !sleep 1s && xdotool key super+shift+j &
"autocmd FileType plaintex :set filetype=tex

" }}}

" settings {{{

let g:tex_flavor = "latex"

" }}}

" vim:foldmethod=marker:foldlevel=0
