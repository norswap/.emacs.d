; ==============================================================================
; === NORSWAP'S EMACS CONFIG ===================================================
; ==============================================================================
; This file resides in the directory ".emacs.d". This file is executed after
; "site-start.el". If you want to move .emacs.d to another path than
; "~/.emacs.d", you can modify your "site-start.el" file to include, for
; instance:
;
; (setq user-emacs-directory "C:/h/Dropbox/.emacs.d/")
; (setq user-init-file "C:/h/Dropbox/.emacs.d/init.el")
; (load user-init-file)
;
; The two variables are emacs API variables. They don't control any behaviour
; per se (e.g. ~/.emacs.d will still be created and ~/.emacs OR
; ~/.emacs.d/init.el is still loaded if it exists), but they are taken into
; account by some code, including my own config. My config will ensure that all
; config/data files are stored in "user-emacs-directory" and not in the default
; location.
;
; Note that if you use the default directory, you should *not* load the init
; file in "site-start.el", lest it be loaded twice. If you can't modify
; "site-start.el", you can put the above code in the .emacs file instead.
;
; If you wish to use an emacs daemon on unix, you can add this line to your
; .profile (or equivalent): ". <path_to_.emacs.d>/init.sh", and edit the file to
; point to the .emacs.d/emacs.sh file. Now using the "emacs" command will
; automatically run the emacs daemon if it isn't launched, open a new frame if
; there isn't one visible, and then open your file in an existing frame.
;
; If you wish to use an emacs daemon on windows, you can copy the emacs.bat file
; in your emacs install directory (e.g. "C:\Program Files\emacs"), modify it and
; add the directory to your path. You can then use the script to open a file
; with emacs. If a frame is already open, it will open the file in this frame,
; or it will create a new frame to open the file.
;
; Additionally, you may want to install auctex, follow the instruction for your
; platform. Ideally do it before installing anything else as it may overwrite
; files (notables site-start.el).
; ==============================================================================

;; Common-Lisp-like features.
(require 'cl)

;; Customize system.
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)

(add-to-list 'load-path (concat user-emacs-directory "plugins"))
(require 'norswap-funcs)
(require 'norswap-keybinds)
(require 'norswap-interface)
(require 'norswap-shell)
(require 'norswap-languages)
(if (eq system-type 'windows-nt)
    (require 'norswap-windows)
    (require 'norswap-unix))
