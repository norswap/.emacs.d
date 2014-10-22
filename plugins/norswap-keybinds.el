;; Custom Keybinds

(require 'norswap-funcs)

;;;;; Keymaps ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Keep as an example of how to make a prefix, but C-v is scroll-down.
;(define-prefix-command 'ctrl-v-prefix)
;(global-set-key (kbd "C-v") 'ctrl-v-prefix)

;; A minor mode to override keys in all major mode.
(defvar norswap-keys (make-keymap) "norswap-keys-minor-mode keymap")
(define-minor-mode norswap-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t "" norswap-keys)

;; Disable norswap-keys in the minibuffer.
(add-hook 'minibuffer-setup-hook (lambda () (norswap-keys-minor-mode 0)))

(defun norswap-key (key func)
  "Helper to define all-overriding custom keybinds."
  (define-key norswap-keys key func))

;;;;; UnOverride ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar info-override (make-keymap))
(define-minor-mode info-override-minor-mode "" nil "" info-override)
(define-key info-override (kbd "S-<tab>") 'Info-prev-reference)
(define-key info-override (kbd "M-n")   'clone-buffer)
(add-hook 'Info-mode-hook (lambda () (info-override-minor-mode 1)))

;;;;; Copy, Paste, Cut, Delete and Select ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(norswap-key (kbd "M-Y")     'reverse-yank-pop)
(norswap-key (kbd "C-c y")   'browse-kill-ring)
(norswap-key (kbd "C-c u")   'yank-below)
(norswap-key (kbd "C-c w")   'delete-region)
(norswap-key (kbd "C-c i")   'select-line)
(norswap-key (kbd "C-c o")   'select-paragraph)
(norswap-key (kbd "C-c p")   'select-word)

;;;;; Moving Around in the File ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Override these commands, normally are scroll-down/up-command.
(norswap-key (kbd "M-v") (lambda () (interactive) (forward-line -10)))
(norswap-key (kbd "C-v") (lambda () (interactive) (forward-line 10)))

(norswap-key (kbd "M-p") 'backward-paragraph)
(norswap-key (kbd "M-n") 'forward-paragraph)
(norswap-key (kbd "<wheel-up>") (lambda () (interactive) (scroll-down 5)))
(norswap-key (kbd "<wheel-down>") (lambda () (interactive) (scroll-up 5)))

;;;;; Switching and Moving Buffers ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Display modern buffer list.
(norswap-key (kbd "C-x C-b") 'ibuffer)

;; Open buffer in another window whitout switching to it.
(norswap-key (kbd "C-S-x b") 'iswitchb-display-buffer)

;; Shift buffer right then open in current window.
(norswap-key (kbd "C-x 8 f") 'shift-and-open)

;; Kill the buffer in the next window.
(norswap-key (kbd "C-x 4 k") 'kill-next-window-buffer)

;; Delete current buffer and current file (asks confirmation).
(norswap-key (kbd "C-c d")   'delete-file-and-buffer)
(norswap-key (kbd "C-c r")   'rename-file-and-buffer)

;; Wraps directions around for buffer displacement (elpa: buffer-move).
(setq windmove-wrap-around t)

(define-prefix-command 'C-c-h-prefix)
(norswap-key (kbd "C-c h") 'C-c-h-prefix)
(define-prefix-command 'C-c-j-prefix)
(norswap-key (kbd "C-c j") 'C-c-j-prefix)
(define-prefix-command 'C-c-k-prefix)
(norswap-key (kbd "C-c k") 'C-c-k-prefix)
(define-prefix-command 'C-c-l-prefix)
(norswap-key (kbd "C-c l") 'C-c-l-prefix)

(global-set-key (kbd "C-c hh") 'windmove-left)
(global-set-key (kbd "C-c jj") 'windmove-down)
(global-set-key (kbd "C-c kk") 'windmove-up)
(global-set-key (kbd "C-c ll") 'windmove-right)
(global-set-key (kbd "C-c hm") 'buf-move-left)
(global-set-key (kbd "C-c jm") 'buf-move-down)
(global-set-key (kbd "C-c km") 'buf-move-up)
(global-set-key (kbd "C-c lm") 'buf-move-right)
(global-set-key (kbd "C-c hs") 'buf-swap-left)
(global-set-key (kbd "C-c js") 'buf-swap-down)
(global-set-key (kbd "C-c ks") 'buf-swap-up)
(global-set-key (kbd "C-c ls") 'buf-swap-right)
(global-set-key (kbd "C-c hf") (kbd "C-c hh C-x C-f C-u C-x q"))
(global-set-key (kbd "C-c jf") (kbd "C-c jj C-x C-f C-u C-x q"))
(global-set-key (kbd "C-c kf") (kbd "C-c kk C-x C-f C-u C-x q"))
(global-set-key (kbd "C-c lf") (kbd "C-c ll C-x C-f C-u C-x q"))
(global-set-key (kbd "C-c hb") (kbd "C-c hh C-x b C-u C-x q"))
(global-set-key (kbd "C-c jb") (kbd "C-c jj C-x b C-u C-x q"))
(global-set-key (kbd "C-c kb") (kbd "C-c kk C-x b C-u C-x q"))
(global-set-key (kbd "C-c lb") (kbd "C-c ll C-x b C-u C-x q"))

;; unused: C-: / C-= / C-+ / C-/

(norswap-key (kbd "C-c ^") 'shrink-window)
(norswap-key (kbd "C-c c") 'goto-comment)
(norswap-key (kbd "C-c v") 'next-column)
(norswap-key (kbd "C-c x") 'prev-column)

;;;;; Indentation ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(norswap-key (kbd "<backtab>")   'unindent)
(norswap-key (kbd "C-x t")       'indent-relative)
(norswap-key (kbd "C-x <tab>")   'augment-region-indent)
(norswap-key (kbd "C-<S-tab>")   'reduce-region-indent)

;;;;; Other Keybinds ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Toggle auto-fill-mode (text wrapping).
(norswap-key (kbd "C-c q") 'auto-fill-mode)
(norswap-key (kbd "C-z") 'undo)
(norswap-key (kbd "C-x q") 'self-insert-command)
(norswap-key (kbd "C-c C-c") 'comment-region)
(norswap-key (kbd "C-c C-v") 'uncomment-region)
(norswap-key (kbd "C-x g") 'select-minibuffer)
(norswap-key (kbd "C-x y") 'set-80-columns)
(norswap-key (kbd "C-c t") 'toggle-trailing-whitespace-display)
(norswap-key (kbd "M-Q") 'unfill-paragraph)
(norswap-key (kbd "C-c e") 'eval-print-last-sexp)

;; If a backspace encounters a tab, it will untabify it before deleting.
(define-key global-map [remap backward-delete-char-untabify]
    'backward-delete-char)

;; A menu to quickly jump to a visible word (elpa: ace-jump-mode).
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; Global key to open a new eshell instance.
(norswap-key (kbd "C-c C-s") (kbd "C-u M-x eshell"))
;; There are more shell-map related keybinds in norswap-shell.el.

;;;;; Mode Specific ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Command to compile at TeX file;
(add-hook 'TeX-mode-hook (lambda ()
    (define-key TeX-mode-map (kbd "C-c C-n") 'TeX-command-master)))
; (define-key (current-local-map) ...) and (local-set-key ...) also work


;;;;; Unbound user functions. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; zoom-unzoom
;; goto-column

;;;;; Free keybinds. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; C-+
;; C-t (non-lisp)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'norswap-keybinds)
