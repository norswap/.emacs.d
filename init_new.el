
;;;; PACKAGE REPOSITORIES ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)

(setq package-archives '(
    ("gnu"          . "http://elpa.gnu.org/packages/")
    ("marmalade"    . "http://marmalade-repo.org/packages/")
    ("melpa"        . "http://melpa.milkbox.net/packages/")))

(package-initialize)

;;;; GUI CUSTOMIZATIONS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; TODO(norswap): pull most of these customizations into main config files

;; Load the settings that were set through the Emacs GUI.
;; i.e., "custom-set variables"
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)

;;;; OSX ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (eq system-type 'darwin)

  ;; I configured OSX to invert the "command" and "contro"l key.
  ;; But I want to physical control key to act like "control" in Emacs.
  ;;
  ;; KEY:     the physical key
  ;; MAP:     what it is mapped to in OSX
  ;; EMACS:   what it is mapped to in Emacs
                                         ; KEY     | MAP     | EMACS
  (setq mac-command-modifier 'control)   ; control | command | control
  (setq mac-control-modifier nil)        ; command | control | not used
  (setq mac-option-modifier 'meta)       ; alt     | alt     | meta
  (setq mac-right-option-modifier nil)   ; r-alt   | r-alt   | not used

  ;; When dragging a file onto emacs, don't open a new window.
  (setq ns-pop-up-frames nil)

  ;; Sets $MANPATH, $PATH and exec-path from the shell.
  ;; TODO(norswap): necessary?
  (exec-path-from-shell-initialize)

  ;; Disable GUI dialogs, which are unresponsive on OSX.
  (setq use-dialog-box nil))

;;;; DISPLAY ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Don't produce a bell sound on some event (like scroll-up at the top) but
;; do some visual gimmick instead.
(setq visible-bell t)

;; Display line numbers on the left of windows.
(global-linum-mode 1)

;; Display the column number in the mode line.
(setq column-number-mode t)

;; Highlight the trailing whitespace, except at point.
;; Disable with 'toggle-trailing-whitespace-display.
(setq-default show-trailing-whitespace t)

;; As-you-type substring completion for buffer switching.
(iswitchb-mode 1)

;; Make buffer names unique by including part of file path.
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

;; Disable the menu bar, the toolbar (bar with big button), the startup screen
;; (buffer) and initial message in the scratch buffer.
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")

;;;; BEHAVIOUR ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO(norswap): this fails if the buffer is empty or contains invalid data
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

;; Ignore case in filename completion.
(setq read-file-name-completion-ignore-case t)

;; Don't ask confirmation to kill a buffer that has a process.
(setq kill-buffer-query-functions
  (delq 'process-kill-buffer-query-function kill-buffer-query-functions))

(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent \"Active processes exist\" queries when you quit
Emacs, by setting process-list to nil before exiting."
  (flet ((process-list nil)) ad-do-it))

;; Disable the creation of .#filename lockfiles on some systems (such as OSX).
;; Lockfiles detect collision between multiple edits of the same file on access
;; rather than on save. Detecting on save is sufficient, and doesn't leave
;; garbage in the file system.
(setq create-lockfiles nil)

;; Files deleted in dired go to the trash bin.
(setq delete-by-moving-to-trash t)

;;;; TEXT ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Wrap text at column 80 with M-q or automatically (see below).
(setq-default fill-column 80)

;; Automatically wrap text.
(setq-default auto-fill-function 'do-auto-fill)

;; A sentence ends with a dot, then a *single* space.
(setq sentence-end-double-space nil)

;; Tabs are inserted as spaces.
(setq-default indent-tabs-mode nil)

;; Tab character has the same width as 4 spaces.
(setq-default tab-width 4)

;; Set tab stops to multiple of 4 (for 'tab-to-tab-stop).
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
                        64 68 72 76 80 84 88 92 96 100 104 108
                        112 116 120))

;;;; FONTS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; This font is used notably in TeX's verbatim blocks.
(set-face-attribute 'fixed-pitch nil :height 90 :family "Courier New")

(when (eq system-type 'darwin)
  ;; Works both in a dedicated window and in the console.
  (add-to-list 'default-frame-alist '(font . "Menlo Regular 11")))

;;(set-frame-font "Menlo Regular 11" nil t)

;;;; THEME ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'color-theme)
(setq color-theme-is-global t)  ; Set color theme on all frames.
(color-theme-initialize)
(color-theme-billw)             ; My color theme of choice.

;; Spaces between text and window boundaries.
(set-face-attribute 'fringe nil
    :width 'ultra-condensed :background "black")

;; Border between windows.
(set-face-attribute 'vertical-border nil
    :width 'ultra-condensed :foreground "#333333")

;; Put a space to the left of the line number.
(setq linum-format " %d")

;;;; FUNCTIONS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun toggle-trailing-whitespace-display ()
  "Toggle highlighting of trailing whitespace for the current buffer."
  (interactive)
  (setq show-trailing-whitespace (not show-trailing-whitespace))
  (force-window-update (window-buffer))
  (redisplay t))

(defun set-80-columns ()
  "Set the selected window to 80 columns."
  (interactive)
  (enlarge-window-horizontally (- 80 (window-width))))

(defun select-minibuffer ()
  "Select the minbuffer. Useful to circumvent the dreaded
\"attempted to use minibuffer while in minibuffer\"."
  (interactive)
  (select-window (minibuffer-window)))

;; When booting Emacs, you'll sometimes be told a file has unsaved auto-save
;; data. If you want to inhibit the message, you can discard the data with this
;; function.
(defun discard-autosave-data ()
  "Discard the auto-save file for this buffer."
  (interactive)
  (delete-file (make-auto-save-file-name)))

(defun delete-file-and-buffer ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))

;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

;;;; KEYBINDS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO(norswap): transition all to C-c commands

;; How to define a new prefix.
;;(define-prefix-command 'C-v-prefix)
;;(global-set-key (kbd "C-v") 'C-v-prefix)
;;(define-prefix-command 'C-c-h-prefix)
;;(norswap-key (kbd "C-c h") 'C-c-h-prefix)

(defvar norswap-keys (make-keymap) "norswap-keys-minor-mode keymap")
(define-minor-mode norswap-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t "" norswap-keys)

;; Disable norswap-keys in the minibuffer.
(add-hook 'minibuffer-setup-hook (lambda () (norswap-keys-minor-mode 0)))

(defun norswap-key (key func)
  "Helper to define all-overriding custom keybinds."
  (define-key norswap-keys key func))

(norswap-key (kbd "C-x g")  'select-minibuffer)
(norswap-key (kbd "C-x y")  'set-80-columns)
(norswap-key (kbd "M-p")    'backward-paragraph)
(norswap-key (kbd "M-n")    'forward-paragraph)
(norswap-key (kbd "C-z")    'undo)
(norswap-key (kbd "M-Q")    'unfill-paragraph)
(norswap-key (kbd "C-c t")  'toggle-trailing-whitespace-display)
(norswap-key (kbd "C-c e")  'eval-print-last-sexp)
(norswap-key (kbd "C-c q")  'auto-fill-mode) ; toggle

(norswap-key (kbd "C-c C-c")    'comment-region)
(norswap-key (kbd "C-c C-v")    'uncomment-region)

;; TODO(norswap): eliminate
(norswap-key (kbd "C-c w")   'delete-region)

;;;; ENCODING ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;; AUTO-SAVING ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'desktop)

;; Save the session (open buffers) in a different directory for each machine.
;; Useful if your .emacs.d is on Dropbox.
(let ((dirname (concat user-emacs-directory "files-" system-name
                       "-" (user-real-login-name))))
  (unless (file-exists-p dirname)
    (make-directory dirname))
  (setq desktop-path `(,dirname)))

;; Save the session (open buffers) between emacs invocations.
(desktop-save-mode 1)

;; Autosave the desktop (don't wait untill emacs exits).
(add-hook 'auto-save-hook (lambda () (desktop-save-in-desktop-dir)))

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

;; The server socket file will be automatically stored in
;; <user-emacs-directory>/server on Windows, and in a temporary location on
;; linux/mac (inspected variable 'server-socket-dir to view).

;;;; MAJOR-MODES ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Indents in C are 4 spaces.
(setq-default c-basic-offset 4)

(require 'highlight-parentheses)
(add-hook 'emacs-lisp-mode-hook     'highlight-parentheses-mode)
(add-hook 'lisp-mode-hook           'highlight-parentheses-mode)
(add-hook 'lisp-interaction-hook    'highlight-parentheses-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Start the Emacs daemon, which allows opning all files in a single Emacs
;; instance.
(server-start)
