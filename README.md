# minimal-c-vimrc
Minimal init.vim for C/C++ development (manual for Debian/Ubuntu-based distributions)

### Use with NeoVIM only!
1. Download & save **init.vim** (`~/.config/nvim/init.vim`)
2. Download Plug for NVIM: https://github.com/junegunn/vim-plug#unix-1
3. ~~Install **xclip/xfce4-clipman** for the system clipboard support~~ Installed by default in Xubuntu Desktop.
4. Install **luajit**
5. Install **clangd** (and **clang** if needed): `sudo apt-get install clangd`
6. Install **nodejs** and **npm** (required for Command-T)
7. Download **wombat256** colorscheme from https://www.vim.org/scripts/script.php?script_id=2465 and copy the scheme file to `~/.config/nvim/colors`
8. Install **fonts-powerline**
9. Launch **nvim** and do `:PlugInstall`
10. Install **coc-clangd**: `:CocInstall coc-clangd`
11. Build **Command-T** LUA library: `cd ~/.local/share/nvim/plugged/command-t/lua/wincent/commandt/lib` && make
12. Install **bear**: `sudo apt-get install bear` (or compile from the sources: https://github.com/rizsotto/Bear) - **Optional**
13. Open any c/c++ file and launch **coc-clangd** install in case **clangd** is not found in $PATH: run `:CocInstall coc-clangd`
14. To generate **compile_commands.json** for your project launch `bear -- $your_make_command` (like `bear -- make -j8`)
15. Enjoy!
