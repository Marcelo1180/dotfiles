#!/bin/bash
#
# by Marcelo Arteaga <artegamarcelo@gmail.com>
# License: GNU GPLv3
#

welcomemsg() {
	echo "BIENVENIDO"
}

aplicaciones() {
  sudo apt update
	sudo apt install \
		blueman \
		thunar \
		git \
		neovim xclip \
		firefox \
		mpv \
		zathura \
		python-pip \
		feh
}

dotfiles() {
	cd $HOME
	#git clone https://github.com/Marcelo1180/dotfiles .dotfiles
	cd $HOME/.dotfiles
	bash bootstrap.sh
}

neovim() {
  sudo apt install neovim
  pip install neovim --user
	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim +silent +VimEnter +PlugInstall +qall
}

VERSION="5.0.56"
if [ `uname -m` == "x86_64" ]; then
	ARCH="x86_64"
else
	ARCH="i686"
fi
TMP="/tmp/zotero.tar.bz2"
DEST_FOLDER=zotero
EXEC=zotero

echo ">>> This script will download and install Developer DOTFILES on your system."
echo ">>> Do you want to continue?"
echo ">>> y/n (default=y)"
read INPUT
if [ "$INPUT" = "n" ]; then
	echo ">>> Aborting installation"
	exit 0
fi

welcomemsg
aplicaciones
dotfiles
neovim

# Firefox
# tridactyl
# https://github.com/tridactyl/tridactyl
# https://tridactyl.cmcaine.co.uk/betas/tridactyl-latest.xpi
