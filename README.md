# Marcelo1180 dotfiles

## Requirements
- MacOsX Monterey
- [Homebrew](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-homebrew-on-macos)

## Installation

You need a git client
```sh
brew install git
```

You need to clone the repository at home (~)
```bash
git clone https://github.com/Marcelo1180/dotfiles.git ~/.dotfiles
```

Run installer
```bash
cd ~/.dotfiles
chmod +x install.sh
./install.sh
```

Run after installation of NVIM
[Reference](https://github.com/junegunn/vim-plug)
```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Run after installation of FZF
[Reference](https://sourabhbajaj.com/mac-setup/iTerm/fzf.html)
```sh
/usr/local/opt/fzf/install
```

Autorun after installation, edit ~/.zshrc
```sh
...
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files'
source ~/.bash_aliases
```

Pyenv autorun after installation, edit ~/.zprofile
```sh
eval "$(pyenv init --path)"
```

## License

MIT License

    Copyright (c) 2021 Marcelo1180
    
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    
    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
