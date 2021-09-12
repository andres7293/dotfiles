#!/bin/bash

function coc_support {
    sudo pacman -S nodejs clang
    nvim +"CocInstall \
        coc-marketplace \
        coc-python \
        coc-clangd \
        coc-tsserver \
        coc-json \
        coc-markdownlimit \
        coc-rls \
        coc-git"
}

#install required packages
sudo pacman -S neovim fzf gopls
#install tsserver
sudo pacman -S npm
npm install -g typescript typescript-language-server
#install jedi-language server
sudo pacman -S python-pipx
pipx install jedi-language-server
echo "PATH=$PATH:/home/${USER}/.local/bin" >> ~/.bashrc
echo "PATH=$PATH:/home/${USER}/.local/bin" >> ~/.zshrc

mkdir -p ~/.config/nvim/
ln -s $(pwd)/init.vim ~/.config/nvim/init.vim

#install vimplug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#install all plugins from init.vim
nvim +PlugInstall

coc_support
