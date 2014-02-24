;; When cmd & control are inverted in Mac OS settings:
;; ctrl -> ctrl ; cmd -> meta ; alt -> nil
(setq mac-command-modifier 'control)
(setq mac-control-modifier 'meta)
(setq mac-option-modifier nil)

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
(set-face-attribute 'default nil :font "Menlo-Regular 10")

(provide 'norswap-osx)
