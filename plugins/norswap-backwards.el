;; This file contains fixes for old version of emacs. This is useful for
;; platforms where the newest version of emacs is not conveniently available
;; (e.g. Linux package repositories).

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (< emacs-major-version 24)
  (defun c-fill-paragraph (&optional arg)
    (interactive "*P")
    (fill-paragraph arg))
) ;; major-version < 24

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'norswap-backwards)