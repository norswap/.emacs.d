#!/bin/bash

# Same as em.bat but without the --no-wait option or the -w flag. Should be kept in sync.
# See README.md for explanation why we can't just call `em -w "$1"`

BUFFER=${1:-new}

# set $HOME to $APPDATA if not set
[ -v $HOME ] && HOME=$APPDATA

emacsclient.exe \
    --alternate-editor runemacs.exe \
    -f "$HOME/.emacs.d/files-$USERDOMAIN-$USERNAME/server" \
    $BUFFER
