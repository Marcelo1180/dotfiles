# Marcelo1180 dotfiles

## Installation

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/Projects/.dotfiles`, with `~/.dotfiles` as a symlink.) The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
sudo apt-get install fabric openssh-server python-pip
sudo pip install fabric
git clone https://github.com/Marcelo1180/dotfiles.git ~/.dotfiles
fab -H localhost install
```

edit ~/.bashrc
```bash
if command -v tmux>/dev/null; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
bash ~/.bashart
```
