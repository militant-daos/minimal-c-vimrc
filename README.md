# minimal-c-vimrc
Minimal init.vim for C/C++ development

### NeoVIM (PREFERRED)
1. Download & save init.vim
2. Download Plug for NVIM: https://github.com/junegunn/vim-plug#unix-1
3. Install xclip/xfce4-clipman for the system clipboard support
4. Install GTAGS/CTAGS for tags search support:
   - sudo apt-get install global
   - git clone git@github.com:universal-ctags/ctags.git
     - ./autogen.sh
     - ./configure
     - make && make install
6. Install NodeJS, NPM and Yarn: sudo apt-get install nodejs npm yarnpkg
7. Install clangd (and clang if needed): sudo apt-get install clangd 
8. Launch nvim and do :PluginInstall
9. Install coc-clangd: :CocInstall coc-clangd
10. Install bear: sudo apt-get install bear (or compile from the sources: https://github.com/rizsotto/Bear)
11. Open any c/c++ file and launch coc-clangd install in case clangd is not found in $PATH: open any c/c++ file and :CocCommand clangd.install
12. To generate compile_commands.json for your project launch bear -- your_make_command (like bear -- make)
13. Profit!
