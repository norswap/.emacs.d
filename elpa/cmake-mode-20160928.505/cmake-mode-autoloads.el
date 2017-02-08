;;; cmake-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (cmake-help cmake-help-property cmake-help-variable
;;;;;;  cmake-help-module cmake-help-command cmake-help-list-commands
;;;;;;  cmake-command-run cmake-mode) "cmake-mode" "../../../../Users/norswap/.emacs.d/elpa/cmake-mode-20160928.505/cmake-mode.el"
;;;;;;  "17c49c4823418cfb06b50c6951dce28b")
;;; Generated autoloads from ../../../../Users/norswap/.emacs.d/elpa/cmake-mode-20160928.505/cmake-mode.el

(autoload 'cmake-mode "cmake-mode" "\
Major mode for editing CMake source files.

\(fn)" t nil)

(autoload 'cmake-command-run "cmake-mode" "\
Runs the command cmake with the arguments specified.  The
optional argument topic will be appended to the argument list.

\(fn TYPE &optional TOPIC BUFFER)" t nil)

(autoload 'cmake-help-list-commands "cmake-mode" "\
Prints out a list of the cmake commands.

\(fn)" t nil)

(autoload 'cmake-help-command "cmake-mode" "\
Prints out the help message for the command the cursor is on.

\(fn)" t nil)

(autoload 'cmake-help-module "cmake-mode" "\
Prints out the help message for the module the cursor is on.

\(fn)" t nil)

(autoload 'cmake-help-variable "cmake-mode" "\
Prints out the help message for the variable the cursor is on.

\(fn)" t nil)

(autoload 'cmake-help-property "cmake-mode" "\
Prints out the help message for the property the cursor is on.

\(fn)" t nil)

(autoload 'cmake-help "cmake-mode" "\
Queries for any of the four available help topics and prints out the approriate page.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("CMakeLists\\.txt\\'" . cmake-mode))

(add-to-list 'auto-mode-alist '("\\.cmake\\'" . cmake-mode))

;;;***

;;;### (autoloads nil nil ("../../../../Users/norswap/.emacs.d/elpa/cmake-mode-20160928.505/cmake-mode-pkg.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/cmake-mode-20160928.505/cmake-mode.el")
;;;;;;  (22568 28824 24000 0))

;;;***

(provide 'cmake-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; cmake-mode-autoloads.el ends here
