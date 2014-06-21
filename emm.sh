#!/bin/bash

# TODO: try on linux
# TODO: export EDITOR to waiting version

# Set to location of your emacsclient if not on path.
ECLIENT=emacsclient

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

[[ "$@" == -h* ]]     && { shift; echo "$HELP"; exit 0; }
[[ "$@" == --help* ]] && { shift; echo "$HELP"; exit 0; }

################################################################################
# LOGGING

# Invert comments on next two lines to toggle logging.
#LOG=":"
LOG="echo"

# Select log file, leave emtpy for stdout.
LOGF="/tmp/emmtest"

# Logging function.
log () { $LOG $@ 1>>$LOGF; }
#log () { :; }

################################################################################
# PROCESS PARAMS

# Control the presence of the "-n" option depending on the presence of "-w" as
# first argument (-w present <=> -n absent). Remove "-w" from arglist.
[[ "$@" == -w* ]] && { shift; N=""; } || N="-n"

# -nw implies -w.
[[ "$@" == -nw* ]] && N=""

# Use ARGS the board because $@ cannot be assigned to.
ARGS="$@"

# If there are no files specified, specify a default file.
ARGS=${ARGS:-"$EMACS_DEFAULT_FILE"}
[[ "$@" == "-nw" ]] && ARGS="-nw $EMACS_DEFAULT_FILE"

# Determine if the Emacs daemon is running (DRUNNING = 0); and
# whether there is a visible frame (FVISIBLE = "t").
# We look for <= 2 because Emacs --daemon seems to always have an entry in
# visibile-frame-list even if there isn't any visible frame.
FVISIBLE=$($ECLIENT -e "(<= 2 (length (visible-frame-list)))")
DRUNNING=$?

################################################################################
# LAUNCH EMACS

if [[ "$DRUNNING" != "0" ]]; then
    # The daemon is not running, start the daemon and open a frame.
    # Also remove the lock on the desktop, as it is in a user specific folder,
    # and not doing so causes the desktop not to be loaded on OSX, or to
    # have an annoying prompt on Linux.
    rm ~/".emacs.d/files-$(hostname)-$(whoami)/.emacs.desktop.lock"
    log "not running: $ECLIENT $N -a '' -c $ARGS"
    $ECLIENT $N -a "" -c $ARGS
elif [[ "$FVISIBLE" != "t" ]]; then
    log "running but not visible: $ECLIENT $N -c $ARGS"
    # there is a not a visible frame, open one (-c)
    $ECLIENT $N -c $ARGS
else
    log "running & visible: $ECLIENT $N $ARGS"
    $ECLIENT $N $ARGS
fi

################################################################################
# DOC

# explanation of emacsclient options used in this file:
# -n : return from the command without waiting for the buffer to "finish"
# -c : open a new frame
# -a : editor to run if emacs server not running, if empty, runs the emacs
#      server
# -e : evaluate emacs lisp and print out the result
