#!/bin/bash

# Minimalist NeoVim setup

# config  - https://vim-bootstrap.com/
# plugins - https://vimawesome.com
#   - https://github.com/junegunn/vim-plug
#   - https://github.com/VundleVim/Vundle.vim


# fetch/update plugin manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'