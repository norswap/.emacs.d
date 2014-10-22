(defun maximize ()
  "Maximize the window."
  (interactive)
  (w32-send-sys-command 61728)
  (w32-send-sys-command 61488)
  (redisplay))

;; Make unzip work also on Windows (unzip from gnuwin32 needs to be installed
;; and its path added to %PATH%). "-qq" is for the very quiet mode.
(setq archive-zip-extract '("unzip" "-qq"))

;; Maximize the frame at startup.
(defun windows-maximize ()
  "Maximizes the current frame on Windows."
  (interactive)
  (w32-send-sys-command #xf030))
(setq term-setup-hook 'windows-maximize)
(setq window-setup-hook 'windows-maximize)

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; Opening files with their Windows associated programs from whitin dired,
;; with the F3 key.
(define-key dired-mode-map (kbd "<f3>") (lambda () (interactive)
    (w32-shell-execute 1
      (dired-replace-in-string "/" "\\" (dired-get-filename)))))

;; MS Windows clipboard is UTF-16LE
(set-clipboard-coding-system 'utf-16le-dos)

;; Batch files need windows-style newlines.
(push '("\\.bat$" . nil) file-name-buffer-file-type-alist)

;; Make printing to machine possible via postscript printing to GhostScript.
(setenv "GS_LIB" "C:/Program Files/gs/gs9.07/lib")
(setq ps-lpr-command "C:/Program Files/gs/gs9.07/bin/gswin64c.exe")
(setq ps-lpr-switches '("-q" "-dNOPAUSE" "-dBATCH" "-sDEVICE=mswinpr2"))
(setq ps-printer-name t)

;; Use putty's plink.exe for ssh connections.
(eval-after-load "tramp"
    '(setq tramp-default-method "plink")
)

;; Font
(set-face-attribute 'default nil :font "Consolas 9")

(provide 'norswap-windows)
