#!/bin/bash
#
# by Marcelo Arteaga <artegamarcelo@gmail.com>
# License: GNU GPLv3
#
# Connect bluetooth by terminal
# https://antergos.com/wiki/es/hardware/bluetooth/get-bluetooth-headphone-auto-connected-with-a2dp/
# bluetoothctl
# power on
# agent on
# default-agent
# scan on
# pair XX:XX:XX:XX:XX:XX < your headphones "ID"
# trust XX:XX:XX:XX:XX:XX
# connect XX:XX:XX:XX:XX:XX
# scan off
# exit

welcomemsg() {
	echo "BIENVENIDO"
}

i3() {
  sudo apt update
	sudo apt install \
		i3 \
		git \
		libxcb-shape0-dev
	sudo apt install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake
	cd /tmp
	git clone https://www.github.com/Airblader/i3 i3-gaps
	cd i3-gaps
	autoreconf --force --install
	rm -rf build/
	mkdir -p build && cd build/
	../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
	make
	sudo make install
}

st() {
	cd /tmp
	git clone https://github.com/LukeSmithxyz/st
	cd st
	make
	sudo make install
}

nvidia_drivers() {
  sudo add-apt-repository ppa:graphics-drivers/ppa
  sudo apt update
  sudo apt upgrade
	sudo apt install nvidia-387
}

fonts() {
	cd /tmp
  git clone https://github.com/powerline/fonts.git --depth=1
	cd fonts
	./install.sh
}

aplicaciones() {
  sudo add-apt-repository ppa:neovim-ppa/stable
  sudo apt update
	sudo apt install \
		blueman \
		thunar \
		ranger \
		feh \
		git \
		tree \
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
