# Installation

- Run `git clone git@github.com:norswap/.emacs.d.git ~/.emacs.d`.

- Symlink `site-start.el` from your `site-lisp` directory to the `site-start.el` in
  this directory. The typical Linux command is:

    sudo ln -s ~/.emacs.d/site-start.el
        /usr/local/share/emacs/site-lisp/site-start.el

  On Windows, the `site-lisp` directory is inside the emacs install directory
  (in doubt, try `C:\Program Files\emacs`).

- \[Linux\] Add `.~/.emacs.d/init.sh` to your `.bashrc` (or equivalent).

- \[Windows\] Symlink or copy `emacs.bat` to your emacs install directory, and run
  emacs via this file.

Note: to make symlinks in Windows, use [LinkShellExtension][lse].

# Windows Shell Integration

- To associate files with without extensions, type this in a terminal:

      assoc .=noext
      ftype noext="PATH_TO_EMACS/emacs.bat" "%1"

  This actually set the `HKEY_CLASSES_ROOT/.` register key to "noext", and the
  `HKEY_CLASSES_ROOT/noext` key to `"PATH_TO_EMACS/emacs.bat" "%1"`.

- To associate files with unkown extensions to emacs, set the
  `HKEY_CLASSES_ROOT/Unknown/shell/emacs/command` key to
  `"PATH_TO_EMACS/emacs.bat" "%1"`. Then set the
  `HKEY_CLASSES_ROOT/Unkown/shell` key to `emacs`. Or just customize and run the
  `regedit/unknown.reg` file.

- To add an "open with emacs" item to the context menu of all files, set the
  `HKEY_CLASSES_ROOT/*/shell/open with emacs/command` to
  `"PATH_TO_EMACS/emacs.bat" "%1"`. Or just customize and run the
  `regedit/openwith.reg` file.

[lse]: http://schinagl.priv.at/nt/hardlinkshellext/hardlinkshellext.html
