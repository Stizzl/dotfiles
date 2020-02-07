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
set tabstop=8
set shiftwidth=8
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
set smartcase
set listchars=tab:»\ ,trail:·
set list

" }}}

" plugins {{{

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'tpope/vim-surround'
	Plugin 'tpope/vim-fugitive'
	Plugin 'airblade/vim-gitgutter'
	Plugin 'junegunn/goyo.vim'
	Plugin 'junegunn/limelight.vim'
	Plugin 'jiangmiao/auto-pairs'
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
	Plugin 'ludovicchabant/vim-gutentags'
	Plugin 'vimwiki/vimwiki'
	Plugin 'wincent/loupe'
call vundle#end()

" }}}

" plugin-options{{{

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
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" limelight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_default_coefficient = 0.7

" latex-live-preview
let g:livepreview_previewer = 'zathura'
let g:livepreview_cursorhold_recompile = 0

" airline
let g:airline_theme = 'dracula'
let g:airline_powerline_fonts = 1
let g:airline_section_y = 'BN: %{bufnr("%")}'

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
let g:UltiSnipsEditSplit="vertical"

" deoplete
let g:deoplete#enable_at_startup = 1

" vimtex
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode = 0
let g:vimtex_latexmk_continuous = 1

" easymotion
let g:EasyMotion_keys = "asdfghjkl"

" vimwiki
let g:vimwiki_list = [{'path':'~/.vim/vimwiki','syntax': 'markdown', 'ext': '.md'}]

" LanguageClient
set runtimepath+=~/.vim/plugin/LanguageClient-neovim
let g:LanguageClient_serverCommands = {
	\ 'c': [ 'ccls' ],
	\ }

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
	autocmd ColorScheme * highlight ColorColumn ctermfg=203 ctermbg=NONE
	autocmd ColorScheme * highlight TermCursorNC ctermbg=240
augroup END

" }}}

" keybindings & autocmd {{{

let mapleader=" "
let maplocalleader=" "

map <leader>m :!echo yo
nmap s <Plug>(easymotion-s)

let g:counter = 0
function GoyoToggle()
	if (g:counter == 0)
		Goyo
		Limelight
		let g:counter += 1
	elseif (g:counter == 1)
		Goyo!
		Limelight!
		let g:counter -= 1
	endif
endfunction
noremap <silent> <F1> :call GoyoToggle()<CR>

map <F2> :LLPStartPreview<CR>
map <F3> :NERDTreeToggle<CR>
map <F6> :setlocal spell! spelllang=de_de<CR>
map <F7> :setlocal spell! spelllang=en_us<CR>
map <F9> :colorscheme focuspoint<CR>
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
map <F11> :set foldmethod=indent<CR>
map <F12> :e ~/.vimrc<CR>

nnoremap <M-v> "+p
inoremap <M-v> <Esc>"+pa

if has('nvim')
	tmap <F12> <Esc>:bd!<CR>:find ~/.vimrc<CR>

	tnoremap <Esc> <C-\><C-n>
	tnoremap <A-i> <Esc>
endif

vnoremap <silent> < <gv
vnoremap <silent> > >gv

nnoremap <silent> <Esc> :noh<CR>

noremap <silent> <S-j> <Esc>:m +1<CR>
noremap <silent> <S-k> <Esc>:m -2<CR>
vnoremap <silent> <S-j> dp<CR>k1v
vnoremap <silent> <S-k> :m -2<CR>gv

noremap <silent> j gj
noremap <silent> k gk

cmap Q quit

noremap <leader>u :UltiSnipsEdit<CR>G
noremap <leader>b :BufferJumpList<CR>
noremap <leader>x :BufferKillList<CR>

noremap <silent> D :s/.*//<CR>:noh<CR>
noremap <silent> C :s/.*//<CR>:noh<CR>a

inoremap <C-c>h <LEFT>
inoremap <C-c>j <DOWN>
inoremap <C-c>k <UP>
inoremap <C-c>l <RIGHT>

inoremap <C-s> <Esc>:w<CR>a
nnoremap <C-s> :w<CR>

noremap ö o<Esc>
noremap Ö O<Esc>

autocmd VimLeavePre *.tex !latexmk -C %

nnoremap / /\v
vnoremap / /\v

nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

nnoremap <leader>c :w<CR>:!gcc %<CR><CR><C-w>la./a.out<CR><C-\><C-n><C-w>h

autocmd BufEnter NOTES.txt set filetype=vimwiki
" autocmd FileType vimwiki nnoremap <leader>t a* [ ] <CR>

autocmd BufEnter *.h set filetype=c

" }}}

" vim:foldmethod=marker:foldlevel=0
