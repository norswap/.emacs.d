;; Allows copying from emacs towards the X system.
(if (eq window-system 'x) (setq x-select-enable-clipboard t))

;; Font
(set-face-attribute 'default nil :font "Ubuntu Mono 10")

(provide 'norswap-unix)
