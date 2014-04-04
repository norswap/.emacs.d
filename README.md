Note: everything below is a little bit disorganized. I'll do something about
that, eventually. But note there is an easy setup script for OSX, and that the
scripts `emm.sh` and `emmw.sh`, which were made for OSX should work on Linux
(but this has not yet been tested), where they should replace `em.sh` and
`emw.sh`.

# Installation

- Run `git clone git@github.com:norswap/.emacs.d.git EMACS_PARENT/.emacs.d`,
  replacing EMACS_PARENT by the directory where you want to put repository.

- Optionally, customize and symlink `site-start.el` from your `site-lisp`
  directory to the `site-start.el` in this directory. Since `site-start.el` is
  the first thing emacs looks at, you can change where it looks for your emacs
  configureation folder (usually named `.emacs.d`).

  The typical Unix command is:

    sudo ln -s ~/.emacs.d/site-start.el
        /usr/local/share/emacs/site-lisp/site-start.el

  On Windows (*), the `site-lisp` directory is inside the emacs install directory
  (in doubt, try `C:\Program Files\emacs`).

- Alternatively, symlink .~/.emacs.d to the repository (or just clone it there
  in the first place).

    ln -s EMACS_PARENT/.emacs.d ~/.emacs.d

- Add emacs launch scripts to your PATH environment variable.

  The launch scripts are `emacs.bat` and `emacs-wait.bat` on Windows; and
  `em.sh`, `emw.sh` on Linux.

  \[Windows\] Customize the variables at the top of `emacs.bat` and
  `emacs-wait.bat` with the location of your emacs installation and the location
  of this repository.

  There is not a single terminal command to permanently and cleanly add a path
  to PATH, regardless of OS (stupid, right?), so google the procedure for you
  system.

  Alternatively, add symlinks (*) to the scripts in a directory that you already
  know to be on the path (e.g. `/usr/local/bin` or `C:\Windows\System32`).

My emacs launch scripts will setup an emacs server the first time they are
used. Subsequent uses of the command will open a buffer in the existing emacs
window. For each system there is a regular and a waiting version. The waiting
version will wait until the opened buffer is closed to return from the
script. Those are useful to edit git commit messages, for instance.

(*) To make symlinks in Windows, use [LinkShellExtension][lse].

[lse]: http://schinagl.priv.at/nt/hardlinkshellext/hardlinkshellext.html

# Windows Shell Integration

- To use the registry tweaks described next, you'll need to copy or symlink
  `emacs.bat` to `%WINDIR%`. The registry apparently does not use `%PATH%` for
  path resolution, but at least uses `%WINDIR%`.

- Merging the file `registry/noext.reg` with the registry associates files with
  without extensions to emacs. It is equivalent to typing the following commands
  in a terminal:

      assoc .=noext
      ftype noext=emacs "%1"

- Merging the file `registry/unknown.reg` with the registry associates files
  with unkown extensions to emacs.

- Merging the file `registry/openwith.reg` with the registry add an "open with
  emacs" item to the context menu of all files.

# Mac OSX Shell Integration

To install on OSX, run the file `setup/osx_setup.sh`. Here's what it does:

- Install Emacs from homebrew.

- Make sure `emacs` and `emacsclient` refer to the newly installed emacs, not to
  the version of emacs bundled by default by OSX (those are backuped to
  `emacs_old` and `emacsclient_old`.

- Add a custom Emacs app to your applications. This application behaves like
  `em.sh`, but it is an application, which means you can open files with it from
  finder, etc.

The net result of this is that you'll have an "Emacs.app" in your
`/Applications` folder, which you can use to start the daemon, or bring up a
frame. The app that is shown in your dock is the original Emacs app installed by
Homebrew however. It cannot be used to launch emacs.

To associate files types with emacs, use
[duti](https://github.com/moretension/duti/releases). The bundle identifier is
`eu.norswap.Emacs`. e.g.,

    duti -s eu.norswap.Emacs .txt all

You can autostart emacs by adding the .app to `System Preferences > Uers &
Groups > Login Items`.

If you're into such frivolity, you can give the app a nice icon to be shown in
spotlight or launchpad. Using the Finder, navigate to
`/usr/local/Cellar/emacs/24.3`, right click on `Emacs.app`, and click on Show
Package Contents. Do the same for `/Applications/Emacs.app`. Copy the
`Emacs.icns` file from `Contents/Resources` of the app in `Cellar` to the
`Contents/Resources` of the app in `Applications` one. Delete `applet.icns` and
rename `Emacs.icns` to `applet.icns` in the `Applications` app.

At the command line, note that `emacs` will always open in the terminal. As it
does try to set up a server, this command should never be used.

`emacsclient` behaves normally at the command line: it tries to open in cocoa,
unless `-nw` is specified (in which case it opens a console frame). It does not
however guarantee to set up a server or to open a cocoa frame if there are none,
which is why the `em`/`emw` scripts should be used instead.

# Random Linux Setup Notes

    sudo aptitude install emacs24
    ln -s Dropbox/.emacs.d .emacs.d
    run sudo ln -s /home/norswap/.emacs.d/em.sh  /usr/bin/em
    run sudo ln -s /home/norswap/.emacs.d/emw.sh /usr/bin/emw
    run this to make our emacs script the default text editorro
      sudo update-alternatives
      --install /usr/bin/editor editor /usr/bin/em 200
      --slave /usr/share/man/man1/editor.1.gz editor.1.gz
      /usr/share/man/man1/emacs.emacs24.1.gz
    edit /etc/security/pam_env.conf to include
      EDITOR DEFAULT=/usr/bin/emw
      VISUAL DEFAULT=/usr/bin/emw
    later to edit root files, use "em /sudo::/etc/environment" (for instance)
      this needs full path, you can also do "sudo emw file" (but it's console)
    em /sudo::/usr/share/applications/emacs24.desktop
      edit to Exec=editor %F

# Troubleshooting

\[Windows\] If you get an error looking like `The directory ~/.emacs.d/server is
unsafe`, try taking ownership of that directory (setting yourself as the
directory owner in the directory's properties - google it). I suppose the same
kind of problem could occur on Unix, but it never happened to me.