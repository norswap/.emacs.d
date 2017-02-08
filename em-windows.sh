#!/bin/bash

BUFFER=${1:-new}

emacsclient.exe --no-wait \
    --alternate-editor runemacs.exe \
    -f $APPDATA/.emacs.d/files-$USERDOMAIN-$USERNAME/server \
    $BUFFER
