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

" use indentation of previous line
set autoindent

" use intelligent indentation for C
" set smartindent
filetype plugin indent on

set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces

set noet ci pi sts=0 sw=4 ts=4

set listchars=eol:¬,tab:>·,space:·
set list

" Wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120

" From Linux kernel coding standard.
" set textwidth=80

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
"

" Default tags location for Universal-CTags
" set tags=tags;/

let g:DoxygenToolkit_authorName="Victor Krasnoshchok <militant.daos@gmail.com>"

" ----------------------------------------------------------------------------
" Enhanced keyboard mappings
"
nmap <F2> :ToggleBufExplorer<CR>
" NerdTree
nmap <F3> :NERDTreeToggle<CR>

" currently not used
" switch between header/source with F4
" map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" recreate tags file with F5
" map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
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
