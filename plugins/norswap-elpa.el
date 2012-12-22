;; Setup package repositories and customize packages (not keybinds).

(setq package-archives '(
    ("gnu"          . "http://elpa.gnu.org/packages/")
    ("marmalade"    . "http://marmalade-repo.org/packages/")
    ("melpa"        . "http://melpa.milkbox.net/packages/")))

(defun color-theme-norswap ()
    "Switch to my color theme."
    (interactive)
    (require 'color-theme)
    ;; Set color theme on all frames.
    (setq color-theme-is-global t)
    (color-theme-initialize)
    (color-theme-billw)
    ;; Spaces between text and window boundaries.
    (set-face-attribute 'fringe nil
        :width 'ultra-condensed :background "black")
    ;; Border between windows.
    (set-face-attribute 'vertical-border nil
        :width 'ultra-condensed :foreground "black"))

(defun window-number-setup ()
    (load "window-number")
    ;; Display the window number in the mode-line.
    ;; Use M-<num> to switch to a window.
    (window-number-meta-mode 1)
    (window-number-mode 0)
)

;; Installed packages are loaded after the init file.
;; Place commande requiring that they are loaded here.
(defun after-init-hook-func ()
    (color-theme-norswap)
    (window-number-setup))

(add-hook 'after-init-hook 'after-init-hook-func)

;; Latex mode starts in PDF mode.
(add-hook 'Tex-mode-hook (lambda ()
    (TeX-global-PDF-mode t)))

(provide 'norswap-elpa)
