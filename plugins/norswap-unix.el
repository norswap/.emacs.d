;; Allows copying from emacs towards the X system.
(if (eq window-system 'x) (setq x-select-enable-clipboard t))
(provide 'norswap-unix)
