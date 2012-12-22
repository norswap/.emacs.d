To install

- Run `git clone git@github.com:norswap/.emacs.d.git ~/.emacs.d`.

- Symlink `site-start.el` from your `site-lisp` directory to the `site-start.el` in
  this directory. The typical Linux command is:

    sudo ln -s ~/.emacs.d/site-start.el
        /usr/local/share/emacs/site-lisp/site-start.el

  On Windows, the `site-lisp` directory is inside the emacs install directory
  (in doubt, try `C:\Program Files\emacs`).

- [Linux] Add `.~/.emacs.d/init.sh` to your `.bashrc` (or equivalent).

- [Windows] Symlink or copy `emacs.bat` to your emacs install directory, and run
  emacs via this file.

Note: to make symlink on Windows, use [[LinkShellExtension (aka
HardLinkShellExt)|http://schinagl.priv.at/nt/hardlinkshellext/hardlinkshellext.html]].

TODO: put more stuff in the README

  - how to open files w/o extensions with emacs by default in Windows
  - how to add an emacs option in the Windows context menu
  - explain how to make windows symlinks