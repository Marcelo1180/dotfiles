# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# ALIASES
# =======
source $HOME/.bash_aliases

# PLUGINS
# =======
plugins=(
  git-flow-completion
  zsh-syntax-highlighting
  zsh-autosuggestions
)

# THEME POWERLEVEL10K
# ===================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
ZSH_THEME="powerlevel10k/powerlevel10k"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source $ZSH/oh-my-zsh.sh

# FINDER
# ======
# CTRL-T = Find a file
# CTRL-R = Find a command in the history
# ALT-C  = Jump to a directory
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="rg --files --hidden -g '!.*' -g '!node_modules' -g '!docs' -g '!build'"

# DJANGO
# ======
source $HOME/.completion/django_bash_completion

# NODE JS
# =======
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# SWITCH TO NVIM CONFIGS
# ======================
source $HOME/.nvim_switcher.zsh
