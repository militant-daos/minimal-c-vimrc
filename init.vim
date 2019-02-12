call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

Plug 'https://github.com/vim-scripts/wombat256.vim'
Plug 'https://github.com/WolfgangMehner/c-support.git'
Plug 'https://github.com/octol/vim-cpp-enhanced-highlight.git'
Plug 'https://github.com/scrooloose/nerdtree.git', { 'on':  'NERDTreeToggle' }
Plug 'https://github.com/majutsushi/tagbar.git', { 'on':  'TagbarToggle' }
Plug 'https://github.com/jlanzarotta/bufexplorer.git'
Plug 'https://github.com/godlygeek/tabular.git'
Plug 'https://github.com/plasticboy/vim-markdown.git'
Plug 'https://github.com/vim-scripts/DoxygenToolkit.vim.git'
Plug 'https://github.com/ntpeters/vim-better-whitespace.git'
Plug 'https://github.com/jsfaint/gen_tags.vim'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" All of your Plugins must be added before the following line

call plug#end()            " required

filetype plugin indent on    " required

" ----------------------------------------------------------------------------
" Text editing settings
"


" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" disable vi compatibility (emulation of old bugs)
set nocompatible

" set smartindent
filetype plugin indent on

set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces

set ci pi sts=0

if has("autocmd")
  filetype plugin indent on
endif

set listchars=eol:¬,tab:>·,space:·
set list

" Wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120

" turn syntax highlighting on
set t_Co=256
syntax on

" Mouse support
set mouse=a

colorscheme wombat256mod
" turn line numbers on
set number

" highlight matching braces
set showmatch

" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" delete without yanking
" nnoremap d "_d
" vnoremap d "_d

" replace currently selected text with default register
" without yanking it
vnoremap p "_dP

" X11/XFCE clipboard settings
" Install xclip and/or xfce4-clipman first!

let g:clipboard = {
\   'name': 'xclip-xfce4-clipman',
\   'copy': {
\      '+': 'xclip -selection clipboard',
\      '*': 'xclip -selection clipboard',
\    },
\   'paste': {
\      '+': 'xclip -selection clipboard -o',
\      '*': 'xclip -selection clipboard -o',
\   },
\   'cache_enabled': 1,
\ }

set clipboard=unnamedplus

" ----------------------------------------------------------------------------
" Plugins settings

" Dangling whitespaces handling
let g:better_whitespace_enabled=1
let g:show_spaces_that_precede_tabs=1
let g:strip_whitelines_at_eof=1

nnoremap ]w :NextTrailingWhitespace<CR>
nnoremap [w :PrevTrailingWhitespace<CR>

" Search settings
set hlsearch
set incsearch

" Deoplete
let g:deoplete#enable_at_startup = 1


" ----------------------------------------------------------------------------
" External tools settings

" Default tags location for Universal-CTags
" set tags=tags;/

let g:DoxygenToolkit_authorName="Victor Krasnoshchok"

" ----------------------------------------------------------------------------
" Sidekicks & crutches with thread tape

" The Silver Searcher
" How-to install: sudo apt-get install silversearcher-ag

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" ----------------------------------------------------------------------------
" Enhanced keyboard mappings
"
nmap <F2> :ToggleBufExplorer<CR>

" NerdTree
nmap <F3> :NERDTreeToggle<CR>

" currently not used
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" recreate tags file with F5
map <F5> :GenCtags<CR>:GenGTAGS<CR>

" create doxygen comment
map <F6> :Dox<CR>

" build using makeprg with <F7>
map <F7> :make<CR>

" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>

" Tags
nmap <F8> :TagbarToggle<CR>

" goto definition with F12
map <F12> <C-]>

" save the current session
map <C-s> :mksession! ~/vim_session <CR>

" restore the last session
map <C-r> :source ~/vim_session <CR>
