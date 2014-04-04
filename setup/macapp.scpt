# This is the Mac OSX Apple Script used to generate an application that can both
# launch and open Emacs, while enforcing a single Emacs server.

# Called when opening (a) file(s).
on open thefiles
	set pfiles to {}
	repeat with thefile in thefiles
		set pfiles to pfiles & "\"" & POSIX path of thefile & "\" "
	end repeat
	tell application "Terminal"
		do shell script "emm " & pfiles
	end tell
    tell application "Emacs" to activate
end open

# Called when open is not called.
on run {}
    do shell script "emm"
	tell application "Emacs" to activate
end run
