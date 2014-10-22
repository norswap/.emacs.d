# This is the Mac OSX Apple Script used to generate an application that can both
# launch and open Emacs, while enforcing a single Emacs server.

# IMPORTANT: You should always launch Emacs using this app, not the app linked
# to Emacs Dock icon. Doing so will result in unwanted results such as opening
# new files via Finder or console to a new frame.

# Called when opening (a) file(s).
on open thefiles
	set pfiles to {}
	repeat with thefile in thefiles
		set pfiles to pfiles & "\"" & POSIX path of thefile & "\" "
	end repeat
    do shell script "emm " & pfiles
    tell application "Emacs" to activate
end open

# Called when open is not called.
on run {}
    do shell script "emm"
	tell application "Emacs" to activate
end run
