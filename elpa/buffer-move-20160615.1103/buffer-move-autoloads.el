;;; buffer-move-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (buf-move buf-move-right buf-move-left buf-move-down
;;;;;;  buf-move-up) "buffer-move" "../../../../Users/norswap/.emacs.d/elpa/buffer-move-20160615.1103/buffer-move.el"
;;;;;;  "14719b35c28467d61b4a1f9bfb91cbdb")
;;; Generated autoloads from ../../../../Users/norswap/.emacs.d/elpa/buffer-move-20160615.1103/buffer-move.el

(autoload 'buf-move-up "buffer-move" "\
Swap the current buffer and the buffer above the split.
   If there is no split, ie now window above the current one, an
   error is signaled.

\(fn)" t nil)

(autoload 'buf-move-down "buffer-move" "\
Swap the current buffer and the buffer under the split.
   If there is no split, ie now window under the current one, an
   error is signaled.

\(fn)" t nil)

(autoload 'buf-move-left "buffer-move" "\
Swap the current buffer and the buffer on the left of the split.
   If there is no split, ie now window on the left of the current
   one, an error is signaled.

\(fn)" t nil)

(autoload 'buf-move-right "buffer-move" "\
Swap the current buffer and the buffer on the right of the split.
   If there is no split, ie now window on the right of the current
   one, an error is signaled.

\(fn)" t nil)

(autoload 'buf-move "buffer-move" "\
Begin moving the current buffer to different windows.

Use the arrow keys to move in the desired direction.  Pressing
any other key exits this function.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../Users/norswap/.emacs.d/elpa/buffer-move-20160615.1103/buffer-move-pkg.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/buffer-move-20160615.1103/buffer-move.el")
;;;;;;  (22568 28824 340000 0))

;;;***

(provide 'buffer-move-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; buffer-move-autoloads.el ends here
