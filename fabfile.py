# -*- coding: utf-8 -*-
"""Example Google style docstrings.

This module demonstrates documentation as specified by the `Google Python
Style Guide`_. Docstrings may extend over multiple lines. Sections are created
with a section header and a colon followed by a block of indented text.

Example:
    Examples can be given using either the ``Example`` or ``Examples``
    sections. Sections support any reStructuredText formatting, including
    literal blocks::

        $ python example_google.py

Section breaks are created by resuming unindented text. Section breaks
are also implicitly created anytime a new section starts.

Attributes:
    module_level_variable1 (int): Module level variables may be documented in
        either the ``Attributes`` section of the module docstring, or in an
        inline docstring immediately following the variable.

        Either form is acceptable, but the two should not be mixed. Choose
        one convention to document module level variables and be consistent
        with it.

Todo:
    * For module TODOs
    * You have to also use ``sphinx.ext.todo`` extension

.. _Google Python Style Guide:
   http://google.github.io/styleguide/pyguide.html
"""
# fabfile.py
# fab install
# fab -H localhost install

# from fabric.colors import red, green
from fabric.api import sudo, run, task
from fabric.context_managers import cd
from fabric.state import env

env.hosts = ['localhost']
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
      silversearcher-ag \
      locales \
      locales-all')


def fzf():
    run('rm -fR %s' % DEPLOY_FZF)
    run('git clone https://github.com/junegunn/fzf.git %s' % DEPLOY_FZF)
    with cd(DEPLOY_FZF):
        run('bash install --all')


def neovim():
    sudo('rm -f /usr/local/bin/nvim')
    sudo('rm -fR /usr/local/bin/nvim/')
    run('rm -fR ~/.config/nvim')
    sudo('pip install neovim jedi flake8 flake8-docstrings flake8-isort \
         flake8-quotes pep8-naming pep257 isort')
    sudo('pip3 install neovim jedi flake8 flake8-docstrings flake8-isort \
         flake8-quotes pep8-naming pep257 isort mypy')
    sudo('sudo npm install -g neovim')
    run('mkdir -p ~/.config/nvim')
    run('sudo rm -fR %s' % DEPLOY_NVIM)
    run('git clone https://github.com/neovim/neovim.git %s' % DEPLOY_NVIM)
    with cd(DEPLOY_NVIM):
        # run('sudo make CMAKE_BUILD_TYPE=RelWithDebInfo')
        # run('sudo make install')
        sudo('make CMAKE_BUILD_TYPE=RelWithDebInfo', user=env.user)
        run('sudo make install')
        run('curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
        run('nvim +silent +VimEnter +PlugInstall +qall')


def bootstrap():
    with cd(DEPLOY_PATH):
        run('bash bootstrap.sh')


def tmux():
    run('rm -fR ~/.tmux/plugins/tpm')
    run('git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm')
    # run('tmux source ~/.tmux.conf')

@task
def install():
    aplicaciones()
    fzf()
    neovim()
    bootstrap()
    tmux()
