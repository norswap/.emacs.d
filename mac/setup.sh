#!/bin/bash

# Note: this script is idempotent and so can be run over and over without
# producing annoying side-effects.

### Pre-Requsisites ###

# - realpath (brew install coreutils)

### Setup ###

# cd to the directory containing this script
cd "$(dirname "$(realpath "$0")")"

# The directory where you want to install the emacs launchers.
BINDIR=~/bin

### Helper Functions ###

install() {
    ln -snf "$(realpath "$1")" "$2"
}

install_exec_name() {
    install "$1" "$2"
    chmod +x "$2"
}

install_exec() {
    install_exec_name "$1" "$BINDIR/$(basename "$1")"
}

compile_app() {
    local NOEXT="${1%.*}"
    local TMPAPP="$NOEXT.app"
    local NAME="$(basename "$NOEXT")"
    local TARGETAPP="/Applications/$NAME.app"
    # Avoid pesky permission notifications when the apps are changed.
    [[ "$1" -ot "$TARGETAPP" ]] && return
    osacompile -o "$TMPAPP" "$1"
    rm -rf "$TARGETAPP"
    mv "$TMPAPP" "$TARGETAPP"
    cp "$NOEXT.icns" "$TARGETAPP/Contents/Resources/$2.icns"
    # This is necessary so that the app may be used as defaut opener for files.
    # ... and maybe other things too.
    /usr/libexec/PlistBuddy -c \
        "Add :CFBundleIdentifier string com.norswap.$NAME" \
        "$TARGETAPP/Contents/Info.plist"
}

### Installation ###

install .. ~/.emacs.d

install_exec_name ../em-macos.sh $BINDIR/em
install_exec_name ../emw-macos.sh $BINDIR/emw

compile_app ~/".emacs.d/setup/Em.scpt" droplet
compile_app ~/".emacs.d/setup/EmacsFinderOpener.scpt" applet

# install_service ~/.emacs.d/setup/'Open with Emacs.workflow'
