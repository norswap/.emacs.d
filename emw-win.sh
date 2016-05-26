#!/bin/bash

buffer=${1:-'new'}
emacsclient.exe \
    --alternate-editor runemacs.exe \
    -f $APPDATA\.emacs.d\files-$USERDOMAIN-$USERNAME\server \
    $buffer
