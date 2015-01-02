#!/bin/bash

# CUSTOMIZE THESE
installdir='/c/Chocolatey/lib/Emacs.24.3/tools/emacs-24.3/bin'
repodir='/c/Dropbox/.emacs.d'

buffer=${1:-'new'}
$installdir/emacsclient.exe \
    --alternate-editor "$installdir/runemacs.exe" \
    -f "$repodir/files-$USERDOMAIN-$USERNAME/server" $buffer
