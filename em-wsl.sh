#!/bin/bash

# For this to work, you will need to set some variable, i.e. `$WINDOWS_HOME`
# (the Windows dir that contains `.emacs.d`, as a Linux-style WSL path, e.g. `
# /mnt/c/Users/norswap`), `$USERDOMAIN` (to your Windows hostname) and
# `$USERNAME` (to your Windows hostname), e.g. in your `.bashrc`. This is so we
# can locate the server file for emacs running on Windows.

BUFFER=${1:-new}

# resolve relative & symlinks if needed
BUFFER_TMP=$(realpath $BUFFER 2> /dev/null)
[[ $? == 0 ]] && BUFFER=$BUFFER_TMP

# create dir if missing (necessary for Windows path conversion)
DIR=$(dirname $BUFFER)
mkdir -p $DIR

# convert dir part to windows (not basename, in case file does not exist)
DIR_TMP=$(wslpath -m $DIR 2> /dev/null)
[[ $? == 0 ]] && DIR=$DIR_TMP
BUFFER=$DIR/$(basename $BUFFER)

emacsclient.exe --no-wait \
    --alternate-editor runemacs.exe \
    -f "$WINDOWS_HOME/.emacs.d/files-$USERDOMAIN-$USERNAME/server" \
    $BUFFER
