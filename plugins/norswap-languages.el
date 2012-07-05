;; This file requires:
;; highlight-parentheses

;;;;; All languages. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Fontify (color) only comments, strings, preprocessor directives and functions
;; names in some languages. I disabled all of those but comments via the text
;; interface. See the (set-custom-faces) section of the automatically generated
;; part of init.el.
(setq font-lock-maximum-decoration 1)

;;;;; Lisp ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-key emacs-lisp-mode-map (kbd "C-t") 'find-function)

;; Parentheses highlight. I changed colors to
;; '("LimeGreen" "firebrick1" "DodgerBlue1" "LightGoldenrod")
(autoload 'highlight-parentheses-mode "highlight-parentheses.el")
(add-hook 'emacs-lisp-mode-hook 'highlight-parentheses-mode)
(add-hook 'lisp-mode-hook 'highlight-parentheses-mode)
(add-hook 'lisp-interaction-hook 'highlight-parentheses-mode)

;;;;; C-like languages. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Tab size.
(setq-default c-basic-offset 4)

;; Disable electric (automatic indentation on some key presses) indentation.
(setq-default c-electric-flag nil)

;;;;; ASM ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; For GAS comments.
(setq asm-comment-char ?\#)

;;;;; Python ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Restore C-c C-c to the comment functon and set an useful default for the
;; compile command.
(add-hook 'python-mode-hook '(lambda ()
    (set (make-local-variable 'compile-command)
        (concat "python " (buffer-name)))
    (define-key python-mode-map (kbd "C-c C-c") 'comment-region)))

;;;;; CMake ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                ("\\.cmake\\'" . cmake-mode))
              auto-mode-alist))

;;;;; OZ ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (boundp '*OZHOME*) (progn
  (add-to-list 'load-path (concat *OZHOME* "/share/elisp"))
  (add-to-list 'load-path (concat *OZHOME* "/share/elisp"))
  (add-to-list 'auto-mode-alist '("\\.oz\\'" . oz-mode))
  (add-to-list 'auto-mode-alist '("\\.ozg\\'" . oz-gump-mode))
  (autoload 'run-oz "oz" "" t)
  (autoload 'oz-mode "oz" "" t)
  (autoload 'oz-gump-mode "oz" "" t)
  (autoload 'oz-new-buffer "oz" "" t)
  (add-hook 'oz-mode-hook
         	  '(lambda ()
               (setq oz-auto-indent nil)
               (define-key oz-mode-map (kbd "<tab>") 'indent)
               (define-key oz-mode-map (kbd "M-p") 'backward-paragraph)
               (define-key oz-mode-map (kbd "M-n") 'forward-paragraph)))
))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'norswap-languages)
