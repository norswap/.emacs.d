(require 'shell)

;;;;; Key bindings. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Override norwap-keys for some keys.
(defvar shell-override (make-keymap))
(define-minor-mode shell-override-minor-mode "" nil "" shell-override)

(define-key shell-override (kbd "C-l")      'clear-console)
(define-key shell-override (kbd "C-c C-c")  'interrupt-shell-process)
(define-key shell-override (kbd "M-p")      'comint-previous-input)
(define-key shell-override (kbd "M-n")      'comint-next-input)

;; Sync shell with file system (in case of completion problems).
(define-key shell-override (kbd "C-c r")    'shell-resync-dirs)

(defun shell-mode-hook-function () (shell-override-minor-mode 1))
(add-hook 'shell-mode-hook  'shell-mode-hook-function)
(add-hook 'eshell-mode-hook 'shell-mode-hook-function)

;; There are currently a few issues here.
;;
;; - shell-resync-dirs does not work with msys bash because of the path format
;;   starting with "/c/". This should not be an issue as path completion works
;;   as long as absolute path used when cd'ing are started with "C:/" rather
;;   than "/c/".
;;
;; - with bash, comint-interrupt-subjob won't kill some processes, but the
;;   stronger comint-kill-subjob will kill the shell (note that for analogous
;;   eshell cases, replace (eshell-interrupt-process) with (kill-process nil
;;   comint-ptyp), taken from the source for comint-kill-subjob, does the trick)

(defun clear-console ()
  "Clear the content of the shell buffer."
  (interactive)
  (erase-buffer)
  (if (eq major-mode 'shell-mode)
    (command-execute 'comint-send-input)
    (command-execute 'eshell-send-input)))

(defun interrupt-shell-process ()
  "Interrupts a shell process according to shell type (regular or eshell)."
  (interactive)
  (if (eq major-mode 'shell-mode)
    (comint-interrupt-subjob)
    (kill-process nil comint-ptyp)))

;;;;; Tweaks ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Put eshell files in this directory.
(setq eshell-directory-name (concat user-emacs-directory "eshell"))

;; (defadvice shell-resync-dirs (around inhibit-resync-output activate)
;;     "Avoid reams of output in minibuffer on shell-resync-dir command."
;;     (let ((standard-output (lambda (in) )))
;;         ad-do-it nil))

;; In $HOME, put in ".bashrc" (or equivalent):
;; export PS1='\e[33m\w\n\e[32m$\e[00m '

;;;;; Custom shell. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq nshell-default-dir "c:/h/")
(setq nshell-counter 0)

(defun nshell ()
    "Creates a shell, renames it to shell-x, switch to
    nshell-default-dir, then sync it with the file system (for
    completion)."

    (interactive)
    (shell)
    (setq nshell-counter (1+ nshell-counter))
    (rename-buffer (concat "shell-" (number-to-string (1- nshell-counter))))
    (shell-resync-dirs)
    (comint-send-string (get-buffer-process (current-buffer))
                        (concat "cd " nshell-default-dir))
    (comint-send-input)
    (shell-resync-dirs)
    (clear-console)
)

;;;;; Windows specific. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (eq system-type 'windows-nt) (progn

    ;; Default SSH destination. TODO
    (setq explicit-plink.exe-args '("nilaurent@sirius.info.ucl.ac.be"))

    ;; Run commands via MSYS bash.exe, must be in %PATH%.
    (setq shell-file-name "bash.exe")
))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'norswap-shell)
