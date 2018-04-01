#   ---------------------------------------
#   https://github.com/mathiasbynens/dotfiles
#   ---------------------------------------
# Cargar el bash automaticamente por cada session de tmux
. ~/.bashrc
# Definir paleta de colores
export TERM=xterm-256color
export VISUAL=nvim
export EDITOR=nvim
# set fish_greeting "fff"; echo $fish_greeting; fish
# Cargar funciones, alias
for file in ~/.{aliases,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

export PATH="$HOME/.cargo/bin:$PATH"
