;;; vagrant-tramp-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "vagrant-tramp" "../../../../../../Users/norsw/.emacs.d/elpa/vagrant-tramp-20210217.704/vagrant-tramp.el"
;;;;;;  "293491be232580b06df7f312f2313af0")
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/vagrant-tramp-20210217.704/vagrant-tramp.el

(autoload 'vagrant-tramp--completions "vagrant-tramp" "\
List for vagrant tramp completion.  FILE argument is ignored.

\(fn &optional FILE)" nil nil)

(autoload 'vagrant-tramp-term "vagrant-tramp" "\
SSH into BOX-NAME using an `ansi-term'.

\(fn BOX-NAME)" t nil)

(autoload 'vagrant-tramp-add-method "vagrant-tramp" "\
Add `vagrant-tramp-method' to `tramp-methods'." nil nil)

(define-obsolete-function-alias 'vagrant-tramp-enable 'vagrant-tramp-add-method "2015-10-17")

(eval-after-load 'tramp '(progn (vagrant-tramp-add-method) (tramp-set-completion-function vagrant-tramp-method vagrant-tramp-completion-function-alist)))

;;;### (autoloads "actual autoloads are elsewhere" "vagrant-tramp"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/vagrant-tramp-20210217.704/vagrant-tramp.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/vagrant-tramp-20210217.704/vagrant-tramp.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "vagrant-tramp" '("vagrant-tramp-")))

;;;***

;;;***

;;;### (autoloads nil nil ("../../../../../../Users/norsw/.emacs.d/elpa/vagrant-tramp-20210217.704/vagrant-tramp-autoloads.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/vagrant-tramp-20210217.704/vagrant-tramp-pkg.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/vagrant-tramp-20210217.704/vagrant-tramp.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; vagrant-tramp-autoloads.el ends here
