;;; auctex-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "bib-cite" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/bib-cite.el"
;;;;;;  "8d2a94c0ff713fd3fe34b764e1de61a6")
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/bib-cite.el

(autoload 'bib-cite-minor-mode "bib-cite" "\
Toggle bib-cite mode.
When bib-cite mode is enabled, citations, labels and refs are highlighted
when the mouse is over them.  Clicking on these highlights with [mouse-2]
runs `bib-find', and [mouse-3] runs `bib-display'.

\(fn ARG)" t nil)

(autoload 'turn-on-bib-cite "bib-cite" "\
Unconditionally turn on Bib Cite mode." nil nil)

;;;### (autoloads "actual autoloads are elsewhere" "bib-cite" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/bib-cite.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/bib-cite.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "bib-cite" '("LaTeX-" "bib-" "create-alist-from-list" "member-cis" "psg-" "search-directory-tree")))

;;;***

;;;***

;;;### (autoloads nil "context" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/context.el"
;;;;;;  "998ab9bef53f11e91ceb16b5415ce1b4")
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/context.el

(defalias 'ConTeXt-mode #'context-mode)

(autoload 'context-mode "context" "\
Major mode in AUCTeX for editing ConTeXt files.

Special commands:
\\{ConTeXt-mode-map}

Entering `context-mode' calls the value of `text-mode-hook',
then the value of `TeX-mode-hook', and then the value
of `ConTeXt-mode-hook'." t nil)

;;;### (autoloads "actual autoloads are elsewhere" "context" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/context.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/context.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "context" '("ConTeXt-" "TeX-ConTeXt-sentinel" "context-guess-current-interface")))

;;;***

;;;***

;;;### (autoloads nil "context-en" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/context-en.el"
;;;;;;  "dd5c0d09e57605937929dc64b012c176")
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/context-en.el

(autoload 'context-en-mode "context-en" "\
Major mode for editing files for ConTeXt using its english interface.

Special commands:
\\{ConTeXt-mode-map}

Entering `context-mode' calls the value of `text-mode-hook',
then the value of `TeX-mode-hook', and then the value
of `ConTeXt-mode-hook'." t nil)

;;;### (autoloads "actual autoloads are elsewhere" "context-en" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/context-en.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/context-en.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "context-en" '("ConTeXt-")))

;;;***

;;;***

;;;### (autoloads nil "context-nl" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/context-nl.el"
;;;;;;  "e4c8c4ec5c74b749c30397627365e234")
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/context-nl.el

(autoload 'context-nl-mode "context-nl" "\
Major mode for editing files for ConTeXt using its dutch interface.

Special commands:
\\{ConTeXt-mode-map}

Entering `context-mode' calls the value of `text-mode-hook',
then the value of `TeX-mode-hook', and then the value
of `ConTeXt-mode-hook'." t nil)

;;;### (autoloads "actual autoloads are elsewhere" "context-nl" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/context-nl.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/context-nl.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "context-nl" '("ConTeXt-")))

;;;***

;;;***

;;;### (autoloads nil "font-latex" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/font-latex.el"
;;;;;;  "efb9f7db391d9f2692127d729bf728f6")
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/font-latex.el

(autoload 'font-latex-setup "font-latex" "\
Setup this buffer for LaTeX font-lock.  Usually called from a hook." nil nil)

;;;### (autoloads "actual autoloads are elsewhere" "font-latex" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/font-latex.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/font-latex.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "font-latex" '("font-latex-")))

;;;***

;;;***

;;;### (autoloads nil "latex" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/latex.el"
;;;;;;  "0e80ac4fa9785b7fa4cd9e949826f2a9")
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/latex.el

(autoload 'BibTeX-auto-store "latex" "\
This function should be called from `bibtex-mode-hook'.
It will setup BibTeX to store keys in an auto file." nil nil)

(add-to-list 'auto-mode-alist '("\\.drv\\'" . latex-mode) t)

(add-to-list 'auto-mode-alist '("\\.hva\\'" . latex-mode))

(autoload 'TeX-latex-mode "latex" "\
Major mode in AUCTeX for editing LaTeX files.
See info under AUCTeX for full documentation.

Special commands:
\\{LaTeX-mode-map}

Entering LaTeX mode calls the value of `text-mode-hook',
then the value of `TeX-mode-hook', and then the value
of `LaTeX-mode-hook'." t nil)

(add-to-list 'auto-mode-alist '("\\.dtx\\'" . doctex-mode))

(autoload 'docTeX-mode "latex" "\
Major mode in AUCTeX for editing .dtx files derived from `LaTeX-mode'.
Runs `LaTeX-mode', sets a few variables and
runs the hooks in `docTeX-mode-hook'.

\(fn)" t nil)

(defalias 'TeX-doctex-mode #'docTeX-mode)

;;;### (autoloads "actual autoloads are elsewhere" "latex" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/latex.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/latex.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "latex" '("Bib" "LaTeX-" "TeX-" "docTeX-" "latex-math-mode")))

;;;***

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "latex-flymake"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/latex-flymake.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/latex-flymake.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "latex-flymake" '("LaTeX-")))

;;;***

;;;### (autoloads nil "multi-prompt" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/multi-prompt.el"
;;;;;;  "7354a4f118056be41d9d0d4c734081b8")
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/multi-prompt.el

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

;;;### (autoloads "actual autoloads are elsewhere" "multi-prompt"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/multi-prompt.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/multi-prompt.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "multi-prompt" '("multi-prompt-")))

;;;***

;;;***

;;;### (autoloads nil "plain-tex" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/plain-tex.el"
;;;;;;  "c3446a34ac1112a320a771000b9652c6")
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/plain-tex.el

(autoload 'TeX-plain-tex-mode "plain-tex" "\
Major mode in AUCTeX for editing plain TeX files.
See info under AUCTeX for documentation.

Special commands:
\\{plain-TeX-mode-map}

Entering `plain-tex-mode' calls the value of `text-mode-hook',
then the value of `TeX-mode-hook', and then the value
of `plain-TeX-mode-hook'." t nil)

(autoload 'ams-tex-mode "plain-tex" "\
Major mode in AUCTeX for editing AmS-TeX files.
See info under AUCTeX for documentation.

Special commands:
\\{AmSTeX-mode-map}

Entering `ams-tex-mode' calls the value of `text-mode-hook',
then the value of `TeX-mode-hook', and then the value
of `AmS-TeX-mode-hook'." t nil)

;;;### (autoloads "actual autoloads are elsewhere" "plain-tex" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/plain-tex.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/plain-tex.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "plain-tex" '("AmS" "plain-TeX-")))

;;;***

;;;***

;;;### (autoloads nil "preview" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/preview.el"
;;;;;;  "adbf4ed20b9aba94e88d71810662232d")
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/preview.el

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
to add the preview functionality." nil nil)

(autoload 'preview-report-bug "preview" "\
Report a bug in the preview-latex package." t nil)

;;;### (autoloads "actual autoloads are elsewhere" "preview" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/preview.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/preview.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "preview" '("TeX-" "desktop-buffer-preview" "preview-")))

;;;***

;;;***

;;;### (autoloads nil "tex" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex.el"
;;;;;;  "50f230c75009c8e3648b9b5f7a25ca05")
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex.el

(autoload 'TeX-tex-mode "tex" "\
Major mode in AUCTeX for editing TeX or LaTeX files.
Tries to guess whether this file is for plain TeX or LaTeX.

The algorithm is as follows:

   1) if the file is empty or `TeX-force-default-mode' is not set to nil,
      `TeX-default-mode' is chosen
   2) If \\documentstyle or \\begin{, \\section{, \\part{ or \\chapter{ is
      found, `latex-mode' is selected.
   3) Otherwise, use `plain-tex-mode'" t nil)

(autoload 'TeX-auto-generate "tex" "\
Generate style file for TEX and store it in AUTO.
If TEX is a directory, generate style files for all files in the directory.

\(fn TEX AUTO)" t nil)

(autoload 'TeX-auto-generate-global "tex" "\
Create global auto directory for global TeX macro definitions." t nil)

(autoload 'TeX-submit-bug-report "tex" "\
Submit a bug report on AUCTeX via mail.

Don't hesitate to report any problems or inaccurate documentation.

If you don't have setup sending mail from Emacs, please copy the
output buffer into your mail program, as it gives us important
information about your AUCTeX version and AUCTeX configuration." t nil)

;;;### (autoloads "actual autoloads are elsewhere" "tex" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tex" '("Bib" "ConTeXt-" "LaTeX-" "TeX-" "VirTeX-common-initialization" "docTeX-default-extension" "plain-TeX-auto-regexp-list" "tex-")))

;;;***

;;;***

;;;### (autoloads nil "tex-bar" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-bar.el"
;;;;;;  "7c39ea30f37d76fd1631fe7179016c46")
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-bar.el

(autoload 'TeX-install-toolbar "tex-bar" "\
Install toolbar buttons for TeX mode." t nil)

(autoload 'LaTeX-install-toolbar "tex-bar" "\
Install toolbar buttons for LaTeX mode." t nil)

;;;### (autoloads "actual autoloads are elsewhere" "tex-bar" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-bar.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-bar.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tex-bar" '("TeX-bar-")))

;;;***

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "tex-buf" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-buf.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-buf.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tex-buf" '("LaTeX-" "TeX-")))

;;;***

;;;### (autoloads nil "tex-fold" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-fold.el"
;;;;;;  "ba71d93901b4bae13c3f2096756d35be")
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-fold.el

(autoload 'TeX-fold-mode "tex-fold" "\
Minor mode for hiding and revealing macros and environments.

Called interactively, with no prefix argument, toggle the mode.
With universal prefix ARG (or if ARG is nil) turn mode on.
With zero or negative ARG turn mode off.

\(fn &optional ARG)" t nil)

(defalias 'tex-fold-mode #'TeX-fold-mode)

;;;### (autoloads "actual autoloads are elsewhere" "tex-fold" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-fold.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-fold.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tex-fold" '("TeX-fold-")))

;;;***

;;;***

;;;### (autoloads nil "tex-font" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-font.el"
;;;;;;  "180c6b403f43cb30a17ca7c76ba5bf90")
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-font.el

(autoload 'tex-font-setup "tex-font" "\
Setup font lock support for TeX." nil nil)

;;;### (autoloads "actual autoloads are elsewhere" "tex-font" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-font.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-font.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tex-font" '("tex-")))

;;;***

;;;***

;;;### (autoloads nil "tex-info" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-info.el"
;;;;;;  "39fec563903035523aae550f52368234")
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-info.el

(defalias 'Texinfo-mode #'texinfo-mode)

(autoload 'TeX-texinfo-mode "tex-info" "\
Major mode in AUCTeX for editing Texinfo files.

Special commands:
\\{Texinfo-mode-map}

Entering Texinfo mode calls the value of `text-mode-hook' and then the
value of `Texinfo-mode-hook'." t nil)

;;;### (autoloads "actual autoloads are elsewhere" "tex-info" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-info.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-info.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tex-info" '("Texinfo-" "texinfo-environment-regexp")))

;;;***

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "tex-ispell" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-ispell.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-ispell.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tex-ispell" '("TeX-ispell-")))

;;;***

;;;### (autoloads nil "tex-jp" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-jp.el"
;;;;;;  "1d16dec8c938b486e14f80a1353264a2")
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-jp.el

(autoload 'japanese-plain-tex-mode "tex-jp" "\
Major mode in AUCTeX for editing Japanese plain TeX files.
Set `japanese-TeX-mode' to t, and enter `TeX-plain-tex-mode'." t nil)

(autoload 'japanese-latex-mode "tex-jp" "\
Major mode in AUCTeX for editing Japanese LaTeX files.
Set `japanese-TeX-mode' to t, and enter `TeX-latex-mode'." t nil)

;;;### (autoloads "actual autoloads are elsewhere" "tex-jp" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-jp.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-jp.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tex-jp" '("TeX-" "japanese-")))

;;;***

;;;***

;;;### (autoloads nil "tex-site" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-site.el"
;;;;;;  "7a630534a10588078de7e6c2c075a3f0")
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-site.el
 (require 'tex-site)

;;;### (autoloads "actual autoloads are elsewhere" "tex-site" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-site.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-site.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tex-site" '("AUCTeX-" "TeX-" "preview-TeX-style-dir")))

;;;***

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "tex-style" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-style.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-style.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tex-style" '("LaTeX-")))

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "tex-wizard" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-wizard.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-wizard.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tex-wizard" '("TeX-wizard")))

;;;***

;;;### (autoloads nil "texmathp" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/texmathp.el"
;;;;;;  "3140443b72d435044723bd8362c3f7cf")
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/texmathp.el

(autoload 'texmathp "texmathp" "\
Determine if point is inside (La)TeX math mode.
Returns t or nil.  Additional info is placed into `texmathp-why'.
The functions assumes that you have (almost) syntactically correct (La)TeX in
the buffer.
See the variable `texmathp-tex-commands' about which commands are checked." t nil)

(autoload 'texmathp-match-switch "texmathp" "\
Search backward for any of the math switches.
Limit searched to BOUND.

\(fn BOUND)" nil nil)

;;;### (autoloads "actual autoloads are elsewhere" "texmathp" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/texmathp.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/texmathp.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "texmathp" '("texmathp-")))

;;;***

;;;***

;;;### (autoloads nil "toolbar-x" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/toolbar-x.el"
;;;;;;  "2c143ab7b2dc5ee134f8fc72d5776487")
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/toolbar-x.el
 (autoload 'toolbarx-install-toolbar "toolbar-x")

;;;### (autoloads "actual autoloads are elsewhere" "toolbar-x" "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/toolbar-x.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/toolbar-x.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "toolbar-x" '("toolbarx-")))

;;;***

;;;***

;;;### (autoloads nil nil ("../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/auctex-autoloads.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/auctex-pkg.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/auctex.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/bib-cite.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/context-en.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/context-nl.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/context.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/font-latex.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/latex-flymake.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/latex.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/multi-prompt.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/plain-tex.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/preview.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-bar.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-buf.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-fold.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-font.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-info.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-ispell.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-jp.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-mik.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-site.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-style.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex-wizard.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/tex.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/texmathp.el"
;;;;;;  "../../../../../../Users/norsw/.emacs.d/elpa/auctex-13.0.15/toolbar-x.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; auctex-autoloads.el ends here
