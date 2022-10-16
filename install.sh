#!/bin/bash

# Create symbolic links to where the dotfiles need to be

DOTFILES_DIR="$(pwd)"

# inputrc
ln -svf $DOTFILES_DIR/inputrc ~/.inputrc

# zsh
ln -svf $DOTFILES_DIR/zshrc ~/.zshrc

# tmux
ln -svf $DOTFILES_DIR/tmux.conf ~/.tmux.conf

# vim
if [[ ! -d ~/.vim ]]; then
    mkdir ~/.vim
fi
ln -svf $DOTFILES_DIR/vimrc ~/.vimrc

# nvim
if [[ ! -d ~/.config/nvim ]]; then
  mkdir -p ~/.config/nvim
fi
ln -svf $DOTFILES_DIR/init.vim ~/.config/nvim/init.vim
