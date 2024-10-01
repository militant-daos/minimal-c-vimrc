# minimal-c-vimrc
Minimal init.vim for C/C++ development

### Use with NeoVIM only!
1. Download & save **init.vim** (`~/.config/nvim/init.vim`)
2. Download Plug for NVIM: https://github.com/junegunn/vim-plug#unix-1
3. Install **xclip/xfce4-clipman** for the system clipboard support
4. Install **luajit**
5. Install **clangd** (and **clang** if needed): `sudo apt-get install clangd`
6. Launch **nvim** and do `:PlugInstall`
7. Install **coc-clangd**: `:CocInstall coc-clangd`
8. Install **bear**: `sudo apt-get install bear` (or compile from the sources: https://github.com/rizsotto/Bear)
9. Open any c/c++ file and launch **coc-clangd** install in case **clangd** is not found in $PATH: run `:CocInstall coc-clangd`
10. To generate **compile_commands.json** for your project launch `bear -- $your_make_command` (like `bear -- make -j8`)
11. Enjoy!
