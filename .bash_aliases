alias nube='cd /Users/marcelo/Library/Mobile\ Documents/com~apple~CloudDocs'
alias ss='ssh **'
alias ll='ls -la'
alias tt='python manage.py test'
alias rr='python manage.py runserver 0.0.0.0:8000'

alias vv='nvim .'
# Git
alias gs='git status'
alias gl='git log'
alias gb='git branch'
alias gp='git push origin'
alias gac='git add . && git commit -m'
alias gfi='git flow init'
alias gfs='git flow feature start'
alias gff='git flow feature finish -k'

# Django
alias dr='python manage.py runserver'
# alias ds='(cd base/apps && django-admin startapp advisor)'
alias ds='mkdir ./base/apps/advisor && django-admin startapp advisor ./base/apps/advisor'

# Python
alias psh='pipenv shell'

# Kubernetes
alias ka='kubectl apply -f'
alias kgp='kubectl get pods'
alias kdp='kubectl describe pod'
