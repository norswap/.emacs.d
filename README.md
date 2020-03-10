# Installation

**Note: ** Things are tested on Windows and macOS, I make no promises for Linux
(the macOS stuff should work, but it might need a few adjustments).

- [macOS] To install emacs itself: `brew cask install emacs`.

- [Windows] To install emacs itself, download from
  https://www.gnu.org/software/emacs/download.html#windows and add the directory
  to the PATH.

- Run `git clone git@github.com:norswap/.emacs.d.git .emacs.d` in the directory
  where you want the `.emacs.d` directory (whose content is that is that of this
  repository) to appear.

- Symlink `~/.emacs.d` to the repository (or just clone it there in the first
  place). The Unix command is:

    ln -sn emacs.d ~/.emacs.d

  On Windows, you can use the [Link Shell Extension][lse] to make a symlink to
  `C:/Users/USERNAME/AppData/Roaming/.emacs.d`. However, if you have a `HOME`
  environment variable defined, the symlink needs to be made inside that
  directory (I have my home set to `C:/Users/USERNAME`).

- Add emacs launch scripts to your `PATH` environment variable.

  The launch scripts are `em.bat` and `emw.bat` on Windows; and
  `em`, `emw` on Unix (tested on macOS only).

  \[Windows\] Make sure the `bin` directory of the emacs installation directory
  is in your PATH environment variable.

- To quickly compile all elisp files in this repository, type `C-u 0 M-x
  byte-recompile-directory` inside emacs and point to the directory. If you edit
  the files later inside emacs and using my config, the files will recompile
  automatically.

## Launch Scripts

My emacs launch scripts will setup an emacs server (aka daemon) the first time
they are used. Subsequent uses of the command will open a buffer in the existing
emacs window. For each system there is a regular (`em`) and a waiting version
(`emw`). The waiting version will wait until the opened buffer is closed to
return from the script. Those are useful to edit git commit messages, for
instance.

For Windows, there is also `emw-win.sh` for when you need a bash-compatible
editor to fill in the `EDITOR` environment variable (used for git commit
messages for instance). When at the bash command prompt, using `em` and `emw` to
invoke `em.bat` and `emw.bat` should work if using a Cygwin/MinGW-type setup.

The unix launchers have a few more options, which you can check by passing the
`--help` option. In brief: `em -w` behaves like `emw`, and `em -t` or `emw -t`
opens a frame in the terminal.

Some precisions on the emacs server:

If you use my init files, then running emacs for the first time will launch the
server if it's not already running. When using the launcher, this will do
nothing, as the launcher will start the server **in the background** beforehand.
But if launching using the Windows/macOS application, then the server becomes
tied to the app process, meaning that closing the app will kill the server (this
is not an issue: the next time you run a launcher or the app, a new server will
be spawned). Note that if you start the server using a launcher, then you can
close the app and the server will still be active in the background.

Occasionally you want to completely kill the emacs process, which you can do
with `M-x save-buffers-kill-emacs` (prompts for saving modified buffers, or just
use `M-x kill-emacs`).

## Windows Integration

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

# macOS Integration

To install on macOS, run the file `mac/setup.sh`. Here's what it does:

- Add a custom Emacs app (`Em.app`) to your applications. This application
  behaves like `em`, but it is an application, which means you can open files
  with it from finder, etc. You should not use `Emacs.app` to open files (which
  depending on versions, either does not work, or does unfortunate stuff like
  opening a new frame (macOS window) each time).
  
- Add anoter app named `EmacsFinderOpen.app` to your applications. This app can
  be cmd-dragged (or ctrl-dragged if you inverted controls like I did) to the
  Finder's toolbar. There, clicking on it open the Finder's selection in Emacs.
  
- Add a new "Open with Emacs" service (called "quick action" since macOS
  Catalina) that will notably display when you right-click a file. Can also be
  added to the touchbar.

You can script file associations instead of going through the normal `right
click > get info > open with > change for all` route.

To do so, use [duti](https://github.com/moretension/duti/releases). The bundle
identifier is `com.norswap.Emacs`. e.g.,

    duti -s com.norswap.Emacs .txt all

You can autostart emacs by adding `Emacs.app` to `System Preferences > Uers &
Groups > Login Items`.

At the command line, note that `emacs` will always open in the terminal. As it
does try to set up a server, this command should never be used.

`emacsclient` behaves normally at the command line: it tries to open in cocoa,
unless `-nw` is specified (in which case it opens a console frame). It does not
however guarantee to set up a server or to open a cocoa frame if there are none,
which is why the `em`/`emw` scripts should be used instead.

## Linux

Old notes from when I actually set this up on linux. I don't remember much
context, just use this to investigate possible integrations there.

    sudo update-alternatives \
        --install /usr/bin/editor editor /usr/bin/em 200 \
        --slave /usr/share/man/man1/editor.1.gz editor.1.gz \
            /usr/share/man/man1/emacs.emacs24.1.gz
            
    # edit /etc/security/pam_env.conf to include
      EDITOR DEFAULT=/usr/bin/emw
      VISUAL DEFAULT=/usr/bin/emw
      
    # To edit root files, use "em /sudo::/etc/environment" (for instance).
    # This needs full path, you can also do "sudo emw file" (but it's console).
    em /sudo::/usr/share/applications/emacs24.desktop
    # edit to Exec=editor %F

## Troubleshooting

\[Windows\] If you get an error looking like `The directory ~/.emacs.d/server is
unsafe`, try taking ownership of that directory (setting yourself as the
directory owner in the directory's properties - google it). I suppose the same
kind of problem could occur on Unix, but it never happened to me.

\[Windows\] Sometimes after an unsafe shutdown, the app launch will crash. In
that case, go to `files-$HOSTNAME-$USER` and delete `.emacs.desktop.lock` and
`server`. In some rare cases, `.emacs.desktop` gets corrupted and you need to
delete it too (but then you lose the list of open files).
