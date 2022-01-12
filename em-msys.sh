#!/bin/bash

# if the -w flag is present, wait for completion in emacs (exit or server-edit)
WAIT='--no-wait'
[[ "$1" = "-w" ]] && { WAIT=''; shift; }

BUFFER=${1:-new}

# set $HOME to $APPDATA if not set
[ -v $HOME ] && HOME=$APPDATA

emacsclient.exe $WAIT \
    --alternate-editor runemacs.exe \
    -f "$HOME/.emacs.d/files-$USERDOMAIN-$USERNAME/server" \
    $BUFFER
