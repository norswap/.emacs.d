;; This file requires:
;; norswap-funcs, buffer-move, ace-jump-mode
(require 'norswap-funcs)

;;;;; Keymaps ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Necessary to be able to use C-v as a prefix.
(define-prefix-command 'ctrl-v-prefix)
(global-set-key (kbd "C-v") 'ctrl-v-prefix)

;; A minor mode to override keys in all major mode.
(defvar norswap-keys (make-keymap) "norswap-keys-minor-mode keymap")
(define-minor-mode norswap-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " nswp-keys" norswap-keys)
;; Disable in the minibuffer.
(add-hook 'minibuffer-setup-hook (lambda () (norswap-keys-minor-mode 0)))

(defun norswap-key (key func)
  (define-key norswap-keys key func))

;;;;; Copy, paste, cut, delete and select. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; C-k                          'kill-line          cut to end of line
;; C-w                          'kill-region        cut
;; C-y                          'yank               paste
;; M-y                          'yank-pop           replace paste by older paste
(norswap-key (kbd "M-S-y")   'reverse-yank-pop); replace paste by newer paste
(norswap-key (kbd "C-c y")   'paste-below);      insert a newline then paste
(norswap-key (kbd "C-j")     'kill-ring-save);   copy
(norswap-key (kbd "M-w")     'delete-region)
(norswap-key (kbd "C-c s")   'select-line)
(norswap-key (kbd "C-c d")   'select-paragraph)
(norswap-key (kbd "C-c f")   'select-word)

;;;;; Moving around in the file. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(norswap-key (kbd "C-,") (lambda () (interactive) (next-line 10)))
(norswap-key (kbd "C-;") (lambda () (interactive) (previous-line 10)))
(norswap-key (kbd "C-?") 'scroll-down)   ; scrolls towards top
(norswap-key (kbd "C-.") 'scroll-up)     ; scrolls towards bottom
(norswap-key (kbd "M-p") 'backward-paragraph)
(norswap-key (kbd "M-n") 'forward-paragraph)
(norswap-key (kbd "<wheel-up>") (lambda () (interactive) (scroll-down 5)))
(norswap-key (kbd "<wheel-down>") (lambda () (interactive) (scroll-up 5)))

;;;;; Switching and moving buffers. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Open buffer in current window.
;; C-x b    'iswitchb-buffer

;; Open buffer in another window whitout switching to it.
(norswap-key (kbd "C-S-x b") 'iswitchb-display-buffer)

;; Open and replace current buffer.
(norswap-key (kbd "C-x 6 f") 'open-replace-buffer)

;; Shift buffer right then open in current window.
(norswap-key (kbd "C-x 8 f") 'shift-and-open)

;; Kill the buffer in the next window.
(norswap-key (kbd "C-x 4 k") 'kill-next-window-buffer)

;; Exchange the buffer with the one on the right (wraps over).
(norswap-key (kbd "C-x x")   'swap-buffer)

;; Delete current buffer and current file (asks confirmation).
(norswap-key (kbd "C-c k")   'delete-this-buffer-and-file)

(require 'buffer-move)
;; Wraps directions around for buffer displacement.
(setq windmove-wrap-around t)
(norswap-key (kbd "C-:") 'buf-move-stay-left)
(norswap-key (kbd "C-=") 'buf-move-stay-right)
(norswap-key (kbd "C-+") 'buf-move-stay-down)
(norswap-key (kbd "C-/") 'buf-move-stay-up)
(norswap-key (kbd "C-c m") 'buf-move-stay)

;;;;; Indentation. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; <tab>                            'indent-for-tab-command
;; M-i                              'tab-to-tab-stop
;; C-q <tab>                        (insert literal <tab>)
(norswap-key (kbd "<backtab>")   'unindent)
(norswap-key (kbd "C-x t")       'indent-relative)
(norswap-key (kbd "C-x <tab>")   'augment-region-indent)
(norswap-key (kbd "C-<S-tab>")   'reduce-region-indent)

;;;;; Other keybinds. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Toggle auto-fill-mode (text wrapping).
(norswap-key (kbd "C-c q") 'auto-fill-mode)
(norswap-key (kbd "C-l") 'compile)
(norswap-key (kbd "C-z") 'undo)
(norswap-key (kbd "C-x q") 'self-insert-command)
(norswap-key (kbd "C-c C-c") 'comment-region)
(norswap-key (kbd "C-c C-v") 'uncomment-region)
(norswap-key (kbd "C-x p") 'eval-print)
(norswap-key (kbd "C-x g") 'select-minibuffer)
(norswap-key (kbd "C-x y") 'set-80-columns)
(norswap-key (kbd "C-c i") 'toggle-trailing-whitespace-display)

;; If a backspace encounters a tab, it will untabify it before deleting.
(define-key global-map [remap backward-delete-char-untabify]
    'backward-delete-char)

;; A menu to quickly jump to a visible word.
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; Global key to open a new eshell instance.
(norswap-key (kbd "C-c C-s") (kbd "C-u M-x eshell"))
;; There are more shell-map related keybinds in norswap-shell.el.

;;;;; Unbound user functions. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; zoom-unzoom
;; goto-column

;;;;; Free keybinds. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; C-+ ;; C-t (non-lisp)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'norswap-keybinds)
