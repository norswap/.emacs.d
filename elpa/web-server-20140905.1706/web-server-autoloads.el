;;; web-server-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (ws-start) "web-server" "../../../../Users/norswap/.emacs.d/elpa/web-server-20140905.1706/web-server.el"
;;;;;;  "e907132bc8c79e38252c5410d6c381d7")
;;; Generated autoloads from ../../../../Users/norswap/.emacs.d/elpa/web-server-20140905.1706/web-server.el

(autoload 'ws-start "web-server" "\
Start a server using HANDLERS and return the server object.

HANDLERS may be a single function (which is then called on every
request) or a list of conses of the form (MATCHER . FUNCTION),
where the FUNCTION associated with the first successful MATCHER
is called.  Handler functions are called with two arguments, the
process and the request object.

A MATCHER may be either a function (in which case it is called on
the request object) or a cons cell of the form (KEYWORD . STRING)
in which case STRING is matched against the value of the header
specified by KEYWORD.

Any supplied NETWORK-ARGS are assumed to be keyword arguments for
`make-network-process' to which they are passed directly.

For example, the following starts a simple hello-world server on
port 8080.

  (ws-start
   (lambda (request)
     (with-slots (process headers) request
       (process-send-string process
        \"HTTP/1.1 200 OK\\r\\nContent-Type: text/plain\\r\\n\\r\\nhello world\")))
   8080)

Equivalently, the following starts an identical server using a
function MATCH and the `ws-response-header' convenience
function.

  (ws-start
   '(((lambda (_) t) .
      (lambda (proc request)
        (ws-response-header proc 200 '(\"Content-type\" . \"text/plain\"))
        (process-send-string proc \"hello world\")
        t)))
   8080)

\(fn HANDLERS PORT &optional LOG-BUFFER &rest NETWORK-ARGS)" nil nil)

;;;***

;;;### (autoloads nil nil ("../../../../Users/norswap/.emacs.d/elpa/web-server-20140905.1706/web-server-pkg.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/web-server-20140905.1706/web-server-status-codes.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/web-server-20140905.1706/web-server.el")
;;;;;;  (22647 26700 168000 0))

;;;***

(provide 'web-server-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; web-server-autoloads.el ends here
