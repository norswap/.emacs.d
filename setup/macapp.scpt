# This is the Mac OSX Apple Script used to generate an application that can both
# launch and open Emacs, while enforcing a single Emacs server.

global emacsclient
global emacs

on init()
	set emacs to "/usr/local/Cellar/emacs/24.3/Emacs.app/Contents/MacOS/Emacs"
	set emacsclient to "/usr/local/Cellar/emacs/24.3/bin/emacsclient"
	set yfile to "~/.emacs.d/setup/yfile.txt"
	open_emacs()
end init

# Starts the daemon and open a frame, if required.
on open_emacs()
	tell application "Terminal"
		try
			# we look for <= 2 because Emacs --daemon seems to always have an entry in visibile-frame-list even if there isn't
			set frameVisible to do shell script emacsclient & " -e '(<= 2 (length (visible-frame-list)))'"
			if frameVisible is not "t" then
				# there is a not a visible frame open one (-c)
				do shell script emacsclient & " -c -n"
			end if
		on error
			# daemon is not running, start the daemon and open a frame
			do shell script emacsclient & "-a \"\" -c -n"
		end try
	end tell
end open_emacs

# Called when opening (a) file(s).
on open thefiles
	init()
	set pfiles to {}
	repeat with thefile in thefiles
		set pfiles to pfiles & "\"" & POSIX path of thefile & "\" "
	end repeat
	tell application "Terminal"
		do shell script emacsclient & " -n " & pfiles
	end tell
end open

# Called when open is not called.
on run {}
	init()
	# even if no new frames are created or daemon started, focus emacs
	tell application "Emacs" to activate
end run
