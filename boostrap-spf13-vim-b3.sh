#!/bin/bash

init_cfg() {
    app_name='spf13-vim'
    git_uri='https://github.com/spf13/spf13-vim.git'
    git_branch='3.0'
    debug_mode='0'
    fork_maintainer='0'

    endpath=`dirname $0`/home/.${app_name}-3
}

lnif() {
    #Create links
    if [ -e "$1" ]; then

        #Backup existing files (if not mine)
        if [ -e $2 ]; then
                ORIGDEST=$2
                while `test -L ${ORIGDEST}`;do echo ORIGDEST="$ORIGDEST";ORIGDEST=`readlink ${ORIGDEST}`;done
                if [ ! "$1" == "$ORIGDEST" ]; then
                    today=`date +%Y%m%d_%s`
                    mv $2 $2-$today
                fi
        fi

        ln -sf "$1" "$2"
        ret="$?"
    fi
}

update_links() {

    lnif "$endpath/.vimrc" "$HOME/.vimrc"
    lnif "$endpath/.vimrc.bundles" "$HOME/.vimrc.bundles"
    lnif "$endpath/.vimrc.before" "$HOME/.vimrc.before"
    #lnif "$endpath/.vim" "$HOME/.vim"

    # Useful
    touch "$HOME/.vimrc.local"
    touch "$HOME/.vimrc.bundles.local"
    touch "$HOME/.vimrc.before.local"


    ## REMAINING: Kept default from spf13-vim  bootstrap.sh
    if [ -e "$endpath/.vimrc.fork" ]; then
        ln -sf "$endpath/.vimrc.fork" "$HOME/.vimrc.fork"
    elif [ "$fork_maintainer" -eq '1' ]; then
        touch "$HOME/.vimrc.fork"
        touch "$HOME/.vimrc.bundles.fork"
        touch "$HOME/.vimrc.before.fork"
    fi

    if [ -e "$endpath/.vimrc.bundles.fork" ]; then
        ln -sf "$endpath/.vimrc.bundles.fork" "$HOME/.vimrc.bundles.fork"
    fi

    if [ -e "$endpath/.vimrc.before.fork" ]; then
        ln -sf "$endpath/.vimrc.before.fork" "$HOME/.vimrc.before.fork"
    fi
}


##MAIN
if [ "$1" == "run" ]; then
        init_cfg
        update_links
fi
