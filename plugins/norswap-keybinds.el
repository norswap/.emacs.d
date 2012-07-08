;; This file requires:
;; norswap-funcs, buffer-move, ace-jump-mode
(require 'norswap-funcs)

;;;;; Keymaps ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Necessary to be able to use C-v as a prefix.
(define-prefix-command 'ctrl-v-prefix)
(global-set-key (kbd "C-v") 'ctrl-v-prefix)

;;;;; Copy, paste, cut, delete and select. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; C-k                          'kill-line          cut to end of line
;; C-w                          'kill-region        cut
;; C-y                          'yank               paste
;; M-y                          'yank-pop           replace paste by older paste
(global-set-key (kbd "M-S-y")   'reverse-yank-pop); replace paste by newer paste
(global-set-key (kbd "C-c y")   'paste-below);      insert a newline then paste
(global-set-key (kbd "C-j")     'kill-ring-save);   copy
(global-set-key (kbd "M-w")     'delete-region)
(global-set-key (kbd "C-c s")   'select-line)
(global-set-key (kbd "C-c d")   'select-paragraph)
(global-set-key (kbd "C-c f")   'select-word)

;;;;; Moving around in the file. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-,") (lambda () (interactive) (next-line 10)))
(global-set-key (kbd "C-;") (lambda () (interactive) (previous-line 10)))
(global-set-key (kbd "C-?") 'scroll-down)   ; scrolls towards top
(global-set-key (kbd "C-.") 'scroll-up)     ; scrolls towards bottom
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "<wheel-up>") (lambda () (interactive) (scroll-down 5)))
(global-set-key (kbd "<wheel-down>") (lambda () (interactive) (scroll-up 5)))

;;;;; Switching and moving buffers. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Open buffer in current window.
;; C-x b    'iswitchb-buffer

;; Open buffer in another window whitout switching to it.
(global-set-key (kbd "C-S-x b") 'iswitchb-display-buffer)

;; Open and replace current buffer.
(global-set-key (kbd "C-x 6 f") 'open-replace-buffer)

;; Shift buffer right then open in current window.
(global-set-key (kbd "C-x 8 f") 'shift-and-open)

;; Kill the buffer in the next window.
(global-set-key (kbd "C-x 4 k") 'kill-next-window-buffer)

;; Exchange the buffer with the one on the right (wraps over).
(global-set-key (kbd "C-x x")   'swap-buffer)

;; Delete current buffer and current file (asks confirmation).
(global-set-key (kbd "C-c k")   'delete-this-buffer-and-file)

(require 'buffer-move)
;; Wraps directions around for buffer displacement.
(setq windmove-wrap-around t)
(global-set-key (kbd "C-:") 'buf-move-stay-left)
(global-set-key (kbd "C-=") 'buf-move-stay-right)
(global-set-key (kbd "C-+") 'buf-move-stay-down)
(global-set-key (kbd "C-/") 'buf-move-stay-up)
(global-set-key (kbd "C-c m") 'buf-move-stay)

;;;;; Indentation. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; <tab>                            'indent-for-tab-command
;; M-i                              'tab-to-tab-stop
;; C-q <tab>                        (insert literal <tab>)
(global-set-key (kbd "<backtab>")   'unindent)
(global-set-key (kbd "C-x t")       'indent-relative)
(global-set-key (kbd "C-x <tab>")   'augment-region-indent)
(global-set-key (kbd "C-<S-tab>")   'reduce-region-indent)

;;;;; Other keybinds. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Toggle auto-fill-mode (text wrapping).
(global-set-key (kbd "C-c q") 'auto-fill-mode)

(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-x q") 'self-insert-command)
(global-set-key (kbd "C-l") 'compile)
(global-set-key (kbd "C-c C-c") 'comment-region)
(global-set-key (kbd "C-c C-v") 'uncomment-region)
(global-set-key (kbd "C-x p") 'eval-print)
(global-set-key (kbd "C-x g") 'select-minibuffer)
(global-set-key (kbd "C-x y") 'set-80-columns)
(global-set-key (kbd "C-c i") 'toggle-trailing-whitespace-display)

;; If a backspace encounters a tab, it will untabify it before deleting.
(define-key global-map [remap backward-delete-char-untabify]
    'backward-delete-char)

;; A menu to quickly jump to a visible word.
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;;;;; Unbound user functions. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; zoom-unzoom
;; goto-column

;;;;; Free keybinds. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; C-+ ;; C-t (non-lisp)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'norswap-keybinds)
