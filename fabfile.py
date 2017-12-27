#fabfile.py
# fab -H localhost install

# from fabric.colors import red, green
from fabric.api import sudo, run, task
from fabric.context_managers import cd

DEPLOY_PATH = '$HOME/.dotfiles'
DEPLOY_NVIM = '$HOME/nvim'
DEPLOY_FZF = '$HOME/.fzf'

def aplicaciones():
    sudo('apt-get update -y')
    sudo('apt-get install -y \
      bash \
      fish \
      curl \
      wget \
      git \
      xclip \
      python-dev \
      python-pip \
      python3-dev \
      python3-pip \
      ctags \
      shellcheck \
      ranger \
      libtool \
      libtool-bin \
      autoconf \
      automake \
      cmake \
      g++ \
      pkg-config \
      unzip \
      libmsgpack-dev \
      libuv1-dev \
      libluajit-5.1-dev \
      tmux \
      ctags \
      sqlite3 \
      locales \
      locales-all')

def fzf():
    run('git clone https://github.com/junegunn/fzf.git %s' % DEPLOY_FZF)
    with cd(DEPLOY_FZF):
        run('bash install --all')

def neovim():
    sudo('pipinstall neovim jedi flake8 flake8-docstrings flake8-isort \
         flake8-quotes pep8-naming pep257 isort')
    sudo('pip3 install neovim jedi flake8 flake8-docstrings flake8-isort \
         flake8-quotes pep8-naming pep257 isort mypy')
    run('mkdir -p ~/.config/nvim')
    sudo('rm -fR %s' % DEPLOY_NVIM)
    run('git clone https://github.com/neovim/neovim.git %s' % DEPLOY_NVIM)
    with cd(DEPLOY_NVIM):
        run('sudo make CMAKE_BUILD_TYPE=RelWithDebInfo')
        run('sudo make install')
        run('nvim +silent +VimEnter +PlugInstall +qall')

def bootstrap():
    with cd(DEPLOY_PATH):
        run('bash bootstrap.sh')


@task
def install():
    aplicaciones()
    fzf()
    neovim()
    bootstrap()
