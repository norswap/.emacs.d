; ------------------------------------------------------------------------------
; NORSWAP'S EMACS CONFIG
; ------------------------------------------------------------------------------

;; Common-Lisp-like features for Emacs Lisp.
(require 'cl)

;; TODO(norswap): pull most of these customizations into main config files

;; Load the settings that were set through the Emacs GUI.
;; i.e., "custom-set variables"
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)

;; Make `require` look into the `plugins` directory.
(add-to-list 'load-path (concat user-emacs-directory "plugins"))

(require 'norswap-funcs)
(require 'norswap-keybinds)
(require 'norswap-interface)
(require 'norswap-shell)
(require 'norswap-languages)
(require 'norswap-backwards)
(require 'norswap-elpa)
(cond ((eq system-type 'windows-nt) (require 'norswap-windows))
      ((eq system-type 'darwin) (require 'norswap-osx))
      (t (require 'norswap-unix)))

;; Starts the server (allows to open all files with a single instance of emacs).
;; The first line is only useful for Windows, as Linux uses local sockets, which
;; are not kept in a user directory but in /tmp/emacs<num>/.
(setq server-auth-dir (car desktop-path))
(server-start)
