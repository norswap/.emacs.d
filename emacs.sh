#!/bin/sh

# You may need to change the value of the -name parameter, depending on you unix
# distribution (this works on ubuntu).
xprop -name emacs@`hostname` >/dev/null 2>/dev/null
if [ "$?" = "1" ]; then
    emacsclient -c -n -a "" "$@"
else
    emacsclient -n -a "" "$@"
fi
