#!/bin/bash
#
# by Marcelo Arteaga <artegamarcelo@gmail.com>
# License: MIT
#

clear

# List of brew apps by repo
# CLI
FORMULAE=(
  ansible
  ffmpeg
  fzf
  htop
  git-flow
  pipenv
  tmux
  vim
)

# UI
CASKS=(
  alfred
  balenaetcher
  blender
  calibre
  dbeaver-community
  docker
  font-hack-nerd-font
  iterm2
  meld
  notion
  postman
  rescuetime
  slack
  spark
  spotify
  telegram
  the-unarchiver
  ultimaker-cura
  virtualbox
  vnc-viewer
  zoom
  zotero
)

# Prints warning/error $MESSAGE in red foreground color
err_echo() {
    echo -e "\x1b[1;31m [ ] $MESSAGE"
}

ok_echo() {
    echo -e "\x1b[1;32m [*] $MESSAGE"
}

info_echo() {
    echo -e "\x1b[1;34m$MESSAGE"
}

warn_echo() {
    echo -e "\x1b[1;33m$MESSAGE"
}

title_echo() {
    echo -e "\x1b[1;36m$MESSAGE"
}

function linkFile() {
  MESSAGE=$f
  # rm -fr ~/$f && ln -sf $(pwd)/$f ~/$f && ok_echo || err_echo
  ok_echo || err_echo
}

# Link dotfiles to specific directory
# ls list all file, first awk filter files that begins with dot and
# the second exclude some kinds of files
function lnDotFiles() {
  for f in $(ls -1a | awk '/^\./' | awk '!/^.$|^..$|^.git$|^.gitignore$/'); do
    case "$f" in
      .config)
        f='.config/vim' ; linkFile
        ;;
      *)
        linkFile
        ;;
    esac
  done
}

# Main interface
function main(){
  echo "Name    : Juan Marcelo Arteaga Gutierrez"
  echo "Version : 0.1.0"
  echo
  MESSAGE=".dotfiles CLI installer" ; title_echo
  echo
  echo
  MESSAGE="Config files" ; title_echo
  lnDotFiles
  echo
  MESSAGE="Install Brew CLI Apps" ; title_echo
  echo
  # brew install ${CASKS[@]} --cask
  echo
  MESSAGE="Install Brew UI Apps" ; title_echo
  echo
  # brew install ${CASKS[@]} --cask
}

# Ask actions
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	main;
else
	read -p "Esto va a sobreescribir archivos en tu directorio home. ¿Estás seguro? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		main;
	fi;
fi;
