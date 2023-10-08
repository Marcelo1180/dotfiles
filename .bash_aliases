alias n='nvim .'
alias ss='ssh **'
alias ll='ls -la'

alias gs='git status'
alias gl='git log'
alias gb='git branch'
alias gp='git push origin'
alias gac='git add . && git commit -m'
alias gfi='git flow init'
alias gfs='git flow feature start'
alias gff='git flow feature finish -k'

# Django
alias tt='python manage.py test'
alias rr='python manage.py runserver 0.0.0.0:8000'
alias dr='python manage.py runserver'
alias ds='mkdir ./base/apps/advisor && django-admin startapp advisor ./base/apps/advisor'

# Python
alias psh='pipenv shell'

# Kubernetes
alias ka='kubectl apply -f'
alias kgp='kubectl get pods'
alias kdp='kubectl describe pod'
