#!/bin/bash

function coc_support {
    sudo pacman -S node clang
    nvim +"CocInstall \
        coc-marketplace \
        coc-python \
        coc-clangd \
        coc-tsserver \
        coc-json \
        coc-markdownlimit \
        coc-phpactor \
        coc-rls \
        coc-git"
}

#install required packages
sudo pacman -S neovim fzf

mkdir -p ~/.config/nvim/
ln -s $(pwd)/init.vim ~/.config/nvim/init.vim

#install vimplug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#install all plugins from init.vim
nvim +PlugInstall

coc_support
