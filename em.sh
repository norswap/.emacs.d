#!/bin/bash

# TODO: try on linux
# TODO: export EDITOR to waiting version

# This didn't use to be necessary, but apple motherfuckers messed everything up.
source /Users/nilaurent/.bash_profile

# Set to location of your emacsclient if not on path.
ECLIENT=/usr/local/bin/emacsclient

# Set to location of file to open if no files are specified.
EMACS_DEFAULT_FILE=${EMACS_DEFAULT_FILE:-"~/.emacs.d/scratch"}

################################################################################
# HELP

HELP="
    $0 [-h|--help] [-w] [-nw] [files...]

    -w
        (wait) Wait for the opened files to be closed in emacs to return from
        the script.

    -nw

        (no-window) Open a frame in the terminal. Implies -w. Note that the
        daemon supports both terminal and graphic frames regardless of how it
        was started.

    If no file is specified, the value of EMACS_DEFAULT_FILE is used, or
    '~/.emacs.d/scratch' if it isn't set.

"

[[ "$@" == -h* ]]     && { echo "$HELP"; exit 0; }
[[ "$@" == --help* ]] && { echo "$HELP"; exit 0; }

################################################################################
# LOGGING

LOG_FILE="/tmp/emmtest"

# Logging function.
log () { echo $@ 1>>$LOG_FILE; }

# Uncomment this to log to stdout.
#log () { echo $@; }

# Uncomment this to inhibit logging.
#log () { :; }

################################################################################
# PROCESS PARAMS

# Control the presence of the "-n" option depending on the presence of "-w" as
# first argument (-w present <=> -n absent). Remove "-w" from arglist.
[[ "$@" == -w* ]] && { shift; N=""; } || N="-n"

# -nw implies -w, implies that -n should be absent.
# We don't shift, we pass -nw directly to emacsclient.
[[ "$@" == -nw* ]] && N=""

# Use ARGS accross the board because $@ cannot be assigned to.
ARGS=("$@")

# If there are no files specified, specify a default file.
ARGS=${ARGS:-"$EMACS_DEFAULT_FILE"}
[[ "$@" == "-nw" ]] && ARGS=("-nw" "$EMACS_DEFAULT_FILE")

# Determine if the Emacs daemon is running (DRUNNING = 0); and
# whether there is a visible frame (FVISIBLE = "t").
# We look for <= 2 because Emacs --daemon seems to always have an entry in
# visibile-frame-list even if there isn't any visible frame.
FVISIBLE=$($ECLIENT -e "(<= 2 (length (visible-frame-list)))")
DRUNNING=$?

################################################################################
# LAUNCH EMACS

print_args () { printf "\"%s\" " "${ARGS[@]}"; }

if [[ "$DRUNNING" != "0" ]]; then
    # The daemon is not running, start the daemon and open a frame.
    # Also remove the lock on the desktop, as it is in a user specific folder,
    # and not doing so causes the desktop not to be loaded on OSX, or to
    # have an annoying prompt on Linux.
    rm ~/".emacs.d/files-$(hostname)-$(whoami)/.emacs.desktop.lock"
    log "not running: $ECLIENT $N -a '' -c $(print_args)"
    $ECLIENT $N -a '' -c "${ARGS[@]}"
elif [[ "$FVISIBLE" != "t" ]]; then
    log "running but not visible: $ECLIENT $N -c $(print_args)"
    # there is a not a visible frame, open one (-c)
    $ECLIENT $N -c "${ARGS[@]}"
else
    log "running & visible: $ECLIENT $N $(print_args)"
    $ECLIENT $N "${ARGS[@]}"
fi

################################################################################
# DOC

# explanation of emacsclient options used in this file:
# -n : return from the command without waiting for the buffer to "finish"
# -c : open a new frame
# -a : editor to run if emacs server not running, if empty, runs the emacs
#      server
# -e : evaluate emacs lisp and print out the result
# -nw: open the frame in a terminal

################################################################################
# BAK

# This was my old linux version.

# # You may need to change the value of the -name parameter, depending on you Unix
# # distribution (this works on Ubuntu 12.10).
# xprop -name emacs@`hostname` >/dev/null 2>/dev/null
# if [ "$?" = "1" ]; then
#     emacsclient -c -n -a "" "$@" 2>/tmp/emacs-startup <<EOF
# y
# EOF
# else
#     emacsclient -n -a "" "$@" 2>/tmp/emacs-startup <<EOF
# y
# EOF
# fi
