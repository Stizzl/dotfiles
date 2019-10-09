"    __     __       _
"   | _| __|_ |_   _(_)_ __ ___    _ __ ___
"   | | '_ \| \ \ / / | '_ ` _ \  | '__/ __|
"   | | | | | |\ V /| | | | | | |_| | | (__
"   | |_| |_| | \_/ |_|_| |_| |_(_)_|  \___|
"   |__|   |__|

" set-commands {{{

set encoding=utf-8
set number
set relativenumber 
set expandtab
set tabstop=4
set shiftwidth=4
set noswapfile
set nobackup
set splitbelow splitright
set cursorline
set cursorcolumn
set colorcolumn=80
set updatetime=1000
set path+=**	
set wildmenu	
set lazyredraw  
set hlsearch
set spelllang=en,de
set autoread
set autoindent
set smartindent
set hidden
set incsearch
set inccommand=nosplit

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
    Plugin 'chase/focuspoint-vim'
    Plugin 'jiangmiao/auto-pairs'
    Plugin 'xuhdev/vim-latex-live-preview'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'mhinz/vim-startify'
    Plugin 'scrooloose/nerdtree'
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'
    Plugin 'Shougo/deoplete.nvim'
    Plugin 'tomtom/tcomment_vim'
	Plugin 'easymotion/vim-easymotion'
    Plugin 'lervag/vimtex'
    Plugin 'dracula/vim'
    Plugin 'machakann/vim-highlightedyank'
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
let g:airline_theme = 'dracula'
let g:airline_powerline_fonts = 1
let g:airline_section_y = 'BN: %{bufnr("%")}'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail'

" ultisnips
" let g:UltiSnipsExpandTrigger="<C-b>"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
let g:UltiSnipsEditSplit="vertical"

" deoplete
let g:deoplete#enable_at_startup = 1

" fzf
let g:fzf_layout = { 'down': '~33%' }

" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

" easymotion
let g:EasyMotion_keys = "asdfghjkl"

"}}}

" color-scheme{{{

colorscheme dracula

augroup vimrc
    autocmd!
    autocmd ColorScheme * highlight Normal ctermbg=NONE 
	autocmd ColorScheme * highlight NonText ctermbg=NONE 
	autocmd ColorScheme * highlight CursorLine ctermbg=NONE 
	autocmd ColorScheme * highlight FoldColumn ctermfg=238 ctermbg=NONE 
	autocmd ColorScheme * highlight Folded ctermfg=61 ctermbg=NONE 
	autocmd ColorScheme * highlight ColorColumn ctermfg=1 ctermbg=NONE 
	autocmd ColorScheme * highlight TermCursorNC ctermbg=240
augroup END

" }}}

" keybindings & autocmd {{{

let mapleader=" "
let maplocalleader=" "

" unwanted behaivor from easymotion

map <leader>m :!echo yo
nmap s <Plug>(easymotion-s)

" :W sudo saves the file 
command! W w !sudo tee % > /dev/null

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

map <M-v> <Esc>"+pa
map <C-t> :vs term://zsh<CR>a

tnoremap <Esc> <C-\><C-n>
tnoremap <A-i> <Esc>

vnoremap <silent> < <gv
vnoremap <silent> > >gv
" vnoremap <silent> y mz:yank<CR>`z
" vnoremap <silent> Y mz:yank +<CR>`z

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

noremap <leader>e :write tmp.vim<CR>:source %<CR>:!rm %<CR><CR>

" buffers
noremap <leader>b :BufferJumpList<CR>
noremap <leader>x :BufferKillList<CR>

" tabs
noremap <C-h> <C-w>W
noremap <C-l> <C-w>w
noremap <C-j> :tabprevious<CR>
noremap <C-k> :tabnext<CR>
noremap <C-x>0 <C-w>c
noremap <C-x>1 <C-w>w<C-w>c<C-w>W

" }}}

" settings {{{

let g:tex_flavor = "latex"

" }}}

" vim:foldmethod=marker:foldlevel=0
