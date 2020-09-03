#!/bin/bash

function coc_support {
    sudo pacman -S clang
    nvim -c "CocInstall coc-marketplace coc-python coc-clangd"
}

#install required packages
sudo pacman -S neovim

mkdir -p ~/.config/nvim/
ln -s $(pwd)/init.vim ~/.config/nvim/init.vim

#install vimplug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#install all plugins from init.vim
nvim -c "PlugInstall"

coc_support
