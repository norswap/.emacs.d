(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(fill-prefix "") ;; Fixes some M-q issues I think.
 '(ps-print-header nil)
 '(ps-top-margin 72))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(font-lock-function-name-face ((t nil)))
 '(font-lock-preprocessor-face ((t nil)))
 '(font-lock-string-face ((t nil)))
 '(font-lock-variable-name-face ((t nil)))
)
;; Use 'a' in dired (open in same buffer).
(put 'dired-find-alternate-file 'disabled nil)
(put 'erase-buffer 'disabled nil)
