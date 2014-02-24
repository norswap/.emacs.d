#!/bin/bash

# Tentative of making emacsclient work on Mac OS X.
# Clearly won't work with emacs installed from homebrew (compile for coca).

# A few data points (for the brew version):
# - server file is created but is empty:
#   /var/folders/3b/s5n6jr3n5cs4n7d4jllw8zfr0000gn/T/emacs501/server
#   using another filename gives no improvement
# - -c option is not available
# - empty string after -a does not seem to work

emacsclient -n -a "/usr/local/Cellar/emacs/24.3/Emacs.app/Contents/MacOS/Emacs" "$@" \
    -f  "~/Dropbox/.emacs.d/files-$HOSTNAME-$USER/server" "$@" \
    2>/tmp/emacs-startup <<EOF
y
EOF
