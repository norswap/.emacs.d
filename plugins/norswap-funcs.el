;;;;; Copy, paste, cut, delete and select. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun select-word ()
  "Marks the word the cursor is on. Undefined (but harmless) if not on a word."
  (interactive)
  (if (eq (char-before) ?\ ) (forward-char))
  (backward-word) (set-mark-command nil) (forward-word))

(defun select-line ()
  "Marks the line the cursor is on."
  (interactive)
  (move-beginning-of-line nil) (set-mark-command nil) (move-end-of-line nil))

(defun select-paragraph ()
  "Marks the paragraph the cursor is on."
  (interactive)
  (backward-paragraph) (set-mark-command nil) (forward-paragraph))

(defun delete-kill-ring-top ()
  (interactive)
  (setq kill-ring (cdr kill-ring)) nil)

(defun reverse-yank-pop (arg)
  (interactive "p")
  (yank-op (- arg)))

(defun paste-below ()
  (interactive)
  (move-end-of-line nil) (newline) (yank))

;;;;; Indentation. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun unindent ()
  "Moves the begin of the current line to column at the previous
multiple of tab-width."
  (interactive)
  (back-to-indentation)
  (let* ( (cur (current-column))
          (amt (% cur tab-width)))
    (if (and (= amt 0) (/= cur 0)) (setq amt tab-width))
    (backward-delete-char-untabify amt)))

(defun augment-region-indent ()
    "Indent the region by tab-width columns."
    (interactive)
    (indent-rigidly (region-beginning) (region-end) tab-width))

(defun reduce-region-indent ()
    "Unindent the region by tab-width columns."
    (interactive)
    (setq tab-width (- tab-width))
    (augment-region-indent)
    (setq tab-width (- tab-width)))

;;;;; Buffers ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun kill-next-window-buffer ()
  "Kills the buffer in the next window."
  (interactive)
  (kill-buffer (window-buffer (next-window))))

(defun swap-buffer ()
  "Exchange the buffer in this window and the buffer in the next
window. If there is only one window, creates another one
first. Successive invokations move the buffer trough all windows
in order."
  (interactive)
  (if (one-window-p)
      (progn
        (split-window-vertically)
        (display-buffer (other-buffer) t)))
  (let* ((buffer-a (current-buffer))
         (window-b (next-window))
         (buffer-b (window-buffer window-b)))
    (set-window-buffer window-b buffer-a)
    (switch-to-buffer buffer-b)))

;; Creates buf-move-stay-<dir> functions that do like buf-move-<dir> if buf-move
;; stay is false, but don't change the selected window if it's true.
;; If true, don't change the
(defvar buf-move-stay nil)
(defun buf-move-define (dir)
  (setq lexical-binding t)
  (lexical-let
      ((base-func (intern (concat "buf-move-" (symbol-name dir))))
       (new-func  (intern (concat "buf-move-stay-" (symbol-name dir)))))
    (setf (symbol-function new-func) (lambda () (interactive)
       (if buf-move-stay
           (let ((this-window (selected-window)))
             (funcall base-func)
             (select-window this-window))
         (funcall base-func)
)))))
(mapc 'buf-move-define '(up down left right))

(defun buf-move-stay ()
  (interactive)
  (setq buf-move-stay (not buf-move-stay)))

(defun open-replace-buffer (path)
  "Replace the current buffer by another file."
  (interactive "F")
  (let ((cur (window-buffer)))
    (find-file path)
    (kill-buffer cur)))

(defun shift-and-open (path)
  "Shift the current buffer to the right then open a new file in
the current window."
  (interactive "F")
  (let ((stay buf-move-stay))
    (setq buf-move-stay t)
    (buf-move-stay-right)
    (find-file path)
    (setq buf-move-stay stay)))

(defun delete-this-buffer-and-file ()
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

;;;;; Other functions. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun zoom-unzoom ()
  "Toggles font height from 90 to 100 or vice-versa."
  (interactive)
  (if (= (face-attribute 'default :height t) 100)
      (set-face-attribute 'default nil :height 90)
    (set-face-attribute 'default nil :height 100))
    (maximize))

(defun goto-column (column)
  "Go to the specified column of the current line."
  (interactive "p")
  (forward-char (- column (current-column))))

(defun select-minibuffer ()
  "Select the minbuffer. Useful to circumvent the dreaded
\"attempted to use minibuffer while in minibuffer\"."
  (interactive)
  (select-window (minibuffer-window)))

(defun eval-print ()
  "Inserts the result of a lisp evaluation at point."
  (interactive)
  (insert (prin1-to-string (eval-minibuffer "Eval : "))))

(defun set-80-columns ()
  "Set the selected window to 80 columns."
  (interactive)
  (enlarge-window-horizontally (- 80 (window-width))))

(defun toggle-trailing-whitespace-display ()
  "Toggle highlighting of trailing whitespace (not highlithed at
point)."
  (interactive)
  (setq show-trailing-whitespace (not show-trailing-whitespace))
  (force-window-update (window-buffer))
  (redisplay t))

;;;;; Personal ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun sirius ()
    "Connects to the sirius UCL server."
    (interactive)
    (find-file "/nilaurent@sirius.info.ucl.ac.be:.sirius"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'norswap-funcs)
