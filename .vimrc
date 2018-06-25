set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'https://github.com/WolfgangMehner/c-support.git'
Plugin 'https://github.com/octol/vim-cpp-enhanced-highlight.git'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'https://github.com/majutsushi/tagbar.git'
Plugin 'https://github.com/jlanzarotta/bufexplorer.git'
Plugin 'https://github.com/godlygeek/tabular.git'
Plugin 'https://github.com/plasticboy/vim-markdown.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120
" turn syntax highlighting on
set t_Co=256
syntax on
" colorscheme wombat256
" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

set tags=tags;/

" Install DoxygenToolkit from http://www.vim.org/scripts/script.php?script_id=987
let g:DoxygenToolkit_authorName="Victor Krasnoshchok <militant.daos@gmail.com>"

" Enhanced keyboard mappings
"
nmap <F2> :ToggleBufExplorer<CR>
" NerdTree
nmap <F3> :NERDTreeToggle<CR>

" currently not used
" switch between header/source with F4
" map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" recreate tags file with F5
map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
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

set hlsearch
set incsearch
