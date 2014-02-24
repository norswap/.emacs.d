# Installation

- Run `git clone git@github.com:norswap/.emacs.d.git ~/.emacs.d`.

- Symlink `site-start.el` from your `site-lisp` directory to the `site-start.el`
  in this directory. The typical Linux command is:

    sudo ln -s ~/.emacs.d/site-start.el
        /usr/local/share/emacs/site-lisp/site-start.el

  On Windows, the `site-lisp` directory is inside the emacs install directory
  (in doubt, try `C:\Program Files\emacs`).

- \[Linux\] Add `.~/.emacs.d/init.sh` to your `.bashrc` (or equivalent).

- \[Windows\] Customize the variables at the top of `emacs.bat` and
  `emacs-wait.bat` with the location of your emacs installation and the location
  of this repository. Then add those files to your path and run emacs using
  them.

My emacs launch scripts will setup an emacs server the first time they are
used. Subsequent uses of the command will open a buffer in the existing emacs
window. `emacs.bat` and `em.sh` are the regular versions for Windows and Linux,
while `emacs-wait.bat` and `emw.sh` are the waiting version: they wait until the
opened buffer is closed to return from the script. The waiting versions are
useful to edit git commit messages, for instance.

`emm.sh` is a non-functional half-assed attempt to enable the same functionality
on Mac OSX, with a few notes jotted down.

Note: to make symlinks in Windows, use [LinkShellExtension][lse].

# Windows Shell Integration

- To use the registry tweaks described next, you'll need to copy or symlink
  `emacs.bat` to `%WINDIR%`. The registry apparently does not use `%PATH%` for
  path resolution, but at least uses `%WINDIR`.

- Merging the file `registry/noext.reg` with the registry associates files with
  without extensions to emacs. It is equivalent to typing the following commands
  in a terminal:

      assoc .=noext
      ftype noext=emacs "%1"

- Merging the file `registry/unknown.reg` with the registry associates files
  with unkown extensions to emacs.

- Merging the file `registry/openwith.reg` with the registry add an "open with
  emacs" item to the context menu of all files.

[lse]: http://schinagl.priv.at/nt/hardlinkshellext/hardlinkshellext.html

# Troubleshooting

If you get an error looking like `The directory ~/.emacs.d/server is unsafe`,
try taking ownership of that directory (setting yourself as the directory owner
in the directory's properties - google it).