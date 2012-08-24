(setq user-emacs-directory "C:/h/Dropbox/.emacs.d/")
(setq user-init-file "C:/h/Dropbox/.emacs.d/init.el")
(load user-init-file)

;; Load files in `site-start.d' directory. (Auctex)
(dolist (file (directory-files
	       (concat (file-name-directory load-file-name) "site-start.d")
	       t "\\.el\\'"))
  (load file nil t t))
