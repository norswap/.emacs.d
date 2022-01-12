#!/bin/bash

# if the -w flag is present, wait for completion in emacs (exit or server-edit)
WAIT='--no-wait'
[[ "$1" = "-w" ]] && { WAIT=''; shift; }

BUFFER=${1:-new}

# the indicated server file should be the default location, but better safe than sorry
emacsclient.exe $WAIT \
    --alternate-editor runemacs.exe \
    -f ~/".emacs.d/files-$(hostname)-$(whoami)/server" \
    $BUFFER
