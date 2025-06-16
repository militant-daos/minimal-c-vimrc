call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/vim-github-dashboard'
Plug 'vim-scripts/wombat256.vim'

" Files navigation
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jlanzarotta/bufexplorer'

" Tags
Plug 'majutsushi/tagbar', { 'on':  'TagbarToggle' }
Plug 'ludovicchabant/vim-gutentags'

" Markdown and decorations
Plug 'plasticboy/vim-markdown'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'

" Comment/Uncomment tool
Plug 'scrooloose/nerdcommenter'

" Search
Plug 'wincent/command-t'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

" Completion & highlighting
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Misc
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git integration
Plug 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line

call plug#end()            " required

filetype plugin indent on    " required

" ----------------------------------------------------------------------------
" Text editing settings
"
" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8

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

"set listchars=eol:¬,tab:>·,space:·
set list

" Wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120

" turn syntax highlighting on
set t_Co=256
syntax on
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

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
set hlsearch  " Higlight matched
set incsearch " Incremental search

" Coc
let g:coc_node_path='/usr/bin/node'

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Tree-sitter
let g:CommandTPreferredImplementation='lua'
nnoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Airline
set laststatus=2

" Gutentags
let g:gutentags_enabled = 1
set statusline+=%{gutentags#statusline()}
let g:gutentags_cache_dir = '~/.tmp/tags'
autocmd! User vim-gutentags call gutentags#setup_gutentags()

" vim-airline Settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline_powerline_fonts = 1

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fl <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" Grep string under cursor
nnoremap <leader>fg :execute 'Telescope live_grep default_text=' . expand('<cword>')<cr>

" ----------------------------------------------------------------------------
" External tools settings

" Default tags location for Universal-CTags
" set tags=tags;/

" let g:DoxygenToolkit_authorName="Victor Krasnoshchok"

" ----------------------------------------------------------------------------
" Enhanced keyboard mappings
"

" BufExplorer (Telescope also may be used)
nmap <F2> :ToggleBufExplorer<CR>

" NerdTree
nmap <F3> :NERDTreeToggle<CR>

" currently not used
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" recreate tags file with F5
map <F5> :GutentagsUpdate<CR>

" Tags
nmap <F8> :TagbarToggle<CR>

" goto definition with F12
map <F12> <C-]>

" save the current session
map <C-s> :mksession! ~/vim_session <CR>

" restore the last session
map <C-r> :source ~/vim_session <CR>

" Command-T call
map <bslash>t :CommandT<CR>
