# Marcelo1180 dotfiles

## Installation

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/Projects/.dotfiles`, with `~/.dotfiles` as a symlink.) The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
sudo apt-get install fabric openssh-server
sudo pip install fabric
git clone https://github.com/Marcelo1180/dotfiles.git ~/.dotfiles
fab -H localhost install
```

Agregar lo siguient en el ~/.bashrc
```bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
if [[ ! $TERM =~ screen ]]; then
    exec tmux
fi
bash ~/.bashart
```
