#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

# git pull origin master;

function doIt() {
  for f in $(ls .[^.]* -1da --ignore={".","..",".git",".DS_Store",".osx"}); do
    case "$f" in
      .config)
        ln -sf $(pwd)/.config/nvim/init.vim ~/.config/nvim/init.vim
        ln -sf $(pwd)/.config/nvim/snippets ~/.config/nvim/snippets
        ;;
      .gitignore)
        ;;
      .git)
        ;;
      *)
        ln -sf $(pwd)/$f ~/$f
        ;;
    esac
  done
  source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "Esto va a sobreescribir archivos en tu directorio home. ¿Estás seguro? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
