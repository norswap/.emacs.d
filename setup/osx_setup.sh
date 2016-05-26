#!/bin/bash

# Sets up emacs on Mac OSX. Idempotent, so can be run again (e.g. if applescript
# file needs recompiling, or when OSX updates and overwrites the /usr/bin
# binaries).

# Directory containing this file.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$(brew ls --versions emacs)" = "" ]; then
    brew install --cocoa emacs
    # Don't run "brew linkapps" (if you do, don't worry, the result of this is
    # overwritten later on -- it just links Emacs.app to /Applications).
fi

if [ ! -f "/usr/bin/emacs_old" ]; then
    sudo mv /usr/bin/emacs /usr/bin/emacs_old
    sudo mv /usr/bin/emacsclient /usr/bin/emacsclient_old
fi

sudo ln -sf /usr/local/Cellar/emacs/24.4/bin/emacs /usr/bin/emacs
sudo ln -sf /usr/local/Cellar/emacs/24.4/bin/emacsclient /usr/bin/emacsclient
sudo chmod +x ~/.emacs.d/em.sh
sudo chmod +x ~/.emacs.d/emw.sh
sudo ln -sf ~/.emacs.d/em.sh /usr/bin/em
sudo ln -sf ~/.emacs.d/emw.sh /usr/bin/emw

osacompile -o Emacs.app ~/.emacs.d/setup/macapp.scpt
/usr/libexec/PlistBuddy -c "Add :CFBundleIdentifier string eu.norswap.Emacs" \
    Emacs.app/Contents/Info.plist
sudo rm -rf /Applications/Emacs.app
sudo mv Emacs.app /Applications/Emacs.app
