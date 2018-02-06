# fabfile.py
# fab -H localhost install

# from fabric.colors import red, green
from fabric.api import sudo, run, local, task
from fabric.context_managers import cd
from fabric.state import env

env.hosts = ["localhost"]

DEPLOY_PATH = '$HOME/.dotfiles'
DEPLOY_NVIM = '$HOME/nvim'
DEPLOY_FZF = '$HOME/.fzf'
# DEPLOY_HOME = run('echo $HOME')


def demo():
    sudo('echo %s' % DEPLOY_PATH, user=env.user)
    sudo('echo %s' % DEPLOY_PATH)


@task
def install():
    demo()
