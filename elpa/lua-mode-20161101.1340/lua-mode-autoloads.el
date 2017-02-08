;;; lua-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (lua-start-process lua-mode) "lua-mode" "../../../../Users/norswap/.emacs.d/elpa/lua-mode-20161101.1340/lua-mode.el"
;;;;;;  "960fe44293c879b9e9548a2521c2d23f")
;;; Generated autoloads from ../../../../Users/norswap/.emacs.d/elpa/lua-mode-20161101.1340/lua-mode.el

(autoload 'lua-mode "lua-mode" "\
Major mode for editing Lua code.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.lua\\'" . lua-mode))

(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(defalias 'run-lua #'lua-start-process)

(autoload 'lua-start-process "lua-mode" "\
Start a lua process named NAME, running PROGRAM.
PROGRAM defaults to NAME, which defaults to `lua-default-application'.
When called interactively, switch to the process buffer.

\(fn &optional NAME PROGRAM STARTFILE &rest SWITCHES)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../Users/norswap/.emacs.d/elpa/lua-mode-20161101.1340/init-tryout.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/lua-mode-20161101.1340/lua-mode-pkg.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/lua-mode-20161101.1340/lua-mode.el")
;;;;;;  (22568 28822 362000 0))

;;;***

(provide 'lua-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; lua-mode-autoloads.el ends here
