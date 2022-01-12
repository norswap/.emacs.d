#!/bin/bash

# Note: this hasn't been tried on Linux, only macOS.

################################################################################
# DOC

# - Install Emacs with `brew cask install emacs`
#
# - Make sure your `init.el` contains `(server-start)`.
#
# - Emacs can be started graphically or via the command line.
#   - If started without a --(bg-)daemon option, emacs prevents closing the
#     last visible frame (C-x 5 0) and closing the "connection" or "terminal"
#     (C-x C-c) closes the daemon. Use `pgrep macs` to verify if the daemon is
#     running.
#   - With --(bg-)daemon, either the `kill-emacs` emacs command or the `pkill`
#     bash command can be used to kill the daemon.
#   - Besides passing the flag explicitly, you can also get a background daemon
#     by running `emacsclient -a ''`.
#
# - used emacsclient options:
#       -n : return from the command without waiting for the buffer to "finish"
#       -c : open a new graphical frame
#       -a : editor to run if emacs server not running, runs the emacs server
#            if empty
#       -e : evaluate emacs lisp and print out the result
#       -t : open a frame in the terminal, even if a graphical frame exists

################################################################################
# HELP

HELP="
    $0 [-h|--help] [-w] [-t] [files...]

    -w
        (wait) Wait for the opened files to be closed in emacs to return from
        the script.

    -t

        (term) Open a frame in the terminal. Implies -w. Note that the
        daemon supports both terminal and graphic frames regardless of how it
        was started.

    If no file is specified, the value of EMACS_DEFAULT_FILE is used, or
    '~/.emacs.d/scratch' if it isn't set.

"

################################################################################
# PROCESS PARAMS

[[ "$@" == *--help* ]] && { echo "$HELP"; exit 1; }

N='-n'
T=''

while getopts ":hwt" OPT; do
    case $OPT in
        w)  N='';;
        t)  N='' T='-t';;
        h)  echo "$HELP"; exit 1;;
        \?) echo "$HELP"; exit 1;;
    esac
done
shift $((OPTIND - 1))

# Set to location of file to open if no files are specified.
EMACS_DEFAULT_FILE=${EMACS_DEFAULT_FILE:-"~/.emacs.d/scratch"}
ARGS=("$@")
ARGS=${ARGS:-"$EMACS_DEFAULT_FILE"}

# Get the number of "displayed" frames, and check if emacs is running at all.
FRAMES="$(emacsclient -e "(length (frame-list))" 2>/dev/null)"
RUNNING=$?
FRAMES=${FRAMES:-0}

# For some reason, we might end up with zombie emacs processes,
# clean them up or it will mess up the rest of the logic.
if [[ $RUNNING != 0 ]]; then
    EMACS_LOCATION="$(readlink $(which emacs) || which emacs || norswap_not_found)"
    pgrep -f "$EMACS_LOCATION" | awk '{ print $1 }' | xargs kill -9
fi

# Is emacs running with --daemon or --bg-daemon flag?
# If yes, then an additional frame is being counted compared to the real count.
pgrep -if "emacs.*daemon" > /dev/null && FRAMES=$((FRAMES - 1))
##
# Emacs is visible if there are visible frames.
VISIBLE=$([[ "$FRAMES" -gt 0 ]]; echo $?)

# Number of listed frames to be reached for a frame to be actually visible
# (--daemon incurs a fake frame).
# FRAMES=1; [[ $DAEMON == 0 ]] && FRAMES=$((FRAMES + 1))
# TMP="$(emacsclient -e "(<= $FRAMES (length (frame-list)))" 2>/dev/null)"
# Is there a visible frame?
# [[ "$TMP" == t ]]; VISIBLE=$?

# echo running: $RUNNING > /tmp/debugem
# echo visible: $VISIBLE >> /tmp/debugem
# echo frames: $FRAMES >> /tmp/debugem

# Default frame dimensions.
F='((width . 120) (height . 50))'

################################################################################
# LAUNCH EMACS

if [[ $RUNNING != 0 ]]; then
    # Remove the lock on the desktop, as it is in a user specific folder,
    # and not doing so causes the desktop not to be loaded on OSX, or to
    # have an annoying prompt on Linux.
    rm -f ~/".emacs.d/files-$(hostname)-$(whoami)/.emacs.desktop.lock"

    # The daemon is not running, start the daemon and open a frame.
    # echo 1 emacsclient $N $T -a '' -c -F "$F" "${ARGS[@]}" >> /tmp/debugem
    emacsclient $N $T -a '' -c -F "$F" "${ARGS[@]}" 2> /tmp/emacs-startup

elif [[ $VISIBLE != 0 ]]; then
    # Pre-active in case of prompt in Emacs.
    [[ "$T"=="-t" ]] || osascript -e 'activate application "Emacs"'

    # There are no visible frames, open one.
    # echo 2 emacsclient $N $T -c -F "$F" "${ARGS[@]}" >> /tmp/debugem
    emacsclient $N $T -c -F "$F" "${ARGS[@]}"
else
    # Pre-activate in case of prompt in Emacs.
    [[ "$T"=="-t" ]] || osascript -e 'activate application "Emacs"'

    # echo 3 emacsclient $N $T "${ARGS[@]}" >> /tmp/debugem
    emacsclient $N $T "${ARGS[@]}"
fi

################################################################################
