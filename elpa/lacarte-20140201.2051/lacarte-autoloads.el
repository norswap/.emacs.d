;;; lacarte-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (lacarte-execute-menu-command lacarte-execute-command
;;;;;;  lacarte-convert-menu-item-function lacarte) "lacarte" "../../../../Users/norswap/.emacs.d/elpa/lacarte-20140201.2051/lacarte.el"
;;;;;;  "3eb565a1160947fc85cb82409f416e54")
;;; Generated autoloads from ../../../../Users/norswap/.emacs.d/elpa/lacarte-20140201.2051/lacarte.el

(let ((loads (get 'lacarte 'custom-loads))) (if (member '"lacarte" loads) nil (put 'lacarte 'custom-loads (cons '"lacarte" loads))))

(defvar lacarte-convert-menu-item-function nil "\
*Function to call to convert a menu item.
Used by `lacarte-execute-menu-command'.  A typical use would be to
remove the `&' characters used in MS Windows menus to define keyboard
accelerators.  See `lacarte-remove-w32-keybd-accelerators'.")

(custom-autoload 'lacarte-convert-menu-item-function "lacarte" t)

(defface lacarte-shortcut '((((background dark)) (:foreground "gray70")) (t (:foreground "gray50"))) "\
*Face used to highlight key binding of menu item `*Completions*'." :group (quote Icicles-Completions-Display) :group (quote faces))

(autoload 'lacarte-execute-command "lacarte" "\
Execute a menu-bar menu command or an ordinary command.
Type a menu item or a command name.  Completion is available.
With a prefix arg, only menu items are available.
Completion is not case-sensitive.  However, if you use Icicles, then
you can use `C-A' in the minibuffer to toggle case-sensitivity.

If you use Icicles, then you can also sort the completion candidates
in different ways, using `C-,'.  With Icicles, by default menu items
are sorted before non-menu commands, and menu items are highlighted
using face `icicle-special-candidate'.

\(fn &optional NO-COMMANDS-P)" t nil)

(autoload 'lacarte-execute-menu-command "lacarte" "\
Execute a menu-bar menu command.
Type a menu item.  Completion is available.

A prefix argument controls which menus are available:

* None: current major mode, global, and minor-mode keymaps.
* Positive (including plain `C-u'): current major mode keymap.
* Zero (e.g., `C-0'): current global keymap.
* Negative (e.g., `C--'): current minor mode keymaps.

Completion is not case-sensitive.  However, if you use Icicles, then
you can use `C-A' in the minibuffer to toggle case-sensitivity.
If you use Icicles, then you can also sort the completion candidates
in different ways, using `C-,'.

\(fn MAPS)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../Users/norswap/.emacs.d/elpa/lacarte-20140201.2051/lacarte-pkg.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/lacarte-20140201.2051/lacarte.el")
;;;;;;  (21413 43251 792000 0))

;;;***

(provide 'lacarte-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; lacarte-autoloads.el ends here
