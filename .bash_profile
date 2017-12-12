#   ---------------------------------------
#   https://github.com/mathiasbynens/dotfiles
#   ---------------------------------------
# Cargar el bash automaticamente por cada session de tmux
. ~/.bashrc
# set fish_greeting "fff"; echo $fish_greeting; fish
# Cargar funciones, alias
for file in ~/.{bash_prompt,aliases,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
