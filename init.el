;;;; PACKAGE REPOSITORIES ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)

(setq package-archives '(
    ("gnu"          . "http://elpa.gnu.org/packages/")
    ;("marmalade"    . "http://marmalade-repo.org/packages/")
    ("melpa"        . "http://melpa.milkbox.net/packages/")))

(package-initialize)

;;;;; PACKAGES ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path (concat user-emacs-directory "lib"))
(require 'livedown) ;; requires npm install -g livedown
(require 'toggle-letter-case)

;;;; DISPLAY ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Don't produce a bell sound on some event (like scroll-up at the top) but
;; do some visual gimmick instead.
(setq visible-bell t)

;; Display line numbers on the left of windows.
(global-linum-mode 1)

;; Display the column number in the mode line.
(setq column-number-mode t)

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

;; Disable version control support in emacs. Things now load much faster (esp.
;; on Windows).
(setq vc-handled-backends ())

(defadvice kill-new (before kill-push-clipboard activate)
  "Before putting new kill onto the kill-ring, add the clipboard/external
   selection to the kill ring."
  (let ((have-paste
         (and interprogram-paste-function
              ;; condition-case is necessary to prevent "empty or invalid
              ;; pasteboard type" messages from preventing us to use the
              ;; kill-ring before we copy some text from outside Emacs. (Note
              ;; the message will still display!)
              (condition-case nil
                  (funcall interprogram-paste-function)
                (quit nil)))))
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
  (cl-flet ((process-list nil)) ad-do-it))

;; Disable the creation of .#filename lockfiles on some systems (such as OSX).
;; Lockfiles detect collision between multiple edits of the same file on access
;; rather than on save. Detecting on save is sufficient, and doesn't leave
;; garbage in the file system.
(setq create-lockfiles nil)

;; Files deleted in dired go to the trash bin.
(setq delete-by-moving-to-trash t)

;; Avoids recentering the screen when the point moves off-screen if the point is
;; up to 10k lines away.
(setq scroll-step 1)
(setq scroll-conservatively 10000)

(require 'undo-tree)
(global-undo-tree-mode)

;; Recenter the screen around the current search result when iterating through
;; them.
(defadvice
  isearch-repeat-forward
  (after isearch-repeat-forward-recenter activate)
  (recenter))
(defadvice
  isearch-repeat-backward
  (after isearch-repeat-backward-recenter activate)
  (recenter))

;; Search accross all whitespace types.
(setq search-whitespace-regexp "[ \t\r\n]+")

;; New buffers start in text-mode, not fundamental fill.
(setq-default major-mode 'text-mode)

;; Same for initial *scratch*.
(setq initial-major-mode 'text-mode)

;;;; COMPLETION ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Using ido and smex for minibuffer completion almost everywhere.

(ido-mode t)
(ido-everywhere t)                  ;; enhanced by package ido-ubiquitous
(ido-vertical-mode t)               ;; from package ido-vertical-mode
(ido-yes-or-no-mode t)              ;; from package ido-yes-or-no
(global-set-key (kbd "M-x") 'smex)  ;; from package smex

;; When ido cannot file a completion in the current dir, do not attempt to
;; switch dir (annoying when creating new files).
(setq ido-auto-merge-work-directories-length -1)

;; from package flx-ido
;; enables matching on words beginning (e.g. tcm for TeX-command-master)
(flx-ido-mode t)

(setq ido-vertical-define-keys 'C-n-and-C-p-only)

;; Don't switch to other visible frame when opening an already visible buffer.
;; (Not too sure about this one, keep the default for now.)
;; (setq ido-default-buffer-method 'selected-window)
;; (setq ido-default-file-method 'selected-window)

;; TODO try ivy (seems a bit better than ido)
;; ace-window (jump between window, not buffers)

;; TODO document
;; cycle with C-n / C-p
;; C-j force selection

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

;; Fonts are GUI only.

;; This font is used notably in TeX's verbatim blocks.
(set-face-attribute 'fixed-pitch nil :height 90 :family "Courier New")

;; NOTE: Ideally fonts would be set like this on macOS.
;; However, (font-family-list) is nil when this file is read on macOS.
;; Calling set-frame-font directly does not work either.
;; ---
;; (when (eq system-type 'darwin)
;;  (when (member "Monaco" (font-family-list))
;;    (set-frame-font "Monaco 14" nil t)))

(when (eq system-type 'darwin)
  (set-face-attribute 'default nil
                      :family "Monaco" :height 140 :weight 'normal))

(when (eq system-type 'windows-nt)
  (when (member "Consolas" (font-family-list))
    (set-frame-font "Consolas 12" nil t)))

;; Other cool fonts: Hack (++), Fira Code (cool ligatures, but currently
;; unsupported by emacs out of the box), DejaVu Sans Mono, Office Code Pro (bit
;; fat), Inconsolata (thin looking).

;; from http://ergoemacs.org/emacs/emacs_list_and_set_font.html
;; link includes font download link
(set-fontset-font
 t
 '(#x1f300 . #x1fad0)
 (cond
  ((member "Noto Color Emoji" (font-family-list)) "Noto Color Emoji")
  ((member "Noto Emoji" (font-family-list)) "Noto Emoji")
  ((member "Segoe UI Emoji" (font-family-list)) "Segoe UI Emoji")
  ((member "Symbola" (font-family-list)) "Symbola")
  ((member "Apple Color Emoji" (font-family-list)) "Apple Color Emoji")))

;;;; THEME ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; My color theme of choice.
(load-theme 'billw t)

;; Spaces between text and window boundaries.
(set-face-attribute 'fringe nil
    :width 'ultra-condensed :background "black")

;; Border between windows.
(set-face-attribute 'vertical-border nil
    :width 'ultra-condensed :foreground "#333333")

;; Put a space to the left of the line number.
(setq linum-format " %d")

;;;; FUNCTIONS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;; source: https://stackoverflow.com/a/25212377
(defun rename-file-and-buffer ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let* ((name (buffer-name))
        (filename (buffer-file-name))
        (basename (file-name-nondirectory filename)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " (file-name-directory filename) basename nil basename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(defun yank-pop-forward ()
  "Like yank-pop (M-y) but in the other (forward) direction."
  (interactive)
  (yank-pop -1))

(defun reset-kill-ring ()
  "Resets the yank pointer to the begin of the kill ring."
  (interactive)
  (setq kill-ring-yank-pointer kill-ring))

(defun delete-kill-ring-entry ()
  "Deletes the kill-ring entry under the yank pointer (last thing
killed or yanked) from the kill ring."
  (interactive)
  (setq kill-ring (delete (car kill-ring-yank-pointer) kill-ring)))

(defun kill-next-window-and-buffer ()
  "Kill the buffer in the next window, then delete that window."
  (interactive)
  (kill-buffer (window-buffer (next-window)))
  (delete-window (next-window)))

(defun kill-this-window-and-buffer ()
  "Kill the buffer in the this window, then delete this window."
  (interactive)
  (kill-buffer (window-buffer (selected-window)))
  (delete-window (selected-window)))

(setq-default show-trailing-whitespace t)
(make-local-variable 'handle-trailing-whitespace)
(setq-default handle-trailing-whitespace t)
(add-hook 'before-save-hook
          (lambda ()
            (if handle-trailing-whitespace
                (delete-trailing-whitespace))))

(add-hook 'minibuffer-setup-hook
          (lambda () (setq show-trailing-whitespace nil)))

(defun toggle-trailing-whitespace-handling ()
  "Toggle trailing whitespace handling mode. When 'handled',
  trailing whitespace is deleted on save."
  (interactive)
  (setq handle-trailing-whitespace (not handle-trailing-whitespace))
  (force-window-update (window-buffer))
  (redisplay t))

(defun unfill-paragraph ()
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph)))

;;;; KEYBINDS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

(norswap-key (kbd "C-x g")   'select-minibuffer)
(norswap-key (kbd "C-x y")   'set-80-columns)
(norswap-key (kbd "M-p")     'backward-paragraph)
(norswap-key (kbd "M-n")     'forward-paragraph)
(norswap-key (kbd "C-z")     'undo)
(norswap-key (kbd "C-S-z")   'undo-tree-redo)
(norswap-key (kbd "M-Q")     'unfill-paragraph)
(norswap-key (kbd "C-c t")   'toggle-trailing-whitespace-handling)
(norswap-key (kbd "C-c e")   'eval-print-last-sexp)
(norswap-key (kbd "C-c q")   'auto-fill-mode) ; toggle
(norswap-key (kbd "C-c TAB") 'indent-region)
(norswap-key (kbd "C-c SPC") 'ace-jump-mode)
(norswap-key (kbd "M-S-y")   'yank-pop-forward) ;; (osx)
(norswap-key (kbd "M-Y")     'yank-pop-forward) ;; (win)
(norswap-key (kbd "M-C-y")   'delete-kill-ring-entry)
(norswap-key (kbd "C-c C-<") 'reset-kill-ring)
(norswap-key (kbd "C-x 4 k") 'kill-next-window-and-buffer)
(norswap-key (kbd "C-x 4 j") 'kill-this-window-and-buffer)
(norswap-key (kbd "C-c C-c") 'comment-region)
(norswap-key (kbd "C-c C-v") 'uncomment-region)
(norswap-key (kbd "C-c w")   'delete-region)
(norswap-key (kbd "M-l")     'toggle-letter-case)

;; Sane mouse scrolling (that does not accelerate to oblivion).
(norswap-key (kbd "<wheel-up>") (lambda () (interactive) (scroll-down 5)))
(norswap-key (kbd "<wheel-down>") (lambda () (interactive) (scroll-up 5)))

;; Let C-z work in minibuffer and minibuffer completions.
(define-key minibuffer-local-map (kbd "C-z") 'undo)
(define-key ido-common-completion-map (kbd "C-z") 'undo)

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
(let ((dirname (concat user-emacs-directory "files-" (system-name)
                       "-" (user-real-login-name))))
  (unless (file-exists-p dirname)
    (make-directory dirname))
  (setq desktop-path `(,dirname)))


;; Save the session (open buffers) between emacs invocations.
(desktop-save-mode)

;; Autosave the desktop (don't wait untill emacs exits).
(add-hook 'auto-save-hook (lambda () (desktop-save-in-desktop-dir)))

;; Automatically save bookmarks changes.
(setq bookmark-save-flag 1)

;; All files are backed up in user-emacs-directory/backup.
(defvar backup-dir (expand-file-name (concat user-emacs-directory "backup/")))
(setq backup-directory-alist `(( ".*" . ,backup-dir)))

;; By default emacs makes a backup of a file the first time you save a file
;; after visiting it. Killing then reopening the buffer will create a new backup
;; when saving again (new file or overwrite, see below).

(setq
 backup-by-copying t    ;; presumably safer
 version-control t      ;; keep multiple versions
 delete-old-versions t  ;; rotate backups
 kept-old-versions 1    ;; keep the oldest version (e.g. pristine config)
 kept-new-versions 10   ;; keep 10 most recent versions
 vc-make-backup-files t ;; backup files under version control as well
 )

;; All files are autosaved in user-emacs-directory/autosave.
(defvar autosave-dir
  (expand-file-name (concat user-emacs-directory "autosave/")))
(setq auto-save-list-file-prefix (concat autosave-dir "/"))
(setq auto-save-file-name-transforms `((".*" ,autosave-dir t)))

;; auto save every 20 characters typed (this is the minimum)
;; (or, by default, after 30 seconds of idle time: auto-save-timeout)
(setq auto-save-interval 20)

;;;; MAJOR-MODES ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Indents in C are 4 spaces.
(setq-default c-basic-offset 4)

;; Don't re-indent upon inserting special keys (like ';', '{', ')', ...).
(setq-default c-electric-flag nil)

;; Allow using 'a' (open file in same buffer) in Dired.
(put 'dired-find-alternate-file 'disabled nil)

;; Some settings for ps-print-buffer.
(setq ps-print-header nil)
(setq ps-top-margin 72)

(setq lua-indent-level 4)
;; Indent multiline string like comments
(setq lua-indent-string-contents t)

;;;; LISP ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Jump to the definition of functions.
(define-key emacs-lisp-mode-map (kbd "C-c C-t") 'find-function)

;; Match the opening & closing parenthese with pretty colors.
(require 'highlight-parentheses)
(add-hook 'emacs-lisp-mode-hook     'highlight-parentheses-mode)
(add-hook 'lisp-mode-hook           'highlight-parentheses-mode)
(add-hook 'lisp-interaction-hook    'highlight-parentheses-mode)

;; for highlight-parentheses-mode
(set-variable 'hl-paren-colors
    '("LimeGreen" "firebrick1" "DodgerBlue1" "LightGoldenrod"))

;;;; ENCODING ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;; WINDOWS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar archive-zip-extract)
(defvar dired-mode-map)
;(defvar file-name-buffer-file-type-alist)
(when (eq system-type 'windows-nt)

  ;; Make unzip work also on Windows. unzip from gnuwin32 needs to be installed
  ;; and reachable from %PATH%. "-qq" is for the very quiet mode.
  (setq archive-zip-extract '("unzip" "-qq"))

  ;; Opening files with their Windows associated programs from whitin dired,
  ;; with the F3 key.
  (eval-after-load "dired"
    '(define-key dired-mode-map (kbd "<f3>")
       (lambda () (interactive)
	 (with-no-warnings (w32-shell-execute
	  1 (dired-replace-in-string "/" "\\" (dired-get-filename)))))))

  ;; Windows clipboard is UTF-16LE.
  (set-clipboard-coding-system 'utf-16le-dos)

  ;; Batch files need windows-style newlines.
  (push '("\\.bat$" . nil) file-coding-system-alist)

  ;; Note: This is only used when TCP is used (so only on Windows). Otherwise,
  ;; emacs uses local sockets and the variable `server-socket-dir` is used.
  ;; I could try to uniformize this, but everything works as-is, and I'm loath
  ;; to spend time trying to debug finicy startup issues.
  (setq server-auth-dir (car desktop-path)))

;;;; OSX ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (eq system-type 'darwin)

  ;; Inhibit warnings when compiling on other platforms.
  (defvar mac-command-modifier)
  (defvar mac-control-modifier)
  (defvar mac-option-modifier)
  (defvar mac-right-option-modifier)
  (defvar ns-pop-up-frames)

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
  (exec-path-from-shell-initialize)

  ;; Disable GUI dialogs, which are unresponsive on OSX.
  (setq use-dialog-box nil)

  ;; OSX glitches with visible-bell. Blink the mode line instead.
  (setq visible-bell nil)
  (setq ring-bell-function
        (lambda ()
          (invert-face 'mode-line)
          (run-with-timer 0.1 nil 'invert-face 'mode-line))))

;;;; LATEX ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-n") 'TeX-command-master)))

;; This is necessary for AucTeX to figure out it needs to run BibTeX.
(setq TeX-parse-self t) ; Enable parse on load.
(setq TeX-auto-save t)  ; Enable parse on save.

;; Also see C-c C-a (TeX-command-run-all) to get everything done.

;;;; ORGMODE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(with-eval-after-load 'org
    ;; Keep spacing around lines in outline.
    (setq org-cycle-separator-lines 1)

    ;; Indent mode by default.
    (add-hook 'org-mode-hook 'org-indent-mode)

    ;; Wrap long lines (necessary for multiline headings).
    ;; Will display nicely with org-indent-mode.
    (add-hook 'org-mode-hook 'visual-line-mode)

    ;; Disable auto-fill since we allow long lines.
    (add-hook 'org-mode-hook (lambda () (auto-fill-mode -1)))

    ;; Start showing everything in the file (no folding).
    (setq org-startup-folded 'showeverything)

    (setq org-log-state-notes-into-drawer "LOGBOOK")

    ;; Specify nested headlines as a path (headline1/headline2).
    (setq org-refile-use-outline-path 'file)

    ;; Consider all headlines of level <= as refile destinations
    (setq org-refile-targets '((nil . (:maxlevel . 4))))

    ;; Allows refile to create new nodes (/my-new-headline), must confirm.
    (setq org-refile-allow-creating-parent-nodes 'confirm)

    ;; Save all buffers after archiving (only wanted to save the archive buffer,
    ;; but seems difficult.
    (advice-add 'org-archive-subtree :after #'org-save-all-org-buffers)

    ;; C-c C-c is taken by the comment shortcut
    (define-key org-mode-map (kbd "C-c C-d") 'org-ctrl-c-ctrl-c)

    (define-key org-mode-map (kbd "C-c a") 'org-agenda)
    (define-key org-mode-map (kbd "C-c l") 'org-store-link)

    ;; TODO customize org-link-abbrev-alist
    ;; TODO customize org-directory ?
    ;; TODO https://old.reddit.com/r/emacs/comments/6zv83d/share_your_custom_orgmode_link_types/

    ;; faster than C-c C-f/b/u
    (define-key org-mode-map (kbd "C-c f") 'org-forward-heading-same-level)
    (define-key org-mode-map (kbd "C-c b") 'org-backward-heading-same-level)
    (define-key org-mode-map (kbd "C-c u") 'outline-up-heading)
)

;;;; MESSAGES ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun suppress-messages (old-fun &rest args)
  (let ((inhibit-message t))
    (apply old-fun args)))

;; Avoid "Desktop saved in ..."
(advice-add 'desktop-save-in-desktop-dir :around #'suppress-messages)

;; Avoid "Mark set"
(advice-add 'push-mark :around #'suppress-messages)

;; Avoid "Auto save...done"
(setq auto-save-no-message t)

;; Find who emits an annoying message.

(defun who-called-me? (old-fun format &rest args)
  (let ((trace nil) (n 1) (frame nil))
      (while (setf frame (backtrace-frame n))
        (setf n     (1+ n)
              trace (cons (cadr frame) trace)) )
      (apply old-fun (concat "<<%S>>\n" format) (cons trace args))))

;; (advice-add 'message :around #'who-called-me?)
;; (advice-remove 'message #'who-called-me?)

;; Inhibiting "End of buffer" / "Start of buffer", if desired:
;; https://lists.gnu.org/archive/html/help-gnu-emacs/2015-12/msg00191.html

;;;; WORKAROUNDS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun workaround-markdown-fontify-buffer-wiki-links-empty ()
  "Empty replacement for `markdown-fontify-buffer-wiki-links` due to hanging bug."
  (interactive))

(eval-after-load "markdown-mode"
  '(progn
     (fset 'markdown-fontify-buffer-wiki-links
           'workaround-markdown-fontify-buffer-wiki-links-empty)))

;;;; CUSTOM-SET-VARIABLES ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Variables set by emacs features and via the customization interface.
;; I try to only leave stuff here that has to be updated automatically. There
;; should be only one instance of these function calls accross the init files.

;; NOTE: Could move this to other file via:
;; (setq custom-file "~/.emacs-custom.el")
;; (load custom-file)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (color-theme-modern python-mode websocket web-server vagrant-tramp uuidgen undo-tree unbound smex reveal-in-osx-finder markdown-mode lua-mode lacarte ido-yes-or-no ido-vertical-mode ido-ubiquitous highlight-parentheses flymd flx-ido exec-path-from-shell cmake-mode clojure-mode buffer-move auctex ace-jump-mode))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Start the Emacs daemon, which allows opning all files in a single Emacs
;; instance.

(server-start)

;;;; MANUAL SETUP ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Fix TRAMP on Windows
; M-x byte-compile-file, then enter:
; C:/Chocolatey/lib/Emacs.24.3/tools/emacs-24.3/lisp/net/tramp-sh.el
; and restart emacs
; use no method or plink

;;;; TODO ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; - Handle window splitting so that it is appropriate.
;;   Maybe touch upon the "C-x 4 k" & "C-x 4 j" keybinds?

;; I think the best to do it would be to use the info in
;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Choosing-Window.html
;; and define my own action function override that would send buffers matching a
;; certain regex to a certain window. Multiple (regex, window) pairs would be
;; allowable and there would be a simple default action when the variable
;; corresponding to the buffers are undefined (e.g. put in bottom right buffer).

;; - A grid: divide the frame into an XxY invisible grid and allow to grow
;;   window to occupy multiple grid sections; also handle direction oriented
;;   movement in those grid in a way that feel natural. Allow moving anchor (or
;;   any corner?) of a window anywhere, and handle the re-positionning smartly
;;   (introducing empty windows as needed to fill the space.

;; - A way to group files into projects that can be closed and re-opened
;;   simultaneously.

;; - Look at Casey's .emacs, it might help.

;; - https://prelude.emacsredux.com/en/latest/usage/

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Anything that could potentially appear below the following line was added by
;; Emacs custom system. Move it somewhere else!

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
