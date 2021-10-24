#!/usr/bin/env bash
#-------------------------------------------------------------------------------
# File Name           - dotdot.sh
# Description         - A dotfile manager
#-------------------------------------------------------------------------------

check() {
    # setup for first time.
    if [[ -z ${DOT_REPO} && -z ${DOT_DIR} ]]
    then
        # setup menu.
        # setup_init.
    else
        # repo exist?.
        # manage.
    fi
}

setup_init() {
    printf "Setting up dotfiles...\n"
    read -p "Github repo url: " -r DOT_REPO
    # If no input, fall back to `$HOME/..`
    read -p "Directory $(basename "${DOT_DIR}") (${HOME/..}): " -r DOT_DIR
    DOT_DIR=${DOT_DIR:-$HOME}

    if [[ -d "$HOME/$DOT_DIR" ]]    # Check if `$HOME/$DOTDIR` does exist.
    then              # If exists.
        # Clone in DIR.
        if git -C "${HOME}/${DOT_DIR}" clone "${DOT_REPO}"
        then
            add_env "$DOT_REPO" "$DOT_DIR"
            printf "You're good to go!\n"
        else
            # No repo found.
            printf "Missing URL.\n"
            exit 1
        fi
    else             # If !exists.
        printf "$DOT_DIR is not a directory\n"
        exit 1
    fi
}
