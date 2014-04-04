;; When cmd & control are inverted in Mac OS settings:
;; ctrl -> ctrl ; cmd -> meta ; alt -> nil
(setq mac-command-modifier 'control)
(setq mac-control-modifier nil)
(setq mac-option-modifier 'meta)
(setq mac-right-option-modifier nil)

;; "Native" fullscreen. Apparently changes often.
;; (ns-toggle-fullscreen) is undefined.
(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen 'fullboth))

;; Maximize
;; Called in init.el
(defun maximize ()
  (interactive)
  (set-frame-parameter nil 'fullscreen 'maximized))

;; Split window horizontally.
(add-hook 'window-setup-hook (lambda ()
  (split-window-horizontally 90)))

;; Necessary for gpg.
(add-to-list 'exec-path "/usr/local/bin")

;; Font
(add-to-list 'default-frame-alist '(font . "Menlo Regular 11"))
;; The below won't work with --daemon (or in console).
;;(set-face-attribute 'default nil :font "Menlo Regular 11")

;; When dragging a file onto emacs, don't open a new window.
(setq ns-pop-up-frames nil)

(provide 'norswap-osx)
