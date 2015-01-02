;;; auctex-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (turn-on-bib-cite bib-cite-minor-mode) "bib-cite"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/bib-cite.el"
;;;;;;  "fc46c46f400a42af007fd42ce73395be")
;;; Generated autoloads from ../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/bib-cite.el

(autoload 'bib-cite-minor-mode "bib-cite" "\
Toggle bib-cite mode.
When bib-cite mode is enabled, citations, labels and refs are highlighted
when the mouse is over them.  Clicking on these highlights with [mouse-2]
runs bib-find, and [mouse-3] runs bib-display.

\(fn ARG)" t nil)

(autoload 'turn-on-bib-cite "bib-cite" "\
Unconditionally turn on Bib Cite mode.

\(fn)" nil nil)

;;;***

;;;### (autoloads (context-mode) "context" "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/context.el"
;;;;;;  "aaede47229785ee362c712c6887cc44f")
;;; Generated autoloads from ../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/context.el

(defalias 'ConTeXt-mode 'context-mode)

(autoload 'context-mode "context" "\
Major mode in AUCTeX for editing ConTeXt files.

Special commands:
\\{ConTeXt-mode-map}

Entering `context-mode' calls the value of `text-mode-hook',
then the value of `TeX-mode-hook', and then the value
of ConTeXt-mode-hook.

\(fn)" t nil)

;;;***

;;;### (autoloads (context-en-mode) "context-en" "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/context-en.el"
;;;;;;  "5ac2595246062777c61ed4104a93cf61")
;;; Generated autoloads from ../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/context-en.el

(autoload 'context-en-mode "context-en" "\
Major mode for editing files for ConTeXt using its english interface.

Special commands:
\\{ConTeXt-mode-map}

Entering `context-mode' calls the value of `text-mode-hook',
then the value of TeX-mode-hook, and then the value
of context-mode-hook.

\(fn)" t nil)

;;;***

;;;### (autoloads (context-nl-mode) "context-nl" "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/context-nl.el"
;;;;;;  "f5ed983cd477814f04e4a63affd4f323")
;;; Generated autoloads from ../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/context-nl.el

(autoload 'context-nl-mode "context-nl" "\
Major mode for editing files for ConTeXt using its dutch interface.

Special commands:
\\{ConTeXt-mode-map}

Entering `context-mode' calls the value of `text-mode-hook',
then the value of TeX-mode-hook, and then the value
of context-mode-hook.

\(fn)" t nil)

;;;***

;;;### (autoloads (font-latex-setup) "font-latex" "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/font-latex.el"
;;;;;;  "2f06608b82005569dd347d3534c206e3")
;;; Generated autoloads from ../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/font-latex.el

(autoload 'font-latex-setup "font-latex" "\
Setup this buffer for LaTeX font-lock.  Usually called from a hook.

\(fn)" nil nil)

;;;***

;;;### (autoloads (docTeX-mode TeX-latex-mode BibTeX-auto-store)
;;;;;;  "latex" "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/latex.el"
;;;;;;  "9c28d1203d5a7208323289d2b39535ae")
;;; Generated autoloads from ../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/latex.el

(autoload 'BibTeX-auto-store "latex" "\
This function should be called from `bibtex-mode-hook'.
It will setup BibTeX to store keys in an auto file.

\(fn)" nil nil)

(add-to-list 'auto-mode-alist '("\\.drv\\'" . latex-mode))

(autoload 'TeX-latex-mode "latex" "\
Major mode in AUCTeX for editing LaTeX files.
See info under AUCTeX for full documentation.

Special commands:
\\{LaTeX-mode-map}

Entering LaTeX mode calls the value of `text-mode-hook',
then the value of `TeX-mode-hook', and then the value
of `LaTeX-mode-hook'.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.dtx\\'" . doctex-mode))

(autoload 'docTeX-mode "latex" "\
Major mode in AUCTeX for editing .dtx files derived from `LaTeX-mode'.
Runs `LaTeX-mode', sets a few variables and
runs the hooks in `docTeX-mode-hook'.

\(fn)" t nil)

(defalias 'TeX-doctex-mode 'docTeX-mode)

;;;***

;;;### (autoloads (multi-prompt-key-value multi-prompt) "multi-prompt"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/multi-prompt.el"
;;;;;;  "ec1c94ddf907b2d0fe04131a14dd9397")
;;; Generated autoloads from ../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/multi-prompt.el

(autoload 'multi-prompt "multi-prompt" "\
Completing prompt for a list of strings.  
The first argument SEPARATOR should be the string (of length 1) to
separate the elements in the list.  The second argument UNIQUE should
be non-nil, if each element must be unique.  The remaining elements
are the arguments to `completing-read'.  See that.

\(fn SEPARATOR UNIQUE PROMPT TABLE &optional MP-PREDICATE REQUIRE-MATCH INITIAL HISTORY)" nil nil)

(autoload 'multi-prompt-key-value "multi-prompt" "\
Read multiple strings, with completion and key=value support.
PROMPT is a string to prompt with, usually ending with a colon
and a space.  TABLE is an alist.  The car of each element should
be a string representing a key and the optional cdr should be a
list with strings to be used as values for the key.

See the documentation for `completing-read' for details on the
other arguments: PREDICATE, REQUIRE-MATCH, INITIAL-INPUT, HIST,
DEF, and INHERIT-INPUT-METHOD.

The return value is the string as entered in the minibuffer.

\(fn PROMPT TABLE &optional PREDICATE REQUIRE-MATCH INITIAL-INPUT HIST DEF INHERIT-INPUT-METHOD)" nil nil)

;;;***

;;;### (autoloads (ams-tex-mode TeX-plain-tex-mode) "plain-tex" "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/plain-tex.el"
;;;;;;  "f779fa6e1110cb9255a3a5adacf8911c")
;;; Generated autoloads from ../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/plain-tex.el

(autoload 'TeX-plain-tex-mode "plain-tex" "\
Major mode in AUCTeX for editing plain TeX files.
See info under AUCTeX for documentation.

Special commands:
\\{plain-TeX-mode-map}

Entering `plain-tex-mode' calls the value of `text-mode-hook',
then the value of `TeX-mode-hook', and then the value
of plain-TeX-mode-hook.

\(fn)" t nil)

(autoload 'ams-tex-mode "plain-tex" "\
Major mode in AUCTeX for editing AmS-TeX files.
See info under AUCTeX for documentation.

Special commands:
\\{AmSTeX-mode-map}

Entering AmS-tex-mode calls the value of `text-mode-hook',
then the value of `TeX-mode-hook', and then the value
of `AmS-TeX-mode-hook'.

\(fn)" t nil)

;;;***

;;;### (autoloads (preview-report-bug LaTeX-preview-setup preview-install-styles)
;;;;;;  "preview" "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/preview.el"
;;;;;;  "3e7c4464be8fe283a721d02ad8897170")
;;; Generated autoloads from ../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/preview.el

(autoload 'preview-install-styles "preview" "\
Installs the TeX style files into a permanent location.
This must be in the TeX search path.  If FORCE-OVERWRITE is greater
than 1, files will get overwritten without query, if it is less
than 1 or nil, the operation will fail.  The default of 1 for interactive
use will query.

Similarly FORCE-SAVE can be used for saving
`preview-TeX-style-dir' to record the fact that the uninstalled
files are no longer needed in the search path.

\(fn DIR &optional FORCE-OVERWRITE FORCE-SAVE)" t nil)

(autoload 'LaTeX-preview-setup "preview" "\
Hook function for embedding the preview package into AUCTeX.
This is called by `LaTeX-mode-hook' and changes AUCTeX variables
to add the preview functionality.

\(fn)" nil nil)
 (add-hook 'LaTeX-mode-hook #'LaTeX-preview-setup)

(autoload 'preview-report-bug "preview" "\
Report a bug in the preview-latex package.

\(fn)" t nil)

;;;***

;;;### (autoloads (TeX-submit-bug-report TeX-auto-generate-global
;;;;;;  TeX-auto-generate TeX-tex-mode) "tex" "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/tex.el"
;;;;;;  "f638c98c80a58baf47dcf982a997608e")
;;; Generated autoloads from ../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/tex.el

(defalias 'TeX-assoc-string (symbol-function (if (featurep 'xemacs) 'assoc 'assoc-string)))

(autoload 'TeX-tex-mode "tex" "\
Major mode in AUCTeX for editing TeX or LaTeX files.
Tries to guess whether this file is for plain TeX or LaTeX.

The algorithm is as follows:

   1) if the file is empty or `TeX-force-default-mode' is not set to nil,
      `TeX-default-mode' is chosen
   2) If \\documentstyle or \\begin{, \\section{, \\part{ or \\chapter{ is
      found, `latex-mode' is selected.
   3) Otherwise, use `plain-tex-mode'

\(fn)" t nil)

(autoload 'TeX-auto-generate "tex" "\
Generate style file for TEX and store it in AUTO.
If TEX is a directory, generate style files for all files in the directory.

\(fn TEX AUTO)" t nil)

(autoload 'TeX-auto-generate-global "tex" "\
Create global auto directory for global TeX macro definitions.

\(fn)" t nil)

(autoload 'TeX-submit-bug-report "tex" "\
Submit a bug report on AUCTeX via mail.

Don't hesitate to report any problems or inaccurate documentation.

If you don't have setup sending mail from (X)Emacs, please copy the
output buffer into your mail program, as it gives us important
information about your AUCTeX version and AUCTeX configuration.

\(fn)" t nil)

;;;***

;;;### (autoloads (LaTeX-install-toolbar TeX-install-toolbar) "tex-bar"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/tex-bar.el"
;;;;;;  "d15072908452a8022622ddba3f6537d2")
;;; Generated autoloads from ../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/tex-bar.el

(autoload 'TeX-install-toolbar "tex-bar" "\
Install toolbar buttons for TeX mode.

\(fn)" t nil)

(autoload 'LaTeX-install-toolbar "tex-bar" "\
Install toolbar buttons for LaTeX mode.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "tex-fold" "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/tex-fold.el"
;;;;;;  "48c6d153797c587ee9fadcda90acb39c")
;;; Generated autoloads from ../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/tex-fold.el
 (autoload 'TeX-fold-mode "tex-fold" "Minor mode for hiding and revealing macros and environments." t)

(defalias 'tex-fold-mode 'TeX-fold-mode)

;;;***

;;;### (autoloads (tex-font-setup) "tex-font" "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/tex-font.el"
;;;;;;  "6cb30f3aa1f7aba735901cdeb6615049")
;;; Generated autoloads from ../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/tex-font.el

(autoload 'tex-font-setup "tex-font" "\
Setup font lock support for TeX.

\(fn)" nil nil)

;;;***

;;;### (autoloads (TeX-texinfo-mode) "tex-info" "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/tex-info.el"
;;;;;;  "3c28e750ccf0f8082251cca38821dbe9")
;;; Generated autoloads from ../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/tex-info.el

(defalias 'Texinfo-mode 'texinfo-mode)

(autoload 'TeX-texinfo-mode "tex-info" "\
Major mode in AUCTeX for editing Texinfo files.

Special commands:
\\{Texinfo-mode-map}

Entering Texinfo mode calls the value of `text-mode-hook'  and then the
value of `Texinfo-mode-hook'.

\(fn)" t nil)

;;;***

;;;### (autoloads (japanese-latex-mode japanese-plain-tex-mode) "tex-jp"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/tex-jp.el"
;;;;;;  "9e0e52469eb692332f6ff454c6727798")
;;; Generated autoloads from ../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/tex-jp.el

(autoload 'japanese-plain-tex-mode "tex-jp" "\
Major mode in AUCTeX for editing Japanese plain TeX files.
Set `japanese-TeX-mode' to t, and enter `TeX-plain-tex-mode'.

\(fn)" t nil)

(autoload 'japanese-latex-mode "tex-jp" "\
Major mode in AUCTeX for editing Japanese LaTeX files.
Set `japanese-TeX-mode' to t, and enter `TeX-latex-mode'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "tex-site" "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/tex-site.el"
;;;;;;  "5648fdf3fc01cdfe543554fc13e27639")
;;; Generated autoloads from ../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/tex-site.el
 (require 'tex-site)

;;;***

;;;### (autoloads (texmathp-match-switch texmathp) "texmathp" "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/texmathp.el"
;;;;;;  "39e6000daf5c9c5ac7bb7fe6da506713")
;;; Generated autoloads from ../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/texmathp.el

(autoload 'texmathp "texmathp" "\
Determine if point is inside (La)TeX math mode.
Returns t or nil.  Additional info is placed into `texmathp-why'.
The functions assumes that you have (almost) syntactically correct (La)TeX in
the buffer.
See the variable `texmathp-tex-commands' about which commands are checked.

\(fn)" t nil)

(autoload 'texmathp-match-switch "texmathp" "\
Search backward for any of the math switches.
Limit searched to BOUND.

\(fn BOUND)" nil nil)

;;;***

;;;### (autoloads nil "toolbar-x" "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/toolbar-x.el"
;;;;;;  "b53a339031113a1cc21bde9000be3863")
;;; Generated autoloads from ../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/toolbar-x.el
 (autoload 'toolbarx-install-toolbar "toolbar-x")

;;;***

;;;### (autoloads nil nil ("../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/auctex-pkg.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/auctex.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/bib-cite.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/context-en.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/context-nl.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/context.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/font-latex.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/latex.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/multi-prompt.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/plain-tex.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/preview.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/prv-emacs.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/prv-xemacs.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/tex-bar.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/tex-buf.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/tex-fold.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/tex-font.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/tex-info.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/tex-jp.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/tex-mik.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/tex-site.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/tex-style.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/tex-wizard.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/tex.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/texmathp.el"
;;;;;;  "../../../../Users/norswap/.emacs.d/elpa/auctex-11.88/toolbar-x.el")
;;;;;;  (21633 93 436000 0))

;;;***

(provide 'auctex-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; auctex-autoloads.el ends here
