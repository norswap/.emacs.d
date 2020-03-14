# This is the macOS Apple Script used to generate an application that can both
# launch and open Emacs, while enforcing a single Emacs server.

# Called when opening (a) file(s).
on open thefiles
	set pfiles to {}
	repeat with thefile in thefiles
		set pfiles to pfiles & "\"" & POSIX path of thefile & "\" "
	end repeat
    
    # Note "sudo -u norswap --login em" failed because TMPDIR wasn't set
    # (this was very hard to debug).
    do shell script "bash --login em " & pfiles
    
    # Used to be 'tell application "Emacs" to activate"
    # But that would cause the line to be run at compile-time (?!!)    
    activate application "Emacs"
end open

# Called when open is not called.
on run {}
    do shell script "bash --login em"
    activate application "Emacs"
end run
