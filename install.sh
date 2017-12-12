# AUTOR Marcelo Arteaga <arteagamarcelo@gmail.com>

########################################
# System Stuff
########################################

sudo rm -R ~/neovim-config

# Update and install
sudo apt-get update && apt-get install -y \
      bash \
      fish \
      curl \
      wget \
      git \
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
      locales-all

# ranger (FileManager)
# ctags (Busca relacion de funciones en archivos)
# shellcheck (Verifica la sintaxis de un shell)
# sqlite3 (base de datos portable)
# locales (idiomas para SO)
# tmux (Gestor de layouts terminal)
# fish (Terminal ligera para shell)

# Desinstalar Neovim
# sudo rm /usr/local/bin/nvim
# sudo rm -r /usr/local/share/nvim/

# Instalacion de Neovim
sudo git clone https://github.com/neovim/neovim.git ~/neovim && \
      cd ~/neovim && \
      sudo make CMAKE_BUILD_TYPE=RelWithDebInfo && \
      sudo make install

# Instalacion de Fzf
sudo git clone https://github.com/junegunn/fzf.git ~/.fzf && \
			~/.fzf/install --all

# Instalacion de Personalizacion para Neovim
sudo git clone https://github.com/kristijanhusak/neovim-config.git ~/neovim-config && \
      sudo mkdir -p ~/.fonts && \
      cd ~/neovim-config && \
      sudo chmod +x install.sh && \
      sed -i '3,${/zsh/d}' install.sh && \
      sed -i '3,${/z.sh/d}' install.sh && \
      sed -i '/ln -s/d' install.sh && \
      sed -i 's/apt-get install/apt-get install -y/g' install.sh && \
      sed -i 's/sudo//g' install.sh && \
      sed -i '/nvim -c/d' install.sh

sudo tmux && \
      tmux source-file ~/neovim-config/tmux.conf && \
      sh install.sh

########################################
# Python
########################################
# Install python linting and neovim plugin
sudo pip install neovim jedi flake8 flake8-docstrings flake8-isort flake8-quotes pep8-naming pep257 isort
sudo pip3 install neovim jedi flake8 flake8-docstrings flake8-isort flake8-quotes pep8-naming pep257 isort mypy

########################################
# Instalacion de Plugins NVIM
nvim +silent +VimEnter +PlugInstall +qall


########################################
# Personalizations
########################################
# # Add some aliases
# ADD bashrc /root/.bashrc
# # Add my git config
# ADD gitconfig /etc/gitconfig
# # Change the workdir, Put it inside root so I can see neovim settings in finder
# WORKDIR /root/app
# # Neovim needs this so that <ctrl-h> can work
# RUN infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > /tmp/$TERM.ti
# RUN tic /tmp/$TERM.ti
# # Command for the image
# CMD ["/bin/bash"]
# # Add nvim config. Put this last since it changes often
# ADD nvim /root/.config/nvim
# # Install neovim Modules
# RUN nvim -i NONE -c PlugInstall -c quitall > /dev/null 2>&1
# RUN nvim -i NONE -c UpdateRemotePlugins -c quitall > /dev/null 2>&1
# # Add flake8 config, don't trigger a long build process
# ADD flake8 /root/.flake8
# # Add local vim-options, can override the one inside
# ADD vim-options /root/.config/nvim/plugged/vim-options
# # Add isort config, also changes often
# ADD isort.cfg /root/.isort.cfg
