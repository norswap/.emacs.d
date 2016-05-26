Note: everything below is a little bit disorganized. I'll do something about
that, eventually. But note there is an easy setup script for OSX. There also
needs to be a mention of `emw-win.sh`. Generally, things haven't been tested on
Linux since they changed significantly recently.

# Installation

- Run `git clone git@github.com:norswap/.emacs.d.git .emacs.d` in the directory
  where you want the `.emacs.d` directory (whose content is that is that of this
  repository) to appear.

- Symlink `~/.emacs.d` to the repository (or just clone it there in the first
  place). The Unix command is:

    ln -s emacs.d ~/.emacs.d

  On Windows, you can use the [Link Shell Extension][lse] to make a symlink to
  `C:/Users/USERNAME/AppData/Roaming/.emacs.d`. However, if you have a `HOME`
  environment variable defined, the symlink needs to be made inside that
  directory (I have my home set to `C:/Users/USERNAME`).

- Add emacs launch scripts to your `PATH` environment variable.

  The launch scripts are `em.bat` and `emw.bat` on Windows; and
  `em.sh`, `emw.sh` on Unix (tested on OSX only).

  \[Windows\] Make sure the `bin` directory of the emacs installation directory
  is in your PATH environment variable.

- To quickly compile all elisp files in this repository, type `C-u 0 M-x
  byte-recompile-directory` inside emacs and point to the directory. If you edit
  the files later inside emacs and using my config, the files will recompile
  automatically.

My emacs launch scripts will setup an emacs server the first time they are used.
Subsequent uses of the command will open a buffer in the existing emacs window.
For each system there is a regular (`em`) and a waiting version (`emw`). The
waiting version will wait until the opened buffer is closed to return from the
script. Those are useful to edit git commit messages, for instance.

# Windows Shell Integration

- To use the registry tweaks described next, you'll need to copy or symlink
  `em.bat` to `%WINDIR%`. The registry apparently does not use `%PATH%` for
  path resolution, but at least uses `%WINDIR%`.

- Merging the file `regedit/noext.reg` with the registry associates files with
  without extensions to emacs. It is equivalent to typing the following commands
  in a terminal:

      assoc .=noext
      ftype noext=em "%1"

- Merging the file `regedit/unknown.reg` with the registry associates files
  with unkown extensions to emacs.

- Merging the file `regedit/openwith.reg` with the registry add an "open with
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
`/usr/local/Cellar/emacs/24.5`, right click on `Emacs.app`, and click on Show
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

# Notes That Were in `init.el`

    ; This file resides in the directory ".emacs.d". This file is executed after
    ; "site-start.el". If you want to move .emacs.d to another path than
    ; "~/.emacs.d", you can modify your "site-start.el" file to include, for
    ; instance:
    ;
    ; (setq user-emacs-directory "C:/Dropbox/.emacs.d/")
    ; (setq user-init-file "C:/Dropbox/.emacs.d/init.el")
    ; (load user-init-file)
    ;
    ; The two variables are Emacs API variables. They don't control any behaviour
    ; per se (e.g. ~/.emacs.d will still be created and ~/.emacs OR
    ; ~/.emacs.d/init.el is still loaded if it exists), but they are taken into
    ; account by some code, including my own config. My config will ensure that all
    ; config/data files are stored in "user-emacs-directory" and not in the default
    ; location.
    ;
    ; Note that if you use the default directory, you should *not* load the init
    ; file in "site-start.el", lest it be loaded twice. If you can't modify
    ; "site-start.el", you can put the above code in the .emacs file instead.
    ;
    ; If you wish to use an emacs daemon on unix, you can add this line to your
    ; .profile (or equivalent): ". <path_to_.emacs.d>/init.sh", and edit the file to
    ; point to the .emacs.d/emacs.sh file. Now using the "emacs" command will
    ; automatically run the emacs daemon if it isn't launched, open a new frame if
    ; there isn't one visible, and then open your file in an existing frame.
    ;
    ; If you wish to use an emacs daemon on windows, you can copy the emacs.bat file
    ; in your emacs install directory (e.g. "C:\Program Files\emacs"), modify it and
    ; add the directory to your path. You can then use the script to open a file
    ; with emacs. If a frame is already open, it will open the file in this frame,
    ; or it will create a new frame to open the file.
    ;
    ; Additionally, you may want to install auctex, follow the instruction for your
    ; platform. Ideally do it before installing anything else as it may overwrite
    ; files (notables site-start.el).

    ;; The server socket file will be automatically stored in
    ;; <user-emacs-directory>/server on Windows, and in a temporary location on
    ;; linux/mac (inspected variable 'server-socket-dir to view).
