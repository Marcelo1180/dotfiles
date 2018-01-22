#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

# git pull origin master;

function doIt() {
  for f in $(ls .[^.]* -1da --ignore={".","..",".git",".DS_Store",".osx"}); do
    case "$f" in
      .config)
        echo $(pwd)/.config/nvim/init.vim ~/.config/nvim/init.vim
        echo $(pwd)/.config/nvim/snippets ~/.config/nvim/snippets
        ;;
      *)
        echo $(pwd)/$f ~/$f
        ;;
    esac
  done
  source ~/.bash_profile;
}

doIt;
