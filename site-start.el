;; site-start.el
;; (windows: <emacs_install_dir>/site-lisp/site-start.el)
;;
;; This file loads before the (usually user-specific) init-file; hence it can be
;; used to change the location used to look for the init file.
;;
;; I personnally don't use this on Unix, because I'm satisfied with having the
;; emacs files in "~/.emacs.d" (I use a symlink).

(setq user-emacs-directory "C:/h/Dropbox/.emacs.d/")
(setq user-init-file "C:/h/Dropbox/.emacs.d/init.el")
(load user-init-file)
