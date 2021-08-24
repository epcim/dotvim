dotvim
======

Homeshick (homesick) managed repository with VIM dotfiles.


## Files

Nvim setup:
- .config/nvim/init.vim (sources ~/.vimrc)
- .config/nvim/local_bundles.vim

Minimalist vim setup:
- .vimrc (sources ~/.vimrc.local)
- .vimrc.local

## Providers

Python:
- https://neovim.io/doc/user/provider.html
```
 pyenv install 3.6.9
    pyenv virtualenv 3.6.9 py3nvim
    pyenv activate py3nvim
    python3 -m pip install pynvim
    # ~/.pyenv/versions/py3nvim/bin/python -m pip install pynvim
    pyenv which python  # Note the path

The last command reports the interpreter path, add it to your init.vim:
    let g:python3_host_prog = '~/.pyenv/py3nvim/bin/python'
```

## DEPRECATED

Spf13 vim setup (deprecated, will be moved to home/.vimrc_archive):
- .vimrc_spf13 -> ../../../../.spf13-vim-3/.vimrc
- .vimrc.before -> ../../../../.spf13-vim-3/.vimrc.before
- .vimrc.before.fork
- .vimrc.before.local
- .vimrc.bundles -> ../../../../.spf13-vim-3/.vimrc.bundles

Local files (not synced):
- .vimrc.*.local
