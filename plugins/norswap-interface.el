;; This file requires:
;; uniquify, visible-mark, dired-copy-paste, browse-kill-ring

;;;;; Misc ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Don't produce a bell sound on some event (like scroll-up at the top) but
;; do some visual gimmick instead.
(setq visible-bell t)

;;;;; Visual ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; This font is used notably in TeX's verbatim blocks.
(set-face-attribute 'fixed-pitch nil :height 90 :family "Courier New")

;; Smaller font, more spacing.
(set-face-attribute 'default nil :height 90)
(setq-default line-spacing 4)

;;;;; More information. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Display line numbers on the left of windows.
(global-linum-mode 1)

;; Display the column number in the mode line.
(setq column-number-mode t)

;; Display trailing whitespace.
;; Disable with 'toggle-trailing-whitespace-display.
(setq-default show-trailing-whitespace t)

;;;;; Extended functionality. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Can use minibuffer commands while in buffer (useful with shell (C-!)).
(setq enable-recursive-minibuffers t)

;; As-you-type substring completion for buffer switching.
(iswitchb-mode 1)

;; When opening a buffer, show it in same window.
(setq iswitchb-default-method 'samewindow)

(defadvice isearch-search (after isearch-no-fail activate)
  "Search is automatically wrapped, as text is typed."
  (unless isearch-success
    (ad-disable-advice 'isearch-search 'after 'isearch-no-fail)
    (ad-activate 'isearch-search)
    (isearch-repeat (if isearch-forward 'forward))
    (ad-enable-advice 'isearch-search 'after 'isearch-no-fail)
    (ad-activate 'isearch-search)))

(defadvice kill-new (before kill-push-clipboard activate)
  "Before putting new kill onto the kill-ring, add the clipboard/external
   selection to the kill ring"
  (let ((have-paste (and interprogram-paste-function
                         (funcall interprogram-paste-function))))
    (when have-paste (push have-paste kill-ring))))

;; Automatically recompile .el files wich have already been compiled.
;; Does not do the initial compilation.
(defun auto-recompile-el-buffer ()
  (interactive)
  (when (and (eq major-mode 'emacs-lisp-mode)
             (file-exists-p (concat buffer-file-name "c")))
    (byte-compile-file buffer-file-name)))

(add-hook 'after-save-hook 'auto-recompile-el-buffer)

;; Make buffer names unique by including part of file path.
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

;; Display useful info in case of problems.
(eval-after-load "tramp"
    '(setq tramp-debug-buffer t)
)

;; Ignore case in filename completion (defaults to nil on Unix).
(setq read-file-name-completion-ignore-case t)

;; Allow copy-pasting of files in dired.
(require 'dired-copy-paste)

;; Allow browsing editing the kill ring.
(require 'browse-kill-ring)

;;;;; Mark ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Disable transient mark : the region is always active and not highlighted. It
;; can not be deactivated with C-g.
(transient-mark-mode -1)

;; No "visual" selection with shift + direction.
(setq shift-select-mode nil)

;; Give a visual clue of the mark's position.
(require 'visible-mark)
(global-visible-mark-mode)

;;;;; Text ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Wrap text at column 80 with M-q or automatically (see below).
(setq-default fill-column 80)

;; Automatically wrap text.
(setq-default auto-fill-function 'do-auto-fill)

;; Delete trailing whitespace on save.
(make-variable-buffer-local 'delete-trailing-whitespace-on-save)
(setq-default delete-trailing-whitespace-on-save t)
(add-hook 'before-save-hook
          (lambda ()
            (if delete-trailing-whitespace-on-save
                (delete-trailing-whitespace))))

;;;;; Encoding ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; If the coding system of a file cannot be determined and utf-8 is a
;; possibility, assume the file is utf-8 with unix newlines. Also sets the
;; default for new buffers and IO.
(prefer-coding-system 'utf-8-unix)

;; Coding of text output to terminal.
(set-terminal-coding-system 'undecided-unix)

;; Coding system for keyboard terminal input.
(set-keyboard-coding-system 'utf-8-unix)

;; Coding for text received trough the X window system.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;;;;; Noise ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; To shut off message buffer. It does supply useful information however, so I
;; re-enabled it.
;(setq message-log-max nil)
;(kill-buffer "*Messages*")

;; Give me a backtrace when something goes wrong.
(setq debug-on-error t)

;; Don't ask confirmation to kill a buffer that has a process.
(setq kill-buffer-query-functions
  (delq 'process-kill-buffer-query-function kill-buffer-query-functions))

;; No startup screen.
(setq inhibit-startup-screen t)

;; No initial message in scratch buffer.
(setq initial-scratch-message "")

;; Disable toolbar (big buttons wasting space).
(tool-bar-mode -1)

;; Disable scroll bars.
(set-scroll-bar-mode nil)

;; No icons to indicate truncation or continuation.
(setq-default fringe-indicator-alist nil)

;; Disable menu-bar (we don't need file->this or buffers->that, we're a one man
;; command-line commando !).
(menu-bar-mode -1)

;; Activate winner mode : use C-c left and C-c right to navigate the various
;; window setup you used, in chronological order.
(winner-mode 1)

(defun yes-or-no-p (arg)
  "An alias for y-or-n-p, because I hate having to type 'yes' or 'no'."
  (y-or-n-p arg))

(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent \"Active processes exist\" queries when you quit
Emacs, by setting process-list to nil before exiting."
  (flet ((process-list nil)) ad-do-it))

;; Disable version control support in emacs. Things now load much faster !
(setq vc-handled-backends ())

;;;;; Indentation. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Tabs are insert as spaces.
(setq-default indent-tabs-mode nil)

;; Tab character has the same width as 4 spaces.
(setq-default tab-width 4)

;; Set tab stops to multiple of 4 (for 'tab-to-tab-stop).
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
                        64 68 72 76 80 84 88 92 96 100 104 108
                        112 116 120))

;;;;; Auto-Saving ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'desktop)

;; Save the folder in a different directory for each machine.
;; Usefull if your .emacs.d is on Dropbox.
(let ((dirname (concat user-emacs-directory "files-" system-name
                       "-" (user-real-login-name))))
  (unless (file-exists-p dirname)
    (make-directory dirname))
  (setq desktop-path `(,dirname)))

;; Save the session (open buffers) between emacs invocations.
(desktop-save-mode 1)

;; Autosave the desktop (don't wait till emacs exits).
(add-hook 'auto-save-hook (lambda () (desktop-save-in-desktop-dir)))

;; Files deleted in dired go to the trash bin.
(setq delete-by-moving-to-trash t)

;; Automatically save bookmarks changes.
(setq bookmark-save-flag 1)

;; All files are backed up in user-emacs-directory/backup.
(defvar backup-dir (expand-file-name (concat user-emacs-directory "backup/")))
(setq backup-directory-alist `(( ".*" . ,backup-dir)))

;; All files are autosaved in user-emacs-directory/autosave.
(defvar autosave-dir
  (expand-file-name (concat user-emacs-directory "autosave/")))
(setq auto-save-list-file-prefix (concat autosave-dir "/"))
(setq auto-save-file-name-transforms `((".*" ,autosave-dir t)))

;; Disable the creation of .#filename lockfiles on some systems (such as OSX):
;; those detect collision between multiple edits of the same file on access
;; rather than on save. Detecting on save is sufficient, and doesn't risk
;; leaving garbage in the file system.
(setq create-lockfiles nil)

;; Sometimes auto-save files generate annoying conflicts. This is a means to
;; simply discard all auto-save data for a file.
(defun discard-this-file ()
  "Discard the auto-save file for this buffer."
  (interactive)
  (delete-file (make-auto-save-file-name)))

;; The server socket file will be automatically stored in
;; <user-emacs-directory>/server on Windows, and in a temporary location on
;; linux/mac (inspected variable 'server-socket-dir to view).

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'norswap-interface)
