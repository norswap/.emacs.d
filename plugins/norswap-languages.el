
;;;;; All languages. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Fontify (color) only comments, strings, preprocessor directives and functions
;; names in some languages. I disabled all of those but comments via the text
;; interface. See the (set-custom-faces) section of the automatically generated
;; part of init.el.
(setq font-lock-maximum-decoration 1)

;;;;; Lisp ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-key emacs-lisp-mode-map (kbd "C-t") 'find-function)

;; elpa: highlight-parentheses
(add-hook 'emacs-lisp-mode-hook     'highlight-parentheses-mode)
(add-hook 'lisp-mode-hook           'highlight-parentheses-mode)
(add-hook 'lisp-interaction-hook    'highlight-parentheses-mode)

(set-variable 'hl-paren-colors
    '("LimeGreen" "firebrick1" "DodgerBlue1" "LightGoldenrod"))

;;;;; C-like languages. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Tab size.
(setq-default c-basic-offset 4)

;; Disable electric (automatic indentation on some key presses) indentation.
(setq-default c-electric-flag nil)

;;;;; ASM ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; For GAS comments.
(setq asm-comment-char ?\#)

;;;;; SQL ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Use '\' as an escape character.
(add-hook 'sql-mode-hook
          (lambda ()
	    (modify-syntax-entry ?\\ "\\" sql-mode-syntax-table)))

;;;;; Python ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Restore C-c C-c to the comment functon and set an useful default for the
;; compile command.
(add-hook 'python-mode-hook '(lambda ()
    (set (make-local-variable 'compile-command)
        (concat "python " (buffer-name)))
    (define-key python-mode-map (kbd "C-c C-c") 'comment-region)))

;;;;; CMake ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; elpa: cmake-modeo
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                ("\\.cmake\\'" . cmake-mode))
              auto-mode-alist))

;;;;; Ruby ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Do not insert an emacs (en)coding comment upon saving.
(add-hook 'ruby-mode-hook '(lambda ()
   (setq ruby-insert-encoding-magic-comment nil)))

;; Open rakefiles in ruby-mode.
(setq auto-mode-alist  (cons '("Rakefile$" . ruby-mode) auto-mode-alist))

;;;;; OZ ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (boundp '*OZHOME*) (progn
  (add-to-list 'load-path (concat *OZHOME* "/share/mozart/elisp"))
  (add-to-list 'load-path (concat *OZHOME* "/share/mozart/elisp"))
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

;;;;; JSON ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun json-format ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "python -m json.tool" (buffer-name) t)
))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'norswap-languages)
