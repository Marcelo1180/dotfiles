# -*- coding: utf-8 -*-
"""Instalacion de desarrollo
"""
# fabfile.py
# fab install
# fab -H localhost install

# from fabric.colors import red, green
from fabric.api import sudo, run, task
from fabric.context_managers import cd
from fabric.state import env

env.hosts = ['localhost']


def aplicaciones():
    sudo('apt-get update -y')
    sudo('apt-get install -y \
      fisher \
      htop')


def python():
    sudo('pip install \
    virtualenv \
    autopep8 \
    sphinx')


@task
def install():
    aplicaciones()
    python()
