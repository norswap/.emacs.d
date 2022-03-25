# My Emacs Config

This document deals with how the integrate emacs with the OS rather than the
emacs config itself. Maybe someday!

## Installation

- [macOS] To install emacs itself: `brew cask install emacs`.

- [Windows] To install emacs itself, download from
  https://www.gnu.org/software/emacs/download.html#windows and add the directory
  to the PATH.

- [Linux] Use your favourite package manager.

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

[lse]: https://schinagl.priv.at/nt/hardlinkshellext/linkshellextension.html

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
instance (you can set `EDITOR=emw`).

There are different versions of the script pair, for different OSes and usages.

On all versions of the scripts except Windows/.bat (because it's painful), `em
-w` does the same as `emw`. On all versions exceptions Windows/.bat and
Windows/MSYS, `emw` just calls `em -w` (the rationale is below for MSYS).

Full list of scripts:

- `em[w]-macos.sh`: for macOs

  It started as a Unix script, but it now has bits of macOS specific logic, and
  a lot of stuff to combat the general broken-ness of that OS. It's now way
  over-completed, but no way I will simplify it until something breaks.

  This also has the extra `-t` flag compared to other versions, which starts
  emacs in the terminal if passed. (It *should* interact with the daemon
  properly, but I wouldn't stake my life on that fact.)

  **EDIT:** Starting the emacs deamon on the command line doesn't work anymore
  (unsure why, and not motivated enought to look right now). Start the daemon by
  running `Emacs.app` then use to command line to open extra files.

- `em[w].bat`: for Windows

  Batch is hell, so the `-w` flag is not supported and `emw.bat` is just a copy
  of `em.bat` with the `--no-wait` flag edited out.

- `em[w]-linux.sh`: for Linux

  For linux, but also supports a specific [WSL] use case: calling emacs from
  Linux/WSL to open a file on a daemon running on the Windows side.

  [WSL]:

  For the WSL support to work, you will need to set some variable, i.e.
  `$WINDOWS_HOME` (the Windows directory that contains `.emacs.d`, as a
  Windows-style path (forward slashes are okay, e.g. `C:/Users/norswap`),
  `$USERDOMAIN` (to your Windows hostname) and `$USERNAME` (to your Windows
  usernmae), e.g. in your `.bashrc`. This is so we can locate the server file
  for emacs running on Windows.

  The other divergence to add for WSL support is the necessity to translate
  Unix-style paths like `/mnt/c/folder/file` or `/home/norswap/file` to
  Windows-style paths like `C:\folder\file` or
  `\\wsl.localhost\Ubuntu\home\norswap\file`. It turns out this is mildly
  difficult if you want to handle files that do not exist, and so as a side
  effect, the script will create the dir structure of non-existant buffer (e.g.
  `em a/b/c` will create dirs `a` and `b` if they don't yet exist — which
  normally emacs would only do if you save the file).

- `em[w]-msys.sh`: for Windows running Unix-like environment (like MSYS)

  The `emw` script here does **not** call the related `em` script (instead it's
  a copy, just like in the .bat case). The reason is that I use `emw-msys.sh` as
  the value of the git `core.editor` property (where it will be invoked by Git
  Bash, which is MSYS), and I can't assume that the `em` in the PATH will map to
  `em-msys.bat`.

## The Emacs Server

If you use my init files, then running emacs for the first time will launch the
server in the background if it's not already running.

If launching using the Windows/macOS application, then the server becomes tied
to the app process, meaning that closing the app will kill the server (this is
not an issue: the next time you run a launcher or the app, a new server will be
spawned). Note that if you started the server using a launcher, then you can
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

## macOS Integration

(Note: probably outdated? This stuff tends to change with every macOS release
and I'm not longer maintaining the fancy integrations like EmacsFinderOpen and
"Open with Emacs".)

To install on macOS, run the file `mac/setup.sh`. Here's what it does:

- Add a custom Emacs app (`Em.app`) to your applications. This application
  behaves like `em`, but it is an application, which means you can open files
  with it from finder, etc. You should not use `Emacs.app` to open files (which
  depending on versions, either does not work, or does unfortunate stuff like
  opening a new frame (macOS window) each time).

  **EDIT:** `Emacs.app` now seems to work for all use cases, so `Em.app` is
  probably redundant. Not deleting it quite yet because I might be missing some
  of the more subtle implications. `Em.app` is now broken on my setup when
  starting it before `Emacs.app` ("stty: stdin isn't a terminal"). No idea what
  changed.

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

### Some macOS weirdness

At the command line, note that `emacs` will always open in the terminal. As it
does try to set up a server, this command should never be used.

`emacsclient` behaves normally at the command line: it tries to open in cocoa,
unless `-nw` is specified (in which case it opens a console frame). It does not
however guarantee to set up a server or to open a cocoa frame if there are none,
which is why the `em`/`emw` scripts should be used instead.

## Troubleshooting

Sometimes after an unsafe shutdown, the app launch will crash. In
that case, go to `files-$HOSTNAME-$USER` and delete `.emacs.desktop.lock` and
`server`. In some rare cases, `.emacs.desktop` gets corrupted and you need to
delete it too (but then you lose the list of open files).

\[Windows\] If you get an error looking like `The directory ~/.emacs.d/server is
unsafe`, try taking ownership of that directory (setting yourself as the
directory owner in the directory's properties - google it).
