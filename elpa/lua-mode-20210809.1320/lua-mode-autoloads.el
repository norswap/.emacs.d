;;; lua-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads "actual autoloads are elsewhere" "init-tryout"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/lua-mode-20210809.1320/init-tryout.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/lua-mode-20210809.1320/init-tryout.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init-tryout" '("add-trace-for")))

;;;***

;;;### (autoloads nil "lua-mode" "../../../../../../Users/norsw/.emacs.d/elpa/lua-mode-20210809.1320/lua-mode.el"
;;;;;;  "f0b7c81cd23712373edddaa5c84fab6a")
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/lua-mode-20210809.1320/lua-mode.el

(autoload 'lua-mode "lua-mode" "\
Major mode for editing Lua code.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.lua\\'" . lua-mode))

(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(defalias 'run-lua #'lua-start-process)

(autoload 'lua-start-process "lua-mode" "\
Start a Lua process named NAME, running PROGRAM.
PROGRAM defaults to NAME, which defaults to `lua-default-application'.
When called interactively, switch to the process buffer.

\(fn &optional NAME PROGRAM STARTFILE &rest SWITCHES)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "lua-mode" "../../../../../../Users/norsw/.emacs.d/elpa/lua-mode-20210809.1320/lua-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/lua-mode-20210809.1320/lua-mode.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "lua-mode" '("lua-")))

;;;***

;;;***

;;;### (autoloads nil nil ("../../../../../../Users/norsw/.emacs.d/elpa/lua-mode-20210809.1320/init-tryout.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/lua-mode-20210809.1320/lua-mode-autoloads.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/lua-mode-20210809.1320/lua-mode-pkg.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/lua-mode-20210809.1320/lua-mode.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; lua-mode-autoloads.el ends here
