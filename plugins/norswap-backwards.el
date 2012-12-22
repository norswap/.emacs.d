;; Fixes for Old Versions of Emacs

(if (< emacs-major-version 24)
  (defun c-fill-paragraph (&optional arg)
    (interactive "*P")
    (fill-paragraph arg))
)

(provide 'norswap-backwards)
