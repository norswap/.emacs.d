(defvar *OZHOME* "C:/h/ip/mozart")

(defun maximize ()
  "Maximize the window."
  (interactive)
  (w32-send-sys-command 61728)
  (w32-send-sys-command 61488)
  (redisplay))

;; Make unzip work also on Windows (unzip from gnuwin32 needs to be installed
;; and its path added to %PATH%). "-qq" is for the very quiet mode.
(setq archive-zip-extract '("unzip" "-qq"))

;; Maximize the frame and split into two windows.
(add-hook 'window-setup-hook (lambda ()
  (maximize)
  (split-window-horizontally 90)))

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
(setenv "GS_LIB" "C:/h/p/gs/lib")
(setq ps-lpr-command "C:/h/p/gs/bin/gswin32c.exe")
(setq ps-lpr-switches '("-q" "-dNOPAUSE" "-dBATCH" "-sDEVICE=mswinpr2"))
(setq ps-printer-name t)

;; Use putty's plink.exe for ssh connections.
(eval-after-load "tramp"
    '(setq tramp-default-method "plink")
)

(provide 'norswap-windows)
