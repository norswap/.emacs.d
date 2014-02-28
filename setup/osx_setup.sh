#!/bin/bash
brew install --cocoa emacs
# don't run "brew linkapps" (if you do don't worry, the result of this is
# overwritten later on -- it just links Emacs.app to /Applications)
sudo mv /usr/bin/emacs /usr/bin/emacs_old
sudo mv /usr/bin/emacsclient /usr/bin/emacsclient_old
sudo ln -s /usr/local/Cellar/emacs/24.3/bin/emacs /usr/bin/emacs
sudo ln -s /usr/local/Cellar/emacs/24.3/bin/emacsclient /usr/bin/emacsclient
osacompile -o Emacs.app macapp.scpt
sudo mv Emacs.app /Applications/Emacs.app

################################################################################

# You can autostart emacs by adding to System Preferences > Uers & Groups >
# Login Items.

################################################################################

# If you're into such frivolity, you can give the app a nice icon to be shown in
# spotlight or launchpad:
#
# Using the Finder, navigate to /usr/local/Cellar/emacs/24.3 and right click on
# Emacs.app, and click on Show Package Contents. Do the same for the
# /Applications/Emacs.app.
#
# Copy the Emacs.icns file from Contents/Resources of the Cellar one to the
# Contents/Resources of the Applications one. Delete applet.icns and rename
# Emacs.icns to applet.icns in the Applications one.
