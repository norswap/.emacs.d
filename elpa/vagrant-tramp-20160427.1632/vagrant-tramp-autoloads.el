;;; vagrant-tramp-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (vagrant-tramp-add-method vagrant-tramp-term vagrant-tramp--completions)
;;;;;;  "vagrant-tramp" "../../../../Users/norswap/.emacs.d/elpa/vagrant-tramp-20160427.1632/vagrant-tramp.el"
;;;;;;  "852a6a9fbcc273a246999fdcd9485351")
;;; Generated autoloads from ../../../../Users/norswap/.emacs.d/elpa/vagrant-tramp-20160427.1632/vagrant-tramp.el

(autoload 'vagrant-tramp--completions "vagrant-tramp" "\
List for vagrant tramp completion.  FILE argument is ignored.

\(fn &optional FILE)" nil nil)

(autoload 'vagrant-tramp-term "vagrant-tramp" "\
SSH into BOX-NAME using an `ansi-term'.

\(fn BOX-NAME)" t nil)

(autoload 'vagrant-tramp-add-method "vagrant-tramp" "\
Add `vagrant-tramp-method' to `tramp-methods'.

\(fn)" nil nil)

(define-obsolete-function-alias 'vagrant-tramp-enable 'vagrant-tramp-add-method)

(eval-after-load 'tramp '(progn (vagrant-tramp-add-method) (tramp-set-completion-function vagrant-tramp-method vagrant-tramp-completion-function-alist)))

;;;***

;;;### (autoloads nil nil ("../../../../Users/norswap/.emacs.d/elpa/vagrant-tramp-20160427.1632/vagrant-tramp-pkg.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/vagrant-tramp-20160427.1632/vagrant-tramp.el")
;;;;;;  (22568 28817 584000 0))

;;;***

(provide 'vagrant-tramp-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; vagrant-tramp-autoloads.el ends here
