(require 'shell)

;;;;; Key bindings. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Clear console.
(define-key shell-mode-map (kbd "C-l") 'clear-console)
(add-hook 'eshell-mode-hook (lambda ()
    (define-key eshell-mode-map (kbd "C-l") (lambda () (interactive)
        (setq inhibit-read-only t)
        (erase-buffer)
        (eshell-send-input)
        (setq inhibit-read-only nil)
))))

;; Sync shell with file system (in case of completion problems).
(define-key shell-mode-map (kbd "C-c r") 'shell-resync-dirs)

(defun clear-console ()
  "Clear the content of the shell buffer."
  (interactive)
  (mark-whole-buffer)
  (delete-region (point) (mark))
  (comint-send-input)
)

;;;;; Tweaks ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Do not fill text in shell mode.
(add-hook 'comint-mode-hook (lambda () (auto-fill-mode nil)))

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

;;;;; Closing completion buffers. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Automatically close comint completion buffers. Lifted from
;; http://snarfed.org/automatically_close_completions_in_emacs_shell_comint_mode

(defun comint-close-completions ()
  "Close the comint completions buffer.
Used in advice to various comint functions to automatically close
the completions buffer as soon as I'm done with it. Based on
Dmitriy Igrishin's patched version of comint.el."
  (if comint-dynamic-list-completions-config
      (progn
        (set-window-configuration comint-dynamic-list-completions-config)
        (setq comint-dynamic-list-completions-config nil))))

(defadvice comint-send-input (after close-completions activate)
  (comint-close-completions))

(defadvice comint-dynamic-complete-as-filename (after close-completions activate)
  (if ad-return-value (comint-close-completions)))

(defadvice comint-dynamic-simple-complete (after close-completions activate)
  (if (member ad-return-value '('sole 'shortest 'partial))
      (comint-close-completions)))

(defadvice comint-dynamic-list-completions (after close-completions activate)
    (comint-close-completions)
    (if (not unread-command-events)
        ;; comint's "Type space to flush" swallows space. put it back in.
        (setq unread-command-events (listify-key-sequence " "))))

;;;;; Windows specific. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (eq system-type 'windows-nt) (progn

    ;; Default SSH destination. TODO
    (setq explicit-plink.exe-args '("nilaurent@sirius.info.ucl.ac.be"))

    ;; Use MSYS bash.exe as default shell. Must be in %PATH%.
    (setq explicit-shell-file-name "bash.exe")

    ;; Run commands via bash.exe.
    (setq shell-file-name "bash.exe")
))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'norswap-shell)
