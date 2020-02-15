#!/usr/bin/env bash
# Marcelo Arteaga <artegamarcelo@gmail.com>, GNU GPLv3

#!/bin/sh

# Exit if any subcommand fails
set -e

CLEAR_LINE='\r\033[K'

printf "${CLEAR_LINE}[1/6]⏳   Creating link references\n"
ln -sf $(pwd)/.tmux.conf ~/.tmux.conf
ln -sf $(pwd)/.config/nvim ~/.config/nvim

printf "${CLEAR_LINE}[2/6]⏳   Installing applications\n"
# Ubuntu or Zorin
sudo apt update
sudo apt install -y \
  python-pip \
  python3-pip \
  xclip \

printf "${CLEAR_LINE}[3/6]⏳   Installing & configuring Nvim\n"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +silent +VimEnter +PlugInstall +qall
pip install neovim
pip3 install neovim


#yarn > /dev/null
